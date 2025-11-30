#include "pch.h"
#include "IocpCore.h"
#include "IocpEvent.h"


IocpCore::IocpCore()
{
	_iocpHandle = CreateIoCompletionPort(INVALID_HANDLE_VALUE, 0, 0, 0);
	ASSERT_CRASH(_iocpHandle != INVALID_HANDLE_VALUE);
}

IocpCore::~IocpCore()
{
	::CloseHandle(_iocpHandle);
}


bool IocpCore::Register(shared_ptr<IocpObject> iocpObject, ULONG_PTR key)
{
	return ::CreateIoCompletionPort(iocpObject->GetHandle(), _iocpHandle, key, 0);
}

bool IocpCore::Dispatch(DWORD ms)
{
	DWORD bytes = 0;
	ULONG_PTR key = 0;
	LPOVERLAPPED overlapped = nullptr;

	if (::GetQueuedCompletionStatus(_iocpHandle, OUT &bytes, OUT &key, OUT &overlapped, ms))
	{
		if (overlapped == nullptr) return false;

		IocpEvent* iocpEvent = reinterpret_cast<IocpEvent*>(overlapped);
		iocpEvent->owner->Dispatch(iocpEvent, bytes);	// iocpObejct -> dispatch

	}
	else
	{
		const int32 errCode = ::WSAGetLastError();
		switch (errCode)
		{
		case WAIT_TIMEOUT:
			return false;
		default:
			/* TODO */
			break;
		}
		

	}
	return true;
}

