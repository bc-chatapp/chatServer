
protoc.exe -I=./ --cpp_out=. protocol.proto

protoc.exe -I=./ --dart_out=. protocol.proto



protoc.exe -I=./ ^
 --plugin=protoc-gen-ts_proto=..\..\chatClient\node_modules\.bin\protoc-gen-ts_proto.cmd ^
 --ts_proto_out=. protocol.proto


IF ERRORLEVEL 1 PAUSE

XCOPY /Y Protocol.pb.h "..\cppServer"
XCOPY /Y Protocol.pb.cc "..\cppServer"

XCOPY /Y Protocol.pb.h "..\DummyClient"
XCOPY /Y Protocol.pb.cc "..\DummyClient"

XCOPY /Y ".\*.dart" "..\..\chatapp\lib\net\proto\"


XCOPY /Y ".\protocol.ts" "..\..\chatClient\src\net\proto\"
