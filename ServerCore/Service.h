#pragma once

#include "IocpCore.h"
#include "Session.h"
#include "Listener.h"
#include "NetAddress.h"


enum class ServiceType : uint8
{
	Server,
	Client,
};

using SessionFactory = std::function<std::shared_ptr<Session>()>;

class Service : public enable_shared_from_this<Service>
{
public:
	Service(ServiceType type, NetAddress address, shared_ptr<IocpCore> core, SessionFactory factory);
	~Service() { }

	bool Start();
	void Stop();


	void AddSession(shared_ptr<Session> session);
	void ReleaseSession(shared_ptr<Session> session);
	shared_ptr<Session> CreateSession();


public:
	/* Information */
	ServiceType GetServiceType() { return _type;}
	NetAddress GetNetAddress() { return _netAddress; }
	shared_ptr<IocpCore> GetIocpCore() { return _iocpCore; }


private:
	USE_LOCK;
	ServiceType _type;
	shared_ptr<IocpCore> _iocpCore;
	NetAddress _netAddress = {};

	set<shared_ptr<Session>> _sessions;
	int32	_sessionCount = 0;

	shared_ptr<Listener>		_listener;
	SessionFactory _sessionFactory;
};

