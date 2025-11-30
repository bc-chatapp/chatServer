#pragma once

using BYTE = unsigned char;
using int8 = __int8;
using int16 = __int16;
using int32 = __int32;
using int64 = __int64;
using uint8 = unsigned __int8;
using uint16 = unsigned __int16;
using uint32 = unsigned __int32;
using uint64 = unsigned __int64;



#define USE_MANY_LOCKS(count)	mutex _locks[count];
#define USE_LOCK				USE_MANY_LOCKS(1)
#define	WRITE_LOCK_IDX(idx)		lock_guard<mutex> lockGuard_##idx(_locks[idx]);
#define WRITE_LOCK				WRITE_LOCK_IDX(0)






#define ASSERT_CRASH(expr)						\
	do {										\
		if (!(expr))							\
		{										\
			const int32 errCode = ::WSAGetLastError(); \
			\
			std::wcout << L"[ASSERT] '" << #expr << L"' Failed! Code: " << errCode << std::endl; \
			\
			__debugbreak();	\
			std::abort();   \
		} \
	} while(false)