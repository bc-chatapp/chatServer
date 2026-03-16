#pragma once

#include "Service.h"
#include "IocpEvent.h"
#include "NetAddress.h"



class Session : public IocpObject
{
	friend class Listener;
	friend class Service;

	enum
	{
		//BUFFER_SIZE = 0x10000, // 64KB
		BUFFER_SIZE = 8192, // 8KB
	};

public:
	static LPFN_CONNECTEX		ConnectEx;
	static LPFN_DISCONNECTEX	DisconnectEx;

public:
	Session();
	~Session();

	void Init();

	/* Call */
	void Send(shared_ptr<SendBuffer> sendBuffer);
	bool Connect();
	void Disconnect();
	void CleanupAndRelease();

	shared_ptr<Service>	GetService() { return _service.lock(); }
	void				SetService(shared_ptr<Service> service) { _service = service; }

public:
	/* Information */
	void				SetAddress(NetAddress address) { _netAddress = address; }
	NetAddress			GetAddress() { return _netAddress; }
	SOCKET				GetSocket() { return _socket; }
	bool				IsConnected() { return _connected; }
	shared_ptr<Session> GetSession() { return static_pointer_cast<Session>(shared_from_this()); }
	
	char* GetAcceptBuffer() { return _acceptBuffer; }

private:
	/* 인터페이스 구현 */
	virtual HANDLE		GetHandle() override;
	virtual void		Dispatch(class IocpEvent* iocpEvent, int32 Bytes = 0) override;


private:
	/* Events */
	bool RegisterConnect();
	bool RegisterDisconnect();
	void RegisterRecv();
	void RegisterSend();

	void ProcessConnect();
	void ProcessDisconnect();
	void ProcessRecv(int32 Bytes);
	void ProcessSend(int32 Bytes);

	
protected:
	/* overrides */
	virtual void OnConnected() { }
	virtual void OnDisconnected() { }
	virtual void OnRecv(BYTE* buffer, int32 len) { }
	virtual void OnSend(int32 len) { }

private:
	weak_ptr<Service>	_service;
	SOCKET				_socket = INVALID_SOCKET;
	NetAddress 			_netAddress = {};
	atomic<bool>		_connected = false;

	char _acceptBuffer[BUFFER_SIZE * 2];
private:
	USE_LOCK;
	RecvBuffer			_recvBuffer;

	queue<shared_ptr<SendBuffer>> _sendQueue;
	atomic<bool>		_sendRegistered = false;


private:
	/* Events */
	ConnectEvent		_connectEvent;
	DisconnectEvent		_disconnectEvent;
	RecvEvent			_recvEvent;
	SendEvent			_sendEvent;


	
};

