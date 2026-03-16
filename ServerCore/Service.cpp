#include "pch.h"
#include "Service.h"


Service::Service(ServiceType type, NetAddress address, shared_ptr<IocpCore> core, SessionFactory factory) 
	: _type(type), _netAddress(address), _iocpCore(core), _sessionFactory(factory)
{
}

bool Service::Start()
{
	if (_type == ServiceType::Server)
	{
		_listener = make_shared<Listener>();
		if (_listener->Start(shared_from_this()) == false) 
		{
			_listener.reset();
			// TODO: 로그
			return false;
		}
	}
	else
	{
		
	}
	return true;
}


void Service::Stop()
{
	WRITE_LOCK;

	// 모든 세션 정리
	for (auto& session : _sessions)
	{
		if (session) session->Disconnect();
	}
	_sessions.clear();
	_sessionCount = 0;

	_listener.reset();
	_iocpCore.reset();
}


void Service::AddSession(shared_ptr<Session> session)
{
	WRITE_LOCK;
	_sessionCount++;
	_sessions.insert(session);
}

void Service::ReleaseSession(shared_ptr<Session> session)
{
	WRITE_LOCK;
	
	_sessions.erase(session);
	_sessionCount--;
}

shared_ptr<Session> Service::CreateSession()
{
	//shared_ptr<Session> session = make_shared<Session>();
	shared_ptr<Session> session = _sessionFactory();

	session->SetService(shared_from_this());

	if (_type == ServiceType::Client)
	{
		session->SetAddress(GetNetAddress());
	}

	if (false == _iocpCore->Register(session, 0))
		return nullptr;

	return session;
}