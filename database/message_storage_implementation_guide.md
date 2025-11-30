# 메시지 저장 정책 구현 가이드

## 개요
서버에서 모든 대화를 저장하고, 메시지 전송 후 txt 파일로 로그를 남기는 시스템

## 주요 개념

### 1. 대화방 식별자 (conv_id)
- **1:1 채팅**: `direct:user01_dummy001` (알파벳 순서로 정렬)
- **그룹 채팅**: `group:group001`
- 친구 관계 테이블에 `conv_id` 컬럼 추가하여 저장

### 2. 메시지 순차 번호 (msg_seq)
- 각 대화방마다 1, 2, 3... 순차적으로 부여
- `AUTO_INCREMENT` 또는 별도 카운터 테이블 사용

### 3. 읽음 상태 관리
- `read_status` 테이블에 `last_read_seq` 저장
- 오프라인 사용자 로그인 시 `last_read_seq` 이후 메시지 푸시

## 구현 단계

### Step 1: 테이블 생성
```sql
-- 위의 message_storage_design.sql 실행
```

### Step 2: 대화방 생성 로직
```cpp
// ChatService.cpp에 추가
string CreateOrGetConversationId(const string& user1, const string& user2) {
    // 알파벳 순서로 정렬
    vector<string> participants = {user1, user2};
    sort(participants.begin(), participants.end());
    
    string convId = "direct:" + participants[0] + "_" + participants[1];
    
    // conversations 테이블에 없으면 생성
    // 있으면 기존 conv_id 반환
    
    return convId;
}
```

### Step 3: 메시지 저장 로직
```cpp
// ChatService::SendDirect 수정
bool ChatService::SendDirect(...) {
    // 1. 대화방 ID 생성/조회
    string convId = CreateOrGetConversationId(senderId, receiverId);
    
    // 2. 메시지 순차 번호 가져오기 (AUTO_INCREMENT 또는 카운터)
    int64_t msgSeq = GetNextMessageSeq(convId);
    
    // 3. 메시지 저장 (is_delivered = FALSE)
    SaveMessage(convId, msgSeq, senderId, receiverId, pkt);
    
    // 4. 수신자가 온라인인지 확인
    if (auto target = _userManager.FindSession(receiverId)) {
        // 온라인: 즉시 전송
        PushEnvelope(target, 0, pkt_s_chat);
        
        // 전송 완료 처리
        MarkMessageAsDelivered(convId, msgSeq, receiverId);
        
        // 읽음 상태 업데이트
        UpdateReadStatus(receiverId, convId, msgSeq);
        
        // txt 파일로 저장
        SaveMessageToFile(convId, msgSeq, senderId, receiverId, pkt);
        
        // 메시지 테이블에서 삭제 (또는 보관)
        DeleteMessage(convId, msgSeq);
    } else {
        // 오프라인: 메시지 테이블에 보관 (나중에 푸시)
        // 로그인 시 PushOfflineData에서 처리
    }
}
```

### Step 4: 오프라인 메시지 푸시
```cpp
// PacketDispatcher::PushOfflineData 수정
void PushOfflineData(sessionPtr& session, const string& userId) {
    // 1. 친구 요청 푸시 (기존 로직)
    
    // 2. 오프라인 메시지 푸시 (새로 추가)
    auto conversations = GetUserConversations(userId);
    for (const auto& convId : conversations) {
        int64_t lastReadSeq = GetLastReadSeq(userId, convId);
        auto messages = GetUnreadMessages(convId, lastReadSeq);
        
        for (const auto& msg : messages) {
            // S_Chat 전송
            PushEnvelope(session, 0, msg);
            
            // 전송 완료 처리
            MarkMessageAsDelivered(convId, msg.msg_seq, userId);
            
            // 읽음 상태 업데이트
            UpdateReadStatus(userId, convId, msg.msg_seq);
            
            // txt 파일로 저장
            SaveMessageToFile(convId, msg.msg_seq, msg.sender_id, userId, msg);
            
            // 메시지 테이블에서 삭제
            DeleteMessage(convId, msg.msg_seq);
        }
    }
}
```

### Step 5: txt 파일 저장 로직
```cpp
// 파일 저장 경로: logs/conversations/{conv_id}.txt
void SaveMessageToFile(const string& convId, int64_t msgSeq, 
                       const string& senderId, const string& receiverId,
                       const Protocol::S_Chat& msg) {
    string filename = "logs/conversations/" + convId + ".txt";
    ofstream file(filename, ios::app);
    
    if (file.is_open()) {
        // 타임스탬프 포맷팅
        time_t ts = msg.ts_server() / 1000;
        char timeStr[100];
        strftime(timeStr, sizeof(timeStr), "%Y-%m-%d %H:%M:%S", localtime(&ts));
        
        // 메시지 텍스트 추출
        string messageText = msg.payload().text().message();
        
        // 로그 형식: [타임스탬프] [순번] [보낸사람] -> [받는사람]: 메시지
        file << "[" << timeStr << "] [" << msgSeq << "] " 
             << senderId << " -> " << receiverId << ": " 
             << messageText << endl;
        
        file.close();
    }
}
```

## 친구 테이블에 conv_id 추가

```sql
-- 친구 관계 수락 시 대화방 ID 생성 및 저장
ALTER TABLE friends ADD COLUMN conv_id VARCHAR(255) NULL COMMENT '대화방 ID';
ALTER TABLE friends ADD INDEX idx_conv_id (conv_id);

-- 친구 수락 시 대화방 ID 생성
UPDATE friends 
SET conv_id = CONCAT('direct:', 
    LEAST(user_id, friend_id), '_', 
    GREATEST(user_id, friend_id))
WHERE status = 'accepted' AND conv_id IS NULL;
```

## 주의사항

1. **메시지 삭제 vs 보관**
   - txt 파일로 저장 후 삭제: 저장 공간 절약, 하지만 복구 불가
   - 보관: 복구 가능, 하지만 저장 공간 증가
   - 권장: 일정 기간(예: 30일) 보관 후 삭제

2. **메시지 순차 번호**
   - `AUTO_INCREMENT` 사용 시: 간단하지만 대화방별 순서 보장 어려움
   - 별도 카운터 테이블: 대화방별 순서 보장, 하지만 동시성 처리 필요

3. **파일 저장 경로**
   - 운영체제별 경로 처리 필요
   - 로그 파일 크기 관리 (로테이션)

