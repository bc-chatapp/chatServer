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
  cCheckId,
  sCheckId,
  cCheckEmail,
  sCheckEmail,
  cReqEmailVerify,
  sReqEmailVerify,
  cConfirmEmailVerify,
  sConfirmEmailVerify,
  cSignup,
  sSignup,
  cLogin,
  sLogin,
  cFetchOffline,
  sMessageBatch,
  sError,
  cHeartbeat,
  sHeartbeat,
  cChat,
  sChat,
  cAck,
  cReqHistory,
  sReqHistory,
  cUploadFile,
  sUploadFile,
  cSearchUser,
  sSearchUser,
  cFriendAction,
  sFriendAction,
  cFetchFriendData,
  sFetchFriendData,
  sFriendPush,
  cCreateGroup,
  sCreateGroup,
  cGroupList,
  sGroupList,
  cJoinGroup,
  sJoinGroup,
  cInviteFriend,
  sInviteFriend,
  cLeaveGroup,
  sLeaveGroup,
  cGroupMemberList,
  sGroupMemberList,
  cGroupInfo,
  sGroupInfo,
  cEditGroup,
  sEditGroup,
  notSet
}

class Envelope extends $pb.GeneratedMessage {
  factory Envelope({
    $core.int? version,
    $fixnum.Int64? requestId,
    $core.String? authToken,
    C_CheckId? cCheckId,
    S_CheckId? sCheckId,
    C_CheckEmail? cCheckEmail,
    S_CheckEmail? sCheckEmail,
    C_RequestEmailVerify? cReqEmailVerify,
    S_RequestEmailVerify? sReqEmailVerify,
    C_ConfirmEmailVerify? cConfirmEmailVerify,
    S_ConfirmEmailVerify? sConfirmEmailVerify,
    C_SignUp? cSignup,
    S_SignUp? sSignup,
    C_Login? cLogin,
    S_Login? sLogin,
    C_FetchOffline? cFetchOffline,
    S_MessageBatch? sMessageBatch,
    S_Error? sError,
    C_Heartbeat? cHeartbeat,
    S_Heartbeat? sHeartbeat,
    C_Chat? cChat,
    S_Chat? sChat,
    C_Ack? cAck,
    C_ReqHistory? cReqHistory,
    S_ReqHistory? sReqHistory,
    C_UploadFile? cUploadFile,
    S_UploadFile? sUploadFile,
    C_SearchUser? cSearchUser,
    S_SearchUser? sSearchUser,
    C_FriendAction? cFriendAction,
    S_FriendAction? sFriendAction,
    C_FetchFriendData? cFetchFriendData,
    S_FetchFriendData? sFetchFriendData,
    S_FriendPush? sFriendPush,
    C_CreateGroup? cCreateGroup,
    S_CreateGroup? sCreateGroup,
    C_GroupList? cGroupList,
    S_GroupList? sGroupList,
    C_JoinGroup? cJoinGroup,
    S_JoinGroup? sJoinGroup,
    C_InviteFriend? cInviteFriend,
    S_InviteFriend? sInviteFriend,
    C_LeaveGroup? cLeaveGroup,
    S_LeaveGroup? sLeaveGroup,
    C_GroupMemberList? cGroupMemberList,
    S_GroupMemberList? sGroupMemberList,
    C_GroupInfo? cGroupInfo,
    S_GroupInfo? sGroupInfo,
    C_EditGroup? cEditGroup,
    S_EditGroup? sEditGroup,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (requestId != null) result.requestId = requestId;
    if (authToken != null) result.authToken = authToken;
    if (cCheckId != null) result.cCheckId = cCheckId;
    if (sCheckId != null) result.sCheckId = sCheckId;
    if (cCheckEmail != null) result.cCheckEmail = cCheckEmail;
    if (sCheckEmail != null) result.sCheckEmail = sCheckEmail;
    if (cReqEmailVerify != null) result.cReqEmailVerify = cReqEmailVerify;
    if (sReqEmailVerify != null) result.sReqEmailVerify = sReqEmailVerify;
    if (cConfirmEmailVerify != null)
      result.cConfirmEmailVerify = cConfirmEmailVerify;
    if (sConfirmEmailVerify != null)
      result.sConfirmEmailVerify = sConfirmEmailVerify;
    if (cSignup != null) result.cSignup = cSignup;
    if (sSignup != null) result.sSignup = sSignup;
    if (cLogin != null) result.cLogin = cLogin;
    if (sLogin != null) result.sLogin = sLogin;
    if (cFetchOffline != null) result.cFetchOffline = cFetchOffline;
    if (sMessageBatch != null) result.sMessageBatch = sMessageBatch;
    if (sError != null) result.sError = sError;
    if (cHeartbeat != null) result.cHeartbeat = cHeartbeat;
    if (sHeartbeat != null) result.sHeartbeat = sHeartbeat;
    if (cChat != null) result.cChat = cChat;
    if (sChat != null) result.sChat = sChat;
    if (cAck != null) result.cAck = cAck;
    if (cReqHistory != null) result.cReqHistory = cReqHistory;
    if (sReqHistory != null) result.sReqHistory = sReqHistory;
    if (cUploadFile != null) result.cUploadFile = cUploadFile;
    if (sUploadFile != null) result.sUploadFile = sUploadFile;
    if (cSearchUser != null) result.cSearchUser = cSearchUser;
    if (sSearchUser != null) result.sSearchUser = sSearchUser;
    if (cFriendAction != null) result.cFriendAction = cFriendAction;
    if (sFriendAction != null) result.sFriendAction = sFriendAction;
    if (cFetchFriendData != null) result.cFetchFriendData = cFetchFriendData;
    if (sFetchFriendData != null) result.sFetchFriendData = sFetchFriendData;
    if (sFriendPush != null) result.sFriendPush = sFriendPush;
    if (cCreateGroup != null) result.cCreateGroup = cCreateGroup;
    if (sCreateGroup != null) result.sCreateGroup = sCreateGroup;
    if (cGroupList != null) result.cGroupList = cGroupList;
    if (sGroupList != null) result.sGroupList = sGroupList;
    if (cJoinGroup != null) result.cJoinGroup = cJoinGroup;
    if (sJoinGroup != null) result.sJoinGroup = sJoinGroup;
    if (cInviteFriend != null) result.cInviteFriend = cInviteFriend;
    if (sInviteFriend != null) result.sInviteFriend = sInviteFriend;
    if (cLeaveGroup != null) result.cLeaveGroup = cLeaveGroup;
    if (sLeaveGroup != null) result.sLeaveGroup = sLeaveGroup;
    if (cGroupMemberList != null) result.cGroupMemberList = cGroupMemberList;
    if (sGroupMemberList != null) result.sGroupMemberList = sGroupMemberList;
    if (cGroupInfo != null) result.cGroupInfo = cGroupInfo;
    if (sGroupInfo != null) result.sGroupInfo = sGroupInfo;
    if (cEditGroup != null) result.cEditGroup = cEditGroup;
    if (sEditGroup != null) result.sEditGroup = sEditGroup;
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
    10: Envelope_Body.cCheckId,
    11: Envelope_Body.sCheckId,
    12: Envelope_Body.cCheckEmail,
    13: Envelope_Body.sCheckEmail,
    14: Envelope_Body.cReqEmailVerify,
    15: Envelope_Body.sReqEmailVerify,
    16: Envelope_Body.cConfirmEmailVerify,
    17: Envelope_Body.sConfirmEmailVerify,
    18: Envelope_Body.cSignup,
    19: Envelope_Body.sSignup,
    20: Envelope_Body.cLogin,
    21: Envelope_Body.sLogin,
    22: Envelope_Body.cFetchOffline,
    23: Envelope_Body.sMessageBatch,
    27: Envelope_Body.sError,
    28: Envelope_Body.cHeartbeat,
    29: Envelope_Body.sHeartbeat,
    30: Envelope_Body.cChat,
    31: Envelope_Body.sChat,
    32: Envelope_Body.cAck,
    33: Envelope_Body.cReqHistory,
    34: Envelope_Body.sReqHistory,
    35: Envelope_Body.cUploadFile,
    36: Envelope_Body.sUploadFile,
    40: Envelope_Body.cSearchUser,
    41: Envelope_Body.sSearchUser,
    42: Envelope_Body.cFriendAction,
    43: Envelope_Body.sFriendAction,
    44: Envelope_Body.cFetchFriendData,
    45: Envelope_Body.sFetchFriendData,
    46: Envelope_Body.sFriendPush,
    50: Envelope_Body.cCreateGroup,
    51: Envelope_Body.sCreateGroup,
    52: Envelope_Body.cGroupList,
    53: Envelope_Body.sGroupList,
    54: Envelope_Body.cJoinGroup,
    55: Envelope_Body.sJoinGroup,
    56: Envelope_Body.cInviteFriend,
    57: Envelope_Body.sInviteFriend,
    60: Envelope_Body.cLeaveGroup,
    61: Envelope_Body.sLeaveGroup,
    62: Envelope_Body.cGroupMemberList,
    63: Envelope_Body.sGroupMemberList,
    64: Envelope_Body.cGroupInfo,
    65: Envelope_Body.sGroupInfo,
    66: Envelope_Body.cEditGroup,
    67: Envelope_Body.sEditGroup,
    0: Envelope_Body.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Envelope',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..oo(0, [
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      27,
      28,
      29,
      30,
      31,
      32,
      33,
      34,
      35,
      36,
      40,
      41,
      42,
      43,
      44,
      45,
      46,
      50,
      51,
      52,
      53,
      54,
      55,
      56,
      57,
      60,
      61,
      62,
      63,
      64,
      65,
      66,
      67
    ])
    ..aI(1, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'requestId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'authToken')
    ..aOM<C_CheckId>(10, _omitFieldNames ? '' : 'cCheckId',
        subBuilder: C_CheckId.create)
    ..aOM<S_CheckId>(11, _omitFieldNames ? '' : 'sCheckId',
        subBuilder: S_CheckId.create)
    ..aOM<C_CheckEmail>(12, _omitFieldNames ? '' : 'cCheckEmail',
        subBuilder: C_CheckEmail.create)
    ..aOM<S_CheckEmail>(13, _omitFieldNames ? '' : 'sCheckEmail',
        subBuilder: S_CheckEmail.create)
    ..aOM<C_RequestEmailVerify>(14, _omitFieldNames ? '' : 'cReqEmailVerify',
        subBuilder: C_RequestEmailVerify.create)
    ..aOM<S_RequestEmailVerify>(15, _omitFieldNames ? '' : 'sReqEmailVerify',
        subBuilder: S_RequestEmailVerify.create)
    ..aOM<C_ConfirmEmailVerify>(
        16, _omitFieldNames ? '' : 'cConfirmEmailVerify',
        subBuilder: C_ConfirmEmailVerify.create)
    ..aOM<S_ConfirmEmailVerify>(
        17, _omitFieldNames ? '' : 'sConfirmEmailVerify',
        subBuilder: S_ConfirmEmailVerify.create)
    ..aOM<C_SignUp>(18, _omitFieldNames ? '' : 'cSignup',
        subBuilder: C_SignUp.create)
    ..aOM<S_SignUp>(19, _omitFieldNames ? '' : 'sSignup',
        subBuilder: S_SignUp.create)
    ..aOM<C_Login>(20, _omitFieldNames ? '' : 'cLogin',
        subBuilder: C_Login.create)
    ..aOM<S_Login>(21, _omitFieldNames ? '' : 'sLogin',
        subBuilder: S_Login.create)
    ..aOM<C_FetchOffline>(22, _omitFieldNames ? '' : 'cFetchOffline',
        subBuilder: C_FetchOffline.create)
    ..aOM<S_MessageBatch>(23, _omitFieldNames ? '' : 'sMessageBatch',
        subBuilder: S_MessageBatch.create)
    ..aOM<S_Error>(27, _omitFieldNames ? '' : 'sError',
        subBuilder: S_Error.create)
    ..aOM<C_Heartbeat>(28, _omitFieldNames ? '' : 'cHeartbeat',
        subBuilder: C_Heartbeat.create)
    ..aOM<S_Heartbeat>(29, _omitFieldNames ? '' : 'sHeartbeat',
        subBuilder: S_Heartbeat.create)
    ..aOM<C_Chat>(30, _omitFieldNames ? '' : 'cChat', subBuilder: C_Chat.create)
    ..aOM<S_Chat>(31, _omitFieldNames ? '' : 'sChat', subBuilder: S_Chat.create)
    ..aOM<C_Ack>(32, _omitFieldNames ? '' : 'cAck', subBuilder: C_Ack.create)
    ..aOM<C_ReqHistory>(33, _omitFieldNames ? '' : 'cReqHistory',
        subBuilder: C_ReqHistory.create)
    ..aOM<S_ReqHistory>(34, _omitFieldNames ? '' : 'sReqHistory',
        subBuilder: S_ReqHistory.create)
    ..aOM<C_UploadFile>(35, _omitFieldNames ? '' : 'cUploadFile',
        subBuilder: C_UploadFile.create)
    ..aOM<S_UploadFile>(36, _omitFieldNames ? '' : 'sUploadFile',
        subBuilder: S_UploadFile.create)
    ..aOM<C_SearchUser>(40, _omitFieldNames ? '' : 'cSearchUser',
        subBuilder: C_SearchUser.create)
    ..aOM<S_SearchUser>(41, _omitFieldNames ? '' : 'sSearchUser',
        subBuilder: S_SearchUser.create)
    ..aOM<C_FriendAction>(42, _omitFieldNames ? '' : 'cFriendAction',
        subBuilder: C_FriendAction.create)
    ..aOM<S_FriendAction>(43, _omitFieldNames ? '' : 'sFriendAction',
        subBuilder: S_FriendAction.create)
    ..aOM<C_FetchFriendData>(44, _omitFieldNames ? '' : 'cFetchFriendData',
        subBuilder: C_FetchFriendData.create)
    ..aOM<S_FetchFriendData>(45, _omitFieldNames ? '' : 'sFetchFriendData',
        subBuilder: S_FetchFriendData.create)
    ..aOM<S_FriendPush>(46, _omitFieldNames ? '' : 'sFriendPush',
        subBuilder: S_FriendPush.create)
    ..aOM<C_CreateGroup>(50, _omitFieldNames ? '' : 'cCreateGroup',
        subBuilder: C_CreateGroup.create)
    ..aOM<S_CreateGroup>(51, _omitFieldNames ? '' : 'sCreateGroup',
        subBuilder: S_CreateGroup.create)
    ..aOM<C_GroupList>(52, _omitFieldNames ? '' : 'cGroupList',
        subBuilder: C_GroupList.create)
    ..aOM<S_GroupList>(53, _omitFieldNames ? '' : 'sGroupList',
        subBuilder: S_GroupList.create)
    ..aOM<C_JoinGroup>(54, _omitFieldNames ? '' : 'cJoinGroup',
        subBuilder: C_JoinGroup.create)
    ..aOM<S_JoinGroup>(55, _omitFieldNames ? '' : 'sJoinGroup',
        subBuilder: S_JoinGroup.create)
    ..aOM<C_InviteFriend>(56, _omitFieldNames ? '' : 'cInviteFriend',
        subBuilder: C_InviteFriend.create)
    ..aOM<S_InviteFriend>(57, _omitFieldNames ? '' : 'sInviteFriend',
        subBuilder: S_InviteFriend.create)
    ..aOM<C_LeaveGroup>(60, _omitFieldNames ? '' : 'cLeaveGroup',
        subBuilder: C_LeaveGroup.create)
    ..aOM<S_LeaveGroup>(61, _omitFieldNames ? '' : 'sLeaveGroup',
        subBuilder: S_LeaveGroup.create)
    ..aOM<C_GroupMemberList>(62, _omitFieldNames ? '' : 'cGroupMemberList',
        subBuilder: C_GroupMemberList.create)
    ..aOM<S_GroupMemberList>(63, _omitFieldNames ? '' : 'sGroupMemberList',
        subBuilder: S_GroupMemberList.create)
    ..aOM<C_GroupInfo>(64, _omitFieldNames ? '' : 'cGroupInfo',
        subBuilder: C_GroupInfo.create)
    ..aOM<S_GroupInfo>(65, _omitFieldNames ? '' : 'sGroupInfo',
        subBuilder: S_GroupInfo.create)
    ..aOM<C_EditGroup>(66, _omitFieldNames ? '' : 'cEditGroup',
        subBuilder: C_EditGroup.create)
    ..aOM<S_EditGroup>(67, _omitFieldNames ? '' : 'sEditGroup',
        subBuilder: S_EditGroup.create)
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
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  @$pb.TagNumber(19)
  @$pb.TagNumber(20)
  @$pb.TagNumber(21)
  @$pb.TagNumber(22)
  @$pb.TagNumber(23)
  @$pb.TagNumber(27)
  @$pb.TagNumber(28)
  @$pb.TagNumber(29)
  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  @$pb.TagNumber(32)
  @$pb.TagNumber(33)
  @$pb.TagNumber(34)
  @$pb.TagNumber(35)
  @$pb.TagNumber(36)
  @$pb.TagNumber(40)
  @$pb.TagNumber(41)
  @$pb.TagNumber(42)
  @$pb.TagNumber(43)
  @$pb.TagNumber(44)
  @$pb.TagNumber(45)
  @$pb.TagNumber(46)
  @$pb.TagNumber(50)
  @$pb.TagNumber(51)
  @$pb.TagNumber(52)
  @$pb.TagNumber(53)
  @$pb.TagNumber(54)
  @$pb.TagNumber(55)
  @$pb.TagNumber(56)
  @$pb.TagNumber(57)
  @$pb.TagNumber(60)
  @$pb.TagNumber(61)
  @$pb.TagNumber(62)
  @$pb.TagNumber(63)
  @$pb.TagNumber(64)
  @$pb.TagNumber(65)
  @$pb.TagNumber(66)
  @$pb.TagNumber(67)
  Envelope_Body whichBody() => _Envelope_BodyByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  @$pb.TagNumber(19)
  @$pb.TagNumber(20)
  @$pb.TagNumber(21)
  @$pb.TagNumber(22)
  @$pb.TagNumber(23)
  @$pb.TagNumber(27)
  @$pb.TagNumber(28)
  @$pb.TagNumber(29)
  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  @$pb.TagNumber(32)
  @$pb.TagNumber(33)
  @$pb.TagNumber(34)
  @$pb.TagNumber(35)
  @$pb.TagNumber(36)
  @$pb.TagNumber(40)
  @$pb.TagNumber(41)
  @$pb.TagNumber(42)
  @$pb.TagNumber(43)
  @$pb.TagNumber(44)
  @$pb.TagNumber(45)
  @$pb.TagNumber(46)
  @$pb.TagNumber(50)
  @$pb.TagNumber(51)
  @$pb.TagNumber(52)
  @$pb.TagNumber(53)
  @$pb.TagNumber(54)
  @$pb.TagNumber(55)
  @$pb.TagNumber(56)
  @$pb.TagNumber(57)
  @$pb.TagNumber(60)
  @$pb.TagNumber(61)
  @$pb.TagNumber(62)
  @$pb.TagNumber(63)
  @$pb.TagNumber(64)
  @$pb.TagNumber(65)
  @$pb.TagNumber(66)
  @$pb.TagNumber(67)
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
  C_CheckId get cCheckId => $_getN(3);
  @$pb.TagNumber(10)
  set cCheckId(C_CheckId value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasCCheckId() => $_has(3);
  @$pb.TagNumber(10)
  void clearCCheckId() => $_clearField(10);
  @$pb.TagNumber(10)
  C_CheckId ensureCCheckId() => $_ensure(3);

  @$pb.TagNumber(11)
  S_CheckId get sCheckId => $_getN(4);
  @$pb.TagNumber(11)
  set sCheckId(S_CheckId value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasSCheckId() => $_has(4);
  @$pb.TagNumber(11)
  void clearSCheckId() => $_clearField(11);
  @$pb.TagNumber(11)
  S_CheckId ensureSCheckId() => $_ensure(4);

  @$pb.TagNumber(12)
  C_CheckEmail get cCheckEmail => $_getN(5);
  @$pb.TagNumber(12)
  set cCheckEmail(C_CheckEmail value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasCCheckEmail() => $_has(5);
  @$pb.TagNumber(12)
  void clearCCheckEmail() => $_clearField(12);
  @$pb.TagNumber(12)
  C_CheckEmail ensureCCheckEmail() => $_ensure(5);

  @$pb.TagNumber(13)
  S_CheckEmail get sCheckEmail => $_getN(6);
  @$pb.TagNumber(13)
  set sCheckEmail(S_CheckEmail value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasSCheckEmail() => $_has(6);
  @$pb.TagNumber(13)
  void clearSCheckEmail() => $_clearField(13);
  @$pb.TagNumber(13)
  S_CheckEmail ensureSCheckEmail() => $_ensure(6);

  @$pb.TagNumber(14)
  C_RequestEmailVerify get cReqEmailVerify => $_getN(7);
  @$pb.TagNumber(14)
  set cReqEmailVerify(C_RequestEmailVerify value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasCReqEmailVerify() => $_has(7);
  @$pb.TagNumber(14)
  void clearCReqEmailVerify() => $_clearField(14);
  @$pb.TagNumber(14)
  C_RequestEmailVerify ensureCReqEmailVerify() => $_ensure(7);

  @$pb.TagNumber(15)
  S_RequestEmailVerify get sReqEmailVerify => $_getN(8);
  @$pb.TagNumber(15)
  set sReqEmailVerify(S_RequestEmailVerify value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasSReqEmailVerify() => $_has(8);
  @$pb.TagNumber(15)
  void clearSReqEmailVerify() => $_clearField(15);
  @$pb.TagNumber(15)
  S_RequestEmailVerify ensureSReqEmailVerify() => $_ensure(8);

  @$pb.TagNumber(16)
  C_ConfirmEmailVerify get cConfirmEmailVerify => $_getN(9);
  @$pb.TagNumber(16)
  set cConfirmEmailVerify(C_ConfirmEmailVerify value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasCConfirmEmailVerify() => $_has(9);
  @$pb.TagNumber(16)
  void clearCConfirmEmailVerify() => $_clearField(16);
  @$pb.TagNumber(16)
  C_ConfirmEmailVerify ensureCConfirmEmailVerify() => $_ensure(9);

  @$pb.TagNumber(17)
  S_ConfirmEmailVerify get sConfirmEmailVerify => $_getN(10);
  @$pb.TagNumber(17)
  set sConfirmEmailVerify(S_ConfirmEmailVerify value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasSConfirmEmailVerify() => $_has(10);
  @$pb.TagNumber(17)
  void clearSConfirmEmailVerify() => $_clearField(17);
  @$pb.TagNumber(17)
  S_ConfirmEmailVerify ensureSConfirmEmailVerify() => $_ensure(10);

  @$pb.TagNumber(18)
  C_SignUp get cSignup => $_getN(11);
  @$pb.TagNumber(18)
  set cSignup(C_SignUp value) => $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasCSignup() => $_has(11);
  @$pb.TagNumber(18)
  void clearCSignup() => $_clearField(18);
  @$pb.TagNumber(18)
  C_SignUp ensureCSignup() => $_ensure(11);

  @$pb.TagNumber(19)
  S_SignUp get sSignup => $_getN(12);
  @$pb.TagNumber(19)
  set sSignup(S_SignUp value) => $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasSSignup() => $_has(12);
  @$pb.TagNumber(19)
  void clearSSignup() => $_clearField(19);
  @$pb.TagNumber(19)
  S_SignUp ensureSSignup() => $_ensure(12);

  /// LOGIN
  @$pb.TagNumber(20)
  C_Login get cLogin => $_getN(13);
  @$pb.TagNumber(20)
  set cLogin(C_Login value) => $_setField(20, value);
  @$pb.TagNumber(20)
  $core.bool hasCLogin() => $_has(13);
  @$pb.TagNumber(20)
  void clearCLogin() => $_clearField(20);
  @$pb.TagNumber(20)
  C_Login ensureCLogin() => $_ensure(13);

  @$pb.TagNumber(21)
  S_Login get sLogin => $_getN(14);
  @$pb.TagNumber(21)
  set sLogin(S_Login value) => $_setField(21, value);
  @$pb.TagNumber(21)
  $core.bool hasSLogin() => $_has(14);
  @$pb.TagNumber(21)
  void clearSLogin() => $_clearField(21);
  @$pb.TagNumber(21)
  S_Login ensureSLogin() => $_ensure(14);

  @$pb.TagNumber(22)
  C_FetchOffline get cFetchOffline => $_getN(15);
  @$pb.TagNumber(22)
  set cFetchOffline(C_FetchOffline value) => $_setField(22, value);
  @$pb.TagNumber(22)
  $core.bool hasCFetchOffline() => $_has(15);
  @$pb.TagNumber(22)
  void clearCFetchOffline() => $_clearField(22);
  @$pb.TagNumber(22)
  C_FetchOffline ensureCFetchOffline() => $_ensure(15);

  @$pb.TagNumber(23)
  S_MessageBatch get sMessageBatch => $_getN(16);
  @$pb.TagNumber(23)
  set sMessageBatch(S_MessageBatch value) => $_setField(23, value);
  @$pb.TagNumber(23)
  $core.bool hasSMessageBatch() => $_has(16);
  @$pb.TagNumber(23)
  void clearSMessageBatch() => $_clearField(23);
  @$pb.TagNumber(23)
  S_MessageBatch ensureSMessageBatch() => $_ensure(16);

  @$pb.TagNumber(27)
  S_Error get sError => $_getN(17);
  @$pb.TagNumber(27)
  set sError(S_Error value) => $_setField(27, value);
  @$pb.TagNumber(27)
  $core.bool hasSError() => $_has(17);
  @$pb.TagNumber(27)
  void clearSError() => $_clearField(27);
  @$pb.TagNumber(27)
  S_Error ensureSError() => $_ensure(17);

  @$pb.TagNumber(28)
  C_Heartbeat get cHeartbeat => $_getN(18);
  @$pb.TagNumber(28)
  set cHeartbeat(C_Heartbeat value) => $_setField(28, value);
  @$pb.TagNumber(28)
  $core.bool hasCHeartbeat() => $_has(18);
  @$pb.TagNumber(28)
  void clearCHeartbeat() => $_clearField(28);
  @$pb.TagNumber(28)
  C_Heartbeat ensureCHeartbeat() => $_ensure(18);

  @$pb.TagNumber(29)
  S_Heartbeat get sHeartbeat => $_getN(19);
  @$pb.TagNumber(29)
  set sHeartbeat(S_Heartbeat value) => $_setField(29, value);
  @$pb.TagNumber(29)
  $core.bool hasSHeartbeat() => $_has(19);
  @$pb.TagNumber(29)
  void clearSHeartbeat() => $_clearField(29);
  @$pb.TagNumber(29)
  S_Heartbeat ensureSHeartbeat() => $_ensure(19);

  /// Chat, Data(File)
  @$pb.TagNumber(30)
  C_Chat get cChat => $_getN(20);
  @$pb.TagNumber(30)
  set cChat(C_Chat value) => $_setField(30, value);
  @$pb.TagNumber(30)
  $core.bool hasCChat() => $_has(20);
  @$pb.TagNumber(30)
  void clearCChat() => $_clearField(30);
  @$pb.TagNumber(30)
  C_Chat ensureCChat() => $_ensure(20);

  @$pb.TagNumber(31)
  S_Chat get sChat => $_getN(21);
  @$pb.TagNumber(31)
  set sChat(S_Chat value) => $_setField(31, value);
  @$pb.TagNumber(31)
  $core.bool hasSChat() => $_has(21);
  @$pb.TagNumber(31)
  void clearSChat() => $_clearField(31);
  @$pb.TagNumber(31)
  S_Chat ensureSChat() => $_ensure(21);

  @$pb.TagNumber(32)
  C_Ack get cAck => $_getN(22);
  @$pb.TagNumber(32)
  set cAck(C_Ack value) => $_setField(32, value);
  @$pb.TagNumber(32)
  $core.bool hasCAck() => $_has(22);
  @$pb.TagNumber(32)
  void clearCAck() => $_clearField(32);
  @$pb.TagNumber(32)
  C_Ack ensureCAck() => $_ensure(22);

  @$pb.TagNumber(33)
  C_ReqHistory get cReqHistory => $_getN(23);
  @$pb.TagNumber(33)
  set cReqHistory(C_ReqHistory value) => $_setField(33, value);
  @$pb.TagNumber(33)
  $core.bool hasCReqHistory() => $_has(23);
  @$pb.TagNumber(33)
  void clearCReqHistory() => $_clearField(33);
  @$pb.TagNumber(33)
  C_ReqHistory ensureCReqHistory() => $_ensure(23);

  @$pb.TagNumber(34)
  S_ReqHistory get sReqHistory => $_getN(24);
  @$pb.TagNumber(34)
  set sReqHistory(S_ReqHistory value) => $_setField(34, value);
  @$pb.TagNumber(34)
  $core.bool hasSReqHistory() => $_has(24);
  @$pb.TagNumber(34)
  void clearSReqHistory() => $_clearField(34);
  @$pb.TagNumber(34)
  S_ReqHistory ensureSReqHistory() => $_ensure(24);

  @$pb.TagNumber(35)
  C_UploadFile get cUploadFile => $_getN(25);
  @$pb.TagNumber(35)
  set cUploadFile(C_UploadFile value) => $_setField(35, value);
  @$pb.TagNumber(35)
  $core.bool hasCUploadFile() => $_has(25);
  @$pb.TagNumber(35)
  void clearCUploadFile() => $_clearField(35);
  @$pb.TagNumber(35)
  C_UploadFile ensureCUploadFile() => $_ensure(25);

  @$pb.TagNumber(36)
  S_UploadFile get sUploadFile => $_getN(26);
  @$pb.TagNumber(36)
  set sUploadFile(S_UploadFile value) => $_setField(36, value);
  @$pb.TagNumber(36)
  $core.bool hasSUploadFile() => $_has(26);
  @$pb.TagNumber(36)
  void clearSUploadFile() => $_clearField(36);
  @$pb.TagNumber(36)
  S_UploadFile ensureSUploadFile() => $_ensure(26);

  /// Freind
  @$pb.TagNumber(40)
  C_SearchUser get cSearchUser => $_getN(27);
  @$pb.TagNumber(40)
  set cSearchUser(C_SearchUser value) => $_setField(40, value);
  @$pb.TagNumber(40)
  $core.bool hasCSearchUser() => $_has(27);
  @$pb.TagNumber(40)
  void clearCSearchUser() => $_clearField(40);
  @$pb.TagNumber(40)
  C_SearchUser ensureCSearchUser() => $_ensure(27);

  @$pb.TagNumber(41)
  S_SearchUser get sSearchUser => $_getN(28);
  @$pb.TagNumber(41)
  set sSearchUser(S_SearchUser value) => $_setField(41, value);
  @$pb.TagNumber(41)
  $core.bool hasSSearchUser() => $_has(28);
  @$pb.TagNumber(41)
  void clearSSearchUser() => $_clearField(41);
  @$pb.TagNumber(41)
  S_SearchUser ensureSSearchUser() => $_ensure(28);

  @$pb.TagNumber(42)
  C_FriendAction get cFriendAction => $_getN(29);
  @$pb.TagNumber(42)
  set cFriendAction(C_FriendAction value) => $_setField(42, value);
  @$pb.TagNumber(42)
  $core.bool hasCFriendAction() => $_has(29);
  @$pb.TagNumber(42)
  void clearCFriendAction() => $_clearField(42);
  @$pb.TagNumber(42)
  C_FriendAction ensureCFriendAction() => $_ensure(29);

  @$pb.TagNumber(43)
  S_FriendAction get sFriendAction => $_getN(30);
  @$pb.TagNumber(43)
  set sFriendAction(S_FriendAction value) => $_setField(43, value);
  @$pb.TagNumber(43)
  $core.bool hasSFriendAction() => $_has(30);
  @$pb.TagNumber(43)
  void clearSFriendAction() => $_clearField(43);
  @$pb.TagNumber(43)
  S_FriendAction ensureSFriendAction() => $_ensure(30);

  @$pb.TagNumber(44)
  C_FetchFriendData get cFetchFriendData => $_getN(31);
  @$pb.TagNumber(44)
  set cFetchFriendData(C_FetchFriendData value) => $_setField(44, value);
  @$pb.TagNumber(44)
  $core.bool hasCFetchFriendData() => $_has(31);
  @$pb.TagNumber(44)
  void clearCFetchFriendData() => $_clearField(44);
  @$pb.TagNumber(44)
  C_FetchFriendData ensureCFetchFriendData() => $_ensure(31);

  @$pb.TagNumber(45)
  S_FetchFriendData get sFetchFriendData => $_getN(32);
  @$pb.TagNumber(45)
  set sFetchFriendData(S_FetchFriendData value) => $_setField(45, value);
  @$pb.TagNumber(45)
  $core.bool hasSFetchFriendData() => $_has(32);
  @$pb.TagNumber(45)
  void clearSFetchFriendData() => $_clearField(45);
  @$pb.TagNumber(45)
  S_FetchFriendData ensureSFetchFriendData() => $_ensure(32);

  @$pb.TagNumber(46)
  S_FriendPush get sFriendPush => $_getN(33);
  @$pb.TagNumber(46)
  set sFriendPush(S_FriendPush value) => $_setField(46, value);
  @$pb.TagNumber(46)
  $core.bool hasSFriendPush() => $_has(33);
  @$pb.TagNumber(46)
  void clearSFriendPush() => $_clearField(46);
  @$pb.TagNumber(46)
  S_FriendPush ensureSFriendPush() => $_ensure(33);

  /// Group
  @$pb.TagNumber(50)
  C_CreateGroup get cCreateGroup => $_getN(34);
  @$pb.TagNumber(50)
  set cCreateGroup(C_CreateGroup value) => $_setField(50, value);
  @$pb.TagNumber(50)
  $core.bool hasCCreateGroup() => $_has(34);
  @$pb.TagNumber(50)
  void clearCCreateGroup() => $_clearField(50);
  @$pb.TagNumber(50)
  C_CreateGroup ensureCCreateGroup() => $_ensure(34);

  @$pb.TagNumber(51)
  S_CreateGroup get sCreateGroup => $_getN(35);
  @$pb.TagNumber(51)
  set sCreateGroup(S_CreateGroup value) => $_setField(51, value);
  @$pb.TagNumber(51)
  $core.bool hasSCreateGroup() => $_has(35);
  @$pb.TagNumber(51)
  void clearSCreateGroup() => $_clearField(51);
  @$pb.TagNumber(51)
  S_CreateGroup ensureSCreateGroup() => $_ensure(35);

  @$pb.TagNumber(52)
  C_GroupList get cGroupList => $_getN(36);
  @$pb.TagNumber(52)
  set cGroupList(C_GroupList value) => $_setField(52, value);
  @$pb.TagNumber(52)
  $core.bool hasCGroupList() => $_has(36);
  @$pb.TagNumber(52)
  void clearCGroupList() => $_clearField(52);
  @$pb.TagNumber(52)
  C_GroupList ensureCGroupList() => $_ensure(36);

  @$pb.TagNumber(53)
  S_GroupList get sGroupList => $_getN(37);
  @$pb.TagNumber(53)
  set sGroupList(S_GroupList value) => $_setField(53, value);
  @$pb.TagNumber(53)
  $core.bool hasSGroupList() => $_has(37);
  @$pb.TagNumber(53)
  void clearSGroupList() => $_clearField(53);
  @$pb.TagNumber(53)
  S_GroupList ensureSGroupList() => $_ensure(37);

  @$pb.TagNumber(54)
  C_JoinGroup get cJoinGroup => $_getN(38);
  @$pb.TagNumber(54)
  set cJoinGroup(C_JoinGroup value) => $_setField(54, value);
  @$pb.TagNumber(54)
  $core.bool hasCJoinGroup() => $_has(38);
  @$pb.TagNumber(54)
  void clearCJoinGroup() => $_clearField(54);
  @$pb.TagNumber(54)
  C_JoinGroup ensureCJoinGroup() => $_ensure(38);

  @$pb.TagNumber(55)
  S_JoinGroup get sJoinGroup => $_getN(39);
  @$pb.TagNumber(55)
  set sJoinGroup(S_JoinGroup value) => $_setField(55, value);
  @$pb.TagNumber(55)
  $core.bool hasSJoinGroup() => $_has(39);
  @$pb.TagNumber(55)
  void clearSJoinGroup() => $_clearField(55);
  @$pb.TagNumber(55)
  S_JoinGroup ensureSJoinGroup() => $_ensure(39);

  @$pb.TagNumber(56)
  C_InviteFriend get cInviteFriend => $_getN(40);
  @$pb.TagNumber(56)
  set cInviteFriend(C_InviteFriend value) => $_setField(56, value);
  @$pb.TagNumber(56)
  $core.bool hasCInviteFriend() => $_has(40);
  @$pb.TagNumber(56)
  void clearCInviteFriend() => $_clearField(56);
  @$pb.TagNumber(56)
  C_InviteFriend ensureCInviteFriend() => $_ensure(40);

  @$pb.TagNumber(57)
  S_InviteFriend get sInviteFriend => $_getN(41);
  @$pb.TagNumber(57)
  set sInviteFriend(S_InviteFriend value) => $_setField(57, value);
  @$pb.TagNumber(57)
  $core.bool hasSInviteFriend() => $_has(41);
  @$pb.TagNumber(57)
  void clearSInviteFriend() => $_clearField(57);
  @$pb.TagNumber(57)
  S_InviteFriend ensureSInviteFriend() => $_ensure(41);

  @$pb.TagNumber(60)
  C_LeaveGroup get cLeaveGroup => $_getN(42);
  @$pb.TagNumber(60)
  set cLeaveGroup(C_LeaveGroup value) => $_setField(60, value);
  @$pb.TagNumber(60)
  $core.bool hasCLeaveGroup() => $_has(42);
  @$pb.TagNumber(60)
  void clearCLeaveGroup() => $_clearField(60);
  @$pb.TagNumber(60)
  C_LeaveGroup ensureCLeaveGroup() => $_ensure(42);

  @$pb.TagNumber(61)
  S_LeaveGroup get sLeaveGroup => $_getN(43);
  @$pb.TagNumber(61)
  set sLeaveGroup(S_LeaveGroup value) => $_setField(61, value);
  @$pb.TagNumber(61)
  $core.bool hasSLeaveGroup() => $_has(43);
  @$pb.TagNumber(61)
  void clearSLeaveGroup() => $_clearField(61);
  @$pb.TagNumber(61)
  S_LeaveGroup ensureSLeaveGroup() => $_ensure(43);

  @$pb.TagNumber(62)
  C_GroupMemberList get cGroupMemberList => $_getN(44);
  @$pb.TagNumber(62)
  set cGroupMemberList(C_GroupMemberList value) => $_setField(62, value);
  @$pb.TagNumber(62)
  $core.bool hasCGroupMemberList() => $_has(44);
  @$pb.TagNumber(62)
  void clearCGroupMemberList() => $_clearField(62);
  @$pb.TagNumber(62)
  C_GroupMemberList ensureCGroupMemberList() => $_ensure(44);

  @$pb.TagNumber(63)
  S_GroupMemberList get sGroupMemberList => $_getN(45);
  @$pb.TagNumber(63)
  set sGroupMemberList(S_GroupMemberList value) => $_setField(63, value);
  @$pb.TagNumber(63)
  $core.bool hasSGroupMemberList() => $_has(45);
  @$pb.TagNumber(63)
  void clearSGroupMemberList() => $_clearField(63);
  @$pb.TagNumber(63)
  S_GroupMemberList ensureSGroupMemberList() => $_ensure(45);

  @$pb.TagNumber(64)
  C_GroupInfo get cGroupInfo => $_getN(46);
  @$pb.TagNumber(64)
  set cGroupInfo(C_GroupInfo value) => $_setField(64, value);
  @$pb.TagNumber(64)
  $core.bool hasCGroupInfo() => $_has(46);
  @$pb.TagNumber(64)
  void clearCGroupInfo() => $_clearField(64);
  @$pb.TagNumber(64)
  C_GroupInfo ensureCGroupInfo() => $_ensure(46);

  @$pb.TagNumber(65)
  S_GroupInfo get sGroupInfo => $_getN(47);
  @$pb.TagNumber(65)
  set sGroupInfo(S_GroupInfo value) => $_setField(65, value);
  @$pb.TagNumber(65)
  $core.bool hasSGroupInfo() => $_has(47);
  @$pb.TagNumber(65)
  void clearSGroupInfo() => $_clearField(65);
  @$pb.TagNumber(65)
  S_GroupInfo ensureSGroupInfo() => $_ensure(47);

  @$pb.TagNumber(66)
  C_EditGroup get cEditGroup => $_getN(48);
  @$pb.TagNumber(66)
  set cEditGroup(C_EditGroup value) => $_setField(66, value);
  @$pb.TagNumber(66)
  $core.bool hasCEditGroup() => $_has(48);
  @$pb.TagNumber(66)
  void clearCEditGroup() => $_clearField(66);
  @$pb.TagNumber(66)
  C_EditGroup ensureCEditGroup() => $_ensure(48);

  @$pb.TagNumber(67)
  S_EditGroup get sEditGroup => $_getN(49);
  @$pb.TagNumber(67)
  set sEditGroup(S_EditGroup value) => $_setField(67, value);
  @$pb.TagNumber(67)
  $core.bool hasSEditGroup() => $_has(49);
  @$pb.TagNumber(67)
  void clearSEditGroup() => $_clearField(67);
  @$pb.TagNumber(67)
  S_EditGroup ensureSEditGroup() => $_ensure(49);
}

/// -------------
/// 회원가입
/// ---------------
class C_CheckId extends $pb.GeneratedMessage {
  factory C_CheckId({
    $core.String? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  C_CheckId._();

  factory C_CheckId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_CheckId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_CheckId',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_CheckId clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_CheckId copyWith(void Function(C_CheckId) updates) =>
      super.copyWith((message) => updates(message as C_CheckId)) as C_CheckId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_CheckId create() => C_CheckId._();
  @$core.override
  C_CheckId createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_CheckId getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_CheckId>(create);
  static C_CheckId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class S_CheckId extends $pb.GeneratedMessage {
  factory S_CheckId({
    $core.bool? isAvailable,
  }) {
    final result = create();
    if (isAvailable != null) result.isAvailable = isAvailable;
    return result;
  }

  S_CheckId._();

  factory S_CheckId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_CheckId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_CheckId',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAvailable')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_CheckId clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_CheckId copyWith(void Function(S_CheckId) updates) =>
      super.copyWith((message) => updates(message as S_CheckId)) as S_CheckId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_CheckId create() => S_CheckId._();
  @$core.override
  S_CheckId createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_CheckId getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_CheckId>(create);
  static S_CheckId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAvailable => $_getBF(0);
  @$pb.TagNumber(1)
  set isAvailable($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAvailable() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAvailable() => $_clearField(1);
}

class C_CheckEmail extends $pb.GeneratedMessage {
  factory C_CheckEmail({
    $core.String? email,
  }) {
    final result = create();
    if (email != null) result.email = email;
    return result;
  }

  C_CheckEmail._();

  factory C_CheckEmail.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_CheckEmail.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_CheckEmail',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_CheckEmail clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_CheckEmail copyWith(void Function(C_CheckEmail) updates) =>
      super.copyWith((message) => updates(message as C_CheckEmail))
          as C_CheckEmail;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_CheckEmail create() => C_CheckEmail._();
  @$core.override
  C_CheckEmail createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_CheckEmail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_CheckEmail>(create);
  static C_CheckEmail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);
}

class S_CheckEmail extends $pb.GeneratedMessage {
  factory S_CheckEmail({
    $core.bool? isAvailable,
  }) {
    final result = create();
    if (isAvailable != null) result.isAvailable = isAvailable;
    return result;
  }

  S_CheckEmail._();

  factory S_CheckEmail.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_CheckEmail.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_CheckEmail',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAvailable')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_CheckEmail clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_CheckEmail copyWith(void Function(S_CheckEmail) updates) =>
      super.copyWith((message) => updates(message as S_CheckEmail))
          as S_CheckEmail;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_CheckEmail create() => S_CheckEmail._();
  @$core.override
  S_CheckEmail createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_CheckEmail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_CheckEmail>(create);
  static S_CheckEmail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAvailable => $_getBF(0);
  @$pb.TagNumber(1)
  set isAvailable($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAvailable() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAvailable() => $_clearField(1);
}

class C_RequestEmailVerify extends $pb.GeneratedMessage {
  factory C_RequestEmailVerify({
    $core.String? email,
  }) {
    final result = create();
    if (email != null) result.email = email;
    return result;
  }

  C_RequestEmailVerify._();

  factory C_RequestEmailVerify.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_RequestEmailVerify.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_RequestEmailVerify',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_RequestEmailVerify clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_RequestEmailVerify copyWith(void Function(C_RequestEmailVerify) updates) =>
      super.copyWith((message) => updates(message as C_RequestEmailVerify))
          as C_RequestEmailVerify;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_RequestEmailVerify create() => C_RequestEmailVerify._();
  @$core.override
  C_RequestEmailVerify createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_RequestEmailVerify getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_RequestEmailVerify>(create);
  static C_RequestEmailVerify? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);
}

class S_RequestEmailVerify extends $pb.GeneratedMessage {
  factory S_RequestEmailVerify({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  S_RequestEmailVerify._();

  factory S_RequestEmailVerify.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_RequestEmailVerify.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_RequestEmailVerify',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_RequestEmailVerify clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_RequestEmailVerify copyWith(void Function(S_RequestEmailVerify) updates) =>
      super.copyWith((message) => updates(message as S_RequestEmailVerify))
          as S_RequestEmailVerify;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_RequestEmailVerify create() => S_RequestEmailVerify._();
  @$core.override
  S_RequestEmailVerify createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_RequestEmailVerify getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_RequestEmailVerify>(create);
  static S_RequestEmailVerify? _defaultInstance;

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

class C_ConfirmEmailVerify extends $pb.GeneratedMessage {
  factory C_ConfirmEmailVerify({
    $core.String? email,
    $core.String? code,
  }) {
    final result = create();
    if (email != null) result.email = email;
    if (code != null) result.code = code;
    return result;
  }

  C_ConfirmEmailVerify._();

  factory C_ConfirmEmailVerify.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_ConfirmEmailVerify.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_ConfirmEmailVerify',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_ConfirmEmailVerify clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_ConfirmEmailVerify copyWith(void Function(C_ConfirmEmailVerify) updates) =>
      super.copyWith((message) => updates(message as C_ConfirmEmailVerify))
          as C_ConfirmEmailVerify;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_ConfirmEmailVerify create() => C_ConfirmEmailVerify._();
  @$core.override
  C_ConfirmEmailVerify createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_ConfirmEmailVerify getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_ConfirmEmailVerify>(create);
  static C_ConfirmEmailVerify? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);
}

class S_ConfirmEmailVerify extends $pb.GeneratedMessage {
  factory S_ConfirmEmailVerify({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  S_ConfirmEmailVerify._();

  factory S_ConfirmEmailVerify.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_ConfirmEmailVerify.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_ConfirmEmailVerify',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_ConfirmEmailVerify clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_ConfirmEmailVerify copyWith(void Function(S_ConfirmEmailVerify) updates) =>
      super.copyWith((message) => updates(message as S_ConfirmEmailVerify))
          as S_ConfirmEmailVerify;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_ConfirmEmailVerify create() => S_ConfirmEmailVerify._();
  @$core.override
  S_ConfirmEmailVerify createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_ConfirmEmailVerify getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_ConfirmEmailVerify>(create);
  static S_ConfirmEmailVerify? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

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

/// -------------
/// 로그인
/// ---------------
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

enum ChatPayload_Data { text, image, video, file, system, notSet }

class ChatPayload extends $pb.GeneratedMessage {
  factory ChatPayload({
    Text? text,
    Image? image,
    Video? video,
    File? file,
    SystemMsg? system,
  }) {
    final result = create();
    if (text != null) result.text = text;
    if (image != null) result.image = image;
    if (video != null) result.video = video;
    if (file != null) result.file = file;
    if (system != null) result.system = system;
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
    3: ChatPayload_Data.video,
    4: ChatPayload_Data.file,
    5: ChatPayload_Data.system,
    0: ChatPayload_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatPayload',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<Text>(1, _omitFieldNames ? '' : 'text', subBuilder: Text.create)
    ..aOM<Image>(2, _omitFieldNames ? '' : 'image', subBuilder: Image.create)
    ..aOM<Video>(3, _omitFieldNames ? '' : 'video', subBuilder: Video.create)
    ..aOM<File>(4, _omitFieldNames ? '' : 'file', subBuilder: File.create)
    ..aOM<SystemMsg>(5, _omitFieldNames ? '' : 'system',
        subBuilder: SystemMsg.create)
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
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  ChatPayload_Data whichData() => _ChatPayload_DataByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  void clearData() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Text get text => $_getN(0);
  @$pb.TagNumber(1)
  set text(Text value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => $_clearField(1);
  @$pb.TagNumber(1)
  Text ensureText() => $_ensure(0);

  @$pb.TagNumber(2)
  Image get image => $_getN(1);
  @$pb.TagNumber(2)
  set image(Image value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => $_clearField(2);
  @$pb.TagNumber(2)
  Image ensureImage() => $_ensure(1);

  @$pb.TagNumber(3)
  Video get video => $_getN(2);
  @$pb.TagNumber(3)
  set video(Video value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasVideo() => $_has(2);
  @$pb.TagNumber(3)
  void clearVideo() => $_clearField(3);
  @$pb.TagNumber(3)
  Video ensureVideo() => $_ensure(2);

  @$pb.TagNumber(4)
  File get file => $_getN(3);
  @$pb.TagNumber(4)
  set file(File value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasFile() => $_has(3);
  @$pb.TagNumber(4)
  void clearFile() => $_clearField(4);
  @$pb.TagNumber(4)
  File ensureFile() => $_ensure(3);

  @$pb.TagNumber(5)
  SystemMsg get system => $_getN(4);
  @$pb.TagNumber(5)
  set system(SystemMsg value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasSystem() => $_has(4);
  @$pb.TagNumber(5)
  void clearSystem() => $_clearField(5);
  @$pb.TagNumber(5)
  SystemMsg ensureSystem() => $_ensure(4);
}

class Text extends $pb.GeneratedMessage {
  factory Text({
    $core.String? message,
  }) {
    final result = create();
    if (message != null) result.message = message;
    return result;
  }

  Text._();

  factory Text.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Text.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Text',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Text clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Text copyWith(void Function(Text) updates) =>
      super.copyWith((message) => updates(message as Text)) as Text;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Text create() => Text._();
  @$core.override
  Text createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Text getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Text>(create);
  static Text? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);
}

class Image extends $pb.GeneratedMessage {
  factory Image({
    $core.String? url,
    $core.String? thumbnail,
    $fixnum.Int64? size,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (thumbnail != null) result.thumbnail = thumbnail;
    if (size != null) result.size = size;
    return result;
  }

  Image._();

  factory Image.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Image.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Image',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'thumbnail')
    ..aInt64(3, _omitFieldNames ? '' : 'size')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Image clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Image copyWith(void Function(Image) updates) =>
      super.copyWith((message) => updates(message as Image)) as Image;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Image create() => Image._();
  @$core.override
  Image createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Image getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Image>(create);
  static Image? _defaultInstance;

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

  @$pb.TagNumber(3)
  $fixnum.Int64 get size => $_getI64(2);
  @$pb.TagNumber(3)
  set size($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearSize() => $_clearField(3);
}

class Video extends $pb.GeneratedMessage {
  factory Video({
    $core.String? url,
    $core.String? thumbnail,
    $fixnum.Int64? durationSec,
    $fixnum.Int64? size,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (thumbnail != null) result.thumbnail = thumbnail;
    if (durationSec != null) result.durationSec = durationSec;
    if (size != null) result.size = size;
    return result;
  }

  Video._();

  factory Video.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Video.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Video',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'thumbnail')
    ..aInt64(3, _omitFieldNames ? '' : 'durationSec')
    ..aInt64(4, _omitFieldNames ? '' : 'size')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Video clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Video copyWith(void Function(Video) updates) =>
      super.copyWith((message) => updates(message as Video)) as Video;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Video create() => Video._();
  @$core.override
  Video createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Video getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Video>(create);
  static Video? _defaultInstance;

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

  @$pb.TagNumber(3)
  $fixnum.Int64 get durationSec => $_getI64(2);
  @$pb.TagNumber(3)
  set durationSec($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDurationSec() => $_has(2);
  @$pb.TagNumber(3)
  void clearDurationSec() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get size => $_getI64(3);
  @$pb.TagNumber(4)
  set size($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearSize() => $_clearField(4);
}

class File extends $pb.GeneratedMessage {
  factory File({
    $core.String? url,
    $core.String? filename,
    $fixnum.Int64? size,
    $core.String? mimeType,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (filename != null) result.filename = filename;
    if (size != null) result.size = size;
    if (mimeType != null) result.mimeType = mimeType;
    return result;
  }

  File._();

  factory File.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory File.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'File',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'filename')
    ..aInt64(3, _omitFieldNames ? '' : 'size')
    ..aOS(4, _omitFieldNames ? '' : 'mimeType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  File clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  File copyWith(void Function(File) updates) =>
      super.copyWith((message) => updates(message as File)) as File;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static File create() => File._();
  @$core.override
  File createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static File getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<File>(create);
  static File? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.String get mimeType => $_getSZ(3);
  @$pb.TagNumber(4)
  set mimeType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMimeType() => $_has(3);
  @$pb.TagNumber(4)
  void clearMimeType() => $_clearField(4);
}

class SystemMsg extends $pb.GeneratedMessage {
  factory SystemMsg({
    $core.String? message,
    $core.int? type,
    $core.String? inviteGroupId,
    $core.String? inviteGroupCode,
    $core.String? inviteGroupName,
  }) {
    final result = create();
    if (message != null) result.message = message;
    if (type != null) result.type = type;
    if (inviteGroupId != null) result.inviteGroupId = inviteGroupId;
    if (inviteGroupCode != null) result.inviteGroupCode = inviteGroupCode;
    if (inviteGroupName != null) result.inviteGroupName = inviteGroupName;
    return result;
  }

  SystemMsg._();

  factory SystemMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SystemMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SystemMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..aI(2, _omitFieldNames ? '' : 'type')
    ..aOS(3, _omitFieldNames ? '' : 'inviteGroupId')
    ..aOS(4, _omitFieldNames ? '' : 'inviteGroupCode')
    ..aOS(5, _omitFieldNames ? '' : 'inviteGroupName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemMsg copyWith(void Function(SystemMsg) updates) =>
      super.copyWith((message) => updates(message as SystemMsg)) as SystemMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SystemMsg create() => SystemMsg._();
  @$core.override
  SystemMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SystemMsg getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SystemMsg>(create);
  static SystemMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get type => $_getIZ(1);
  @$pb.TagNumber(2)
  set type($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get inviteGroupId => $_getSZ(2);
  @$pb.TagNumber(3)
  set inviteGroupId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasInviteGroupId() => $_has(2);
  @$pb.TagNumber(3)
  void clearInviteGroupId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get inviteGroupCode => $_getSZ(3);
  @$pb.TagNumber(4)
  set inviteGroupCode($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasInviteGroupCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearInviteGroupCode() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get inviteGroupName => $_getSZ(4);
  @$pb.TagNumber(5)
  set inviteGroupName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasInviteGroupName() => $_has(4);
  @$pb.TagNumber(5)
  void clearInviteGroupName() => $_clearField(5);
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
    $fixnum.Int64? msgSeq,
    $core.String? senderId,
    $core.String? senderName,
    ChatPayload? payload,
    $fixnum.Int64? tsServer,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (clientMsgId != null) result.clientMsgId = clientMsgId;
    if (msgSeq != null) result.msgSeq = msgSeq;
    if (senderId != null) result.senderId = senderId;
    if (senderName != null) result.senderName = senderName;
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
    ..aInt64(3, _omitFieldNames ? '' : 'msgSeq')
    ..aOS(4, _omitFieldNames ? '' : 'senderId')
    ..aOS(5, _omitFieldNames ? '' : 'senderName')
    ..aOM<ChatPayload>(6, _omitFieldNames ? '' : 'payload',
        subBuilder: ChatPayload.create)
    ..aInt64(7, _omitFieldNames ? '' : 'tsServer')
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
  $fixnum.Int64 get msgSeq => $_getI64(2);
  @$pb.TagNumber(3)
  set msgSeq($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMsgSeq() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsgSeq() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get senderId => $_getSZ(3);
  @$pb.TagNumber(4)
  set senderId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSenderId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSenderId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get senderName => $_getSZ(4);
  @$pb.TagNumber(5)
  set senderName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSenderName() => $_has(4);
  @$pb.TagNumber(5)
  void clearSenderName() => $_clearField(5);

  @$pb.TagNumber(6)
  ChatPayload get payload => $_getN(5);
  @$pb.TagNumber(6)
  set payload(ChatPayload value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasPayload() => $_has(5);
  @$pb.TagNumber(6)
  void clearPayload() => $_clearField(6);
  @$pb.TagNumber(6)
  ChatPayload ensurePayload() => $_ensure(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get tsServer => $_getI64(6);
  @$pb.TagNumber(7)
  set tsServer($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTsServer() => $_has(6);
  @$pb.TagNumber(7)
  void clearTsServer() => $_clearField(7);
}

class C_ReqHistory extends $pb.GeneratedMessage {
  factory C_ReqHistory({
    $core.String? convId,
    $fixnum.Int64? lastMsgSeq,
    $core.int? limit,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (lastMsgSeq != null) result.lastMsgSeq = lastMsgSeq;
    if (limit != null) result.limit = limit;
    return result;
  }

  C_ReqHistory._();

  factory C_ReqHistory.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_ReqHistory.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_ReqHistory',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aInt64(2, _omitFieldNames ? '' : 'lastMsgSeq')
    ..aI(3, _omitFieldNames ? '' : 'limit')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_ReqHistory clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_ReqHistory copyWith(void Function(C_ReqHistory) updates) =>
      super.copyWith((message) => updates(message as C_ReqHistory))
          as C_ReqHistory;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_ReqHistory create() => C_ReqHistory._();
  @$core.override
  C_ReqHistory createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_ReqHistory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_ReqHistory>(create);
  static C_ReqHistory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get convId => $_getSZ(0);
  @$pb.TagNumber(1)
  set convId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConvId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastMsgSeq => $_getI64(1);
  @$pb.TagNumber(2)
  set lastMsgSeq($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLastMsgSeq() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastMsgSeq() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get limit => $_getIZ(2);
  @$pb.TagNumber(3)
  set limit($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => $_clearField(3);
}

class S_ReqHistory extends $pb.GeneratedMessage {
  factory S_ReqHistory({
    $core.String? convId,
    $core.Iterable<S_Chat>? messages,
    $core.bool? isEnd,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (messages != null) result.messages.addAll(messages);
    if (isEnd != null) result.isEnd = isEnd;
    return result;
  }

  S_ReqHistory._();

  factory S_ReqHistory.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_ReqHistory.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_ReqHistory',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..pPM<S_Chat>(2, _omitFieldNames ? '' : 'messages',
        subBuilder: S_Chat.create)
    ..aOB(3, _omitFieldNames ? '' : 'isEnd')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_ReqHistory clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_ReqHistory copyWith(void Function(S_ReqHistory) updates) =>
      super.copyWith((message) => updates(message as S_ReqHistory))
          as S_ReqHistory;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_ReqHistory create() => S_ReqHistory._();
  @$core.override
  S_ReqHistory createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_ReqHistory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_ReqHistory>(create);
  static S_ReqHistory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get convId => $_getSZ(0);
  @$pb.TagNumber(1)
  set convId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConvId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<S_Chat> get messages => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get isEnd => $_getBF(2);
  @$pb.TagNumber(3)
  set isEnd($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsEnd() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsEnd() => $_clearField(3);
}

/// 파일 업로드 요청
class C_UploadFile extends $pb.GeneratedMessage {
  factory C_UploadFile({
    $core.String? filename,
    $fixnum.Int64? size,
    $core.String? mimeType,
    $core.bool? isImage,
    C_UploadFile_UploadType? uploadType,
    $core.String? targetId,
  }) {
    final result = create();
    if (filename != null) result.filename = filename;
    if (size != null) result.size = size;
    if (mimeType != null) result.mimeType = mimeType;
    if (isImage != null) result.isImage = isImage;
    if (uploadType != null) result.uploadType = uploadType;
    if (targetId != null) result.targetId = targetId;
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
    ..aE<C_UploadFile_UploadType>(5, _omitFieldNames ? '' : 'uploadType',
        enumValues: C_UploadFile_UploadType.values)
    ..aOS(6, _omitFieldNames ? '' : 'targetId')
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

  @$pb.TagNumber(5)
  C_UploadFile_UploadType get uploadType => $_getN(4);
  @$pb.TagNumber(5)
  set uploadType(C_UploadFile_UploadType value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasUploadType() => $_has(4);
  @$pb.TagNumber(5)
  void clearUploadType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get targetId => $_getSZ(5);
  @$pb.TagNumber(6)
  set targetId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTargetId() => $_has(5);
  @$pb.TagNumber(6)
  void clearTargetId() => $_clearField(6);
}

class S_UploadFile extends $pb.GeneratedMessage {
  factory S_UploadFile({
    $core.bool? success,
    $core.String? message,
    $core.String? fileId,
    $core.String? uploadUrl,
    $core.String? downloadUrl,
    $core.String? thumbUploadUrl,
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
    if (thumbUploadUrl != null) result.thumbUploadUrl = thumbUploadUrl;
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
    ..aOS(6, _omitFieldNames ? '' : 'thumbUploadUrl')
    ..aOS(7, _omitFieldNames ? '' : 'thumbnailUrl')
    ..aInt64(8, _omitFieldNames ? '' : 'expiresAt')
    ..aOS(9, _omitFieldNames ? '' : 'path')
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
  $core.String get thumbUploadUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set thumbUploadUrl($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasThumbUploadUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearThumbUploadUrl() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get thumbnailUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set thumbnailUrl($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasThumbnailUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearThumbnailUrl() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get expiresAt => $_getI64(7);
  @$pb.TagNumber(8)
  set expiresAt($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasExpiresAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearExpiresAt() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get path => $_getSZ(8);
  @$pb.TagNumber(9)
  set path($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasPath() => $_has(8);
  @$pb.TagNumber(9)
  void clearPath() => $_clearField(9);
}

class C_Ack extends $pb.GeneratedMessage {
  factory C_Ack({
    $core.String? convId,
    $fixnum.Int64? msgSeq,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (msgSeq != null) result.msgSeq = msgSeq;
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
    ..aInt64(2, _omitFieldNames ? '' : 'msgSeq')
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
  $fixnum.Int64 get msgSeq => $_getI64(1);
  @$pb.TagNumber(2)
  set msgSeq($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMsgSeq() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsgSeq() => $_clearField(2);
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

class S_MessageBatch_ConversationBatch extends $pb.GeneratedMessage {
  factory S_MessageBatch_ConversationBatch({
    $core.String? convId,
    $core.Iterable<S_Chat>? messages,
    $core.int? unreadCount,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (messages != null) result.messages.addAll(messages);
    if (unreadCount != null) result.unreadCount = unreadCount;
    return result;
  }

  S_MessageBatch_ConversationBatch._();

  factory S_MessageBatch_ConversationBatch.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_MessageBatch_ConversationBatch.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_MessageBatch.ConversationBatch',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..pPM<S_Chat>(2, _omitFieldNames ? '' : 'messages',
        subBuilder: S_Chat.create)
    ..aI(3, _omitFieldNames ? '' : 'unreadCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_MessageBatch_ConversationBatch clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_MessageBatch_ConversationBatch copyWith(
          void Function(S_MessageBatch_ConversationBatch) updates) =>
      super.copyWith(
              (message) => updates(message as S_MessageBatch_ConversationBatch))
          as S_MessageBatch_ConversationBatch;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_MessageBatch_ConversationBatch create() =>
      S_MessageBatch_ConversationBatch._();
  @$core.override
  S_MessageBatch_ConversationBatch createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_MessageBatch_ConversationBatch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_MessageBatch_ConversationBatch>(
          create);
  static S_MessageBatch_ConversationBatch? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get convId => $_getSZ(0);
  @$pb.TagNumber(1)
  set convId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConvId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<S_Chat> get messages => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get unreadCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set unreadCount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUnreadCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnreadCount() => $_clearField(3);
}

class S_MessageBatch extends $pb.GeneratedMessage {
  factory S_MessageBatch({
    $core.Iterable<S_MessageBatch_ConversationBatch>? batches,
  }) {
    final result = create();
    if (batches != null) result.batches.addAll(batches);
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
    ..pPM<S_MessageBatch_ConversationBatch>(1, _omitFieldNames ? '' : 'batches',
        subBuilder: S_MessageBatch_ConversationBatch.create)
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
  $pb.PbList<S_MessageBatch_ConversationBatch> get batches => $_getList(0);
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
    $core.String? userId,
    $core.String? name,
    $core.String? statusMessage,
    $core.String? profileImageUrl,
    $fixnum.Int64? requestedAt,
    $core.bool? isReceived,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (name != null) result.name = name;
    if (statusMessage != null) result.statusMessage = statusMessage;
    if (profileImageUrl != null) result.profileImageUrl = profileImageUrl;
    if (requestedAt != null) result.requestedAt = requestedAt;
    if (isReceived != null) result.isReceived = isReceived;
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
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'statusMessage')
    ..aOS(4, _omitFieldNames ? '' : 'profileImageUrl')
    ..aInt64(5, _omitFieldNames ? '' : 'requestedAt')
    ..aOB(6, _omitFieldNames ? '' : 'isReceived')
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
  $fixnum.Int64 get requestedAt => $_getI64(4);
  @$pb.TagNumber(5)
  set requestedAt($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRequestedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearRequestedAt() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isReceived => $_getBF(5);
  @$pb.TagNumber(6)
  set isReceived($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsReceived() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsReceived() => $_clearField(6);
}

class C_SearchUser extends $pb.GeneratedMessage {
  factory C_SearchUser({
    $core.String? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  C_SearchUser._();

  factory C_SearchUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_SearchUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_SearchUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_SearchUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_SearchUser copyWith(void Function(C_SearchUser) updates) =>
      super.copyWith((message) => updates(message as C_SearchUser))
          as C_SearchUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_SearchUser create() => C_SearchUser._();
  @$core.override
  C_SearchUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_SearchUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_SearchUser>(create);
  static C_SearchUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class S_SearchUser extends $pb.GeneratedMessage {
  factory S_SearchUser({
    $core.bool? success,
    FriendInfo? userInfo,
    $core.bool? isFriend,
    $core.bool? hasSentRequest,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (userInfo != null) result.userInfo = userInfo;
    if (isFriend != null) result.isFriend = isFriend;
    if (hasSentRequest != null) result.hasSentRequest = hasSentRequest;
    return result;
  }

  S_SearchUser._();

  factory S_SearchUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_SearchUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_SearchUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<FriendInfo>(2, _omitFieldNames ? '' : 'userInfo',
        subBuilder: FriendInfo.create)
    ..aOB(3, _omitFieldNames ? '' : 'isFriend')
    ..aOB(4, _omitFieldNames ? '' : 'hasSentRequest')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_SearchUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_SearchUser copyWith(void Function(S_SearchUser) updates) =>
      super.copyWith((message) => updates(message as S_SearchUser))
          as S_SearchUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_SearchUser create() => S_SearchUser._();
  @$core.override
  S_SearchUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_SearchUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_SearchUser>(create);
  static S_SearchUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

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

  @$pb.TagNumber(3)
  $core.bool get isFriend => $_getBF(2);
  @$pb.TagNumber(3)
  set isFriend($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsFriend() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsFriend() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get hasSentRequest => $_getBF(3);
  @$pb.TagNumber(4)
  set hasSentRequest($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHasSentRequest() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasSentRequest() => $_clearField(4);
}

/// --- 친구 관리 액션 (요청, 수락, 거절, 삭제) ---
class C_FriendAction extends $pb.GeneratedMessage {
  factory C_FriendAction({
    C_FriendAction_ActionType? action,
    $core.String? targetUserId,
  }) {
    final result = create();
    if (action != null) result.action = action;
    if (targetUserId != null) result.targetUserId = targetUserId;
    return result;
  }

  C_FriendAction._();

  factory C_FriendAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_FriendAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_FriendAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aE<C_FriendAction_ActionType>(1, _omitFieldNames ? '' : 'action',
        enumValues: C_FriendAction_ActionType.values)
    ..aOS(2, _omitFieldNames ? '' : 'targetUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FriendAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FriendAction copyWith(void Function(C_FriendAction) updates) =>
      super.copyWith((message) => updates(message as C_FriendAction))
          as C_FriendAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_FriendAction create() => C_FriendAction._();
  @$core.override
  C_FriendAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_FriendAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_FriendAction>(create);
  static C_FriendAction? _defaultInstance;

  @$pb.TagNumber(1)
  C_FriendAction_ActionType get action => $_getN(0);
  @$pb.TagNumber(1)
  set action(C_FriendAction_ActionType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get targetUserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set targetUserId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTargetUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetUserId() => $_clearField(2);
}

class S_FriendAction extends $pb.GeneratedMessage {
  factory S_FriendAction({
    $core.bool? success,
    $core.String? message,
    FriendInfo? updatedFriend,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (updatedFriend != null) result.updatedFriend = updatedFriend;
    return result;
  }

  S_FriendAction._();

  factory S_FriendAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_FriendAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_FriendAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<FriendInfo>(3, _omitFieldNames ? '' : 'updatedFriend',
        subBuilder: FriendInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendAction copyWith(void Function(S_FriendAction) updates) =>
      super.copyWith((message) => updates(message as S_FriendAction))
          as S_FriendAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_FriendAction create() => S_FriendAction._();
  @$core.override
  S_FriendAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_FriendAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_FriendAction>(create);
  static S_FriendAction? _defaultInstance;

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
  FriendInfo get updatedFriend => $_getN(2);
  @$pb.TagNumber(3)
  set updatedFriend(FriendInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdatedFriend() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedFriend() => $_clearField(3);
  @$pb.TagNumber(3)
  FriendInfo ensureUpdatedFriend() => $_ensure(2);
}

class C_FetchFriendData extends $pb.GeneratedMessage {
  factory C_FetchFriendData() => create();

  C_FetchFriendData._();

  factory C_FetchFriendData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_FetchFriendData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_FetchFriendData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FetchFriendData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FetchFriendData copyWith(void Function(C_FetchFriendData) updates) =>
      super.copyWith((message) => updates(message as C_FetchFriendData))
          as C_FetchFriendData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_FetchFriendData create() => C_FetchFriendData._();
  @$core.override
  C_FetchFriendData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_FetchFriendData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_FetchFriendData>(create);
  static C_FetchFriendData? _defaultInstance;
}

class S_FetchFriendData extends $pb.GeneratedMessage {
  factory S_FetchFriendData({
    $core.Iterable<FriendInfo>? friends,
    $core.Iterable<FriendRequest>? receivedRequests,
    $core.Iterable<FriendRequest>? sentRequests,
  }) {
    final result = create();
    if (friends != null) result.friends.addAll(friends);
    if (receivedRequests != null)
      result.receivedRequests.addAll(receivedRequests);
    if (sentRequests != null) result.sentRequests.addAll(sentRequests);
    return result;
  }

  S_FetchFriendData._();

  factory S_FetchFriendData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_FetchFriendData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_FetchFriendData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..pPM<FriendInfo>(1, _omitFieldNames ? '' : 'friends',
        subBuilder: FriendInfo.create)
    ..pPM<FriendRequest>(2, _omitFieldNames ? '' : 'receivedRequests',
        subBuilder: FriendRequest.create)
    ..pPM<FriendRequest>(3, _omitFieldNames ? '' : 'sentRequests',
        subBuilder: FriendRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FetchFriendData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FetchFriendData copyWith(void Function(S_FetchFriendData) updates) =>
      super.copyWith((message) => updates(message as S_FetchFriendData))
          as S_FetchFriendData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_FetchFriendData create() => S_FetchFriendData._();
  @$core.override
  S_FetchFriendData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_FetchFriendData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_FetchFriendData>(create);
  static S_FetchFriendData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<FriendInfo> get friends => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<FriendRequest> get receivedRequests => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<FriendRequest> get sentRequests => $_getList(2);
}

/// --- 실시간 푸시 알림 ---
class S_FriendPush extends $pb.GeneratedMessage {
  factory S_FriendPush({
    S_FriendPush_PushType? type,
    FriendInfo? userInfo,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (userInfo != null) result.userInfo = userInfo;
    return result;
  }

  S_FriendPush._();

  factory S_FriendPush.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_FriendPush.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_FriendPush',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aE<S_FriendPush_PushType>(1, _omitFieldNames ? '' : 'type',
        enumValues: S_FriendPush_PushType.values)
    ..aOM<FriendInfo>(2, _omitFieldNames ? '' : 'userInfo',
        subBuilder: FriendInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendPush clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FriendPush copyWith(void Function(S_FriendPush) updates) =>
      super.copyWith((message) => updates(message as S_FriendPush))
          as S_FriendPush;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_FriendPush create() => S_FriendPush._();
  @$core.override
  S_FriendPush createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_FriendPush getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_FriendPush>(create);
  static S_FriendPush? _defaultInstance;

  @$pb.TagNumber(1)
  S_FriendPush_PushType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(S_FriendPush_PushType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

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

class GroupInfo extends $pb.GeneratedMessage {
  factory GroupInfo({
    $core.String? groupId,
    $core.String? groupName,
    $core.String? groupCode,
    $core.String? description,
    $core.String? groupImageUrl,
    $core.int? memberCount,
    $fixnum.Int64? storageCapacityBytes,
    $fixnum.Int64? storageUsageBytes,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    if (groupName != null) result.groupName = groupName;
    if (groupCode != null) result.groupCode = groupCode;
    if (description != null) result.description = description;
    if (groupImageUrl != null) result.groupImageUrl = groupImageUrl;
    if (memberCount != null) result.memberCount = memberCount;
    if (storageCapacityBytes != null)
      result.storageCapacityBytes = storageCapacityBytes;
    if (storageUsageBytes != null) result.storageUsageBytes = storageUsageBytes;
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
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..aOS(5, _omitFieldNames ? '' : 'groupImageUrl')
    ..aI(6, _omitFieldNames ? '' : 'memberCount')
    ..aInt64(7, _omitFieldNames ? '' : 'storageCapacityBytes')
    ..aInt64(8, _omitFieldNames ? '' : 'storageUsageBytes')
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
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get groupImageUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set groupImageUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGroupImageUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearGroupImageUrl() => $_clearField(5);

  /// 멤버 관련
  @$pb.TagNumber(6)
  $core.int get memberCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set memberCount($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMemberCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearMemberCount() => $_clearField(6);

  /// 공유 스토리지 정보
  @$pb.TagNumber(7)
  $fixnum.Int64 get storageCapacityBytes => $_getI64(6);
  @$pb.TagNumber(7)
  set storageCapacityBytes($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStorageCapacityBytes() => $_has(6);
  @$pb.TagNumber(7)
  void clearStorageCapacityBytes() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get storageUsageBytes => $_getI64(7);
  @$pb.TagNumber(8)
  set storageUsageBytes($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasStorageUsageBytes() => $_has(7);
  @$pb.TagNumber(8)
  void clearStorageUsageBytes() => $_clearField(8);
}

class GroupMemberInfo extends $pb.GeneratedMessage {
  factory GroupMemberInfo({
    $core.String? userId,
    $core.String? name,
    $core.String? profileImageUrl,
    $core.String? statusMessage,
    GroupRole? role,
    $fixnum.Int64? joinedAt,
    $fixnum.Int64? lastActiveAt,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (name != null) result.name = name;
    if (profileImageUrl != null) result.profileImageUrl = profileImageUrl;
    if (statusMessage != null) result.statusMessage = statusMessage;
    if (role != null) result.role = role;
    if (joinedAt != null) result.joinedAt = joinedAt;
    if (lastActiveAt != null) result.lastActiveAt = lastActiveAt;
    return result;
  }

  GroupMemberInfo._();

  factory GroupMemberInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupMemberInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupMemberInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'profileImageUrl')
    ..aOS(4, _omitFieldNames ? '' : 'statusMessage')
    ..aE<GroupRole>(5, _omitFieldNames ? '' : 'role',
        enumValues: GroupRole.values)
    ..aInt64(6, _omitFieldNames ? '' : 'joinedAt')
    ..aInt64(7, _omitFieldNames ? '' : 'lastActiveAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupMemberInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupMemberInfo copyWith(void Function(GroupMemberInfo) updates) =>
      super.copyWith((message) => updates(message as GroupMemberInfo))
          as GroupMemberInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupMemberInfo create() => GroupMemberInfo._();
  @$core.override
  GroupMemberInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupMemberInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupMemberInfo>(create);
  static GroupMemberInfo? _defaultInstance;

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
  $core.String get profileImageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set profileImageUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasProfileImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearProfileImageUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get statusMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set statusMessage($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStatusMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatusMessage() => $_clearField(4);

  @$pb.TagNumber(5)
  GroupRole get role => $_getN(4);
  @$pb.TagNumber(5)
  set role(GroupRole value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasRole() => $_has(4);
  @$pb.TagNumber(5)
  void clearRole() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get joinedAt => $_getI64(5);
  @$pb.TagNumber(6)
  set joinedAt($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasJoinedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearJoinedAt() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get lastActiveAt => $_getI64(6);
  @$pb.TagNumber(7)
  set lastActiveAt($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLastActiveAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastActiveAt() => $_clearField(7);
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
    GroupInfo? group,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (group != null) result.group = group;
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
    ..aOM<GroupInfo>(3, _omitFieldNames ? '' : 'group',
        subBuilder: GroupInfo.create)
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
  GroupInfo get group => $_getN(2);
  @$pb.TagNumber(3)
  set group(GroupInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasGroup() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroup() => $_clearField(3);
  @$pb.TagNumber(3)
  GroupInfo ensureGroup() => $_ensure(2);
}

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

class C_GroupInfo extends $pb.GeneratedMessage {
  factory C_GroupInfo({
    $core.String? groupId,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    return result;
  }

  C_GroupInfo._();

  factory C_GroupInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_GroupInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_GroupInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GroupInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GroupInfo copyWith(void Function(C_GroupInfo) updates) =>
      super.copyWith((message) => updates(message as C_GroupInfo))
          as C_GroupInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_GroupInfo create() => C_GroupInfo._();
  @$core.override
  C_GroupInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_GroupInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_GroupInfo>(create);
  static C_GroupInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupId => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => $_clearField(1);
}

class S_GroupInfo extends $pb.GeneratedMessage {
  factory S_GroupInfo({
    GroupInfo? group,
    GroupRole? myRole,
  }) {
    final result = create();
    if (group != null) result.group = group;
    if (myRole != null) result.myRole = myRole;
    return result;
  }

  S_GroupInfo._();

  factory S_GroupInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_GroupInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_GroupInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOM<GroupInfo>(1, _omitFieldNames ? '' : 'group',
        subBuilder: GroupInfo.create)
    ..aE<GroupRole>(2, _omitFieldNames ? '' : 'myRole',
        enumValues: GroupRole.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GroupInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GroupInfo copyWith(void Function(S_GroupInfo) updates) =>
      super.copyWith((message) => updates(message as S_GroupInfo))
          as S_GroupInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_GroupInfo create() => S_GroupInfo._();
  @$core.override
  S_GroupInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_GroupInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_GroupInfo>(create);
  static S_GroupInfo? _defaultInstance;

  @$pb.TagNumber(1)
  GroupInfo get group => $_getN(0);
  @$pb.TagNumber(1)
  set group(GroupInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroup() => $_clearField(1);
  @$pb.TagNumber(1)
  GroupInfo ensureGroup() => $_ensure(0);

  @$pb.TagNumber(2)
  GroupRole get myRole => $_getN(1);
  @$pb.TagNumber(2)
  set myRole(GroupRole value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMyRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearMyRole() => $_clearField(2);
}

class C_InviteFriend extends $pb.GeneratedMessage {
  factory C_InviteFriend({
    $core.String? groupId,
    $core.Iterable<$core.String>? friendUserIds,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    if (friendUserIds != null) result.friendUserIds.addAll(friendUserIds);
    return result;
  }

  C_InviteFriend._();

  factory C_InviteFriend.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_InviteFriend.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_InviteFriend',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupId')
    ..pPS(2, _omitFieldNames ? '' : 'friendUserIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_InviteFriend clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_InviteFriend copyWith(void Function(C_InviteFriend) updates) =>
      super.copyWith((message) => updates(message as C_InviteFriend))
          as C_InviteFriend;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_InviteFriend create() => C_InviteFriend._();
  @$core.override
  C_InviteFriend createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_InviteFriend getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_InviteFriend>(create);
  static C_InviteFriend? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupId => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get friendUserIds => $_getList(1);
}

class S_InviteFriend extends $pb.GeneratedMessage {
  factory S_InviteFriend({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  S_InviteFriend._();

  factory S_InviteFriend.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_InviteFriend.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_InviteFriend',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_InviteFriend clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_InviteFriend copyWith(void Function(S_InviteFriend) updates) =>
      super.copyWith((message) => updates(message as S_InviteFriend))
          as S_InviteFriend;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_InviteFriend create() => S_InviteFriend._();
  @$core.override
  S_InviteFriend createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_InviteFriend getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_InviteFriend>(create);
  static S_InviteFriend? _defaultInstance;

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

class C_JoinGroup extends $pb.GeneratedMessage {
  factory C_JoinGroup({
    $core.String? groupCode,
  }) {
    final result = create();
    if (groupCode != null) result.groupCode = groupCode;
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
    ..aOS(1, _omitFieldNames ? '' : 'groupCode')
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
  $core.String get groupCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupCode() => $_clearField(1);
}

class S_JoinGroup extends $pb.GeneratedMessage {
  factory S_JoinGroup({
    $core.bool? success,
    $core.String? message,
    GroupInfo? group,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (group != null) result.group = group;
    return result;
  }

  S_JoinGroup._();

  factory S_JoinGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_JoinGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_JoinGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<GroupInfo>(3, _omitFieldNames ? '' : 'group',
        subBuilder: GroupInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_JoinGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_JoinGroup copyWith(void Function(S_JoinGroup) updates) =>
      super.copyWith((message) => updates(message as S_JoinGroup))
          as S_JoinGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_JoinGroup create() => S_JoinGroup._();
  @$core.override
  S_JoinGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_JoinGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_JoinGroup>(create);
  static S_JoinGroup? _defaultInstance;

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
  GroupInfo get group => $_getN(2);
  @$pb.TagNumber(3)
  set group(GroupInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasGroup() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroup() => $_clearField(3);
  @$pb.TagNumber(3)
  GroupInfo ensureGroup() => $_ensure(2);
}

class C_GroupMemberList extends $pb.GeneratedMessage {
  factory C_GroupMemberList({
    $core.String? groupId,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    return result;
  }

  C_GroupMemberList._();

  factory C_GroupMemberList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_GroupMemberList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_GroupMemberList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GroupMemberList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GroupMemberList copyWith(void Function(C_GroupMemberList) updates) =>
      super.copyWith((message) => updates(message as C_GroupMemberList))
          as C_GroupMemberList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_GroupMemberList create() => C_GroupMemberList._();
  @$core.override
  C_GroupMemberList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_GroupMemberList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_GroupMemberList>(create);
  static C_GroupMemberList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupId => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => $_clearField(1);
}

class S_GroupMemberList extends $pb.GeneratedMessage {
  factory S_GroupMemberList({
    $core.String? groupId,
    $core.Iterable<GroupMemberInfo>? members,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    if (members != null) result.members.addAll(members);
    return result;
  }

  S_GroupMemberList._();

  factory S_GroupMemberList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_GroupMemberList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_GroupMemberList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupId')
    ..pPM<GroupMemberInfo>(2, _omitFieldNames ? '' : 'members',
        subBuilder: GroupMemberInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GroupMemberList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GroupMemberList copyWith(void Function(S_GroupMemberList) updates) =>
      super.copyWith((message) => updates(message as S_GroupMemberList))
          as S_GroupMemberList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_GroupMemberList create() => S_GroupMemberList._();
  @$core.override
  S_GroupMemberList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_GroupMemberList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_GroupMemberList>(create);
  static S_GroupMemberList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupId => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<GroupMemberInfo> get members => $_getList(1);
}

class C_LeaveGroup extends $pb.GeneratedMessage {
  factory C_LeaveGroup({
    $core.String? groupId,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    return result;
  }

  C_LeaveGroup._();

  factory C_LeaveGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_LeaveGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_LeaveGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_LeaveGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_LeaveGroup copyWith(void Function(C_LeaveGroup) updates) =>
      super.copyWith((message) => updates(message as C_LeaveGroup))
          as C_LeaveGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_LeaveGroup create() => C_LeaveGroup._();
  @$core.override
  C_LeaveGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_LeaveGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_LeaveGroup>(create);
  static C_LeaveGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupId => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => $_clearField(1);
}

class S_LeaveGroup extends $pb.GeneratedMessage {
  factory S_LeaveGroup({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  S_LeaveGroup._();

  factory S_LeaveGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_LeaveGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_LeaveGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_LeaveGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_LeaveGroup copyWith(void Function(S_LeaveGroup) updates) =>
      super.copyWith((message) => updates(message as S_LeaveGroup))
          as S_LeaveGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_LeaveGroup create() => S_LeaveGroup._();
  @$core.override
  S_LeaveGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_LeaveGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_LeaveGroup>(create);
  static S_LeaveGroup? _defaultInstance;

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

class C_EditGroup extends $pb.GeneratedMessage {
  factory C_EditGroup({
    $core.String? groupId,
    $core.String? newName,
    $core.String? newImageUrl,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    if (newName != null) result.newName = newName;
    if (newImageUrl != null) result.newImageUrl = newImageUrl;
    return result;
  }

  C_EditGroup._();

  factory C_EditGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_EditGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_EditGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupId')
    ..aOS(2, _omitFieldNames ? '' : 'newName')
    ..aOS(3, _omitFieldNames ? '' : 'newImageUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_EditGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_EditGroup copyWith(void Function(C_EditGroup) updates) =>
      super.copyWith((message) => updates(message as C_EditGroup))
          as C_EditGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_EditGroup create() => C_EditGroup._();
  @$core.override
  C_EditGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_EditGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_EditGroup>(create);
  static C_EditGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupId => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get newName => $_getSZ(1);
  @$pb.TagNumber(2)
  set newName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNewName() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get newImageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set newImageUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNewImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewImageUrl() => $_clearField(3);
}

class S_EditGroup extends $pb.GeneratedMessage {
  factory S_EditGroup({
    $core.bool? success,
    $core.String? message,
    GroupInfo? group,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (group != null) result.group = group;
    return result;
  }

  S_EditGroup._();

  factory S_EditGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_EditGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_EditGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<GroupInfo>(3, _omitFieldNames ? '' : 'group',
        subBuilder: GroupInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_EditGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_EditGroup copyWith(void Function(S_EditGroup) updates) =>
      super.copyWith((message) => updates(message as S_EditGroup))
          as S_EditGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_EditGroup create() => S_EditGroup._();
  @$core.override
  S_EditGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_EditGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_EditGroup>(create);
  static S_EditGroup? _defaultInstance;

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
  GroupInfo get group => $_getN(2);
  @$pb.TagNumber(3)
  set group(GroupInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasGroup() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroup() => $_clearField(3);
  @$pb.TagNumber(3)
  GroupInfo ensureGroup() => $_ensure(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
