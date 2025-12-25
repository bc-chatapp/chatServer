#pragma once


#include "Session.h"
#include "../protocol.pb.h"

using sessionPtr = shared_ptr<Session>;
class UserManager;



class VerificationManager
{
public:
    explicit VerificationManager(UserManager& userManager) : _userManager(userManager) { }
    ~VerificationManager() = default;


    /* Func 1
    - DB 조회 -> 이메일 확인 필요상태인지 
    
    - Email 조회 후, 저장 
    
    
    - 확인 url 생성 방법 및 구현
    
    */

    /* 실제 전송. ->  실제 smtp 연동 보내기 */

    /* 받고, 서버에 저장
    DB넣어야해. */

private:

    UserManager& _userManager;

};