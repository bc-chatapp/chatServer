#include "pch.h"

#include "Service.h"
#include "IocpCore.h"
#include "NetAddress.h"

#include "protocol.pb.h"

static constexpr int PROTO_VERSION = 1;


static void WriteU32BE(char* buf, uint32_t v)
{
	buf[0] = static_cast<char>((v >> 24) & 0xFF);
	buf[1] = static_cast<char>((v >> 16) & 0xFF);
	buf[2] = static_cast<char>((v >> 8) & 0xFF);
	buf[3] = static_cast<char>((v) & 0xFF);
}

static uint32_t ReadU32BE(const BYTE* buf)
{
	return (static_cast<uint32_t>(buf[0]) << 24) |
		(static_cast<uint32_t>(buf[1]) << 16) |
		(static_cast<uint32_t>(buf[2]) << 8) |
		(static_cast<uint32_t>(buf[3]));
}

std::string AnsiToUtf8(const std::string& ansi)
{
	if (ansi.empty()) return std::string();

	// 1) ANSI → UTF-16 (wide)
	int wlen = MultiByteToWideChar(CP_ACP, 0, ansi.c_str(), -1, nullptr, 0);
	if (wlen <= 0) return std::string();

	std::wstring wstr(wlen, L'\0');
	MultiByteToWideChar(CP_ACP, 0, ansi.c_str(), -1, &wstr[0], wlen);

	// 2) UTF-16 → UTF-8
	int u8len = WideCharToMultiByte(CP_UTF8, 0, wstr.c_str(), -1, nullptr, 0, nullptr, nullptr);
	if (u8len <= 0) return std::string();

	std::string utf8(u8len - 1, '\0'); // 마지막 '\0' 제외
	WideCharToMultiByte(CP_UTF8, 0, wstr.c_str(), -1, &utf8[0], u8len, nullptr, nullptr);

	return utf8;
}

class ClientSession : public Session
{
public:
	ClientSession() : _recvBuf() {}
	~ClientSession() { std::wcout << L"~ClientSession" << std::endl; }

protected:
	// 연결 완료되면: 즉시 C_Login 전송
	virtual void OnConnected() override
	{
		std::cout << "[Client] >> Connected\n";
		SendLogin("dummy001"); // 원하는 테스트 ID로 교체 가능
	}

	virtual void OnDisconnected() override
	{
		std::cout << "[Client] >> Disconnected\n";
	}

	// 서버에서 온 데이터를 4바이트 길이 프레이밍으로 파싱
	virtual void OnRecv(BYTE* buffer, int32 len) override
	{
		_recvBuf.insert(_recvBuf.end(), buffer, buffer + len);

		size_t offset = 0;
		while (true)
		{
			if (_recvBuf.size() - offset < 4)
				break;

			uint32_t bodyLen = ReadU32BE(_recvBuf.data() + offset);
			if (_recvBuf.size() - offset - 4 < bodyLen)
				break;

			const BYTE* body = _recvBuf.data() + offset + 4;

			Protocol::Envelope env;
			if (!env.ParseFromArray(body, static_cast<int>(bodyLen)))
			{
				std::cerr << "[Client] !! ParseFromArray failed\n";
				return;
			}

			HandleEnvelope(env);

			offset += 4 + bodyLen;
		}

		if (offset > 0)
		{
			// 남은 데이터만 앞으로 당김
			std::vector<BYTE> remain;
			remain.insert(remain.end(), _recvBuf.begin() + offset, _recvBuf.end());
			_recvBuf.swap(remain);
		}
	}

	virtual void OnSend(int32 /*len*/) override
	{
		// 필요하면 로그
	}

public:
	void SendChatDirect(const std::string& to, const std::string& msg)
	{
		Protocol::C_Chat chat;
		chat.set_conv_id("direct:" + to);
		auto* text = chat.mutable_payload()->mutable_text();

		std::string utf8 = AnsiToUtf8(msg);
		text->set_message(utf8);

		static uint64_t sReqId = 2;
		Protocol::Envelope env;
		env.set_version(1);
		env.set_request_id(sReqId++);
		*env.mutable_c_chat() = chat;

		SendEnvelope(env);
	}

private:
	void SendLogin(const std::string& userId)
	{
		Protocol::C_Login login;
		login.set_user_id(userId);

		Protocol::Envelope env;
		env.set_version(1);        // GProtoVersion과 맞추기
		env.set_request_id(1);     // 대충 1부터
		*env.mutable_c_login() = login;

		SendEnvelope(env);
	}

	// Envelope -> [4B len(be)] + body 직렬화 후 Send
	void SendEnvelope(Protocol::Envelope& env)
	{
		std::string body;
		if (!env.SerializeToString(&body))
		{
			std::cout << "[Dummy] SerializeToString failed\n";
			return;
		}

		// 서버와 통일: 리틀엔디안 uint32 bodyLen
		uint32_t bodyLen = static_cast<uint32_t>(body.size());

		std::vector<char> packet(sizeof(uint32_t) + bodyLen);
		::memcpy(packet.data(), &bodyLen, sizeof(uint32_t));          // 리틀엔디안 그대로
		::memcpy(packet.data() + sizeof(uint32_t), body.data(), bodyLen);

		std::cout << "[Dummy] sending bodyLen=" << bodyLen
			<< " total=" << packet.size() << std::endl;

		auto sendBuffer = std::make_shared<SendBuffer>(static_cast<int32>(packet.size()));
		sendBuffer->CopyData(packet.data(), static_cast<int32>(packet.size()));
		Send(sendBuffer);
	}


	void HandleEnvelope(const Protocol::Envelope& env)
	{
		/*switch (env.body_case())
		{
		case Protocol::Envelope::kSLogin:
			std::cout << "[Recv] S_Login: user=" << env.s_login().user_id()
				<< " token=" << env.s_login().auth_token() << "\n";
			break;

		case Protocol::Envelope::kSChat:
		{
			const auto& s = env.s_chat();
			std::string txt = s.payload().has_text() ? s.payload().text().message() : "[non-text]";
			std::cout << "[Recv] S_Chat conv=" << s.conv_id()
				<< " from=" << s.sender_id()
				<< " msg=" << txt << "\n";
			break;
		}

		case Protocol::Envelope::kSError:
			std::cerr << "[Recv] S_Error: code=" << env.s_error().code()
				<< " msg=" << env.s_error().message() << "\n";
			break;

		default:
			std::cout << "[Recv] Unknown envelope body\n";
			break;
		}*/
	}

private:
	std::vector<BYTE> _recvBuf;
	uint64_t _nextReqId = 1;
};



int main()
{
	// 1) Winsock
	WSADATA wsa;
	if (::WSAStartup(MAKEWORD(2, 2), &wsa) != 0)
	{
		std::cout << "[Error] WSAStartup failed\n";
		return 0;
	}

	// 2) IOCP Core
	auto iocpCore = std::make_shared<IocpCore>();

	// 3) Service (Client)
	auto service = std::make_shared<Service>(
		ServiceType::Client,
		NetAddress(L"127.0.0.1", 7777),
		iocpCore,
		[]() { return std::make_shared<ClientSession>(); }
	);

	// 4) 세션 생성 + ConnectEx
	auto clientSession = service->CreateSession();
	if (clientSession == nullptr)
	{
		std::cout << "[Error] CreateSession failed\n";
		return 0;
	}

	if (clientSession->Connect() == false)
	{
		std::cout << "[Error] ConnectEx failed\n";
		return 0;
	}

	std::cout << "[Client] Connecting to 127.0.0.1:7777 ...\n";

	// 5) IO 스레드 루프
	std::thread ioThread([iocpCore]()
		{
			while (true)
			{
				iocpCore->Dispatch();
			}
		});

	// 6) 콘솔 입력 → C_Chat(direct:dummy_002) 전송
	std::cout << "Type message and press Enter (exit to quit)\n";
	while (true)
	{
		std::string input;
		if (!std::getline(std::cin, input)) break;
		if (input == "exit") break;

		if (clientSession->IsConnected() == false)
		{
			std::cout << "[Client] Not connected\n";
			continue;
		}

		// 기본 테스트: 상대를 dummy_002로 고정
		std::static_pointer_cast<ClientSession>(clientSession)->SendChatDirect("userid", input);
	}

	ioThread.join();
	::WSACleanup();
	return 0;
}