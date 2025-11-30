#pragma once



class IocpObject : public enable_shared_from_this<IocpObject>
{
public:
	virtual HANDLE GetHandle() = 0;
	virtual void Dispatch(class IocpEvent* iocpEvent, int32 Bytes = 0) = 0;
};


class IocpCore
{
public:
	IocpCore();
	~IocpCore();

	HANDLE Handle() const { return _iocpHandle; }

	bool Register(shared_ptr<IocpObject> iocpObject, ULONG_PTR key);
	bool Dispatch(DWORD ms = INFINITE);


private:
	HANDLE _iocpHandle;

};

