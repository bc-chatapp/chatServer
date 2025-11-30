#pragma once



enum class EventType :uint8
{
	ACCEPT,
	CONNECT,
	DISCONNECT,
	RECV,
	SEND,

};


class Session;


class IocpEvent : public OVERLAPPED
{
public:
	IocpEvent(EventType type) : eventType(type) { }
	void Init();

public:
	EventType						eventType;
	shared_ptr<class IocpObject>	owner;
};

/* Connect */

class ConnectEvent : public IocpEvent
{
public:
	ConnectEvent() : IocpEvent(EventType::CONNECT) { }
};

class DisconnectEvent : public IocpEvent
{
public:
	DisconnectEvent() : IocpEvent(EventType::DISCONNECT) { }
};

/* Accept */

class AcceptEvent : public IocpEvent
{
public:
	AcceptEvent() : IocpEvent(EventType::ACCEPT) { }

public:
	shared_ptr<class Session> session = nullptr;
};


/* Send/ Recv*/

class RecvEvent : public IocpEvent
{
public:
	RecvEvent() : IocpEvent(EventType::RECV) { }
};


class SendEvent : public IocpEvent
{
public:
	SendEvent() : IocpEvent(EventType::SEND) { }

public:
	vector<shared_ptr<SendBuffer>> sendBuffers;
};


