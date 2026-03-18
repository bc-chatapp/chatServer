# MOA Chat Server

실시간 채팅 앱 **MOA**의 백엔드 서버. C++ IOCP 기반 TCP 소켓 통신으로 메시지 라우팅, 파일 관리, 인증 등을 처리한다.

<!-- 아키텍처 다이어그램 (draw.io export) -->
<!-- ![Architecture](docs/architecture.png) -->

---

## 기술 스택

| 분류 | 기술 |
|------|------|
| Language | C++17 |
| I/O Model | Windows IOCP (I/O Completion Ports) |
| Protocol | Protocol Buffers (protobuf) |
| Database | MySQL 8.0 (mysqlx C++ Connector) |
| Cloud Storage | Google Cloud Storage (V4 Signed URL, RSA-SHA256) |
| Push | Firebase Cloud Messaging HTTP v1 (OAuth2) |
| Auth | bcrypt, JWT, OAuth2 (Google/Apple) |
| TLS | nginx stream proxy (Let's Encrypt) |
| Logging | spdlog v1.15.1 |
| HTTP Client | libcurl + OpenSSL |
| Build | Visual Studio 2022, MSVC |

---

## 주요 기능

**채팅**
- 1:1 / 그룹 실시간 메시지 (텍스트, 이미지, 동영상, 파일, 음성)
- 오프라인 메시지 동기화 (로그인 시 미수신 메시지 일괄 push)
- 읽음 확인 (unread count 실시간 감소)
- 메시지 답장 / 수정 / 삭제 (soft delete)
- 이모지 반응, @멘션, 채팅방 공지, 그룹 투표

**인증 / 보안**
- 이메일 + 비밀번호 로그인 (bcrypt)
- 소셜 로그인 — Google, Apple OAuth
- 세션 토큰 (JWT) + 레이트 리밋 (50 pkt/sec)
- 차단 / 신고

**파일**
- GCS Signed URL 기반 파일 업로드 (서버 대역폭 사용 없음)
- 구독 등급별 용량 제한 + 파일 보관 정책
- 만료 파일 자동 삭제 (6시간 주기 백그라운드 배치)

**기타**
- FCM 푸시 알림 (오프라인 수신자, 만료 토큰 자동 삭제)
- 공 뽑기 게임 (seed 기반 결정론적 시뮬레이션)
- 포토 슬라이드 (사진 + 텍스트 오버레이)

---

## 서버 아키텍처

```
Client (React Native, TCP)
  │  TLS (port 443)
  ▼
nginx (stream proxy — TLS 종료)
  │  plain TCP (127.0.0.1:3000)
  ▼
┌─────────────────────────────────────────────┐
│  C++ IOCP Server                            │
│                                             │
│  PacketDispatcher                           │
│    │                                        │
│    ├── Service Layer                        │
│    │   Auth / Chat / File / Group / Friend  │
│    │   Block / Notification                 │
│    │                                        │
│    ├── Repository Layer (MySQL 8.0)         │
│    │   User / Message / Group / Friend      │
│    │   File / FcmToken / Poll / Block       │
│    │                                        │
│    └── Cloud Layer                          │
│        GCS (Signed URL) / FCM (HTTP v1)     │
└─────────────────────────────────────────────┘
```

### 패킷 처리 흐름

```
TCP 수신 → RecvBuffer 누적 → Length-Prefixed Framing (4B 헤더 + protobuf)
  → PacketDispatcher::DispatchPacket()
    → Version Check → Auth Token Check → Rate Limit Check
    → switch(payload_case) → Service 호출 → DB 조회/저장 → 응답 패킷 전송
```

### 스레딩 모델

| 스레드 | 역할 | 개수 |
|--------|------|------|
| Main | 콘솔 입력, 서버 제어 | 1 |
| IOCP Worker | 패킷 수신 / 처리 / 응답 | `hardware_concurrency()` |
| Heartbeat | 좀비 세션 감지 (10초 주기) | 1 |
| ExpirationBatch | 만료 파일 GCS 삭제 (6시간 주기) | 1 |

---

## 프로젝트 구조

```
cppServer/
├── ServerCore/            # IOCP 네트워킹 프레임워크
│   ├── IocpCore           # IOCP 핸들 관리, Dispatch 루프
│   ├── Session            # 소켓 세션 (비동기 Recv/Send)
│   ├── Listener           # AcceptEx 기반 연결 수락
│   ├── RecvBuffer         # 링 버퍼 (8KB)
│   └── SendBuffer         # 전송 큐
│
├── cppServer/             # 메인 애플리케이션
│   ├── mainServer.cpp     # 엔트리포인트
│   ├── ServerSession      # 인증, 레이트리밋, 하트비트
│   ├── PacketDispatcher   # protobuf 패킷 라우팅
│   ├── CoreGlobal         # 전역 서비스 관리
│   ├── Logger             # spdlog 래퍼
│   │
│   ├── Service/           # 비즈니스 로직
│   │   ├── AuthService           로그인 / 회원가입 / 소셜로그인 / 탈퇴
│   │   ├── ChatService           메시지 전송, 답장/삭제/수정, 읽음확인, 반응, 투표
│   │   ├── FileService           파일 업로드 (용량 체크 + Signed URL)
│   │   ├── GroupService          그룹 생성 / 참여 / 탈퇴 / 삭제
│   │   ├── FriendService         친구 요청 / 수락 / 거절
│   │   ├── BlockService          차단 / 신고
│   │   ├── NotificationService   FCM 토큰 관리
│   │   ├── UserManager           세션 관리, 중복로그인, 타임아웃
│   │   └── ExpirationBatchJob    만료 파일 삭제 배치
│   │
│   ├── DB/                # 데이터 접근 계층
│   │   ├── DBManager             MySQL 연결 (thread_local 스레드별 세션)
│   │   ├── UserRepository        사용자 CRUD
│   │   ├── MessageRepository     메시지 저장/조회, 읽음상태, 반응
│   │   ├── GroupRepository       그룹/멤버 CRUD
│   │   ├── FriendRepository      친구관계 CRUD
│   │   ├── FileRepository        파일 메타데이터, 만료 관리
│   │   └── PollRepository        투표 생성/참여/종료
│   │
│   └── Cloud/             # 외부 서비스 연동
│       ├── FcmClient             FCM HTTP v1 (OAuth2 JWT)
│       └── CloudStorageGCS       GCS REST API (V4 Signed URL)
│
├── Protobuf/
│   └── protocol.proto     # 메시지 타입 정의
│
└── database/
    └── db_schema/         # 마이그레이션 SQL
```

---

## DB 스키마

순차적 마이그레이션 파일로 관리.

| 테이블 | 설명 |
|--------|------|
| `users` | 사용자 (인증, 프로필, 구독 등급, OAuth) |
| `friends` | 친구 관계 (요청/수락 상태) |
| `groups` / `group_members` | 그룹 + 멤버 (역할, 초대코드) |
| `conversations` / `conversation_participants` | 대화방 (direct / group) |
| `messages` / `read_status` | 메시지 + 읽음 확인 |
| `fcm_tokens` | FCM 푸시 토큰 (기기별) |
| `file_uploads` | 파일 메타데이터 + 보관 만료 |
| `subscriptions` / `subscription_plans` | 구독 플랜 |
| `block_list` / `reports` | 차단 + 신고 |
| `message_reactions` | 이모지 반응 |
| `polls` / `poll_votes` | 투표 |
| `announcements` | 채팅방 공지 |

---

## 부하 테스트 결과

실제 앱과 동일한 패킷 시퀀스(Login → 동기화 → Heartbeat + Chat + ReadReceipt)로 측정.

### 규모별 결과 (localhost, plain TCP)

| 항목 | 100명 | 5,000명 | 10,000명 |
|------|-------|---------|----------|
| 접속/로그인 | 100% | 100% | 99.99% |
| 메시지 실패 | 0 | 0 | 0 |
| 응답 avg | 2.2ms | 15.2ms | 101ms |
| 응답 p99 | 4ms | 110ms | 526ms |
| 메시지 처리량 | 190 msg/s | 5,198 msg/s | **6,941 msg/s** |
| 피크 메모리 | 30MB | 497MB | 975MB |
| 정리 후 메모리 | 21MB | 24MB | 25MB |

- 5,000명: **117만건** 메시지 전송, 실패 0
- 10,000명: **115만건** 메시지 전송, 실패 0, **6,941 msg/s**
- 세션 종료 후 메모리/핸들 정상 회수 확인

---

## 트러블슈팅

### 1. DB 세션 경쟁 상태

**증상**: 100명 동시 로그인 시 21% 실패, 메시지 100% 타임아웃

**원인**: `DBManager`가 `mysqlx::Session` 하나를 모든 IOCP 워커 스레드가 공유. `mysqlx::Session`은 내부적으로 단일 TCP 연결이라 동시 쿼리 시 패킷 충돌.

**수정**: `thread_local` 세션으로 변경 — 각 워커 스레드가 독립 MySQL 연결 보유.

```cpp
// Before
unique_ptr<mysqlx::Session> _session;  // 전체 공유

// After
mysqlx::Session& DBManager::GetSession() {
    thread_local std::unique_ptr<mysqlx::Session> tls_session;
    if (!tls_session)
        tls_session = std::make_unique<mysqlx::Session>(settings);
    return *tls_session;
}
```

| 항목 | Before | After |
|------|--------|-------|
| 로그인 성공률 | 79% | **100%** |
| 메시지 | 0 성공 / 8434 실패 | **10458 성공 / 0 실패** |
| 응답 avg | 157ms | **2.2ms** |

### 2. 세션 메모리/핸들 누수

**증상**: 5,000명 접속 후 전원 disconnect → 핸들/메모리 그대로 유지. 반복 시 무한 증가.

**원인**: 클라이언트가 TCP를 먼저 끊으면 `DisconnectEx()` 비동기 완료 통지가 안 와서 `ProcessDisconnect()` → `ReleaseSession()`이 안 불림. `shared_ptr` 참조가 안 풀려 소멸자 미호출.

**수정**: `CleanupAndRelease()` — `DisconnectEx` 비동기 체인 대신 직접 정리.

```cpp
void Session::CleanupAndRelease() {
    if (_connected.exchange(false) == false) return;
    OnDisconnected();
    if (_socket != INVALID_SOCKET) {
        ::closesocket(_socket);
        _socket = INVALID_SOCKET;
    }
    if (auto service = _service.lock())
        service->ReleaseSession(GetSession());
}
```

| 항목 | Before | After |
|------|--------|-------|
| 5000명 후 핸들 | 5206 → **5206** | 5205 → **202** |
| 5000명 후 메모리 | 503MB → **503MB** | 497MB → **24MB** |
| 소멸자 호출 | 안 불림 | **전부 불림** |

