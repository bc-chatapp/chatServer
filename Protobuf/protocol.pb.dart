// This is a generated file - do not edit.
//
// Generated from protocol.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'protocol.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'protocol.pbenum.dart';

enum Envelope_Body {
  cSignup,
  sSignup,
  cLogin,
  sLogin,
  cJoinDirect,
  cJoinGroup,
  cCreateGroup,
  sCreateGroup,
  cAck,
  sError,
  cHeartbeat,
  sHeartbeat,
  cChat,
  sChat,
  cFetchOffline,
  sMessageBatch,
  cUploadFile,
  sUploadFile,
  cFriendList,
  sFriendList,
  cGroupList,
  sGroupList,
  cGroupJoinRequest,
  sGroupJoinRequest,
  cGroupJoinResponse,
  sGroupJoinResponse,
  cGroupJoinRequestList,
  sGroupJoinRequestList,
  cFrientRequestFind,
  sFrientRequestFind,
  cFriendRequestAdd,
  sFriendRequestAdd,
  cFriendRequestCancel,
  sFriendRequestCancel,
  cFriendRequestRemove,
  sFriendRequestRemove,
  cFriendRequestList,
  sFriendRequestList,
  cFriendRequestRespond,
  sFriendRequestRespond,
  sFriendRequestPush,
  notSet
}

class Envelope extends $pb.GeneratedMessage {
  factory Envelope({
    $core.int? version,
    $fixnum.Int64? requestId,
    $core.String? authToken,
    C_SignUp? cSignup,
    S_SignUp? sSignup,
    C_Login? cLogin,
    S_Login? sLogin,
    C_JoinDirect? cJoinDirect,
    C_JoinGroup? cJoinGroup,
    C_CreateGroup? cCreateGroup,
    S_CreateGroup? sCreateGroup,
    C_Ack? cAck,
    S_Error? sError,
    C_Heartbeat? cHeartbeat,
    S_Heartbeat? sHeartbeat,
    C_Chat? cChat,
    S_Chat? sChat,
    C_FetchOffline? cFetchOffline,
    S_MessageBatch? sMessageBatch,
    C_UploadFile? cUploadFile,
    S_UploadFile? sUploadFile,
    C_FriendList? cFriendList,
    S_FriendList? sFriendList,
    C_GroupList? cGroupList,
    S_GroupList? sGroupList,
    C_GroupJoinRequest? cGroupJoinRequest,
    S_GroupJoinRequest? sGroupJoinRequest,
    C_GroupJoinResponse? cGroupJoinResponse,
    S_GroupJoinResponse? sGroupJoinResponse,
    C_GroupJoinRequestList? cGroupJoinRequestList,
    S_GroupJoinRequestList? sGroupJoinRequestList,
    C_FriendRequest_Find? cFrientRequestFind,
    S_FriendRequest_Find? sFrientRequestFind,
    C_FriendRequest_Add? cFriendRequestAdd,
    S_FriendRequest_Add? sFriendRequestAdd,
    C_FriendRequest_Cancel? cFriendRequestCancel,
    S_FriendRequest_Cancel? sFriendRequestCancel,
    C_FriendRequest_Remove? cFriendRequestRemove,
    S_FriendRequest_Remove? sFriendRequestRemove,
    C_FriendRequest_List? cFriendRequestList,
    S_FriendRequest_List? sFriendRequestList,
    C_FriendRequest_Respond? cFriendRequestRespond,
    S_FriendRequest_Respond? sFriendRequestRespond,
    S_FriendRequest_Push? sFriendRequestPush,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (requestId != null) result.requestId = requestId;
    if (authToken != null) result.authToken = authToken;
    if (cSignup != null) result.cSignup = cSignup;
    if (sSignup != null) result.sSignup = sSignup;
    if (cLogin != null) result.cLogin = cLogin;
    if (sLogin != null) result.sLogin = sLogin;
    if (cJoinDirect != null) result.cJoinDirect = cJoinDirect;
    if (cJoinGroup != null) result.cJoinGroup = cJoinGroup;
    if (cCreateGroup != null) result.cCreateGroup = cCreateGroup;
    if (sCreateGroup != null) result.sCreateGroup = sCreateGroup;
    if (cAck != null) result.cAck = cAck;
    if (sError != null) result.sError = sError;
    if (cHeartbeat != null) result.cHeartbeat = cHeartbeat;
    if (sHeartbeat != null) result.sHeartbeat = sHeartbeat;
    if (cChat != null) result.cChat = cChat;
    if (sChat != null) result.sChat = sChat;
    if (cFetchOffline != null) result.cFetchOffline = cFetchOffline;
    if (sMessageBatch != null) result.sMessageBatch = sMessageBatch;
    if (cUploadFile != null) result.cUploadFile = cUploadFile;
    if (sUploadFile != null) result.sUploadFile = sUploadFile;
    if (cFriendList != null) result.cFriendList = cFriendList;
    if (sFriendList != null) result.sFriendList = sFriendList;
    if (cGroupList != null) result.cGroupList = cGroupList;
    if (sGroupList != null) result.sGroupList = sGroupList;
    if (cGroupJoinRequest != null) result.cGroupJoinRequest = cGroupJoinRequest;
    if (sGroupJoinRequest != null) result.sGroupJoinRequest = sGroupJoinRequest;
    if (cGroupJoinResponse != null)
      result.cGroupJoinResponse = cGroupJoinResponse;
    if (sGroupJoinResponse != null)
      result.sGroupJoinResponse = sGroupJoinResponse;
    if (cGroupJoinRequestList != null)
      result.cGroupJoinRequestList = cGroupJoinRequestList;
    if (sGroupJoinRequestList != null)
      result.sGroupJoinRequestList = sGroupJoinRequestList;
    if (cFrientRequestFind != null)
      result.cFrientRequestFind = cFrientRequestFind;
    if (sFrientRequestFind != null)
      result.sFrientRequestFind = sFrientRequestFind;
    if (cFriendRequestAdd != null) result.cFriendRequestAdd = cFriendRequestAdd;
    if (sFriendRequestAdd != null) result.sFriendRequestAdd = sFriendRequestAdd;
    if (cFriendRequestCancel != null)
      result.cFriendRequestCancel = cFriendRequestCancel;
    if (sFriendRequestCancel != null)
      result.sFriendRequestCancel = sFriendRequestCancel;
    if (cFriendRequestRemove != null)
      result.cFriendRequestRemove = cFriendRequestRemove;
    if (sFriendRequestRemove != null)
      result.sFriendRequestRemove = sFriendRequestRemove;
    if (cFriendRequestList != null)
      result.cFriendRequestList = cFriendRequestList;
    if (sFriendRequestList != null)
      result.sFriendRequestList = sFriendRequestList;
    if (cFriendRequestRespond != null)
      result.cFriendRequestRespond = cFriendRequestRespond;
    if (sFriendRequestRespond != null)
      result.sFriendRequestRespond = sFriendRequestRespond;
    if (sFriendRequestPush != null)
      result.sFriendRequestPush = sFriendRequestPush;
    return result;
  }

  Envelope._();

  factory Envelope.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Envelope.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Envelope_Body> _Envelope_BodyByTag = {
    10: Envelope_Body.cSignup,
    11: Envelope_Body.sSignup,
    20: Envelope_Body.cLogin,
    21: Envelope_Body.sLogin,
    22: Envelope_Body.cJoinDirect,
    23: Envelope_Body.cJoinGroup,
    24: Envelope_Body.cCreateGroup,
    25: Envelope_Body.sCreateGroup,
    26: Envelope_Body.cAck,
    27: Envelope_Body.sError,
    28: Envelope_Body.cHeartbeat,
    29: Envelope_Body.sHeartbeat,
    30: Envelope_Body.cChat,
    31: Envelope_Body.sChat,
    32: Envelope_Body.cFetchOffline,
    33: Envelope_Body.sMessageBatch,
    34: Envelope_Body.cUploadFile,
    35: Envelope_Body.sUploadFile,
    40: Envelope_Body.cFriendList,
    41: Envelope_Body.sFriendList,
    42: Envelope_Body.cGroupList,
    43: Envelope_Body.sGroupList,
    44: Envelope_Body.cGroupJoinRequest,
    45: Envelope_Body.sGroupJoinRequest,
    46: Envelope_Body.cGroupJoinResponse,
    47: Envelope_Body.sGroupJoinResponse,
    48: Envelope_Body.cGroupJoinRequestList,
    49: Envelope_Body.sGroupJoinRequestList,
    50: Envelope_Body.cFrientRequestFind,
    51: Envelope_Body.sFrientRequestFind,
    52: Envelope_Body.cFriendRequestAdd,
    53: Envelope_Body.sFriendRequestAdd,
    54: Envelope_Body.cFriendRequestCancel,
    55: Envelope_Body.sFriendRequestCancel,
    56: Envelope_Body.cFriendRequestRemove,
    57: Envelope_Body.sFriendRequestRemove,
    58: Envelope_Body.cFriendRequestList,
    59: Envelope_Body.sFriendRequestList,
    60: Envelope_Body.cFriendRequestRespond,
    61: Envelope_Body.sFriendRequestRespond,
    62: Envelope_Body.sFriendRequestPush,
    0: Envelope_Body.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Envelope',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..oo(0, [
      10,
      11,
      20,
      21,
      22,
      23,
      24,
      25,
      26,
      27,
      28,
      29,
      30,
      31,
      32,
      33,
      34,
      35,
      40,
      41,
      42,
      43,
      44,
      45,
      46,
      47,
      48,
      49,
      50,
      51,
      52,
      53,
      54,
      55,
      56,
      57,
      58,
      59,
      60,
      61,
      62
    ])
    ..aI(1, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'requestId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'authToken')
    ..aOM<C_SignUp>(10, _omitFieldNames ? '' : 'cSignup',
        subBuilder: C_SignUp.create)
    ..aOM<S_SignUp>(11, _omitFieldNames ? '' : 'sSignup',
        subBuilder: S_SignUp.create)
    ..aOM<C_Login>(20, _omitFieldNames ? '' : 'cLogin',
        subBuilder: C_Login.create)
    ..aOM<S_Login>(21, _omitFieldNames ? '' : 'sLogin',
        subBuilder: S_Login.create)
    ..aOM<C_JoinDirect>(22, _omitFieldNames ? '' : 'cJoinDirect',
        subBuilder: C_JoinDirect.create)
    ..aOM<C_JoinGroup>(23, _omitFieldNames ? '' : 'cJoinGroup',
        subBuilder: C_JoinGroup.create)
    ..aOM<C_CreateGroup>(24, _omitFieldNames ? '' : 'cCreateGroup',
        subBuilder: C_CreateGroup.create)
    ..aOM<S_CreateGroup>(25, _omitFieldNames ? '' : 'sCreateGroup',
        subBuilder: S_CreateGroup.create)
    ..aOM<C_Ack>(26, _omitFieldNames ? '' : 'cAck', subBuilder: C_Ack.create)
    ..aOM<S_Error>(27, _omitFieldNames ? '' : 'sError',
        subBuilder: S_Error.create)
    ..aOM<C_Heartbeat>(28, _omitFieldNames ? '' : 'cHeartbeat',
        subBuilder: C_Heartbeat.create)
    ..aOM<S_Heartbeat>(29, _omitFieldNames ? '' : 'sHeartbeat',
        subBuilder: S_Heartbeat.create)
    ..aOM<C_Chat>(30, _omitFieldNames ? '' : 'cChat', subBuilder: C_Chat.create)
    ..aOM<S_Chat>(31, _omitFieldNames ? '' : 'sChat', subBuilder: S_Chat.create)
    ..aOM<C_FetchOffline>(32, _omitFieldNames ? '' : 'cFetchOffline',
        subBuilder: C_FetchOffline.create)
    ..aOM<S_MessageBatch>(33, _omitFieldNames ? '' : 'sMessageBatch',
        subBuilder: S_MessageBatch.create)
    ..aOM<C_UploadFile>(34, _omitFieldNames ? '' : 'cUploadFile',
        subBuilder: C_UploadFile.create)
    ..aOM<S_UploadFile>(35, _omitFieldNames ? '' : 'sUploadFile',
        subBuilder: S_UploadFile.create)
    ..aOM<C_FriendList>(40, _omitFieldNames ? '' : 'cFriendList',
        subBuilder: C_FriendList.create)
    ..aOM<S_FriendList>(41, _omitFieldNames ? '' : 'sFriendList',
        subBuilder: S_FriendList.create)
    ..aOM<C_GroupList>(42, _omitFieldNames ? '' : 'cGroupList',
        subBuilder: C_GroupList.create)
    ..aOM<S_GroupList>(43, _omitFieldNames ? '' : 'sGroupList',
        subBuilder: S_GroupList.create)
    ..aOM<C_GroupJoinRequest>(44, _omitFieldNames ? '' : 'cGroupJoinRequest',
        subBuilder: C_GroupJoinRequest.create)
    ..aOM<S_GroupJoinRequest>(45, _omitFieldNames ? '' : 'sGroupJoinRequest',
        subBuilder: S_GroupJoinRequest.create)
    ..aOM<C_GroupJoinResponse>(46, _omitFieldNames ? '' : 'cGroupJoinResponse',
        subBuilder: C_GroupJoinResponse.create)
    ..aOM<S_GroupJoinResponse>(47, _omitFieldNames ? '' : 'sGroupJoinResponse',
        subBuilder: S_GroupJoinResponse.create)
    ..aOM<C_GroupJoinRequestList>(
        48, _omitFieldNames ? '' : 'cGroupJoinRequestList',
        subBuilder: C_GroupJoinRequestList.create)
    ..aOM<S_GroupJoinRequestList>(
        49, _omitFieldNames ? '' : 'sGroupJoinRequestList',
        subBuilder: S_GroupJoinRequestList.create)
    ..aOM<C_FriendRequest_Find>(50, _omitFieldNames ? '' : 'cFrientRequestFind',
        subBuilder: C_FriendRequest_Find.create)
    ..aOM<S_FriendRequest_Find>(51, _omitFieldNames ? '' : 'sFrientRequestFind',
        subBuilder: S_FriendRequest_Find.create)
    ..aOM<C_FriendRequest_Add>(52, _omitFieldNames ? '' : 'cFriendRequestAdd',
        subBuilder: C_FriendRequest_Add.create)
    ..aOM<S_FriendRequest_Add>(53, _omitFieldNames ? '' : 'sFriendRequestAdd',
        subBuilder: S_FriendRequest_Add.create)
    ..aOM<C_FriendRequest_Cancel>(
        54, _omitFieldNames ? '' : 'cFriendRequestCancel',
        subBuilder: C_FriendRequest_Cancel.create)
    ..aOM<S_FriendRequest_Cancel>(
        55, _omitFieldNames ? '' : 'sFriendRequestCancel',
        subBuilder: S_FriendRequest_Cancel.create)
    ..aOM<C_FriendRequest_Remove>(
        56, _omitFieldNames ? '' : 'cFriendRequestRemove',
        subBuilder: C_FriendRequest_Remove.create)
    ..aOM<S_FriendRequest_Remove>(
        57, _omitFieldNames ? '' : 'sFriendRequestRemove',
        subBuilder: S_FriendRequest_Remove.create)
    ..aOM<C_FriendRequest_List>(58, _omitFieldNames ? '' : 'cFriendRequestList',
        subBuilder: C_FriendRequest_List.create)
    ..aOM<S_FriendRequest_List>(59, _omitFieldNames ? '' : 'sFriendRequestList',
        subBuilder: S_FriendRequest_List.create)
    ..aOM<C_FriendRequest_Respond>(
        60, _omitFieldNames ? '' : 'cFriendRequestRespond',
        subBuilder: C_FriendRequest_Respond.create)
    ..aOM<S_FriendRequest_Respond>(
        61, _omitFieldNames ? '' : 'sFriendRequestRespond',
        subBuilder: S_FriendRequest_Respond.create)
    ..aOM<S_FriendRequest_Push>(62, _omitFieldNames ? '' : 'sFriendRequestPush',
        subBuilder: S_FriendRequest_Push.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Envelope clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Envelope copyWith(void Function(Envelope) updates) =>
      super.copyWith((message) => updates(message as Envelope)) as Envelope;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Envelope create() => Envelope._();
  @$core.override
  Envelope createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Envelope getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Envelope>(create);
  static Envelope? _defaultInstance;

  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(20)
  @$pb.TagNumber(21)
  @$pb.TagNumber(22)
  @$pb.TagNumber(23)
  @$pb.TagNumber(24)
  @$pb.TagNumber(25)
  @$pb.TagNumber(26)
  @$pb.TagNumber(27)
  @$pb.TagNumber(28)
  @$pb.TagNumber(29)
  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  @$pb.TagNumber(32)
  @$pb.TagNumber(33)
  @$pb.TagNumber(34)
  @$pb.TagNumber(35)
  @$pb.TagNumber(40)
  @$pb.TagNumber(41)
  @$pb.TagNumber(42)
  @$pb.TagNumber(43)
  @$pb.TagNumber(44)
  @$pb.TagNumber(45)
  @$pb.TagNumber(46)
  @$pb.TagNumber(47)
  @$pb.TagNumber(48)
  @$pb.TagNumber(49)
  @$pb.TagNumber(50)
  @$pb.TagNumber(51)
  @$pb.TagNumber(52)
  @$pb.TagNumber(53)
  @$pb.TagNumber(54)
  @$pb.TagNumber(55)
  @$pb.TagNumber(56)
  @$pb.TagNumber(57)
  @$pb.TagNumber(58)
  @$pb.TagNumber(59)
  @$pb.TagNumber(60)
  @$pb.TagNumber(61)
  @$pb.TagNumber(62)
  Envelope_Body whichBody() => _Envelope_BodyByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(20)
  @$pb.TagNumber(21)
  @$pb.TagNumber(22)
  @$pb.TagNumber(23)
  @$pb.TagNumber(24)
  @$pb.TagNumber(25)
  @$pb.TagNumber(26)
  @$pb.TagNumber(27)
  @$pb.TagNumber(28)
  @$pb.TagNumber(29)
  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  @$pb.TagNumber(32)
  @$pb.TagNumber(33)
  @$pb.TagNumber(34)
  @$pb.TagNumber(35)
  @$pb.TagNumber(40)
  @$pb.TagNumber(41)
  @$pb.TagNumber(42)
  @$pb.TagNumber(43)
  @$pb.TagNumber(44)
  @$pb.TagNumber(45)
  @$pb.TagNumber(46)
  @$pb.TagNumber(47)
  @$pb.TagNumber(48)
  @$pb.TagNumber(49)
  @$pb.TagNumber(50)
  @$pb.TagNumber(51)
  @$pb.TagNumber(52)
  @$pb.TagNumber(53)
  @$pb.TagNumber(54)
  @$pb.TagNumber(55)
  @$pb.TagNumber(56)
  @$pb.TagNumber(57)
  @$pb.TagNumber(58)
  @$pb.TagNumber(59)
  @$pb.TagNumber(60)
  @$pb.TagNumber(61)
  @$pb.TagNumber(62)
  void clearBody() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get requestId => $_getI64(1);
  @$pb.TagNumber(2)
  set requestId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRequestId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get authToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set authToken($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAuthToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthToken() => $_clearField(3);

  /// AUTH
  @$pb.TagNumber(10)
  C_SignUp get cSignup => $_getN(3);
  @$pb.TagNumber(10)
  set cSignup(C_SignUp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasCSignup() => $_has(3);
  @$pb.TagNumber(10)
  void clearCSignup() => $_clearField(10);
  @$pb.TagNumber(10)
  C_SignUp ensureCSignup() => $_ensure(3);

  @$pb.TagNumber(11)
  S_SignUp get sSignup => $_getN(4);
  @$pb.TagNumber(11)
  set sSignup(S_SignUp value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasSSignup() => $_has(4);
  @$pb.TagNumber(11)
  void clearSSignup() => $_clearField(11);
  @$pb.TagNumber(11)
  S_SignUp ensureSSignup() => $_ensure(4);

  @$pb.TagNumber(20)
  C_Login get cLogin => $_getN(5);
  @$pb.TagNumber(20)
  set cLogin(C_Login value) => $_setField(20, value);
  @$pb.TagNumber(20)
  $core.bool hasCLogin() => $_has(5);
  @$pb.TagNumber(20)
  void clearCLogin() => $_clearField(20);
  @$pb.TagNumber(20)
  C_Login ensureCLogin() => $_ensure(5);

  @$pb.TagNumber(21)
  S_Login get sLogin => $_getN(6);
  @$pb.TagNumber(21)
  set sLogin(S_Login value) => $_setField(21, value);
  @$pb.TagNumber(21)
  $core.bool hasSLogin() => $_has(6);
  @$pb.TagNumber(21)
  void clearSLogin() => $_clearField(21);
  @$pb.TagNumber(21)
  S_Login ensureSLogin() => $_ensure(6);

  @$pb.TagNumber(22)
  C_JoinDirect get cJoinDirect => $_getN(7);
  @$pb.TagNumber(22)
  set cJoinDirect(C_JoinDirect value) => $_setField(22, value);
  @$pb.TagNumber(22)
  $core.bool hasCJoinDirect() => $_has(7);
  @$pb.TagNumber(22)
  void clearCJoinDirect() => $_clearField(22);
  @$pb.TagNumber(22)
  C_JoinDirect ensureCJoinDirect() => $_ensure(7);

  @$pb.TagNumber(23)
  C_JoinGroup get cJoinGroup => $_getN(8);
  @$pb.TagNumber(23)
  set cJoinGroup(C_JoinGroup value) => $_setField(23, value);
  @$pb.TagNumber(23)
  $core.bool hasCJoinGroup() => $_has(8);
  @$pb.TagNumber(23)
  void clearCJoinGroup() => $_clearField(23);
  @$pb.TagNumber(23)
  C_JoinGroup ensureCJoinGroup() => $_ensure(8);

  @$pb.TagNumber(24)
  C_CreateGroup get cCreateGroup => $_getN(9);
  @$pb.TagNumber(24)
  set cCreateGroup(C_CreateGroup value) => $_setField(24, value);
  @$pb.TagNumber(24)
  $core.bool hasCCreateGroup() => $_has(9);
  @$pb.TagNumber(24)
  void clearCCreateGroup() => $_clearField(24);
  @$pb.TagNumber(24)
  C_CreateGroup ensureCCreateGroup() => $_ensure(9);

  @$pb.TagNumber(25)
  S_CreateGroup get sCreateGroup => $_getN(10);
  @$pb.TagNumber(25)
  set sCreateGroup(S_CreateGroup value) => $_setField(25, value);
  @$pb.TagNumber(25)
  $core.bool hasSCreateGroup() => $_has(10);
  @$pb.TagNumber(25)
  void clearSCreateGroup() => $_clearField(25);
  @$pb.TagNumber(25)
  S_CreateGroup ensureSCreateGroup() => $_ensure(10);

  @$pb.TagNumber(26)
  C_Ack get cAck => $_getN(11);
  @$pb.TagNumber(26)
  set cAck(C_Ack value) => $_setField(26, value);
  @$pb.TagNumber(26)
  $core.bool hasCAck() => $_has(11);
  @$pb.TagNumber(26)
  void clearCAck() => $_clearField(26);
  @$pb.TagNumber(26)
  C_Ack ensureCAck() => $_ensure(11);

  @$pb.TagNumber(27)
  S_Error get sError => $_getN(12);
  @$pb.TagNumber(27)
  set sError(S_Error value) => $_setField(27, value);
  @$pb.TagNumber(27)
  $core.bool hasSError() => $_has(12);
  @$pb.TagNumber(27)
  void clearSError() => $_clearField(27);
  @$pb.TagNumber(27)
  S_Error ensureSError() => $_ensure(12);

  @$pb.TagNumber(28)
  C_Heartbeat get cHeartbeat => $_getN(13);
  @$pb.TagNumber(28)
  set cHeartbeat(C_Heartbeat value) => $_setField(28, value);
  @$pb.TagNumber(28)
  $core.bool hasCHeartbeat() => $_has(13);
  @$pb.TagNumber(28)
  void clearCHeartbeat() => $_clearField(28);
  @$pb.TagNumber(28)
  C_Heartbeat ensureCHeartbeat() => $_ensure(13);

  @$pb.TagNumber(29)
  S_Heartbeat get sHeartbeat => $_getN(14);
  @$pb.TagNumber(29)
  set sHeartbeat(S_Heartbeat value) => $_setField(29, value);
  @$pb.TagNumber(29)
  $core.bool hasSHeartbeat() => $_has(14);
  @$pb.TagNumber(29)
  void clearSHeartbeat() => $_clearField(29);
  @$pb.TagNumber(29)
  S_Heartbeat ensureSHeartbeat() => $_ensure(14);

  /// Chat, Data(File)
  @$pb.TagNumber(30)
  C_Chat get cChat => $_getN(15);
  @$pb.TagNumber(30)
  set cChat(C_Chat value) => $_setField(30, value);
  @$pb.TagNumber(30)
  $core.bool hasCChat() => $_has(15);
  @$pb.TagNumber(30)
  void clearCChat() => $_clearField(30);
  @$pb.TagNumber(30)
  C_Chat ensureCChat() => $_ensure(15);

  @$pb.TagNumber(31)
  S_Chat get sChat => $_getN(16);
  @$pb.TagNumber(31)
  set sChat(S_Chat value) => $_setField(31, value);
  @$pb.TagNumber(31)
  $core.bool hasSChat() => $_has(16);
  @$pb.TagNumber(31)
  void clearSChat() => $_clearField(31);
  @$pb.TagNumber(31)
  S_Chat ensureSChat() => $_ensure(16);

  @$pb.TagNumber(32)
  C_FetchOffline get cFetchOffline => $_getN(17);
  @$pb.TagNumber(32)
  set cFetchOffline(C_FetchOffline value) => $_setField(32, value);
  @$pb.TagNumber(32)
  $core.bool hasCFetchOffline() => $_has(17);
  @$pb.TagNumber(32)
  void clearCFetchOffline() => $_clearField(32);
  @$pb.TagNumber(32)
  C_FetchOffline ensureCFetchOffline() => $_ensure(17);

  @$pb.TagNumber(33)
  S_MessageBatch get sMessageBatch => $_getN(18);
  @$pb.TagNumber(33)
  set sMessageBatch(S_MessageBatch value) => $_setField(33, value);
  @$pb.TagNumber(33)
  $core.bool hasSMessageBatch() => $_has(18);
  @$pb.TagNumber(33)
  void clearSMessageBatch() => $_clearField(33);
  @$pb.TagNumber(33)
  S_MessageBatch ensureSMessageBatch() => $_ensure(18);

  @$pb.TagNumber(34)
  C_UploadFile get cUploadFile => $_getN(19);
  @$pb.TagNumber(34)
  set cUploadFile(C_UploadFile value) => $_setField(34, value);
  @$pb.TagNumber(34)
  $core.bool hasCUploadFile() => $_has(19);
  @$pb.TagNumber(34)
  void clearCUploadFile() => $_clearField(34);
  @$pb.TagNumber(34)
  C_UploadFile ensureCUploadFile() => $_ensure(19);

  @$pb.TagNumber(35)
  S_UploadFile get sUploadFile => $_getN(20);
  @$pb.TagNumber(35)
  set sUploadFile(S_UploadFile value) => $_setField(35, value);
  @$pb.TagNumber(35)
  $core.bool hasSUploadFile() => $_has(20);
  @$pb.TagNumber(35)
  void clearSUploadFile() => $_clearField(35);
  @$pb.TagNumber(35)
  S_UploadFile ensureSUploadFile() => $_ensure(20);

  @$pb.TagNumber(40)
  C_FriendList get cFriendList => $_getN(21);
  @$pb.TagNumber(40)
  set cFriendList(C_FriendList value) => $_setField(40, value);
  @$pb.TagNumber(40)
  $core.bool hasCFriendList() => $_has(21);
  @$pb.TagNumber(40)
  void clearCFriendList() => $_clearField(40);
  @$pb.TagNumber(40)
  C_FriendList ensureCFriendList() => $_ensure(21);

  @$pb.TagNumber(41)
  S_FriendList get sFriendList => $_getN(22);
  @$pb.TagNumber(41)
  set sFriendList(S_FriendList value) => $_setField(41, value);
  @$pb.TagNumber(41)
  $core.bool hasSFriendList() => $_has(22);
  @$pb.TagNumber(41)
  void clearSFriendList() => $_clearField(41);
  @$pb.TagNumber(41)
  S_FriendList ensureSFriendList() => $_ensure(22);

  @$pb.TagNumber(42)
  C_GroupList get cGroupList => $_getN(23);
  @$pb.TagNumber(42)
  set cGroupList(C_GroupList value) => $_setField(42, value);
  @$pb.TagNumber(42)
  $core.bool hasCGroupList() => $_has(23);
  @$pb.TagNumber(42)
  void clearCGroupList() => $_clearField(42);
  @$pb.TagNumber(42)
  C_GroupList ensureCGroupList() => $_ensure(23);

  @$pb.TagNumber(43)
  S_GroupList get sGroupList => $_getN(24);
  @$pb.TagNumber(43)
  set sGroupList(S_GroupList value) => $_setField(43, value);
  @$pb.TagNumber(43)
  $core.bool hasSGroupList() => $_has(24);
  @$pb.TagNumber(43)
  void clearSGroupList() => $_clearField(43);
  @$pb.TagNumber(43)
  S_GroupList ensureSGroupList() => $_ensure(24);

  @$pb.TagNumber(44)
  C_GroupJoinRequest get cGroupJoinRequest => $_getN(25);
  @$pb.TagNumber(44)
  set cGroupJoinRequest(C_GroupJoinRequest value) => $_setField(44, value);
  @$pb.TagNumber(44)
  $core.bool hasCGroupJoinRequest() => $_has(25);
  @$pb.TagNumber(44)
  void clearCGroupJoinRequest() => $_clearField(44);
  @$pb.TagNumber(44)
  C_GroupJoinRequest ensureCGroupJoinRequest() => $_ensure(25);

  @$pb.TagNumber(45)
  S_GroupJoinRequest get sGroupJoinRequest => $_getN(26);
  @$pb.TagNumber(45)
  set sGroupJoinRequest(S_GroupJoinRequest value) => $_setField(45, value);
  @$pb.TagNumber(45)
  $core.bool hasSGroupJoinRequest() => $_has(26);
  @$pb.TagNumber(45)
  void clearSGroupJoinRequest() => $_clearField(45);
  @$pb.TagNumber(45)
  S_GroupJoinRequest ensureSGroupJoinRequest() => $_ensure(26);

  @$pb.TagNumber(46)
  C_GroupJoinResponse get cGroupJoinResponse => $_getN(27);
  @$pb.TagNumber(46)
  set cGroupJoinResponse(C_GroupJoinResponse value) => $_setField(46, value);
  @$pb.TagNumber(46)
  $core.bool hasCGroupJoinResponse() => $_has(27);
  @$pb.TagNumber(46)
  void clearCGroupJoinResponse() => $_clearField(46);
  @$pb.TagNumber(46)
  C_GroupJoinResponse ensureCGroupJoinResponse() => $_ensure(27);

  @$pb.TagNumber(47)
  S_GroupJoinResponse get sGroupJoinResponse => $_getN(28);
  @$pb.TagNumber(47)
  set sGroupJoinResponse(S_GroupJoinResponse value) => $_setField(47, value);
  @$pb.TagNumber(47)
  $core.bool hasSGroupJoinResponse() => $_has(28);
  @$pb.TagNumber(47)
  void clearSGroupJoinResponse() => $_clearField(47);
  @$pb.TagNumber(47)
  S_GroupJoinResponse ensureSGroupJoinResponse() => $_ensure(28);

  @$pb.TagNumber(48)
  C_GroupJoinRequestList get cGroupJoinRequestList => $_getN(29);
  @$pb.TagNumber(48)
  set cGroupJoinRequestList(C_GroupJoinRequestList value) =>
      $_setField(48, value);
  @$pb.TagNumber(48)
  $core.bool hasCGroupJoinRequestList() => $_has(29);
  @$pb.TagNumber(48)
  void clearCGroupJoinRequestList() => $_clearField(48);
  @$pb.TagNumber(48)
  C_GroupJoinRequestList ensureCGroupJoinRequestList() => $_ensure(29);

  @$pb.TagNumber(49)
  S_GroupJoinRequestList get sGroupJoinRequestList => $_getN(30);
  @$pb.TagNumber(49)
  set sGroupJoinRequestList(S_GroupJoinRequestList value) =>
      $_setField(49, value);
  @$pb.TagNumber(49)
  $core.bool hasSGroupJoinRequestList() => $_has(30);
  @$pb.TagNumber(49)
  void clearSGroupJoinRequestList() => $_clearField(49);
  @$pb.TagNumber(49)
  S_GroupJoinRequestList ensureSGroupJoinRequestList() => $_ensure(30);

  /// Friend Request (50-)
  @$pb.TagNumber(50)
  C_FriendRequest_Find get cFrientRequestFind => $_getN(31);
  @$pb.TagNumber(50)
  set cFrientRequestFind(C_FriendRequest_Find value) => $_setField(50, value);
  @$pb.TagNumber(50)
  $core.bool hasCFrientRequestFind() => $_has(31);
  @$pb.TagNumber(50)
  void clearCFrientRequestFind() => $_clearField(50);
  @$pb.TagNumber(50)
  C_FriendRequest_Find ensureCFrientRequestFind() => $_ensure(31);

  @$pb.TagNumber(51)
  S_FriendRequest_Find get sFrientRequestFind => $_getN(32);
  @$pb.TagNumber(51)
  set sFrientRequestFind(S_FriendRequest_Find value) => $_setField(51, value);
  @$pb.TagNumber(51)
  $core.bool hasSFrientRequestFind() => $_has(32);
  @$pb.TagNumber(51)
  void clearSFrientRequestFind() => $_clearField(51);
  @$pb.TagNumber(51)
  S_FriendRequest_Find ensureSFrientRequestFind() => $_ensure(32);

  @$pb.TagNumber(52)
  C_FriendRequest_Add get cFriendRequestAdd => $_getN(33);
  @$pb.TagNumber(52)
  set cFriendRequestAdd(C_FriendRequest_Add value) => $_setField(52, value);
  @$pb.TagNumber(52)
  $core.bool hasCFriendRequestAdd() => $_has(33);
  @$pb.TagNumber(52)
  void clearCFriendRequestAdd() => $_clearField(52);
  @$pb.TagNumber(52)
  C_FriendRequest_Add ensureCFriendRequestAdd() => $_ensure(33);

  @$pb.TagNumber(53)
  S_FriendRequest_Add get sFriendRequestAdd => $_getN(34);
  @$pb.TagNumber(53)
  set sFriendRequestAdd(S_FriendRequest_Add value) => $_setField(53, value);
  @$pb.TagNumber(53)
  $core.bool hasSFriendRequestAdd() => $_has(34);
  @$pb.TagNumber(53)
  void clearSFriendRequestAdd() => $_clearField(53);
  @$pb.TagNumber(53)
  S_FriendRequest_Add ensureSFriendRequestAdd() => $_ensure(34);

  @$pb.TagNumber(54)
  C_FriendRequest_Cancel get cFriendRequestCancel => $_getN(35);
  @$pb.TagNumber(54)
  set cFriendRequestCancel(C_FriendRequest_Cancel value) =>
      $_setField(54, value);
  @$pb.TagNumber(54)
  $core.bool hasCFriendRequestCancel() => $_has(35);
  @$pb.TagNumber(54)
  void clearCFriendRequestCancel() => $_clearField(54);
  @$pb.TagNumber(54)
  C_FriendRequest_Cancel ensureCFriendRequestCancel() => $_ensure(35);

  @$pb.TagNumber(55)
  S_FriendRequest_Cancel get sFriendRequestCancel => $_getN(36);
  @$pb.TagNumber(55)
  set sFriendRequestCancel(S_FriendRequest_Cancel value) =>
      $_setField(55, value);
  @$pb.TagNumber(55)
  $core.bool hasSFriendRequestCancel() => $_has(36);
  @$pb.TagNumber(55)
  void clearSFriendRequestCancel() => $_clearField(55);
  @$pb.TagNumber(55)
  S_FriendRequest_Cancel ensureSFriendRequestCancel() => $_ensure(36);

  @$pb.TagNumber(56)
  C_FriendRequest_Remove get cFriendRequestRemove => $_getN(37);
  @$pb.TagNumber(56)
  set cFriendRequestRemove(C_FriendRequest_Remove value) =>
      $_setField(56, value);
  @$pb.TagNumber(56)
  $core.bool hasCFriendRequestRemove() => $_has(37);
  @$pb.TagNumber(56)
  void clearCFriendRequestRemove() => $_clearField(56);
  @$pb.TagNumber(56)
  C_FriendRequest_Remove ensureCFriendRequestRemove() => $_ensure(37);

  @$pb.TagNumber(57)
  S_FriendRequest_Remove get sFriendRequestRemove => $_getN(38);
  @$pb.TagNumber(57)
  set sFriendRequestRemove(S_FriendRequest_Remove value) =>
      $_setField(57, value);
  @$pb.TagNumber(57)
  $core.bool hasSFriendRequestRemove() => $_has(38);
  @$pb.TagNumber(57)
  void clearSFriendRequestRemove() => $_clearField(57);
  @$pb.TagNumber(57)
  S_FriendRequest_Remove ensureSFriendRequestRemove() => $_ensure(38);

  @$pb.TagNumber(58)
  C_FriendRequest_List get cFriendRequestList => $_getN(39);
  @$pb.TagNumber(58)
  set cFriendRequestList(C_FriendRequest_List value) => $_setField(58, value);
  @$pb.TagNumber(58)
  $core.bool hasCFriendRequestList() => $_has(39);
  @$pb.TagNumber(58)
  void clearCFriendRequestList() => $_clearField(58);
  @$pb.TagNumber(58)
  C_FriendRequest_List ensureCFriendRequestList() => $_ensure(39);

  @$pb.TagNumber(59)
  S_FriendRequest_List get sFriendRequestList => $_getN(40);
  @$pb.TagNumber(59)
  set sFriendRequestList(S_FriendRequest_List value) => $_setField(59, value);
  @$pb.TagNumber(59)
  $core.bool hasSFriendRequestList() => $_has(40);
  @$pb.TagNumber(59)
  void clearSFriendRequestList() => $_clearField(59);
  @$pb.TagNumber(59)
  S_FriendRequest_List ensureSFriendRequestList() => $_ensure(40);

  @$pb.TagNumber(60)
  C_FriendRequest_Respond get cFriendRequestRespond => $_getN(41);
  @$pb.TagNumber(60)
  set cFriendRequestRespond(C_FriendRequest_Respond value) =>
      $_setField(60, value);
  @$pb.TagNumber(60)
  $core.bool hasCFriendRequestRespond() => $_has(41);
  @$pb.TagNumber(60)
  void clearCFriendRequestRespond() => $_clearField(60);
  @$pb.TagNumber(60)
  C_FriendRequest_Respond ensureCFriendRequestRespond() => $_ensure(41);

  @$pb.TagNumber(61)
  S_FriendRequest_Respond get sFriendRequestRespond => $_getN(42);
  @$pb.TagNumber(61)
  set sFriendRequestRespond(S_FriendRequest_Respond value) =>
      $_setField(61, value);
  @$pb.TagNumber(61)
  $core.bool hasSFriendRequestRespond() => $_has(42);
  @$pb.TagNumber(61)
  void clearSFriendRequestRespond() => $_clearField(61);
  @$pb.TagNumber(61)
  S_FriendRequest_Respond ensureSFriendRequestRespond() => $_ensure(42);

  @$pb.TagNumber(62)
  S_FriendRequest_Push get sFriendRequestPush => $_getN(43);
  @$pb.TagNumber(62)
  set sFriendRequestPush(S_FriendRequest_Push value) => $_setField(62, value);
  @$pb.TagNumber(62)
  $core.bool hasSFriendRequestPush() => $_has(43);
  @$pb.TagNumber(62)
  void clearSFriendRequestPush() => $_clearField(62);
  @$pb.TagNumber(62)
  S_FriendRequest_Push ensureSFriendRequestPush() => $_ensure(43);
}

enum ChatPayload_Data { text, image, file, notSet }

class ChatPayload extends $pb.GeneratedMessage {
  factory ChatPayload({
    TextMsg? text,
    ImageMsg? image,
    FileMsg? file,
  }) {
    final result = create();
    if (text != null) result.text = text;
    if (image != null) result.image = image;
    if (file != null) result.file = file;
    return result;
  }

  ChatPayload._();

  factory ChatPayload.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatPayload.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ChatPayload_Data> _ChatPayload_DataByTag = {
    1: ChatPayload_Data.text,
    2: ChatPayload_Data.image,
    3: ChatPayload_Data.file,
    0: ChatPayload_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatPayload',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<TextMsg>(1, _omitFieldNames ? '' : 'text', subBuilder: TextMsg.create)
    ..aOM<ImageMsg>(2, _omitFieldNames ? '' : 'image',
        subBuilder: ImageMsg.create)
    ..aOM<FileMsg>(3, _omitFieldNames ? '' : 'file', subBuilder: FileMsg.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatPayload clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatPayload copyWith(void Function(ChatPayload) updates) =>
      super.copyWith((message) => updates(message as ChatPayload))
          as ChatPayload;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatPayload create() => ChatPayload._();
  @$core.override
  ChatPayload createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatPayload getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatPayload>(create);
  static ChatPayload? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  ChatPayload_Data whichData() => _ChatPayload_DataByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearData() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  TextMsg get text => $_getN(0);
  @$pb.TagNumber(1)
  set text(TextMsg value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => $_clearField(1);
  @$pb.TagNumber(1)
  TextMsg ensureText() => $_ensure(0);

  @$pb.TagNumber(2)
  ImageMsg get image => $_getN(1);
  @$pb.TagNumber(2)
  set image(ImageMsg value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => $_clearField(2);
  @$pb.TagNumber(2)
  ImageMsg ensureImage() => $_ensure(1);

  @$pb.TagNumber(3)
  FileMsg get file => $_getN(2);
  @$pb.TagNumber(3)
  set file(FileMsg value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasFile() => $_has(2);
  @$pb.TagNumber(3)
  void clearFile() => $_clearField(3);
  @$pb.TagNumber(3)
  FileMsg ensureFile() => $_ensure(2);
}

class TextMsg extends $pb.GeneratedMessage {
  factory TextMsg({
    $core.String? message,
  }) {
    final result = create();
    if (message != null) result.message = message;
    return result;
  }

  TextMsg._();

  factory TextMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextMsg copyWith(void Function(TextMsg) updates) =>
      super.copyWith((message) => updates(message as TextMsg)) as TextMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextMsg create() => TextMsg._();
  @$core.override
  TextMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TextMsg getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TextMsg>(create);
  static TextMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);
}

class ImageMsg extends $pb.GeneratedMessage {
  factory ImageMsg({
    $core.String? url,
    $core.String? thumbnail,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (thumbnail != null) result.thumbnail = thumbnail;
    return result;
  }

  ImageMsg._();

  factory ImageMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ImageMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ImageMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'thumbnail')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageMsg copyWith(void Function(ImageMsg) updates) =>
      super.copyWith((message) => updates(message as ImageMsg)) as ImageMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageMsg create() => ImageMsg._();
  @$core.override
  ImageMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ImageMsg getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageMsg>(create);
  static ImageMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get thumbnail => $_getSZ(1);
  @$pb.TagNumber(2)
  set thumbnail($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasThumbnail() => $_has(1);
  @$pb.TagNumber(2)
  void clearThumbnail() => $_clearField(2);
}

class FileMsg extends $pb.GeneratedMessage {
  factory FileMsg({
    $core.String? url,
    $core.String? filename,
    $fixnum.Int64? size,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (filename != null) result.filename = filename;
    if (size != null) result.size = size;
    return result;
  }

  FileMsg._();

  factory FileMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FileMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FileMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'filename')
    ..aInt64(3, _omitFieldNames ? '' : 'size')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileMsg copyWith(void Function(FileMsg) updates) =>
      super.copyWith((message) => updates(message as FileMsg)) as FileMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileMsg create() => FileMsg._();
  @$core.override
  FileMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FileMsg getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileMsg>(create);
  static FileMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get filename => $_getSZ(1);
  @$pb.TagNumber(2)
  set filename($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFilename() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilename() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get size => $_getI64(2);
  @$pb.TagNumber(3)
  set size($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearSize() => $_clearField(3);
}

/// 회원가입
class C_SignUp extends $pb.GeneratedMessage {
  factory C_SignUp({
    $core.String? userId,
    $core.String? password,
    $core.String? name,
    $core.String? email,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (password != null) result.password = password;
    if (name != null) result.name = name;
    if (email != null) result.email = email;
    return result;
  }

  C_SignUp._();

  factory C_SignUp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_SignUp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_SignUp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_SignUp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_SignUp copyWith(void Function(C_SignUp) updates) =>
      super.copyWith((message) => updates(message as C_SignUp)) as C_SignUp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_SignUp create() => C_SignUp._();
  @$core.override
  C_SignUp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_SignUp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_SignUp>(create);
  static C_SignUp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => $_clearField(4);
}

class S_SignUp extends $pb.GeneratedMessage {
  factory S_SignUp({
    $core.bool? success,
    $core.String? message,
    $core.String? userId,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (userId != null) result.userId = userId;
    return result;
  }

  S_SignUp._();

  factory S_SignUp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_SignUp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_SignUp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_SignUp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_SignUp copyWith(void Function(S_SignUp) updates) =>
      super.copyWith((message) => updates(message as S_SignUp)) as S_SignUp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_SignUp create() => S_SignUp._();
  @$core.override
  S_SignUp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_SignUp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_SignUp>(create);
  static S_SignUp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);
}

class C_Login extends $pb.GeneratedMessage {
  factory C_Login({
    $core.String? userId,
    $core.String? password,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (password != null) result.password = password;
    return result;
  }

  C_Login._();

  factory C_Login.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_Login.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_Login',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_Login clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_Login copyWith(void Function(C_Login) updates) =>
      super.copyWith((message) => updates(message as C_Login)) as C_Login;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_Login create() => C_Login._();
  @$core.override
  C_Login createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_Login getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_Login>(create);
  static C_Login? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);
}

class S_Login extends $pb.GeneratedMessage {
  factory S_Login({
    $core.String? userId,
    $core.String? authToken,
    $core.String? name,
    $core.String? email,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (authToken != null) result.authToken = authToken;
    if (name != null) result.name = name;
    if (email != null) result.email = email;
    return result;
  }

  S_Login._();

  factory S_Login.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_Login.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_Login',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'authToken')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_Login clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_Login copyWith(void Function(S_Login) updates) =>
      super.copyWith((message) => updates(message as S_Login)) as S_Login;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_Login create() => S_Login._();
  @$core.override
  S_Login createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_Login getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_Login>(create);
  static S_Login? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get authToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set authToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAuthToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => $_clearField(4);
}

class C_JoinDirect extends $pb.GeneratedMessage {
  factory C_JoinDirect({
    $core.String? peerUserId,
  }) {
    final result = create();
    if (peerUserId != null) result.peerUserId = peerUserId;
    return result;
  }

  C_JoinDirect._();

  factory C_JoinDirect.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_JoinDirect.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_JoinDirect',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_JoinDirect clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_JoinDirect copyWith(void Function(C_JoinDirect) updates) =>
      super.copyWith((message) => updates(message as C_JoinDirect))
          as C_JoinDirect;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_JoinDirect create() => C_JoinDirect._();
  @$core.override
  C_JoinDirect createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_JoinDirect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_JoinDirect>(create);
  static C_JoinDirect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPeerUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerUserId() => $_clearField(1);
}

class C_JoinGroup extends $pb.GeneratedMessage {
  factory C_JoinGroup({
    $core.String? groupId,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    return result;
  }

  C_JoinGroup._();

  factory C_JoinGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_JoinGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_JoinGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_JoinGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_JoinGroup copyWith(void Function(C_JoinGroup) updates) =>
      super.copyWith((message) => updates(message as C_JoinGroup))
          as C_JoinGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_JoinGroup create() => C_JoinGroup._();
  @$core.override
  C_JoinGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_JoinGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_JoinGroup>(create);
  static C_JoinGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupId => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => $_clearField(1);
}

class C_CreateGroup extends $pb.GeneratedMessage {
  factory C_CreateGroup({
    $core.String? groupName,
  }) {
    final result = create();
    if (groupName != null) result.groupName = groupName;
    return result;
  }

  C_CreateGroup._();

  factory C_CreateGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_CreateGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_CreateGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_CreateGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_CreateGroup copyWith(void Function(C_CreateGroup) updates) =>
      super.copyWith((message) => updates(message as C_CreateGroup))
          as C_CreateGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_CreateGroup create() => C_CreateGroup._();
  @$core.override
  C_CreateGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_CreateGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_CreateGroup>(create);
  static C_CreateGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupName => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupName() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupName() => $_clearField(1);
}

class S_CreateGroup extends $pb.GeneratedMessage {
  factory S_CreateGroup({
    $core.bool? success,
    $core.String? message,
    $core.String? groupId,
    $core.String? groupName,
    $core.String? groupCode,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (groupId != null) result.groupId = groupId;
    if (groupName != null) result.groupName = groupName;
    if (groupCode != null) result.groupCode = groupCode;
    return result;
  }

  S_CreateGroup._();

  factory S_CreateGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_CreateGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_CreateGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOS(3, _omitFieldNames ? '' : 'groupId')
    ..aOS(4, _omitFieldNames ? '' : 'groupName')
    ..aOS(5, _omitFieldNames ? '' : 'groupCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_CreateGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_CreateGroup copyWith(void Function(S_CreateGroup) updates) =>
      super.copyWith((message) => updates(message as S_CreateGroup))
          as S_CreateGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_CreateGroup create() => S_CreateGroup._();
  @$core.override
  S_CreateGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_CreateGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_CreateGroup>(create);
  static S_CreateGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get groupId => $_getSZ(2);
  @$pb.TagNumber(3)
  set groupId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGroupId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get groupName => $_getSZ(3);
  @$pb.TagNumber(4)
  set groupName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGroupName() => $_has(3);
  @$pb.TagNumber(4)
  void clearGroupName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get groupCode => $_getSZ(4);
  @$pb.TagNumber(5)
  set groupCode($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGroupCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearGroupCode() => $_clearField(5);
}

class C_Chat extends $pb.GeneratedMessage {
  factory C_Chat({
    $core.String? convId,
    $fixnum.Int64? clientMsgId,
    ChatPayload? payload,
    $fixnum.Int64? tsClient,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (clientMsgId != null) result.clientMsgId = clientMsgId;
    if (payload != null) result.payload = payload;
    if (tsClient != null) result.tsClient = tsClient;
    return result;
  }

  C_Chat._();

  factory C_Chat.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_Chat.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_Chat',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aInt64(2, _omitFieldNames ? '' : 'clientMsgId')
    ..aOM<ChatPayload>(3, _omitFieldNames ? '' : 'payload',
        subBuilder: ChatPayload.create)
    ..aInt64(4, _omitFieldNames ? '' : 'tsClient')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_Chat clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_Chat copyWith(void Function(C_Chat) updates) =>
      super.copyWith((message) => updates(message as C_Chat)) as C_Chat;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_Chat create() => C_Chat._();
  @$core.override
  C_Chat createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_Chat getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_Chat>(create);
  static C_Chat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get convId => $_getSZ(0);
  @$pb.TagNumber(1)
  set convId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConvId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get clientMsgId => $_getI64(1);
  @$pb.TagNumber(2)
  set clientMsgId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasClientMsgId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientMsgId() => $_clearField(2);

  @$pb.TagNumber(3)
  ChatPayload get payload => $_getN(2);
  @$pb.TagNumber(3)
  set payload(ChatPayload value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPayload() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayload() => $_clearField(3);
  @$pb.TagNumber(3)
  ChatPayload ensurePayload() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get tsClient => $_getI64(3);
  @$pb.TagNumber(4)
  set tsClient($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTsClient() => $_has(3);
  @$pb.TagNumber(4)
  void clearTsClient() => $_clearField(4);
}

class S_Chat extends $pb.GeneratedMessage {
  factory S_Chat({
    $core.String? convId,
    $fixnum.Int64? clientMsgId,
    $fixnum.Int64? serverMsgId,
    $core.String? senderId,
    ChatPayload? payload,
    $fixnum.Int64? tsServer,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (clientMsgId != null) result.clientMsgId = clientMsgId;
    if (serverMsgId != null) result.serverMsgId = serverMsgId;
    if (senderId != null) result.senderId = senderId;
    if (payload != null) result.payload = payload;
    if (tsServer != null) result.tsServer = tsServer;
    return result;
  }

  S_Chat._();

  factory S_Chat.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_Chat.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_Chat',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aInt64(2, _omitFieldNames ? '' : 'clientMsgId')
    ..aInt64(3, _omitFieldNames ? '' : 'serverMsgId')
    ..aOS(4, _omitFieldNames ? '' : 'senderId')
    ..aOM<ChatPayload>(5, _omitFieldNames ? '' : 'payload',
        subBuilder: ChatPayload.create)
    ..aInt64(6, _omitFieldNames ? '' : 'tsServer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_Chat clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_Chat copyWith(void Function(S_Chat) updates) =>
      super.copyWith((message) => updates(message as S_Chat)) as S_Chat;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_Chat create() => S_Chat._();
  @$core.override
  S_Chat createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_Chat getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_Chat>(create);
  static S_Chat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get convId => $_getSZ(0);
  @$pb.TagNumber(1)
  set convId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConvId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get clientMsgId => $_getI64(1);
  @$pb.TagNumber(2)
  set clientMsgId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasClientMsgId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientMsgId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get serverMsgId => $_getI64(2);
  @$pb.TagNumber(3)
  set serverMsgId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasServerMsgId() => $_has(2);
  @$pb.TagNumber(3)
  void clearServerMsgId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get senderId => $_getSZ(3);
  @$pb.TagNumber(4)
  set senderId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSenderId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSenderId() => $_clearField(4);

  @$pb.TagNumber(5)
  ChatPayload get payload => $_getN(4);
  @$pb.TagNumber(5)
  set payload(ChatPayload value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPayload() => $_has(4);
  @$pb.TagNumber(5)
  void clearPayload() => $_clearField(5);
  @$pb.TagNumber(5)
  ChatPayload ensurePayload() => $_ensure(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get tsServer => $_getI64(5);
  @$pb.TagNumber(6)
  set tsServer($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTsServer() => $_has(5);
  @$pb.TagNumber(6)
  void clearTsServer() => $_clearField(6);
}

/// 파일 업로드 요청
class C_UploadFile extends $pb.GeneratedMessage {
  factory C_UploadFile({
    $core.String? filename,
    $fixnum.Int64? size,
    $core.String? mimeType,
    $core.bool? isImage,
  }) {
    final result = create();
    if (filename != null) result.filename = filename;
    if (size != null) result.size = size;
    if (mimeType != null) result.mimeType = mimeType;
    if (isImage != null) result.isImage = isImage;
    return result;
  }

  C_UploadFile._();

  factory C_UploadFile.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_UploadFile.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_UploadFile',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'filename')
    ..aInt64(2, _omitFieldNames ? '' : 'size')
    ..aOS(3, _omitFieldNames ? '' : 'mimeType')
    ..aOB(4, _omitFieldNames ? '' : 'isImage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_UploadFile clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_UploadFile copyWith(void Function(C_UploadFile) updates) =>
      super.copyWith((message) => updates(message as C_UploadFile))
          as C_UploadFile;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_UploadFile create() => C_UploadFile._();
  @$core.override
  C_UploadFile createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_UploadFile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_UploadFile>(create);
  static C_UploadFile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filename => $_getSZ(0);
  @$pb.TagNumber(1)
  set filename($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFilename() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilename() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get size => $_getI64(1);
  @$pb.TagNumber(2)
  set size($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get mimeType => $_getSZ(2);
  @$pb.TagNumber(3)
  set mimeType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMimeType() => $_has(2);
  @$pb.TagNumber(3)
  void clearMimeType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isImage => $_getBF(3);
  @$pb.TagNumber(4)
  set isImage($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsImage() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsImage() => $_clearField(4);
}

class S_UploadFile extends $pb.GeneratedMessage {
  factory S_UploadFile({
    $core.bool? success,
    $core.String? message,
    $core.String? fileId,
    $core.String? uploadUrl,
    $core.String? downloadUrl,
    $core.String? thumbnailUrl,
    $fixnum.Int64? expiresAt,
    $core.String? path,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (fileId != null) result.fileId = fileId;
    if (uploadUrl != null) result.uploadUrl = uploadUrl;
    if (downloadUrl != null) result.downloadUrl = downloadUrl;
    if (thumbnailUrl != null) result.thumbnailUrl = thumbnailUrl;
    if (expiresAt != null) result.expiresAt = expiresAt;
    if (path != null) result.path = path;
    return result;
  }

  S_UploadFile._();

  factory S_UploadFile.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_UploadFile.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_UploadFile',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOS(3, _omitFieldNames ? '' : 'fileId')
    ..aOS(4, _omitFieldNames ? '' : 'uploadUrl')
    ..aOS(5, _omitFieldNames ? '' : 'downloadUrl')
    ..aOS(6, _omitFieldNames ? '' : 'thumbnailUrl')
    ..aInt64(7, _omitFieldNames ? '' : 'expiresAt')
    ..aOS(8, _omitFieldNames ? '' : 'path')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_UploadFile clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_UploadFile copyWith(void Function(S_UploadFile) updates) =>
      super.copyWith((message) => updates(message as S_UploadFile))
          as S_UploadFile;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_UploadFile create() => S_UploadFile._();
  @$core.override
  S_UploadFile createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_UploadFile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_UploadFile>(create);
  static S_UploadFile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get fileId => $_getSZ(2);
  @$pb.TagNumber(3)
  set fileId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFileId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get uploadUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set uploadUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUploadUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUploadUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get downloadUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set downloadUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDownloadUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearDownloadUrl() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get thumbnailUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set thumbnailUrl($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasThumbnailUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearThumbnailUrl() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get expiresAt => $_getI64(6);
  @$pb.TagNumber(7)
  set expiresAt($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasExpiresAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearExpiresAt() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get path => $_getSZ(7);
  @$pb.TagNumber(8)
  set path($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPath() => $_has(7);
  @$pb.TagNumber(8)
  void clearPath() => $_clearField(8);
}

class C_Ack extends $pb.GeneratedMessage {
  factory C_Ack({
    $core.String? convId,
    $fixnum.Int64? serverMsgId,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (serverMsgId != null) result.serverMsgId = serverMsgId;
    return result;
  }

  C_Ack._();

  factory C_Ack.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_Ack.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_Ack',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aInt64(2, _omitFieldNames ? '' : 'serverMsgId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_Ack clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_Ack copyWith(void Function(C_Ack) updates) =>
      super.copyWith((message) => updates(message as C_Ack)) as C_Ack;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_Ack create() => C_Ack._();
  @$core.override
  C_Ack createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_Ack getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_Ack>(create);
  static C_Ack? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get convId => $_getSZ(0);
  @$pb.TagNumber(1)
  set convId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConvId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get serverMsgId => $_getI64(1);
  @$pb.TagNumber(2)
  set serverMsgId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasServerMsgId() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerMsgId() => $_clearField(2);
}

class C_FetchOffline extends $pb.GeneratedMessage {
  factory C_FetchOffline({
    $fixnum.Int64? sinceTs,
  }) {
    final result = create();
    if (sinceTs != null) result.sinceTs = sinceTs;
    return result;
  }

  C_FetchOffline._();

  factory C_FetchOffline.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_FetchOffline.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_FetchOffline',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'sinceTs')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FetchOffline clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FetchOffline copyWith(void Function(C_FetchOffline) updates) =>
      super.copyWith((message) => updates(message as C_FetchOffline))
          as C_FetchOffline;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_FetchOffline create() => C_FetchOffline._();
  @$core.override
  C_FetchOffline createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_FetchOffline getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_FetchOffline>(create);
  static C_FetchOffline? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sinceTs => $_getI64(0);
  @$pb.TagNumber(1)
  set sinceTs($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSinceTs() => $_has(0);
  @$pb.TagNumber(1)
  void clearSinceTs() => $_clearField(1);
}

class S_MessageBatch extends $pb.GeneratedMessage {
  factory S_MessageBatch({
    $core.Iterable<S_Chat>? messages,
  }) {
    final result = create();
    if (messages != null) result.messages.addAll(messages);
    return result;
  }

  S_MessageBatch._();

  factory S_MessageBatch.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_MessageBatch.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_MessageBatch',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..pPM<S_Chat>(1, _omitFieldNames ? '' : 'messages',
        subBuilder: S_Chat.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_MessageBatch clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_MessageBatch copyWith(void Function(S_MessageBatch) updates) =>
      super.copyWith((message) => updates(message as S_MessageBatch))
          as S_MessageBatch;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_MessageBatch create() => S_MessageBatch._();
  @$core.override
  S_MessageBatch createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_MessageBatch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_MessageBatch>(create);
  static S_MessageBatch? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<S_Chat> get messages => $_getList(0);
}

class S_Error extends $pb.GeneratedMessage {
  factory S_Error({
    ErrorCode? errorCode,
    $core.int? code,
    $core.String? message,
  }) {
    final result = create();
    if (errorCode != null) result.errorCode = errorCode;
    if (code != null) result.code = code;
    if (message != null) result.message = message;
    return result;
  }

  S_Error._();

  factory S_Error.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_Error.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_Error',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aE<ErrorCode>(1, _omitFieldNames ? '' : 'errorCode',
        enumValues: ErrorCode.values)
    ..aI(2, _omitFieldNames ? '' : 'code', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_Error clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_Error copyWith(void Function(S_Error) updates) =>
      super.copyWith((message) => updates(message as S_Error)) as S_Error;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_Error create() => S_Error._();
  @$core.override
  S_Error createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_Error getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_Error>(create);
  static S_Error? _defaultInstance;

  @$pb.TagNumber(1)
  ErrorCode get errorCode => $_getN(0);
  @$pb.TagNumber(1)
  set errorCode(ErrorCode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasErrorCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get code => $_getIZ(1);
  @$pb.TagNumber(2)
  set code($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);
}

class C_Heartbeat extends $pb.GeneratedMessage {
  factory C_Heartbeat() => create();

  C_Heartbeat._();

  factory C_Heartbeat.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_Heartbeat.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_Heartbeat',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_Heartbeat clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_Heartbeat copyWith(void Function(C_Heartbeat) updates) =>
      super.copyWith((message) => updates(message as C_Heartbeat))
          as C_Heartbeat;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_Heartbeat create() => C_Heartbeat._();
  @$core.override
  C_Heartbeat createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_Heartbeat getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_Heartbeat>(create);
  static C_Heartbeat? _defaultInstance;
}

class S_Heartbeat extends $pb.GeneratedMessage {
  factory S_Heartbeat() => create();

  S_Heartbeat._();

  factory S_Heartbeat.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_Heartbeat.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_Heartbeat',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_Heartbeat clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_Heartbeat copyWith(void Function(S_Heartbeat) updates) =>
      super.copyWith((message) => updates(message as S_Heartbeat))
          as S_Heartbeat;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_Heartbeat create() => S_Heartbeat._();
  @$core.override
  S_Heartbeat createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_Heartbeat getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_Heartbeat>(create);
  static S_Heartbeat? _defaultInstance;
}

class FriendInfo extends $pb.GeneratedMessage {
  factory FriendInfo({
    $core.String? userId,
    $core.String? name,
    $core.String? statusMessage,
    $core.String? profileImageUrl,
    $fixnum.Int64? lastSeen,
    $core.String? status,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (name != null) result.name = name;
    if (statusMessage != null) result.statusMessage = statusMessage;
    if (profileImageUrl != null) result.profileImageUrl = profileImageUrl;
    if (lastSeen != null) result.lastSeen = lastSeen;
    if (status != null) result.status = status;
    return result;
  }

  FriendInfo._();

  factory FriendInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FriendInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FriendInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'statusMessage')
    ..aOS(4, _omitFieldNames ? '' : 'profileImageUrl')
    ..aInt64(5, _omitFieldNames ? '' : 'lastSeen')
    ..aOS(6, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FriendInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FriendInfo copyWith(void Function(FriendInfo) updates) =>
      super.copyWith((message) => updates(message as FriendInfo)) as FriendInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FriendInfo create() => FriendInfo._();
  @$core.override
  FriendInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FriendInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FriendInfo>(create);
  static FriendInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get statusMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set statusMessage($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStatusMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatusMessage() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get profileImageUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set profileImageUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasProfileImageUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearProfileImageUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get lastSeen => $_getI64(4);
  @$pb.TagNumber(5)
  set lastSeen($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLastSeen() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastSeen() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get status => $_getSZ(5);
  @$pb.TagNumber(6)
  set status($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);
}

class FriendRequest extends $pb.GeneratedMessage {
  factory FriendRequest({
    $core.String? requesterUserId,
    $core.String? requesterName,
    $core.String? requesterStatusMessage,
    $core.String? requesterProfileImageUrl,
    $fixnum.Int64? requestedAt,
  }) {
    final result = create();
    if (requesterUserId != null) result.requesterUserId = requesterUserId;
    if (requesterName != null) result.requesterName = requesterName;
    if (requesterStatusMessage != null)
      result.requesterStatusMessage = requesterStatusMessage;
    if (requesterProfileImageUrl != null)
      result.requesterProfileImageUrl = requesterProfileImageUrl;
    if (requestedAt != null) result.requestedAt = requestedAt;
    return result;
  }

  FriendRequest._();

  factory FriendRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FriendRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FriendRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requesterUserId')
    ..aOS(2, _omitFieldNames ? '' : 'requesterName')
    ..aOS(3, _omitFieldNames ? '' : 'requesterStatusMessage')
    ..aOS(4, _omitFieldNames ? '' : 'requesterProfileImageUrl')
    ..aInt64(5, _omitFieldNames ? '' : 'requestedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FriendRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FriendRequest copyWith(void Function(FriendRequest) updates) =>
      super.copyWith((message) => updates(message as FriendRequest))
          as FriendRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FriendRequest create() => FriendRequest._();
  @$core.override
  FriendRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FriendRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FriendRequest>(create);
  static FriendRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requesterUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requesterUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequesterUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequesterUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get requesterName => $_getSZ(1);
  @$pb.TagNumber(2)
  set requesterName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRequesterName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequesterName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get requesterStatusMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set requesterStatusMessage($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRequesterStatusMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearRequesterStatusMessage() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get requesterProfileImageUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set requesterProfileImageUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRequesterProfileImageUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearRequesterProfileImageUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get requestedAt => $_getI64(4);
  @$pb.TagNumber(5)
  set requestedAt($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRequestedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearRequestedAt() => $_clearField(5);
}

/// 친구 목록 조회
class C_FriendList extends $pb.GeneratedMessage {
  factory C_FriendList() => create();

  C_FriendList._();

  factory C_FriendList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_FriendList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_FriendList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FriendList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FriendList copyWith(void Function(C_FriendList) updates) =>
      super.copyWith((message) => updates(message as C_FriendList))
          as C_FriendList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_FriendList create() => C_FriendList._();
  @$core.override
  C_FriendList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_FriendList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_FriendList>(create);
  static C_FriendList? _defaultInstance;
}

class S_FriendList extends $pb.GeneratedMessage {
  factory S_FriendList({
    $core.Iterable<FriendInfo>? friends,
  }) {
    final result = create();
    if (friends != null) result.friends.addAll(friends);
    return result;
  }

  S_FriendList._();

  factory S_FriendList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_FriendList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_FriendList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..pPM<FriendInfo>(1, _omitFieldNames ? '' : 'friends',
        subBuilder: FriendInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendList copyWith(void Function(S_FriendList) updates) =>
      super.copyWith((message) => updates(message as S_FriendList))
          as S_FriendList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_FriendList create() => S_FriendList._();
  @$core.override
  S_FriendList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_FriendList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_FriendList>(create);
  static S_FriendList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<FriendInfo> get friends => $_getList(0);
}

/// 그룹 정보
class GroupInfo extends $pb.GeneratedMessage {
  factory GroupInfo({
    $core.String? groupId,
    $core.String? groupName,
    $core.String? groupCode,
    $core.String? creatorId,
    $fixnum.Int64? createdAt,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    if (groupName != null) result.groupName = groupName;
    if (groupCode != null) result.groupCode = groupCode;
    if (creatorId != null) result.creatorId = creatorId;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  GroupInfo._();

  factory GroupInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupId')
    ..aOS(2, _omitFieldNames ? '' : 'groupName')
    ..aOS(3, _omitFieldNames ? '' : 'groupCode')
    ..aOS(4, _omitFieldNames ? '' : 'creatorId')
    ..aInt64(5, _omitFieldNames ? '' : 'createdAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupInfo copyWith(void Function(GroupInfo) updates) =>
      super.copyWith((message) => updates(message as GroupInfo)) as GroupInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupInfo create() => GroupInfo._();
  @$core.override
  GroupInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GroupInfo>(create);
  static GroupInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupId => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get groupCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set groupCode($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGroupCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupCode() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get creatorId => $_getSZ(3);
  @$pb.TagNumber(4)
  set creatorId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreatorId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatorId() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get createdAt => $_getI64(4);
  @$pb.TagNumber(5)
  set createdAt($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => $_clearField(5);
}

/// 그룹 목록 조회
class C_GroupList extends $pb.GeneratedMessage {
  factory C_GroupList() => create();

  C_GroupList._();

  factory C_GroupList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_GroupList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_GroupList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GroupList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GroupList copyWith(void Function(C_GroupList) updates) =>
      super.copyWith((message) => updates(message as C_GroupList))
          as C_GroupList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_GroupList create() => C_GroupList._();
  @$core.override
  C_GroupList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_GroupList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_GroupList>(create);
  static C_GroupList? _defaultInstance;
}

class S_GroupList extends $pb.GeneratedMessage {
  factory S_GroupList({
    $core.Iterable<GroupInfo>? groups,
  }) {
    final result = create();
    if (groups != null) result.groups.addAll(groups);
    return result;
  }

  S_GroupList._();

  factory S_GroupList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_GroupList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_GroupList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..pPM<GroupInfo>(1, _omitFieldNames ? '' : 'groups',
        subBuilder: GroupInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GroupList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GroupList copyWith(void Function(S_GroupList) updates) =>
      super.copyWith((message) => updates(message as S_GroupList))
          as S_GroupList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_GroupList create() => S_GroupList._();
  @$core.override
  S_GroupList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_GroupList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_GroupList>(create);
  static S_GroupList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GroupInfo> get groups => $_getList(0);
}

/// 그룹 가입 신청
class C_GroupJoinRequest extends $pb.GeneratedMessage {
  factory C_GroupJoinRequest({
    $core.String? groupCode,
  }) {
    final result = create();
    if (groupCode != null) result.groupCode = groupCode;
    return result;
  }

  C_GroupJoinRequest._();

  factory C_GroupJoinRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_GroupJoinRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_GroupJoinRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GroupJoinRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GroupJoinRequest copyWith(void Function(C_GroupJoinRequest) updates) =>
      super.copyWith((message) => updates(message as C_GroupJoinRequest))
          as C_GroupJoinRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_GroupJoinRequest create() => C_GroupJoinRequest._();
  @$core.override
  C_GroupJoinRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_GroupJoinRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_GroupJoinRequest>(create);
  static C_GroupJoinRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupCode() => $_clearField(1);
}

class S_GroupJoinRequest extends $pb.GeneratedMessage {
  factory S_GroupJoinRequest({
    $core.bool? success,
    $core.String? message,
    $core.String? groupId,
    $core.String? groupName,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (groupId != null) result.groupId = groupId;
    if (groupName != null) result.groupName = groupName;
    return result;
  }

  S_GroupJoinRequest._();

  factory S_GroupJoinRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_GroupJoinRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_GroupJoinRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOS(3, _omitFieldNames ? '' : 'groupId')
    ..aOS(4, _omitFieldNames ? '' : 'groupName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GroupJoinRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GroupJoinRequest copyWith(void Function(S_GroupJoinRequest) updates) =>
      super.copyWith((message) => updates(message as S_GroupJoinRequest))
          as S_GroupJoinRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_GroupJoinRequest create() => S_GroupJoinRequest._();
  @$core.override
  S_GroupJoinRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_GroupJoinRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_GroupJoinRequest>(create);
  static S_GroupJoinRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get groupId => $_getSZ(2);
  @$pb.TagNumber(3)
  set groupId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGroupId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get groupName => $_getSZ(3);
  @$pb.TagNumber(4)
  set groupName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGroupName() => $_has(3);
  @$pb.TagNumber(4)
  void clearGroupName() => $_clearField(4);
}

/// 그룹 가입 신청 응답 (그룹장이 수락/거절)
class C_GroupJoinResponse extends $pb.GeneratedMessage {
  factory C_GroupJoinResponse({
    $core.String? groupId,
    $core.String? requesterUserId,
    $core.bool? accept,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    if (requesterUserId != null) result.requesterUserId = requesterUserId;
    if (accept != null) result.accept = accept;
    return result;
  }

  C_GroupJoinResponse._();

  factory C_GroupJoinResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_GroupJoinResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_GroupJoinResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupId')
    ..aOS(2, _omitFieldNames ? '' : 'requesterUserId')
    ..aOB(3, _omitFieldNames ? '' : 'accept')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GroupJoinResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GroupJoinResponse copyWith(void Function(C_GroupJoinResponse) updates) =>
      super.copyWith((message) => updates(message as C_GroupJoinResponse))
          as C_GroupJoinResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_GroupJoinResponse create() => C_GroupJoinResponse._();
  @$core.override
  C_GroupJoinResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_GroupJoinResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_GroupJoinResponse>(create);
  static C_GroupJoinResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupId => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get requesterUserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set requesterUserId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRequesterUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequesterUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get accept => $_getBF(2);
  @$pb.TagNumber(3)
  set accept($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAccept() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccept() => $_clearField(3);
}

class S_GroupJoinResponse extends $pb.GeneratedMessage {
  factory S_GroupJoinResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  S_GroupJoinResponse._();

  factory S_GroupJoinResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_GroupJoinResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_GroupJoinResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GroupJoinResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GroupJoinResponse copyWith(void Function(S_GroupJoinResponse) updates) =>
      super.copyWith((message) => updates(message as S_GroupJoinResponse))
          as S_GroupJoinResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_GroupJoinResponse create() => S_GroupJoinResponse._();
  @$core.override
  S_GroupJoinResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_GroupJoinResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_GroupJoinResponse>(create);
  static S_GroupJoinResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

/// 그룹 가입 신청 목록 조회 (그룹장용)
class C_GroupJoinRequestList extends $pb.GeneratedMessage {
  factory C_GroupJoinRequestList({
    $core.String? groupId,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    return result;
  }

  C_GroupJoinRequestList._();

  factory C_GroupJoinRequestList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_GroupJoinRequestList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_GroupJoinRequestList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GroupJoinRequestList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GroupJoinRequestList copyWith(
          void Function(C_GroupJoinRequestList) updates) =>
      super.copyWith((message) => updates(message as C_GroupJoinRequestList))
          as C_GroupJoinRequestList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_GroupJoinRequestList create() => C_GroupJoinRequestList._();
  @$core.override
  C_GroupJoinRequestList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_GroupJoinRequestList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_GroupJoinRequestList>(create);
  static C_GroupJoinRequestList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupId => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => $_clearField(1);
}

class S_GroupJoinRequestList extends $pb.GeneratedMessage {
  factory S_GroupJoinRequestList({
    $core.Iterable<GroupJoinRequestInfo>? requests,
  }) {
    final result = create();
    if (requests != null) result.requests.addAll(requests);
    return result;
  }

  S_GroupJoinRequestList._();

  factory S_GroupJoinRequestList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_GroupJoinRequestList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_GroupJoinRequestList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..pPM<GroupJoinRequestInfo>(1, _omitFieldNames ? '' : 'requests',
        subBuilder: GroupJoinRequestInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GroupJoinRequestList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GroupJoinRequestList copyWith(
          void Function(S_GroupJoinRequestList) updates) =>
      super.copyWith((message) => updates(message as S_GroupJoinRequestList))
          as S_GroupJoinRequestList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_GroupJoinRequestList create() => S_GroupJoinRequestList._();
  @$core.override
  S_GroupJoinRequestList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_GroupJoinRequestList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_GroupJoinRequestList>(create);
  static S_GroupJoinRequestList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GroupJoinRequestInfo> get requests => $_getList(0);
}

class GroupJoinRequestInfo extends $pb.GeneratedMessage {
  factory GroupJoinRequestInfo({
    $core.String? requesterUserId,
    $core.String? requesterName,
    $fixnum.Int64? requestedAt,
  }) {
    final result = create();
    if (requesterUserId != null) result.requesterUserId = requesterUserId;
    if (requesterName != null) result.requesterName = requesterName;
    if (requestedAt != null) result.requestedAt = requestedAt;
    return result;
  }

  GroupJoinRequestInfo._();

  factory GroupJoinRequestInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupJoinRequestInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupJoinRequestInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requesterUserId')
    ..aOS(2, _omitFieldNames ? '' : 'requesterName')
    ..aInt64(3, _omitFieldNames ? '' : 'requestedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupJoinRequestInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupJoinRequestInfo copyWith(void Function(GroupJoinRequestInfo) updates) =>
      super.copyWith((message) => updates(message as GroupJoinRequestInfo))
          as GroupJoinRequestInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupJoinRequestInfo create() => GroupJoinRequestInfo._();
  @$core.override
  GroupJoinRequestInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupJoinRequestInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupJoinRequestInfo>(create);
  static GroupJoinRequestInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requesterUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requesterUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequesterUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequesterUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get requesterName => $_getSZ(1);
  @$pb.TagNumber(2)
  set requesterName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRequesterName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequesterName() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get requestedAt => $_getI64(2);
  @$pb.TagNumber(3)
  set requestedAt($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRequestedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearRequestedAt() => $_clearField(3);
}

/// 친구 요청 검색
class C_FriendRequest_Find extends $pb.GeneratedMessage {
  factory C_FriendRequest_Find({
    $core.String? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  C_FriendRequest_Find._();

  factory C_FriendRequest_Find.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_FriendRequest_Find.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_FriendRequest_Find',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FriendRequest_Find clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FriendRequest_Find copyWith(void Function(C_FriendRequest_Find) updates) =>
      super.copyWith((message) => updates(message as C_FriendRequest_Find))
          as C_FriendRequest_Find;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_FriendRequest_Find create() => C_FriendRequest_Find._();
  @$core.override
  C_FriendRequest_Find createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_FriendRequest_Find getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_FriendRequest_Find>(create);
  static C_FriendRequest_Find? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class S_FriendRequest_Find extends $pb.GeneratedMessage {
  factory S_FriendRequest_Find({
    $core.bool? exist,
    FriendInfo? userInfo,
  }) {
    final result = create();
    if (exist != null) result.exist = exist;
    if (userInfo != null) result.userInfo = userInfo;
    return result;
  }

  S_FriendRequest_Find._();

  factory S_FriendRequest_Find.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_FriendRequest_Find.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_FriendRequest_Find',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'exist')
    ..aOM<FriendInfo>(2, _omitFieldNames ? '' : 'userInfo',
        subBuilder: FriendInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendRequest_Find clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendRequest_Find copyWith(void Function(S_FriendRequest_Find) updates) =>
      super.copyWith((message) => updates(message as S_FriendRequest_Find))
          as S_FriendRequest_Find;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_FriendRequest_Find create() => S_FriendRequest_Find._();
  @$core.override
  S_FriendRequest_Find createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_FriendRequest_Find getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_FriendRequest_Find>(create);
  static S_FriendRequest_Find? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get exist => $_getBF(0);
  @$pb.TagNumber(1)
  set exist($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasExist() => $_has(0);
  @$pb.TagNumber(1)
  void clearExist() => $_clearField(1);

  @$pb.TagNumber(2)
  FriendInfo get userInfo => $_getN(1);
  @$pb.TagNumber(2)
  set userInfo(FriendInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUserInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  FriendInfo ensureUserInfo() => $_ensure(1);
}

/// 친구 요청 전송
class C_FriendRequest_Add extends $pb.GeneratedMessage {
  factory C_FriendRequest_Add({
    $core.String? friendUserId,
  }) {
    final result = create();
    if (friendUserId != null) result.friendUserId = friendUserId;
    return result;
  }

  C_FriendRequest_Add._();

  factory C_FriendRequest_Add.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_FriendRequest_Add.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_FriendRequest_Add',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'friendUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FriendRequest_Add clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FriendRequest_Add copyWith(void Function(C_FriendRequest_Add) updates) =>
      super.copyWith((message) => updates(message as C_FriendRequest_Add))
          as C_FriendRequest_Add;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_FriendRequest_Add create() => C_FriendRequest_Add._();
  @$core.override
  C_FriendRequest_Add createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_FriendRequest_Add getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_FriendRequest_Add>(create);
  static C_FriendRequest_Add? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get friendUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set friendUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFriendUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFriendUserId() => $_clearField(1);
}

class S_FriendRequest_Add extends $pb.GeneratedMessage {
  factory S_FriendRequest_Add({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  S_FriendRequest_Add._();

  factory S_FriendRequest_Add.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_FriendRequest_Add.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_FriendRequest_Add',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendRequest_Add clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendRequest_Add copyWith(void Function(S_FriendRequest_Add) updates) =>
      super.copyWith((message) => updates(message as S_FriendRequest_Add))
          as S_FriendRequest_Add;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_FriendRequest_Add create() => S_FriendRequest_Add._();
  @$core.override
  S_FriendRequest_Add createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_FriendRequest_Add getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_FriendRequest_Add>(create);
  static S_FriendRequest_Add? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

/// 친구 요청 취소 (보낸 사람이 취소)
class C_FriendRequest_Cancel extends $pb.GeneratedMessage {
  factory C_FriendRequest_Cancel({
    $core.String? friendUserId,
  }) {
    final result = create();
    if (friendUserId != null) result.friendUserId = friendUserId;
    return result;
  }

  C_FriendRequest_Cancel._();

  factory C_FriendRequest_Cancel.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_FriendRequest_Cancel.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_FriendRequest_Cancel',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'friendUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FriendRequest_Cancel clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FriendRequest_Cancel copyWith(
          void Function(C_FriendRequest_Cancel) updates) =>
      super.copyWith((message) => updates(message as C_FriendRequest_Cancel))
          as C_FriendRequest_Cancel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_FriendRequest_Cancel create() => C_FriendRequest_Cancel._();
  @$core.override
  C_FriendRequest_Cancel createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_FriendRequest_Cancel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_FriendRequest_Cancel>(create);
  static C_FriendRequest_Cancel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get friendUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set friendUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFriendUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFriendUserId() => $_clearField(1);
}

class S_FriendRequest_Cancel extends $pb.GeneratedMessage {
  factory S_FriendRequest_Cancel({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  S_FriendRequest_Cancel._();

  factory S_FriendRequest_Cancel.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_FriendRequest_Cancel.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_FriendRequest_Cancel',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendRequest_Cancel clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendRequest_Cancel copyWith(
          void Function(S_FriendRequest_Cancel) updates) =>
      super.copyWith((message) => updates(message as S_FriendRequest_Cancel))
          as S_FriendRequest_Cancel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_FriendRequest_Cancel create() => S_FriendRequest_Cancel._();
  @$core.override
  S_FriendRequest_Cancel createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_FriendRequest_Cancel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_FriendRequest_Cancel>(create);
  static S_FriendRequest_Cancel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

/// 이미 보낸 친구 요청 취소 (받은 사람이 취소)
class C_FriendRequest_Remove extends $pb.GeneratedMessage {
  factory C_FriendRequest_Remove({
    $core.String? friendUserId,
  }) {
    final result = create();
    if (friendUserId != null) result.friendUserId = friendUserId;
    return result;
  }

  C_FriendRequest_Remove._();

  factory C_FriendRequest_Remove.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_FriendRequest_Remove.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_FriendRequest_Remove',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'friendUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FriendRequest_Remove clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FriendRequest_Remove copyWith(
          void Function(C_FriendRequest_Remove) updates) =>
      super.copyWith((message) => updates(message as C_FriendRequest_Remove))
          as C_FriendRequest_Remove;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_FriendRequest_Remove create() => C_FriendRequest_Remove._();
  @$core.override
  C_FriendRequest_Remove createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_FriendRequest_Remove getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_FriendRequest_Remove>(create);
  static C_FriendRequest_Remove? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get friendUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set friendUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFriendUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFriendUserId() => $_clearField(1);
}

class S_FriendRequest_Remove extends $pb.GeneratedMessage {
  factory S_FriendRequest_Remove({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  S_FriendRequest_Remove._();

  factory S_FriendRequest_Remove.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_FriendRequest_Remove.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_FriendRequest_Remove',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendRequest_Remove clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendRequest_Remove copyWith(
          void Function(S_FriendRequest_Remove) updates) =>
      super.copyWith((message) => updates(message as S_FriendRequest_Remove))
          as S_FriendRequest_Remove;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_FriendRequest_Remove create() => S_FriendRequest_Remove._();
  @$core.override
  S_FriendRequest_Remove createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_FriendRequest_Remove getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_FriendRequest_Remove>(create);
  static S_FriendRequest_Remove? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

/// 친구 요청 목록 조회
class C_FriendRequest_List extends $pb.GeneratedMessage {
  factory C_FriendRequest_List({
    C_FriendRequest_List_RequestType? type,
  }) {
    final result = create();
    if (type != null) result.type = type;
    return result;
  }

  C_FriendRequest_List._();

  factory C_FriendRequest_List.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_FriendRequest_List.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_FriendRequest_List',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aE<C_FriendRequest_List_RequestType>(1, _omitFieldNames ? '' : 'type',
        enumValues: C_FriendRequest_List_RequestType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FriendRequest_List clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FriendRequest_List copyWith(void Function(C_FriendRequest_List) updates) =>
      super.copyWith((message) => updates(message as C_FriendRequest_List))
          as C_FriendRequest_List;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_FriendRequest_List create() => C_FriendRequest_List._();
  @$core.override
  C_FriendRequest_List createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_FriendRequest_List getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_FriendRequest_List>(create);
  static C_FriendRequest_List? _defaultInstance;

  @$pb.TagNumber(1)
  C_FriendRequest_List_RequestType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(C_FriendRequest_List_RequestType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);
}

class S_FriendRequest_List extends $pb.GeneratedMessage {
  factory S_FriendRequest_List({
    $core.Iterable<FriendRequest>? requests,
  }) {
    final result = create();
    if (requests != null) result.requests.addAll(requests);
    return result;
  }

  S_FriendRequest_List._();

  factory S_FriendRequest_List.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_FriendRequest_List.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_FriendRequest_List',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..pPM<FriendRequest>(1, _omitFieldNames ? '' : 'requests',
        subBuilder: FriendRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendRequest_List clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendRequest_List copyWith(void Function(S_FriendRequest_List) updates) =>
      super.copyWith((message) => updates(message as S_FriendRequest_List))
          as S_FriendRequest_List;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_FriendRequest_List create() => S_FriendRequest_List._();
  @$core.override
  S_FriendRequest_List createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_FriendRequest_List getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_FriendRequest_List>(create);
  static S_FriendRequest_List? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<FriendRequest> get requests => $_getList(0);
}

/// 친구 요청 수락/거절
class C_FriendRequest_Respond extends $pb.GeneratedMessage {
  factory C_FriendRequest_Respond({
    $core.String? requesterUserId,
    $core.bool? accept,
  }) {
    final result = create();
    if (requesterUserId != null) result.requesterUserId = requesterUserId;
    if (accept != null) result.accept = accept;
    return result;
  }

  C_FriendRequest_Respond._();

  factory C_FriendRequest_Respond.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_FriendRequest_Respond.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_FriendRequest_Respond',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requesterUserId')
    ..aOB(2, _omitFieldNames ? '' : 'accept')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FriendRequest_Respond clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FriendRequest_Respond copyWith(
          void Function(C_FriendRequest_Respond) updates) =>
      super.copyWith((message) => updates(message as C_FriendRequest_Respond))
          as C_FriendRequest_Respond;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_FriendRequest_Respond create() => C_FriendRequest_Respond._();
  @$core.override
  C_FriendRequest_Respond createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_FriendRequest_Respond getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_FriendRequest_Respond>(create);
  static C_FriendRequest_Respond? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requesterUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requesterUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequesterUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequesterUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get accept => $_getBF(1);
  @$pb.TagNumber(2)
  set accept($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAccept() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccept() => $_clearField(2);
}

class S_FriendRequest_Respond extends $pb.GeneratedMessage {
  factory S_FriendRequest_Respond({
    $core.bool? success,
    $core.String? message,
    FriendInfo? friend,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (friend != null) result.friend = friend;
    return result;
  }

  S_FriendRequest_Respond._();

  factory S_FriendRequest_Respond.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_FriendRequest_Respond.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_FriendRequest_Respond',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<FriendInfo>(3, _omitFieldNames ? '' : 'friend',
        protoName: 'friend_', subBuilder: FriendInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendRequest_Respond clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendRequest_Respond copyWith(
          void Function(S_FriendRequest_Respond) updates) =>
      super.copyWith((message) => updates(message as S_FriendRequest_Respond))
          as S_FriendRequest_Respond;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_FriendRequest_Respond create() => S_FriendRequest_Respond._();
  @$core.override
  S_FriendRequest_Respond createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_FriendRequest_Respond getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_FriendRequest_Respond>(create);
  static S_FriendRequest_Respond? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  FriendInfo get friend => $_getN(2);
  @$pb.TagNumber(3)
  set friend(FriendInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasFriend() => $_has(2);
  @$pb.TagNumber(3)
  void clearFriend() => $_clearField(3);
  @$pb.TagNumber(3)
  FriendInfo ensureFriend() => $_ensure(2);
}

/// 친구 요청 푸시 (서버 -> 클라이언트)
class S_FriendRequest_Push extends $pb.GeneratedMessage {
  factory S_FriendRequest_Push({
    S_FriendRequest_Push_EventType? eventType,
    FriendRequest? request,
    FriendInfo? friend,
    $core.String? cancelledUserId,
  }) {
    final result = create();
    if (eventType != null) result.eventType = eventType;
    if (request != null) result.request = request;
    if (friend != null) result.friend = friend;
    if (cancelledUserId != null) result.cancelledUserId = cancelledUserId;
    return result;
  }

  S_FriendRequest_Push._();

  factory S_FriendRequest_Push.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_FriendRequest_Push.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_FriendRequest_Push',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aE<S_FriendRequest_Push_EventType>(1, _omitFieldNames ? '' : 'eventType',
        enumValues: S_FriendRequest_Push_EventType.values)
    ..aOM<FriendRequest>(2, _omitFieldNames ? '' : 'request',
        subBuilder: FriendRequest.create)
    ..aOM<FriendInfo>(3, _omitFieldNames ? '' : 'friend',
        subBuilder: FriendInfo.create)
    ..aOS(4, _omitFieldNames ? '' : 'cancelledUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendRequest_Push clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendRequest_Push copyWith(void Function(S_FriendRequest_Push) updates) =>
      super.copyWith((message) => updates(message as S_FriendRequest_Push))
          as S_FriendRequest_Push;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_FriendRequest_Push create() => S_FriendRequest_Push._();
  @$core.override
  S_FriendRequest_Push createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_FriendRequest_Push getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_FriendRequest_Push>(create);
  static S_FriendRequest_Push? _defaultInstance;

  @$pb.TagNumber(1)
  S_FriendRequest_Push_EventType get eventType => $_getN(0);
  @$pb.TagNumber(1)
  set eventType(S_FriendRequest_Push_EventType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasEventType() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventType() => $_clearField(1);

  @$pb.TagNumber(2)
  FriendRequest get request => $_getN(1);
  @$pb.TagNumber(2)
  set request(FriendRequest value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequest() => $_clearField(2);
  @$pb.TagNumber(2)
  FriendRequest ensureRequest() => $_ensure(1);

  @$pb.TagNumber(3)
  FriendInfo get friend => $_getN(2);
  @$pb.TagNumber(3)
  set friend(FriendInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasFriend() => $_has(2);
  @$pb.TagNumber(3)
  void clearFriend() => $_clearField(3);
  @$pb.TagNumber(3)
  FriendInfo ensureFriend() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get cancelledUserId => $_getSZ(3);
  @$pb.TagNumber(4)
  set cancelledUserId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCancelledUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCancelledUserId() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
