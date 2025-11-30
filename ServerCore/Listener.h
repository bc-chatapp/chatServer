#pragma once
#include "IocpCore.h"



class Session;
class Service;

class Listener : public IocpObject
{
public:
	Listener() = default;
	~Listener();

public:
	bool Start(shared_ptr<Service> service);

public:
	virtual HANDLE GetHandle() override;
	virtual void Dispatch(class IocpEvent* iocpEvent, int32 Bytes = 0) override;


private:
	void RegisterAccept();
	void ProcessAccept(class AcceptEvent* acceptEvent);

protected:
	shared_ptr<Service> _service;
	SOCKET _socket = INVALID_SOCKET;


private:
	static LPFN_ACCEPTEX AcceptEx;
};

