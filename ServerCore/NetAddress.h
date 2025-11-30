#pragma once


#define len(arr) static_cast<int32>(sizeof(arr)/sizeof(arr[0]))

class NetAddress
{
public:
	NetAddress() = default;
	NetAddress(SOCKADDR_IN sockAddr);
	NetAddress(wstring ip, uint16 port);

	const SOCKADDR_IN&	GetSockAddr() { return _sockAddr; }
	wstring				GetIpAddress();
	uint16				GetPort() { return ::ntohs(_sockAddr.sin_port); }


private:
	SOCKADDR_IN _sockAddr = {};

};

