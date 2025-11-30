#pragma once



class SendBuffer : public enable_shared_from_this<SendBuffer>
{
public:
	SendBuffer(int32 bufferSize);
	~SendBuffer() = default;

	BYTE* Buffer() { return _buffer.data(); }
	int32 WriteSize() { return _writeSize; }
	int32 Capacity() { return static_cast<int32>(_buffer.size()); }

	void CopyData(void* Data, int32 len);
	void Close(int32 writeSize);

private:
	vector<BYTE>	_buffer;
	int32			_writeSize = 0;
};

