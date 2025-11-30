#include "pch.h"
#include "SendBuffer.h"

SendBuffer::SendBuffer(int32 bufferSize)
{
	_buffer.resize(bufferSize);
}

void SendBuffer::CopyData(void* Data, int32 len)
{
	if (Capacity() < len) return;

	::memcpy(_buffer.data(), Data, len);
	_writeSize = len;
}

void SendBuffer::Close(int32 writeSize)
{
	_writeSize = writeSize;
}
