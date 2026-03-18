-- 10_drop_storage_triggers.sql
-- 트리거 → 애플리케이션 코드로 전환
-- storage_usage_bytes 증감은 UserRepository::SaveUserAsset()에서 직접 처리

USE chat_server;

DROP TRIGGER IF EXISTS trg_user_asset_insert;
DROP TRIGGER IF EXISTS trg_user_asset_delete;
