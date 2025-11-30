#include "pch.h"
#include "IocpEvent.h"



void IocpEvent::Init()
{
	::ZeroMemory(static_cast<OVERLAPPED*>(this), sizeof(OVERLAPPED));
}
