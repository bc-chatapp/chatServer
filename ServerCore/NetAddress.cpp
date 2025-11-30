#include "pch.h"
#include "NetAddress.h"



NetAddress::NetAddress(SOCKADDR_IN sockAddr) : _sockAddr(sockAddr)
{
}

NetAddress::NetAddress(wstring ip, uint16 port)
{
	::memset(&_sockAddr, 0, sizeof(_sockAddr));
	_sockAddr.sin_family = AF_INET;

	IN_ADDR address;
	::InetPtonW(AF_INET, ip.c_str(), &address);
	_sockAddr.sin_addr = address;

	_sockAddr.sin_port = ::htons(port);
}

wstring NetAddress::GetIpAddress()
{
	WCHAR buffer[100];
	::InetNtopW(AF_INET, &_sockAddr.sin_addr, buffer, len(buffer));
	return wstring(buffer);
}

