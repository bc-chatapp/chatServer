#pragma once

#define WIN32_LEAN_AND_MEAN

#ifdef _DEBUG
#pragma comment(lib, "ServerCore\\Debug\\ServerCore.lib")
#pragma comment(lib, "Protobuf\\Debug\\libprotobufd.lib")
#else
#pragma comment(lib, "ServerCore\\Release\\ServerCore.lib")
#pragma comment(lib, "Protobuf\\Release\\libprotobuf.lib")
#endif

// CorePch.h를 먼저 include (Types.h 등 기본 타입 정의 포함)
#include "CorePch.h"
// CoreGlobal.h는 CorePch.h 이후에 include (int32, int64 등 타입 사용)
#include "CoreGlobal.h"

