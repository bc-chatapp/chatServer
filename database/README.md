# 데이터베이스 스키마

## 테이블 생성 순서

### 1. users 테이블 생성
```bash
# MySQL Workbench에서 실행
source create_users_table.sql
```

### 2. friends 테이블 생성 (users 테이블 생성 후)
```bash
# MySQL Workbench에서 실행
source create_friends_table.sql
```

## friends 테이블 구조

### 필드 설명

| 필드 | 타입 | 설명 | 필수 |
|------|------|------|------|
| id | BIGINT | 자동 증가 PK | ✅ |
| user_id | VARCHAR(100) | 친구 관계의 주인 | ✅ |
| friend_id | VARCHAR(100) | 친구 ID | ✅ |
| status | ENUM | 'pending', 'accepted', 'blocked' | ✅ |
| created_at | TIMESTAMP | 생성 시간 | 자동 |
| updated_at | TIMESTAMP | 수정 시간 | 자동 |

### 인덱스

- `unique_friendship`: (user_id, friend_id) 중복 방지
- `idx_user_id`: user_id 조회 성능 향상
- `idx_friend_id`: friend_id 조회 성능 향상
- `idx_status`: status 필터링 성능 향상

### 외래 키

- `user_id` → `users(user_id)` ON DELETE CASCADE
- `friend_id` → `users(user_id)` ON DELETE CASCADE

### 주의사항

- 양방향 관계: A→B와 B→A를 별도 행으로 저장
- status = 'pending': 친구 요청 중
- status = 'accepted': 친구 관계 수립
- status = 'blocked': 차단 (향후 구현)
