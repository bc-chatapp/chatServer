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

enum Envelope_Payload {
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
  cLogout,
  sLogout,
  cGetMyDevices,
  sGetMyDevices,
  cRemoveDevice,
  sRemoveDevice,
  cFetchMyInfo,
  sFetchMyInfo,
  cEditMyInfo,
  sEditMyInfo,
  cRegisterFcmToken,
  sRegisterFcmToken,
  cChangeEmail,
  sChangeEmail,
  cChangePassword,
  sChangePassword,
  cChat,
  sChat,
  cAck,
  cReqHistory,
  sReqHistory,
  cFetchOffline,
  sMessageBatch,
  cUploadFile,
  sUploadFile,
  cDeleteMessage,
  sDeleteMessage,
  cEditMessage,
  sEditMessage,
  cGetSubscription,
  sGetSubscription,
  cVerifyPurchase,
  sVerifyPurchase,
  cReadReceipt,
  sReadReceipt,
  cCancelSubscription,
  cSearchUser,
  sSearchUser,
  cFriendAction,
  sFriendAction,
  cFetchFriendData,
  sFetchFriendData,
  sFriendPush,
  cBlockUser,
  sBlockUser,
  cUnblockUser,
  sUnblockUser,
  cGetBlockedList,
  sGetBlockedList,
  cReportUser,
  sReportUser,
  cAddReaction,
  cCreatePoll,
  cVote,
  cClosePoll,
  cSetAnnouncement,
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
  cWithdraw,
  sWithdraw,
  cDeleteGroup,
  sDeleteGroup,
  sError,
  cHeartbeat,
  sHeartbeat,
  sCancelSubscription,
  sAddReaction,
  sCreatePoll,
  sVote,
  sClosePoll,
  sSetAnnouncement,
  notSet
}

/// =================================================
/// Envelope
/// =================================================
class Envelope extends $pb.GeneratedMessage {
  factory Envelope({
    $core.int? version,
    $core.int? requestId,
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
    C_Logout? cLogout,
    S_Logout? sLogout,
    C_GetMyDevices? cGetMyDevices,
    S_GetMyDevices? sGetMyDevices,
    C_RemoveDevice? cRemoveDevice,
    S_RemoveDevice? sRemoveDevice,
    C_FetchMyInfo? cFetchMyInfo,
    S_FetchMyInfo? sFetchMyInfo,
    C_EditMyInfo? cEditMyInfo,
    S_EditMyInfo? sEditMyInfo,
    C_RegisterFcmToken? cRegisterFcmToken,
    S_RegisterFcmToken? sRegisterFcmToken,
    C_ChangeEmail? cChangeEmail,
    S_ChangeEmail? sChangeEmail,
    C_ChangePassword? cChangePassword,
    S_ChangePassword? sChangePassword,
    C_Chat? cChat,
    S_Chat? sChat,
    C_Ack? cAck,
    C_ReqHistory? cReqHistory,
    S_ReqHistory? sReqHistory,
    C_FetchOffline? cFetchOffline,
    S_MessageBatch? sMessageBatch,
    C_UploadFile? cUploadFile,
    S_UploadFile? sUploadFile,
    C_DeleteMessage? cDeleteMessage,
    S_DeleteMessage? sDeleteMessage,
    C_EditMessage? cEditMessage,
    S_EditMessage? sEditMessage,
    C_GetSubscription? cGetSubscription,
    S_GetSubscription? sGetSubscription,
    C_VerifyPurchase? cVerifyPurchase,
    S_VerifyPurchase? sVerifyPurchase,
    C_ReadReceipt? cReadReceipt,
    S_ReadReceipt? sReadReceipt,
    C_CancelSubscription? cCancelSubscription,
    C_SearchUser? cSearchUser,
    S_SearchUser? sSearchUser,
    C_FriendAction? cFriendAction,
    S_FriendAction? sFriendAction,
    C_FetchFriendData? cFetchFriendData,
    S_FetchFriendData? sFetchFriendData,
    S_FriendPush? sFriendPush,
    C_BlockUser? cBlockUser,
    S_BlockUser? sBlockUser,
    C_UnblockUser? cUnblockUser,
    S_UnblockUser? sUnblockUser,
    C_GetBlockedList? cGetBlockedList,
    S_GetBlockedList? sGetBlockedList,
    C_ReportUser? cReportUser,
    S_ReportUser? sReportUser,
    C_AddReaction? cAddReaction,
    C_CreatePoll? cCreatePoll,
    C_Vote? cVote,
    C_ClosePoll? cClosePoll,
    C_SetAnnouncement? cSetAnnouncement,
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
    C_Withdraw? cWithdraw,
    S_Withdraw? sWithdraw,
    C_DeleteGroup? cDeleteGroup,
    S_DeleteGroup? sDeleteGroup,
    S_Error? sError,
    C_Heartbeat? cHeartbeat,
    S_Heartbeat? sHeartbeat,
    S_CancelSubscription? sCancelSubscription,
    S_AddReaction? sAddReaction,
    S_CreatePoll? sCreatePoll,
    S_Vote? sVote,
    S_ClosePoll? sClosePoll,
    S_SetAnnouncement? sSetAnnouncement,
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
    if (cLogout != null) result.cLogout = cLogout;
    if (sLogout != null) result.sLogout = sLogout;
    if (cGetMyDevices != null) result.cGetMyDevices = cGetMyDevices;
    if (sGetMyDevices != null) result.sGetMyDevices = sGetMyDevices;
    if (cRemoveDevice != null) result.cRemoveDevice = cRemoveDevice;
    if (sRemoveDevice != null) result.sRemoveDevice = sRemoveDevice;
    if (cFetchMyInfo != null) result.cFetchMyInfo = cFetchMyInfo;
    if (sFetchMyInfo != null) result.sFetchMyInfo = sFetchMyInfo;
    if (cEditMyInfo != null) result.cEditMyInfo = cEditMyInfo;
    if (sEditMyInfo != null) result.sEditMyInfo = sEditMyInfo;
    if (cRegisterFcmToken != null) result.cRegisterFcmToken = cRegisterFcmToken;
    if (sRegisterFcmToken != null) result.sRegisterFcmToken = sRegisterFcmToken;
    if (cChangeEmail != null) result.cChangeEmail = cChangeEmail;
    if (sChangeEmail != null) result.sChangeEmail = sChangeEmail;
    if (cChangePassword != null) result.cChangePassword = cChangePassword;
    if (sChangePassword != null) result.sChangePassword = sChangePassword;
    if (cChat != null) result.cChat = cChat;
    if (sChat != null) result.sChat = sChat;
    if (cAck != null) result.cAck = cAck;
    if (cReqHistory != null) result.cReqHistory = cReqHistory;
    if (sReqHistory != null) result.sReqHistory = sReqHistory;
    if (cFetchOffline != null) result.cFetchOffline = cFetchOffline;
    if (sMessageBatch != null) result.sMessageBatch = sMessageBatch;
    if (cUploadFile != null) result.cUploadFile = cUploadFile;
    if (sUploadFile != null) result.sUploadFile = sUploadFile;
    if (cDeleteMessage != null) result.cDeleteMessage = cDeleteMessage;
    if (sDeleteMessage != null) result.sDeleteMessage = sDeleteMessage;
    if (cEditMessage != null) result.cEditMessage = cEditMessage;
    if (sEditMessage != null) result.sEditMessage = sEditMessage;
    if (cGetSubscription != null) result.cGetSubscription = cGetSubscription;
    if (sGetSubscription != null) result.sGetSubscription = sGetSubscription;
    if (cVerifyPurchase != null) result.cVerifyPurchase = cVerifyPurchase;
    if (sVerifyPurchase != null) result.sVerifyPurchase = sVerifyPurchase;
    if (cReadReceipt != null) result.cReadReceipt = cReadReceipt;
    if (sReadReceipt != null) result.sReadReceipt = sReadReceipt;
    if (cCancelSubscription != null)
      result.cCancelSubscription = cCancelSubscription;
    if (cSearchUser != null) result.cSearchUser = cSearchUser;
    if (sSearchUser != null) result.sSearchUser = sSearchUser;
    if (cFriendAction != null) result.cFriendAction = cFriendAction;
    if (sFriendAction != null) result.sFriendAction = sFriendAction;
    if (cFetchFriendData != null) result.cFetchFriendData = cFetchFriendData;
    if (sFetchFriendData != null) result.sFetchFriendData = sFetchFriendData;
    if (sFriendPush != null) result.sFriendPush = sFriendPush;
    if (cBlockUser != null) result.cBlockUser = cBlockUser;
    if (sBlockUser != null) result.sBlockUser = sBlockUser;
    if (cUnblockUser != null) result.cUnblockUser = cUnblockUser;
    if (sUnblockUser != null) result.sUnblockUser = sUnblockUser;
    if (cGetBlockedList != null) result.cGetBlockedList = cGetBlockedList;
    if (sGetBlockedList != null) result.sGetBlockedList = sGetBlockedList;
    if (cReportUser != null) result.cReportUser = cReportUser;
    if (sReportUser != null) result.sReportUser = sReportUser;
    if (cAddReaction != null) result.cAddReaction = cAddReaction;
    if (cCreatePoll != null) result.cCreatePoll = cCreatePoll;
    if (cVote != null) result.cVote = cVote;
    if (cClosePoll != null) result.cClosePoll = cClosePoll;
    if (cSetAnnouncement != null) result.cSetAnnouncement = cSetAnnouncement;
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
    if (cWithdraw != null) result.cWithdraw = cWithdraw;
    if (sWithdraw != null) result.sWithdraw = sWithdraw;
    if (cDeleteGroup != null) result.cDeleteGroup = cDeleteGroup;
    if (sDeleteGroup != null) result.sDeleteGroup = sDeleteGroup;
    if (sError != null) result.sError = sError;
    if (cHeartbeat != null) result.cHeartbeat = cHeartbeat;
    if (sHeartbeat != null) result.sHeartbeat = sHeartbeat;
    if (sCancelSubscription != null)
      result.sCancelSubscription = sCancelSubscription;
    if (sAddReaction != null) result.sAddReaction = sAddReaction;
    if (sCreatePoll != null) result.sCreatePoll = sCreatePoll;
    if (sVote != null) result.sVote = sVote;
    if (sClosePoll != null) result.sClosePoll = sClosePoll;
    if (sSetAnnouncement != null) result.sSetAnnouncement = sSetAnnouncement;
    return result;
  }

  Envelope._();

  factory Envelope.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Envelope.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Envelope_Payload> _Envelope_PayloadByTag = {
    10: Envelope_Payload.cCheckId,
    11: Envelope_Payload.sCheckId,
    12: Envelope_Payload.cCheckEmail,
    13: Envelope_Payload.sCheckEmail,
    14: Envelope_Payload.cReqEmailVerify,
    15: Envelope_Payload.sReqEmailVerify,
    16: Envelope_Payload.cConfirmEmailVerify,
    17: Envelope_Payload.sConfirmEmailVerify,
    18: Envelope_Payload.cSignup,
    19: Envelope_Payload.sSignup,
    20: Envelope_Payload.cLogin,
    21: Envelope_Payload.sLogin,
    22: Envelope_Payload.cLogout,
    23: Envelope_Payload.sLogout,
    24: Envelope_Payload.cGetMyDevices,
    25: Envelope_Payload.sGetMyDevices,
    26: Envelope_Payload.cRemoveDevice,
    27: Envelope_Payload.sRemoveDevice,
    30: Envelope_Payload.cFetchMyInfo,
    31: Envelope_Payload.sFetchMyInfo,
    32: Envelope_Payload.cEditMyInfo,
    33: Envelope_Payload.sEditMyInfo,
    34: Envelope_Payload.cRegisterFcmToken,
    35: Envelope_Payload.sRegisterFcmToken,
    36: Envelope_Payload.cChangeEmail,
    37: Envelope_Payload.sChangeEmail,
    38: Envelope_Payload.cChangePassword,
    39: Envelope_Payload.sChangePassword,
    40: Envelope_Payload.cChat,
    41: Envelope_Payload.sChat,
    42: Envelope_Payload.cAck,
    43: Envelope_Payload.cReqHistory,
    44: Envelope_Payload.sReqHistory,
    45: Envelope_Payload.cFetchOffline,
    46: Envelope_Payload.sMessageBatch,
    47: Envelope_Payload.cUploadFile,
    48: Envelope_Payload.sUploadFile,
    49: Envelope_Payload.cDeleteMessage,
    50: Envelope_Payload.sDeleteMessage,
    51: Envelope_Payload.cEditMessage,
    52: Envelope_Payload.sEditMessage,
    53: Envelope_Payload.cGetSubscription,
    54: Envelope_Payload.sGetSubscription,
    55: Envelope_Payload.cVerifyPurchase,
    56: Envelope_Payload.sVerifyPurchase,
    57: Envelope_Payload.cReadReceipt,
    58: Envelope_Payload.sReadReceipt,
    59: Envelope_Payload.cCancelSubscription,
    60: Envelope_Payload.cSearchUser,
    61: Envelope_Payload.sSearchUser,
    62: Envelope_Payload.cFriendAction,
    63: Envelope_Payload.sFriendAction,
    64: Envelope_Payload.cFetchFriendData,
    65: Envelope_Payload.sFetchFriendData,
    66: Envelope_Payload.sFriendPush,
    67: Envelope_Payload.cBlockUser,
    68: Envelope_Payload.sBlockUser,
    69: Envelope_Payload.cUnblockUser,
    70: Envelope_Payload.sUnblockUser,
    71: Envelope_Payload.cGetBlockedList,
    72: Envelope_Payload.sGetBlockedList,
    73: Envelope_Payload.cReportUser,
    74: Envelope_Payload.sReportUser,
    75: Envelope_Payload.cAddReaction,
    76: Envelope_Payload.cCreatePoll,
    77: Envelope_Payload.cVote,
    78: Envelope_Payload.cClosePoll,
    79: Envelope_Payload.cSetAnnouncement,
    80: Envelope_Payload.cCreateGroup,
    81: Envelope_Payload.sCreateGroup,
    82: Envelope_Payload.cGroupList,
    83: Envelope_Payload.sGroupList,
    84: Envelope_Payload.cJoinGroup,
    85: Envelope_Payload.sJoinGroup,
    86: Envelope_Payload.cInviteFriend,
    87: Envelope_Payload.sInviteFriend,
    88: Envelope_Payload.cLeaveGroup,
    89: Envelope_Payload.sLeaveGroup,
    90: Envelope_Payload.cGroupMemberList,
    91: Envelope_Payload.sGroupMemberList,
    92: Envelope_Payload.cGroupInfo,
    93: Envelope_Payload.sGroupInfo,
    94: Envelope_Payload.cEditGroup,
    95: Envelope_Payload.sEditGroup,
    96: Envelope_Payload.cWithdraw,
    97: Envelope_Payload.sWithdraw,
    98: Envelope_Payload.cDeleteGroup,
    99: Envelope_Payload.sDeleteGroup,
    100: Envelope_Payload.sError,
    101: Envelope_Payload.cHeartbeat,
    102: Envelope_Payload.sHeartbeat,
    103: Envelope_Payload.sCancelSubscription,
    104: Envelope_Payload.sAddReaction,
    105: Envelope_Payload.sCreatePoll,
    106: Envelope_Payload.sVote,
    107: Envelope_Payload.sClosePoll,
    108: Envelope_Payload.sSetAnnouncement,
    0: Envelope_Payload.notSet
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
      24,
      25,
      26,
      27,
      30,
      31,
      32,
      33,
      34,
      35,
      36,
      37,
      38,
      39,
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
      62,
      63,
      64,
      65,
      66,
      67,
      68,
      69,
      70,
      71,
      72,
      73,
      74,
      75,
      76,
      77,
      78,
      79,
      80,
      81,
      82,
      83,
      84,
      85,
      86,
      87,
      88,
      89,
      90,
      91,
      92,
      93,
      94,
      95,
      96,
      97,
      98,
      99,
      100,
      101,
      102,
      103,
      104,
      105,
      106,
      107,
      108
    ])
    ..aI(1, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'requestId', fieldType: $pb.PbFieldType.OU3)
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
    ..aOM<C_Logout>(22, _omitFieldNames ? '' : 'cLogout',
        subBuilder: C_Logout.create)
    ..aOM<S_Logout>(23, _omitFieldNames ? '' : 'sLogout',
        subBuilder: S_Logout.create)
    ..aOM<C_GetMyDevices>(24, _omitFieldNames ? '' : 'cGetMyDevices',
        subBuilder: C_GetMyDevices.create)
    ..aOM<S_GetMyDevices>(25, _omitFieldNames ? '' : 'sGetMyDevices',
        subBuilder: S_GetMyDevices.create)
    ..aOM<C_RemoveDevice>(26, _omitFieldNames ? '' : 'cRemoveDevice',
        subBuilder: C_RemoveDevice.create)
    ..aOM<S_RemoveDevice>(27, _omitFieldNames ? '' : 'sRemoveDevice',
        subBuilder: S_RemoveDevice.create)
    ..aOM<C_FetchMyInfo>(30, _omitFieldNames ? '' : 'cFetchMyInfo',
        subBuilder: C_FetchMyInfo.create)
    ..aOM<S_FetchMyInfo>(31, _omitFieldNames ? '' : 'sFetchMyInfo',
        subBuilder: S_FetchMyInfo.create)
    ..aOM<C_EditMyInfo>(32, _omitFieldNames ? '' : 'cEditMyInfo',
        subBuilder: C_EditMyInfo.create)
    ..aOM<S_EditMyInfo>(33, _omitFieldNames ? '' : 'sEditMyInfo',
        subBuilder: S_EditMyInfo.create)
    ..aOM<C_RegisterFcmToken>(34, _omitFieldNames ? '' : 'cRegisterFcmToken',
        subBuilder: C_RegisterFcmToken.create)
    ..aOM<S_RegisterFcmToken>(35, _omitFieldNames ? '' : 'sRegisterFcmToken',
        subBuilder: S_RegisterFcmToken.create)
    ..aOM<C_ChangeEmail>(36, _omitFieldNames ? '' : 'cChangeEmail',
        subBuilder: C_ChangeEmail.create)
    ..aOM<S_ChangeEmail>(37, _omitFieldNames ? '' : 'sChangeEmail',
        subBuilder: S_ChangeEmail.create)
    ..aOM<C_ChangePassword>(38, _omitFieldNames ? '' : 'cChangePassword',
        subBuilder: C_ChangePassword.create)
    ..aOM<S_ChangePassword>(39, _omitFieldNames ? '' : 'sChangePassword',
        subBuilder: S_ChangePassword.create)
    ..aOM<C_Chat>(40, _omitFieldNames ? '' : 'cChat', subBuilder: C_Chat.create)
    ..aOM<S_Chat>(41, _omitFieldNames ? '' : 'sChat', subBuilder: S_Chat.create)
    ..aOM<C_Ack>(42, _omitFieldNames ? '' : 'cAck', subBuilder: C_Ack.create)
    ..aOM<C_ReqHistory>(43, _omitFieldNames ? '' : 'cReqHistory',
        subBuilder: C_ReqHistory.create)
    ..aOM<S_ReqHistory>(44, _omitFieldNames ? '' : 'sReqHistory',
        subBuilder: S_ReqHistory.create)
    ..aOM<C_FetchOffline>(45, _omitFieldNames ? '' : 'cFetchOffline',
        subBuilder: C_FetchOffline.create)
    ..aOM<S_MessageBatch>(46, _omitFieldNames ? '' : 'sMessageBatch',
        subBuilder: S_MessageBatch.create)
    ..aOM<C_UploadFile>(47, _omitFieldNames ? '' : 'cUploadFile',
        subBuilder: C_UploadFile.create)
    ..aOM<S_UploadFile>(48, _omitFieldNames ? '' : 'sUploadFile',
        subBuilder: S_UploadFile.create)
    ..aOM<C_DeleteMessage>(49, _omitFieldNames ? '' : 'cDeleteMessage',
        subBuilder: C_DeleteMessage.create)
    ..aOM<S_DeleteMessage>(50, _omitFieldNames ? '' : 'sDeleteMessage',
        subBuilder: S_DeleteMessage.create)
    ..aOM<C_EditMessage>(51, _omitFieldNames ? '' : 'cEditMessage',
        subBuilder: C_EditMessage.create)
    ..aOM<S_EditMessage>(52, _omitFieldNames ? '' : 'sEditMessage',
        subBuilder: S_EditMessage.create)
    ..aOM<C_GetSubscription>(53, _omitFieldNames ? '' : 'cGetSubscription',
        subBuilder: C_GetSubscription.create)
    ..aOM<S_GetSubscription>(54, _omitFieldNames ? '' : 'sGetSubscription',
        subBuilder: S_GetSubscription.create)
    ..aOM<C_VerifyPurchase>(55, _omitFieldNames ? '' : 'cVerifyPurchase',
        subBuilder: C_VerifyPurchase.create)
    ..aOM<S_VerifyPurchase>(56, _omitFieldNames ? '' : 'sVerifyPurchase',
        subBuilder: S_VerifyPurchase.create)
    ..aOM<C_ReadReceipt>(57, _omitFieldNames ? '' : 'cReadReceipt',
        subBuilder: C_ReadReceipt.create)
    ..aOM<S_ReadReceipt>(58, _omitFieldNames ? '' : 'sReadReceipt',
        subBuilder: S_ReadReceipt.create)
    ..aOM<C_CancelSubscription>(
        59, _omitFieldNames ? '' : 'cCancelSubscription',
        subBuilder: C_CancelSubscription.create)
    ..aOM<C_SearchUser>(60, _omitFieldNames ? '' : 'cSearchUser',
        subBuilder: C_SearchUser.create)
    ..aOM<S_SearchUser>(61, _omitFieldNames ? '' : 'sSearchUser',
        subBuilder: S_SearchUser.create)
    ..aOM<C_FriendAction>(62, _omitFieldNames ? '' : 'cFriendAction',
        subBuilder: C_FriendAction.create)
    ..aOM<S_FriendAction>(63, _omitFieldNames ? '' : 'sFriendAction',
        subBuilder: S_FriendAction.create)
    ..aOM<C_FetchFriendData>(64, _omitFieldNames ? '' : 'cFetchFriendData',
        subBuilder: C_FetchFriendData.create)
    ..aOM<S_FetchFriendData>(65, _omitFieldNames ? '' : 'sFetchFriendData',
        subBuilder: S_FetchFriendData.create)
    ..aOM<S_FriendPush>(66, _omitFieldNames ? '' : 'sFriendPush',
        subBuilder: S_FriendPush.create)
    ..aOM<C_BlockUser>(67, _omitFieldNames ? '' : 'cBlockUser',
        subBuilder: C_BlockUser.create)
    ..aOM<S_BlockUser>(68, _omitFieldNames ? '' : 'sBlockUser',
        subBuilder: S_BlockUser.create)
    ..aOM<C_UnblockUser>(69, _omitFieldNames ? '' : 'cUnblockUser',
        subBuilder: C_UnblockUser.create)
    ..aOM<S_UnblockUser>(70, _omitFieldNames ? '' : 'sUnblockUser',
        subBuilder: S_UnblockUser.create)
    ..aOM<C_GetBlockedList>(71, _omitFieldNames ? '' : 'cGetBlockedList',
        subBuilder: C_GetBlockedList.create)
    ..aOM<S_GetBlockedList>(72, _omitFieldNames ? '' : 'sGetBlockedList',
        subBuilder: S_GetBlockedList.create)
    ..aOM<C_ReportUser>(73, _omitFieldNames ? '' : 'cReportUser',
        subBuilder: C_ReportUser.create)
    ..aOM<S_ReportUser>(74, _omitFieldNames ? '' : 'sReportUser',
        subBuilder: S_ReportUser.create)
    ..aOM<C_AddReaction>(75, _omitFieldNames ? '' : 'cAddReaction',
        subBuilder: C_AddReaction.create)
    ..aOM<C_CreatePoll>(76, _omitFieldNames ? '' : 'cCreatePoll',
        subBuilder: C_CreatePoll.create)
    ..aOM<C_Vote>(77, _omitFieldNames ? '' : 'cVote', subBuilder: C_Vote.create)
    ..aOM<C_ClosePoll>(78, _omitFieldNames ? '' : 'cClosePoll',
        subBuilder: C_ClosePoll.create)
    ..aOM<C_SetAnnouncement>(79, _omitFieldNames ? '' : 'cSetAnnouncement',
        subBuilder: C_SetAnnouncement.create)
    ..aOM<C_CreateGroup>(80, _omitFieldNames ? '' : 'cCreateGroup',
        subBuilder: C_CreateGroup.create)
    ..aOM<S_CreateGroup>(81, _omitFieldNames ? '' : 'sCreateGroup',
        subBuilder: S_CreateGroup.create)
    ..aOM<C_GroupList>(82, _omitFieldNames ? '' : 'cGroupList',
        subBuilder: C_GroupList.create)
    ..aOM<S_GroupList>(83, _omitFieldNames ? '' : 'sGroupList',
        subBuilder: S_GroupList.create)
    ..aOM<C_JoinGroup>(84, _omitFieldNames ? '' : 'cJoinGroup',
        subBuilder: C_JoinGroup.create)
    ..aOM<S_JoinGroup>(85, _omitFieldNames ? '' : 'sJoinGroup',
        subBuilder: S_JoinGroup.create)
    ..aOM<C_InviteFriend>(86, _omitFieldNames ? '' : 'cInviteFriend',
        subBuilder: C_InviteFriend.create)
    ..aOM<S_InviteFriend>(87, _omitFieldNames ? '' : 'sInviteFriend',
        subBuilder: S_InviteFriend.create)
    ..aOM<C_LeaveGroup>(88, _omitFieldNames ? '' : 'cLeaveGroup',
        subBuilder: C_LeaveGroup.create)
    ..aOM<S_LeaveGroup>(89, _omitFieldNames ? '' : 'sLeaveGroup',
        subBuilder: S_LeaveGroup.create)
    ..aOM<C_GroupMemberList>(90, _omitFieldNames ? '' : 'cGroupMemberList',
        subBuilder: C_GroupMemberList.create)
    ..aOM<S_GroupMemberList>(91, _omitFieldNames ? '' : 'sGroupMemberList',
        subBuilder: S_GroupMemberList.create)
    ..aOM<C_GroupInfo>(92, _omitFieldNames ? '' : 'cGroupInfo',
        subBuilder: C_GroupInfo.create)
    ..aOM<S_GroupInfo>(93, _omitFieldNames ? '' : 'sGroupInfo',
        subBuilder: S_GroupInfo.create)
    ..aOM<C_EditGroup>(94, _omitFieldNames ? '' : 'cEditGroup',
        subBuilder: C_EditGroup.create)
    ..aOM<S_EditGroup>(95, _omitFieldNames ? '' : 'sEditGroup',
        subBuilder: S_EditGroup.create)
    ..aOM<C_Withdraw>(96, _omitFieldNames ? '' : 'cWithdraw',
        subBuilder: C_Withdraw.create)
    ..aOM<S_Withdraw>(97, _omitFieldNames ? '' : 'sWithdraw',
        subBuilder: S_Withdraw.create)
    ..aOM<C_DeleteGroup>(98, _omitFieldNames ? '' : 'cDeleteGroup',
        subBuilder: C_DeleteGroup.create)
    ..aOM<S_DeleteGroup>(99, _omitFieldNames ? '' : 'sDeleteGroup',
        subBuilder: S_DeleteGroup.create)
    ..aOM<S_Error>(100, _omitFieldNames ? '' : 'sError',
        subBuilder: S_Error.create)
    ..aOM<C_Heartbeat>(101, _omitFieldNames ? '' : 'cHeartbeat',
        subBuilder: C_Heartbeat.create)
    ..aOM<S_Heartbeat>(102, _omitFieldNames ? '' : 'sHeartbeat',
        subBuilder: S_Heartbeat.create)
    ..aOM<S_CancelSubscription>(
        103, _omitFieldNames ? '' : 'sCancelSubscription',
        subBuilder: S_CancelSubscription.create)
    ..aOM<S_AddReaction>(104, _omitFieldNames ? '' : 'sAddReaction',
        subBuilder: S_AddReaction.create)
    ..aOM<S_CreatePoll>(105, _omitFieldNames ? '' : 'sCreatePoll',
        subBuilder: S_CreatePoll.create)
    ..aOM<S_Vote>(106, _omitFieldNames ? '' : 'sVote',
        subBuilder: S_Vote.create)
    ..aOM<S_ClosePoll>(107, _omitFieldNames ? '' : 'sClosePoll',
        subBuilder: S_ClosePoll.create)
    ..aOM<S_SetAnnouncement>(108, _omitFieldNames ? '' : 'sSetAnnouncement',
        subBuilder: S_SetAnnouncement.create)
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
  @$pb.TagNumber(24)
  @$pb.TagNumber(25)
  @$pb.TagNumber(26)
  @$pb.TagNumber(27)
  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  @$pb.TagNumber(32)
  @$pb.TagNumber(33)
  @$pb.TagNumber(34)
  @$pb.TagNumber(35)
  @$pb.TagNumber(36)
  @$pb.TagNumber(37)
  @$pb.TagNumber(38)
  @$pb.TagNumber(39)
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
  @$pb.TagNumber(63)
  @$pb.TagNumber(64)
  @$pb.TagNumber(65)
  @$pb.TagNumber(66)
  @$pb.TagNumber(67)
  @$pb.TagNumber(68)
  @$pb.TagNumber(69)
  @$pb.TagNumber(70)
  @$pb.TagNumber(71)
  @$pb.TagNumber(72)
  @$pb.TagNumber(73)
  @$pb.TagNumber(74)
  @$pb.TagNumber(75)
  @$pb.TagNumber(76)
  @$pb.TagNumber(77)
  @$pb.TagNumber(78)
  @$pb.TagNumber(79)
  @$pb.TagNumber(80)
  @$pb.TagNumber(81)
  @$pb.TagNumber(82)
  @$pb.TagNumber(83)
  @$pb.TagNumber(84)
  @$pb.TagNumber(85)
  @$pb.TagNumber(86)
  @$pb.TagNumber(87)
  @$pb.TagNumber(88)
  @$pb.TagNumber(89)
  @$pb.TagNumber(90)
  @$pb.TagNumber(91)
  @$pb.TagNumber(92)
  @$pb.TagNumber(93)
  @$pb.TagNumber(94)
  @$pb.TagNumber(95)
  @$pb.TagNumber(96)
  @$pb.TagNumber(97)
  @$pb.TagNumber(98)
  @$pb.TagNumber(99)
  @$pb.TagNumber(100)
  @$pb.TagNumber(101)
  @$pb.TagNumber(102)
  @$pb.TagNumber(103)
  @$pb.TagNumber(104)
  @$pb.TagNumber(105)
  @$pb.TagNumber(106)
  @$pb.TagNumber(107)
  @$pb.TagNumber(108)
  Envelope_Payload whichPayload() => _Envelope_PayloadByTag[$_whichOneof(0)]!;
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
  @$pb.TagNumber(24)
  @$pb.TagNumber(25)
  @$pb.TagNumber(26)
  @$pb.TagNumber(27)
  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  @$pb.TagNumber(32)
  @$pb.TagNumber(33)
  @$pb.TagNumber(34)
  @$pb.TagNumber(35)
  @$pb.TagNumber(36)
  @$pb.TagNumber(37)
  @$pb.TagNumber(38)
  @$pb.TagNumber(39)
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
  @$pb.TagNumber(63)
  @$pb.TagNumber(64)
  @$pb.TagNumber(65)
  @$pb.TagNumber(66)
  @$pb.TagNumber(67)
  @$pb.TagNumber(68)
  @$pb.TagNumber(69)
  @$pb.TagNumber(70)
  @$pb.TagNumber(71)
  @$pb.TagNumber(72)
  @$pb.TagNumber(73)
  @$pb.TagNumber(74)
  @$pb.TagNumber(75)
  @$pb.TagNumber(76)
  @$pb.TagNumber(77)
  @$pb.TagNumber(78)
  @$pb.TagNumber(79)
  @$pb.TagNumber(80)
  @$pb.TagNumber(81)
  @$pb.TagNumber(82)
  @$pb.TagNumber(83)
  @$pb.TagNumber(84)
  @$pb.TagNumber(85)
  @$pb.TagNumber(86)
  @$pb.TagNumber(87)
  @$pb.TagNumber(88)
  @$pb.TagNumber(89)
  @$pb.TagNumber(90)
  @$pb.TagNumber(91)
  @$pb.TagNumber(92)
  @$pb.TagNumber(93)
  @$pb.TagNumber(94)
  @$pb.TagNumber(95)
  @$pb.TagNumber(96)
  @$pb.TagNumber(97)
  @$pb.TagNumber(98)
  @$pb.TagNumber(99)
  @$pb.TagNumber(100)
  @$pb.TagNumber(101)
  @$pb.TagNumber(102)
  @$pb.TagNumber(103)
  @$pb.TagNumber(104)
  @$pb.TagNumber(105)
  @$pb.TagNumber(106)
  @$pb.TagNumber(107)
  @$pb.TagNumber(108)
  void clearPayload() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get requestId => $_getIZ(1);
  @$pb.TagNumber(2)
  set requestId($core.int value) => $_setUnsignedInt32(1, value);
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

  /// AUTH / LOGIN (10 ~ 29)
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
  C_Logout get cLogout => $_getN(15);
  @$pb.TagNumber(22)
  set cLogout(C_Logout value) => $_setField(22, value);
  @$pb.TagNumber(22)
  $core.bool hasCLogout() => $_has(15);
  @$pb.TagNumber(22)
  void clearCLogout() => $_clearField(22);
  @$pb.TagNumber(22)
  C_Logout ensureCLogout() => $_ensure(15);

  @$pb.TagNumber(23)
  S_Logout get sLogout => $_getN(16);
  @$pb.TagNumber(23)
  set sLogout(S_Logout value) => $_setField(23, value);
  @$pb.TagNumber(23)
  $core.bool hasSLogout() => $_has(16);
  @$pb.TagNumber(23)
  void clearSLogout() => $_clearField(23);
  @$pb.TagNumber(23)
  S_Logout ensureSLogout() => $_ensure(16);

  @$pb.TagNumber(24)
  C_GetMyDevices get cGetMyDevices => $_getN(17);
  @$pb.TagNumber(24)
  set cGetMyDevices(C_GetMyDevices value) => $_setField(24, value);
  @$pb.TagNumber(24)
  $core.bool hasCGetMyDevices() => $_has(17);
  @$pb.TagNumber(24)
  void clearCGetMyDevices() => $_clearField(24);
  @$pb.TagNumber(24)
  C_GetMyDevices ensureCGetMyDevices() => $_ensure(17);

  @$pb.TagNumber(25)
  S_GetMyDevices get sGetMyDevices => $_getN(18);
  @$pb.TagNumber(25)
  set sGetMyDevices(S_GetMyDevices value) => $_setField(25, value);
  @$pb.TagNumber(25)
  $core.bool hasSGetMyDevices() => $_has(18);
  @$pb.TagNumber(25)
  void clearSGetMyDevices() => $_clearField(25);
  @$pb.TagNumber(25)
  S_GetMyDevices ensureSGetMyDevices() => $_ensure(18);

  @$pb.TagNumber(26)
  C_RemoveDevice get cRemoveDevice => $_getN(19);
  @$pb.TagNumber(26)
  set cRemoveDevice(C_RemoveDevice value) => $_setField(26, value);
  @$pb.TagNumber(26)
  $core.bool hasCRemoveDevice() => $_has(19);
  @$pb.TagNumber(26)
  void clearCRemoveDevice() => $_clearField(26);
  @$pb.TagNumber(26)
  C_RemoveDevice ensureCRemoveDevice() => $_ensure(19);

  @$pb.TagNumber(27)
  S_RemoveDevice get sRemoveDevice => $_getN(20);
  @$pb.TagNumber(27)
  set sRemoveDevice(S_RemoveDevice value) => $_setField(27, value);
  @$pb.TagNumber(27)
  $core.bool hasSRemoveDevice() => $_has(20);
  @$pb.TagNumber(27)
  void clearSRemoveDevice() => $_clearField(27);
  @$pb.TagNumber(27)
  S_RemoveDevice ensureSRemoveDevice() => $_ensure(20);

  /// MY INFO / SETTINGS (30 ~ 39)
  @$pb.TagNumber(30)
  C_FetchMyInfo get cFetchMyInfo => $_getN(21);
  @$pb.TagNumber(30)
  set cFetchMyInfo(C_FetchMyInfo value) => $_setField(30, value);
  @$pb.TagNumber(30)
  $core.bool hasCFetchMyInfo() => $_has(21);
  @$pb.TagNumber(30)
  void clearCFetchMyInfo() => $_clearField(30);
  @$pb.TagNumber(30)
  C_FetchMyInfo ensureCFetchMyInfo() => $_ensure(21);

  @$pb.TagNumber(31)
  S_FetchMyInfo get sFetchMyInfo => $_getN(22);
  @$pb.TagNumber(31)
  set sFetchMyInfo(S_FetchMyInfo value) => $_setField(31, value);
  @$pb.TagNumber(31)
  $core.bool hasSFetchMyInfo() => $_has(22);
  @$pb.TagNumber(31)
  void clearSFetchMyInfo() => $_clearField(31);
  @$pb.TagNumber(31)
  S_FetchMyInfo ensureSFetchMyInfo() => $_ensure(22);

  @$pb.TagNumber(32)
  C_EditMyInfo get cEditMyInfo => $_getN(23);
  @$pb.TagNumber(32)
  set cEditMyInfo(C_EditMyInfo value) => $_setField(32, value);
  @$pb.TagNumber(32)
  $core.bool hasCEditMyInfo() => $_has(23);
  @$pb.TagNumber(32)
  void clearCEditMyInfo() => $_clearField(32);
  @$pb.TagNumber(32)
  C_EditMyInfo ensureCEditMyInfo() => $_ensure(23);

  @$pb.TagNumber(33)
  S_EditMyInfo get sEditMyInfo => $_getN(24);
  @$pb.TagNumber(33)
  set sEditMyInfo(S_EditMyInfo value) => $_setField(33, value);
  @$pb.TagNumber(33)
  $core.bool hasSEditMyInfo() => $_has(24);
  @$pb.TagNumber(33)
  void clearSEditMyInfo() => $_clearField(33);
  @$pb.TagNumber(33)
  S_EditMyInfo ensureSEditMyInfo() => $_ensure(24);

  @$pb.TagNumber(34)
  C_RegisterFcmToken get cRegisterFcmToken => $_getN(25);
  @$pb.TagNumber(34)
  set cRegisterFcmToken(C_RegisterFcmToken value) => $_setField(34, value);
  @$pb.TagNumber(34)
  $core.bool hasCRegisterFcmToken() => $_has(25);
  @$pb.TagNumber(34)
  void clearCRegisterFcmToken() => $_clearField(34);
  @$pb.TagNumber(34)
  C_RegisterFcmToken ensureCRegisterFcmToken() => $_ensure(25);

  @$pb.TagNumber(35)
  S_RegisterFcmToken get sRegisterFcmToken => $_getN(26);
  @$pb.TagNumber(35)
  set sRegisterFcmToken(S_RegisterFcmToken value) => $_setField(35, value);
  @$pb.TagNumber(35)
  $core.bool hasSRegisterFcmToken() => $_has(26);
  @$pb.TagNumber(35)
  void clearSRegisterFcmToken() => $_clearField(35);
  @$pb.TagNumber(35)
  S_RegisterFcmToken ensureSRegisterFcmToken() => $_ensure(26);

  @$pb.TagNumber(36)
  C_ChangeEmail get cChangeEmail => $_getN(27);
  @$pb.TagNumber(36)
  set cChangeEmail(C_ChangeEmail value) => $_setField(36, value);
  @$pb.TagNumber(36)
  $core.bool hasCChangeEmail() => $_has(27);
  @$pb.TagNumber(36)
  void clearCChangeEmail() => $_clearField(36);
  @$pb.TagNumber(36)
  C_ChangeEmail ensureCChangeEmail() => $_ensure(27);

  @$pb.TagNumber(37)
  S_ChangeEmail get sChangeEmail => $_getN(28);
  @$pb.TagNumber(37)
  set sChangeEmail(S_ChangeEmail value) => $_setField(37, value);
  @$pb.TagNumber(37)
  $core.bool hasSChangeEmail() => $_has(28);
  @$pb.TagNumber(37)
  void clearSChangeEmail() => $_clearField(37);
  @$pb.TagNumber(37)
  S_ChangeEmail ensureSChangeEmail() => $_ensure(28);

  @$pb.TagNumber(38)
  C_ChangePassword get cChangePassword => $_getN(29);
  @$pb.TagNumber(38)
  set cChangePassword(C_ChangePassword value) => $_setField(38, value);
  @$pb.TagNumber(38)
  $core.bool hasCChangePassword() => $_has(29);
  @$pb.TagNumber(38)
  void clearCChangePassword() => $_clearField(38);
  @$pb.TagNumber(38)
  C_ChangePassword ensureCChangePassword() => $_ensure(29);

  @$pb.TagNumber(39)
  S_ChangePassword get sChangePassword => $_getN(30);
  @$pb.TagNumber(39)
  set sChangePassword(S_ChangePassword value) => $_setField(39, value);
  @$pb.TagNumber(39)
  $core.bool hasSChangePassword() => $_has(30);
  @$pb.TagNumber(39)
  void clearSChangePassword() => $_clearField(39);
  @$pb.TagNumber(39)
  S_ChangePassword ensureSChangePassword() => $_ensure(30);

  /// CHAT / DATA / FILE (40 ~ 59)
  @$pb.TagNumber(40)
  C_Chat get cChat => $_getN(31);
  @$pb.TagNumber(40)
  set cChat(C_Chat value) => $_setField(40, value);
  @$pb.TagNumber(40)
  $core.bool hasCChat() => $_has(31);
  @$pb.TagNumber(40)
  void clearCChat() => $_clearField(40);
  @$pb.TagNumber(40)
  C_Chat ensureCChat() => $_ensure(31);

  @$pb.TagNumber(41)
  S_Chat get sChat => $_getN(32);
  @$pb.TagNumber(41)
  set sChat(S_Chat value) => $_setField(41, value);
  @$pb.TagNumber(41)
  $core.bool hasSChat() => $_has(32);
  @$pb.TagNumber(41)
  void clearSChat() => $_clearField(41);
  @$pb.TagNumber(41)
  S_Chat ensureSChat() => $_ensure(32);

  @$pb.TagNumber(42)
  C_Ack get cAck => $_getN(33);
  @$pb.TagNumber(42)
  set cAck(C_Ack value) => $_setField(42, value);
  @$pb.TagNumber(42)
  $core.bool hasCAck() => $_has(33);
  @$pb.TagNumber(42)
  void clearCAck() => $_clearField(42);
  @$pb.TagNumber(42)
  C_Ack ensureCAck() => $_ensure(33);

  @$pb.TagNumber(43)
  C_ReqHistory get cReqHistory => $_getN(34);
  @$pb.TagNumber(43)
  set cReqHistory(C_ReqHistory value) => $_setField(43, value);
  @$pb.TagNumber(43)
  $core.bool hasCReqHistory() => $_has(34);
  @$pb.TagNumber(43)
  void clearCReqHistory() => $_clearField(43);
  @$pb.TagNumber(43)
  C_ReqHistory ensureCReqHistory() => $_ensure(34);

  @$pb.TagNumber(44)
  S_ReqHistory get sReqHistory => $_getN(35);
  @$pb.TagNumber(44)
  set sReqHistory(S_ReqHistory value) => $_setField(44, value);
  @$pb.TagNumber(44)
  $core.bool hasSReqHistory() => $_has(35);
  @$pb.TagNumber(44)
  void clearSReqHistory() => $_clearField(44);
  @$pb.TagNumber(44)
  S_ReqHistory ensureSReqHistory() => $_ensure(35);

  @$pb.TagNumber(45)
  C_FetchOffline get cFetchOffline => $_getN(36);
  @$pb.TagNumber(45)
  set cFetchOffline(C_FetchOffline value) => $_setField(45, value);
  @$pb.TagNumber(45)
  $core.bool hasCFetchOffline() => $_has(36);
  @$pb.TagNumber(45)
  void clearCFetchOffline() => $_clearField(45);
  @$pb.TagNumber(45)
  C_FetchOffline ensureCFetchOffline() => $_ensure(36);

  @$pb.TagNumber(46)
  S_MessageBatch get sMessageBatch => $_getN(37);
  @$pb.TagNumber(46)
  set sMessageBatch(S_MessageBatch value) => $_setField(46, value);
  @$pb.TagNumber(46)
  $core.bool hasSMessageBatch() => $_has(37);
  @$pb.TagNumber(46)
  void clearSMessageBatch() => $_clearField(46);
  @$pb.TagNumber(46)
  S_MessageBatch ensureSMessageBatch() => $_ensure(37);

  @$pb.TagNumber(47)
  C_UploadFile get cUploadFile => $_getN(38);
  @$pb.TagNumber(47)
  set cUploadFile(C_UploadFile value) => $_setField(47, value);
  @$pb.TagNumber(47)
  $core.bool hasCUploadFile() => $_has(38);
  @$pb.TagNumber(47)
  void clearCUploadFile() => $_clearField(47);
  @$pb.TagNumber(47)
  C_UploadFile ensureCUploadFile() => $_ensure(38);

  @$pb.TagNumber(48)
  S_UploadFile get sUploadFile => $_getN(39);
  @$pb.TagNumber(48)
  set sUploadFile(S_UploadFile value) => $_setField(48, value);
  @$pb.TagNumber(48)
  $core.bool hasSUploadFile() => $_has(39);
  @$pb.TagNumber(48)
  void clearSUploadFile() => $_clearField(48);
  @$pb.TagNumber(48)
  S_UploadFile ensureSUploadFile() => $_ensure(39);

  @$pb.TagNumber(49)
  C_DeleteMessage get cDeleteMessage => $_getN(40);
  @$pb.TagNumber(49)
  set cDeleteMessage(C_DeleteMessage value) => $_setField(49, value);
  @$pb.TagNumber(49)
  $core.bool hasCDeleteMessage() => $_has(40);
  @$pb.TagNumber(49)
  void clearCDeleteMessage() => $_clearField(49);
  @$pb.TagNumber(49)
  C_DeleteMessage ensureCDeleteMessage() => $_ensure(40);

  @$pb.TagNumber(50)
  S_DeleteMessage get sDeleteMessage => $_getN(41);
  @$pb.TagNumber(50)
  set sDeleteMessage(S_DeleteMessage value) => $_setField(50, value);
  @$pb.TagNumber(50)
  $core.bool hasSDeleteMessage() => $_has(41);
  @$pb.TagNumber(50)
  void clearSDeleteMessage() => $_clearField(50);
  @$pb.TagNumber(50)
  S_DeleteMessage ensureSDeleteMessage() => $_ensure(41);

  @$pb.TagNumber(51)
  C_EditMessage get cEditMessage => $_getN(42);
  @$pb.TagNumber(51)
  set cEditMessage(C_EditMessage value) => $_setField(51, value);
  @$pb.TagNumber(51)
  $core.bool hasCEditMessage() => $_has(42);
  @$pb.TagNumber(51)
  void clearCEditMessage() => $_clearField(51);
  @$pb.TagNumber(51)
  C_EditMessage ensureCEditMessage() => $_ensure(42);

  @$pb.TagNumber(52)
  S_EditMessage get sEditMessage => $_getN(43);
  @$pb.TagNumber(52)
  set sEditMessage(S_EditMessage value) => $_setField(52, value);
  @$pb.TagNumber(52)
  $core.bool hasSEditMessage() => $_has(43);
  @$pb.TagNumber(52)
  void clearSEditMessage() => $_clearField(52);
  @$pb.TagNumber(52)
  S_EditMessage ensureSEditMessage() => $_ensure(43);

  @$pb.TagNumber(53)
  C_GetSubscription get cGetSubscription => $_getN(44);
  @$pb.TagNumber(53)
  set cGetSubscription(C_GetSubscription value) => $_setField(53, value);
  @$pb.TagNumber(53)
  $core.bool hasCGetSubscription() => $_has(44);
  @$pb.TagNumber(53)
  void clearCGetSubscription() => $_clearField(53);
  @$pb.TagNumber(53)
  C_GetSubscription ensureCGetSubscription() => $_ensure(44);

  @$pb.TagNumber(54)
  S_GetSubscription get sGetSubscription => $_getN(45);
  @$pb.TagNumber(54)
  set sGetSubscription(S_GetSubscription value) => $_setField(54, value);
  @$pb.TagNumber(54)
  $core.bool hasSGetSubscription() => $_has(45);
  @$pb.TagNumber(54)
  void clearSGetSubscription() => $_clearField(54);
  @$pb.TagNumber(54)
  S_GetSubscription ensureSGetSubscription() => $_ensure(45);

  @$pb.TagNumber(55)
  C_VerifyPurchase get cVerifyPurchase => $_getN(46);
  @$pb.TagNumber(55)
  set cVerifyPurchase(C_VerifyPurchase value) => $_setField(55, value);
  @$pb.TagNumber(55)
  $core.bool hasCVerifyPurchase() => $_has(46);
  @$pb.TagNumber(55)
  void clearCVerifyPurchase() => $_clearField(55);
  @$pb.TagNumber(55)
  C_VerifyPurchase ensureCVerifyPurchase() => $_ensure(46);

  @$pb.TagNumber(56)
  S_VerifyPurchase get sVerifyPurchase => $_getN(47);
  @$pb.TagNumber(56)
  set sVerifyPurchase(S_VerifyPurchase value) => $_setField(56, value);
  @$pb.TagNumber(56)
  $core.bool hasSVerifyPurchase() => $_has(47);
  @$pb.TagNumber(56)
  void clearSVerifyPurchase() => $_clearField(56);
  @$pb.TagNumber(56)
  S_VerifyPurchase ensureSVerifyPurchase() => $_ensure(47);

  @$pb.TagNumber(57)
  C_ReadReceipt get cReadReceipt => $_getN(48);
  @$pb.TagNumber(57)
  set cReadReceipt(C_ReadReceipt value) => $_setField(57, value);
  @$pb.TagNumber(57)
  $core.bool hasCReadReceipt() => $_has(48);
  @$pb.TagNumber(57)
  void clearCReadReceipt() => $_clearField(57);
  @$pb.TagNumber(57)
  C_ReadReceipt ensureCReadReceipt() => $_ensure(48);

  @$pb.TagNumber(58)
  S_ReadReceipt get sReadReceipt => $_getN(49);
  @$pb.TagNumber(58)
  set sReadReceipt(S_ReadReceipt value) => $_setField(58, value);
  @$pb.TagNumber(58)
  $core.bool hasSReadReceipt() => $_has(49);
  @$pb.TagNumber(58)
  void clearSReadReceipt() => $_clearField(58);
  @$pb.TagNumber(58)
  S_ReadReceipt ensureSReadReceipt() => $_ensure(49);

  @$pb.TagNumber(59)
  C_CancelSubscription get cCancelSubscription => $_getN(50);
  @$pb.TagNumber(59)
  set cCancelSubscription(C_CancelSubscription value) => $_setField(59, value);
  @$pb.TagNumber(59)
  $core.bool hasCCancelSubscription() => $_has(50);
  @$pb.TagNumber(59)
  void clearCCancelSubscription() => $_clearField(59);
  @$pb.TagNumber(59)
  C_CancelSubscription ensureCCancelSubscription() => $_ensure(50);

  /// FRIENDS (60 ~ 79)
  @$pb.TagNumber(60)
  C_SearchUser get cSearchUser => $_getN(51);
  @$pb.TagNumber(60)
  set cSearchUser(C_SearchUser value) => $_setField(60, value);
  @$pb.TagNumber(60)
  $core.bool hasCSearchUser() => $_has(51);
  @$pb.TagNumber(60)
  void clearCSearchUser() => $_clearField(60);
  @$pb.TagNumber(60)
  C_SearchUser ensureCSearchUser() => $_ensure(51);

  @$pb.TagNumber(61)
  S_SearchUser get sSearchUser => $_getN(52);
  @$pb.TagNumber(61)
  set sSearchUser(S_SearchUser value) => $_setField(61, value);
  @$pb.TagNumber(61)
  $core.bool hasSSearchUser() => $_has(52);
  @$pb.TagNumber(61)
  void clearSSearchUser() => $_clearField(61);
  @$pb.TagNumber(61)
  S_SearchUser ensureSSearchUser() => $_ensure(52);

  @$pb.TagNumber(62)
  C_FriendAction get cFriendAction => $_getN(53);
  @$pb.TagNumber(62)
  set cFriendAction(C_FriendAction value) => $_setField(62, value);
  @$pb.TagNumber(62)
  $core.bool hasCFriendAction() => $_has(53);
  @$pb.TagNumber(62)
  void clearCFriendAction() => $_clearField(62);
  @$pb.TagNumber(62)
  C_FriendAction ensureCFriendAction() => $_ensure(53);

  @$pb.TagNumber(63)
  S_FriendAction get sFriendAction => $_getN(54);
  @$pb.TagNumber(63)
  set sFriendAction(S_FriendAction value) => $_setField(63, value);
  @$pb.TagNumber(63)
  $core.bool hasSFriendAction() => $_has(54);
  @$pb.TagNumber(63)
  void clearSFriendAction() => $_clearField(63);
  @$pb.TagNumber(63)
  S_FriendAction ensureSFriendAction() => $_ensure(54);

  @$pb.TagNumber(64)
  C_FetchFriendData get cFetchFriendData => $_getN(55);
  @$pb.TagNumber(64)
  set cFetchFriendData(C_FetchFriendData value) => $_setField(64, value);
  @$pb.TagNumber(64)
  $core.bool hasCFetchFriendData() => $_has(55);
  @$pb.TagNumber(64)
  void clearCFetchFriendData() => $_clearField(64);
  @$pb.TagNumber(64)
  C_FetchFriendData ensureCFetchFriendData() => $_ensure(55);

  @$pb.TagNumber(65)
  S_FetchFriendData get sFetchFriendData => $_getN(56);
  @$pb.TagNumber(65)
  set sFetchFriendData(S_FetchFriendData value) => $_setField(65, value);
  @$pb.TagNumber(65)
  $core.bool hasSFetchFriendData() => $_has(56);
  @$pb.TagNumber(65)
  void clearSFetchFriendData() => $_clearField(65);
  @$pb.TagNumber(65)
  S_FetchFriendData ensureSFetchFriendData() => $_ensure(56);

  @$pb.TagNumber(66)
  S_FriendPush get sFriendPush => $_getN(57);
  @$pb.TagNumber(66)
  set sFriendPush(S_FriendPush value) => $_setField(66, value);
  @$pb.TagNumber(66)
  $core.bool hasSFriendPush() => $_has(57);
  @$pb.TagNumber(66)
  void clearSFriendPush() => $_clearField(66);
  @$pb.TagNumber(66)
  S_FriendPush ensureSFriendPush() => $_ensure(57);

  /// BLOCK / REPORT (67 ~ 74)
  @$pb.TagNumber(67)
  C_BlockUser get cBlockUser => $_getN(58);
  @$pb.TagNumber(67)
  set cBlockUser(C_BlockUser value) => $_setField(67, value);
  @$pb.TagNumber(67)
  $core.bool hasCBlockUser() => $_has(58);
  @$pb.TagNumber(67)
  void clearCBlockUser() => $_clearField(67);
  @$pb.TagNumber(67)
  C_BlockUser ensureCBlockUser() => $_ensure(58);

  @$pb.TagNumber(68)
  S_BlockUser get sBlockUser => $_getN(59);
  @$pb.TagNumber(68)
  set sBlockUser(S_BlockUser value) => $_setField(68, value);
  @$pb.TagNumber(68)
  $core.bool hasSBlockUser() => $_has(59);
  @$pb.TagNumber(68)
  void clearSBlockUser() => $_clearField(68);
  @$pb.TagNumber(68)
  S_BlockUser ensureSBlockUser() => $_ensure(59);

  @$pb.TagNumber(69)
  C_UnblockUser get cUnblockUser => $_getN(60);
  @$pb.TagNumber(69)
  set cUnblockUser(C_UnblockUser value) => $_setField(69, value);
  @$pb.TagNumber(69)
  $core.bool hasCUnblockUser() => $_has(60);
  @$pb.TagNumber(69)
  void clearCUnblockUser() => $_clearField(69);
  @$pb.TagNumber(69)
  C_UnblockUser ensureCUnblockUser() => $_ensure(60);

  @$pb.TagNumber(70)
  S_UnblockUser get sUnblockUser => $_getN(61);
  @$pb.TagNumber(70)
  set sUnblockUser(S_UnblockUser value) => $_setField(70, value);
  @$pb.TagNumber(70)
  $core.bool hasSUnblockUser() => $_has(61);
  @$pb.TagNumber(70)
  void clearSUnblockUser() => $_clearField(70);
  @$pb.TagNumber(70)
  S_UnblockUser ensureSUnblockUser() => $_ensure(61);

  @$pb.TagNumber(71)
  C_GetBlockedList get cGetBlockedList => $_getN(62);
  @$pb.TagNumber(71)
  set cGetBlockedList(C_GetBlockedList value) => $_setField(71, value);
  @$pb.TagNumber(71)
  $core.bool hasCGetBlockedList() => $_has(62);
  @$pb.TagNumber(71)
  void clearCGetBlockedList() => $_clearField(71);
  @$pb.TagNumber(71)
  C_GetBlockedList ensureCGetBlockedList() => $_ensure(62);

  @$pb.TagNumber(72)
  S_GetBlockedList get sGetBlockedList => $_getN(63);
  @$pb.TagNumber(72)
  set sGetBlockedList(S_GetBlockedList value) => $_setField(72, value);
  @$pb.TagNumber(72)
  $core.bool hasSGetBlockedList() => $_has(63);
  @$pb.TagNumber(72)
  void clearSGetBlockedList() => $_clearField(72);
  @$pb.TagNumber(72)
  S_GetBlockedList ensureSGetBlockedList() => $_ensure(63);

  @$pb.TagNumber(73)
  C_ReportUser get cReportUser => $_getN(64);
  @$pb.TagNumber(73)
  set cReportUser(C_ReportUser value) => $_setField(73, value);
  @$pb.TagNumber(73)
  $core.bool hasCReportUser() => $_has(64);
  @$pb.TagNumber(73)
  void clearCReportUser() => $_clearField(73);
  @$pb.TagNumber(73)
  C_ReportUser ensureCReportUser() => $_ensure(64);

  @$pb.TagNumber(74)
  S_ReportUser get sReportUser => $_getN(65);
  @$pb.TagNumber(74)
  set sReportUser(S_ReportUser value) => $_setField(74, value);
  @$pb.TagNumber(74)
  $core.bool hasSReportUser() => $_has(65);
  @$pb.TagNumber(74)
  void clearSReportUser() => $_clearField(74);
  @$pb.TagNumber(74)
  S_ReportUser ensureSReportUser() => $_ensure(65);

  @$pb.TagNumber(75)
  C_AddReaction get cAddReaction => $_getN(66);
  @$pb.TagNumber(75)
  set cAddReaction(C_AddReaction value) => $_setField(75, value);
  @$pb.TagNumber(75)
  $core.bool hasCAddReaction() => $_has(66);
  @$pb.TagNumber(75)
  void clearCAddReaction() => $_clearField(75);
  @$pb.TagNumber(75)
  C_AddReaction ensureCAddReaction() => $_ensure(66);

  @$pb.TagNumber(76)
  C_CreatePoll get cCreatePoll => $_getN(67);
  @$pb.TagNumber(76)
  set cCreatePoll(C_CreatePoll value) => $_setField(76, value);
  @$pb.TagNumber(76)
  $core.bool hasCCreatePoll() => $_has(67);
  @$pb.TagNumber(76)
  void clearCCreatePoll() => $_clearField(76);
  @$pb.TagNumber(76)
  C_CreatePoll ensureCCreatePoll() => $_ensure(67);

  @$pb.TagNumber(77)
  C_Vote get cVote => $_getN(68);
  @$pb.TagNumber(77)
  set cVote(C_Vote value) => $_setField(77, value);
  @$pb.TagNumber(77)
  $core.bool hasCVote() => $_has(68);
  @$pb.TagNumber(77)
  void clearCVote() => $_clearField(77);
  @$pb.TagNumber(77)
  C_Vote ensureCVote() => $_ensure(68);

  @$pb.TagNumber(78)
  C_ClosePoll get cClosePoll => $_getN(69);
  @$pb.TagNumber(78)
  set cClosePoll(C_ClosePoll value) => $_setField(78, value);
  @$pb.TagNumber(78)
  $core.bool hasCClosePoll() => $_has(69);
  @$pb.TagNumber(78)
  void clearCClosePoll() => $_clearField(78);
  @$pb.TagNumber(78)
  C_ClosePoll ensureCClosePoll() => $_ensure(69);

  @$pb.TagNumber(79)
  C_SetAnnouncement get cSetAnnouncement => $_getN(70);
  @$pb.TagNumber(79)
  set cSetAnnouncement(C_SetAnnouncement value) => $_setField(79, value);
  @$pb.TagNumber(79)
  $core.bool hasCSetAnnouncement() => $_has(70);
  @$pb.TagNumber(79)
  void clearCSetAnnouncement() => $_clearField(79);
  @$pb.TagNumber(79)
  C_SetAnnouncement ensureCSetAnnouncement() => $_ensure(70);

  /// GROUPS (80 ~ 99)
  @$pb.TagNumber(80)
  C_CreateGroup get cCreateGroup => $_getN(71);
  @$pb.TagNumber(80)
  set cCreateGroup(C_CreateGroup value) => $_setField(80, value);
  @$pb.TagNumber(80)
  $core.bool hasCCreateGroup() => $_has(71);
  @$pb.TagNumber(80)
  void clearCCreateGroup() => $_clearField(80);
  @$pb.TagNumber(80)
  C_CreateGroup ensureCCreateGroup() => $_ensure(71);

  @$pb.TagNumber(81)
  S_CreateGroup get sCreateGroup => $_getN(72);
  @$pb.TagNumber(81)
  set sCreateGroup(S_CreateGroup value) => $_setField(81, value);
  @$pb.TagNumber(81)
  $core.bool hasSCreateGroup() => $_has(72);
  @$pb.TagNumber(81)
  void clearSCreateGroup() => $_clearField(81);
  @$pb.TagNumber(81)
  S_CreateGroup ensureSCreateGroup() => $_ensure(72);

  @$pb.TagNumber(82)
  C_GroupList get cGroupList => $_getN(73);
  @$pb.TagNumber(82)
  set cGroupList(C_GroupList value) => $_setField(82, value);
  @$pb.TagNumber(82)
  $core.bool hasCGroupList() => $_has(73);
  @$pb.TagNumber(82)
  void clearCGroupList() => $_clearField(82);
  @$pb.TagNumber(82)
  C_GroupList ensureCGroupList() => $_ensure(73);

  @$pb.TagNumber(83)
  S_GroupList get sGroupList => $_getN(74);
  @$pb.TagNumber(83)
  set sGroupList(S_GroupList value) => $_setField(83, value);
  @$pb.TagNumber(83)
  $core.bool hasSGroupList() => $_has(74);
  @$pb.TagNumber(83)
  void clearSGroupList() => $_clearField(83);
  @$pb.TagNumber(83)
  S_GroupList ensureSGroupList() => $_ensure(74);

  @$pb.TagNumber(84)
  C_JoinGroup get cJoinGroup => $_getN(75);
  @$pb.TagNumber(84)
  set cJoinGroup(C_JoinGroup value) => $_setField(84, value);
  @$pb.TagNumber(84)
  $core.bool hasCJoinGroup() => $_has(75);
  @$pb.TagNumber(84)
  void clearCJoinGroup() => $_clearField(84);
  @$pb.TagNumber(84)
  C_JoinGroup ensureCJoinGroup() => $_ensure(75);

  @$pb.TagNumber(85)
  S_JoinGroup get sJoinGroup => $_getN(76);
  @$pb.TagNumber(85)
  set sJoinGroup(S_JoinGroup value) => $_setField(85, value);
  @$pb.TagNumber(85)
  $core.bool hasSJoinGroup() => $_has(76);
  @$pb.TagNumber(85)
  void clearSJoinGroup() => $_clearField(85);
  @$pb.TagNumber(85)
  S_JoinGroup ensureSJoinGroup() => $_ensure(76);

  @$pb.TagNumber(86)
  C_InviteFriend get cInviteFriend => $_getN(77);
  @$pb.TagNumber(86)
  set cInviteFriend(C_InviteFriend value) => $_setField(86, value);
  @$pb.TagNumber(86)
  $core.bool hasCInviteFriend() => $_has(77);
  @$pb.TagNumber(86)
  void clearCInviteFriend() => $_clearField(86);
  @$pb.TagNumber(86)
  C_InviteFriend ensureCInviteFriend() => $_ensure(77);

  @$pb.TagNumber(87)
  S_InviteFriend get sInviteFriend => $_getN(78);
  @$pb.TagNumber(87)
  set sInviteFriend(S_InviteFriend value) => $_setField(87, value);
  @$pb.TagNumber(87)
  $core.bool hasSInviteFriend() => $_has(78);
  @$pb.TagNumber(87)
  void clearSInviteFriend() => $_clearField(87);
  @$pb.TagNumber(87)
  S_InviteFriend ensureSInviteFriend() => $_ensure(78);

  @$pb.TagNumber(88)
  C_LeaveGroup get cLeaveGroup => $_getN(79);
  @$pb.TagNumber(88)
  set cLeaveGroup(C_LeaveGroup value) => $_setField(88, value);
  @$pb.TagNumber(88)
  $core.bool hasCLeaveGroup() => $_has(79);
  @$pb.TagNumber(88)
  void clearCLeaveGroup() => $_clearField(88);
  @$pb.TagNumber(88)
  C_LeaveGroup ensureCLeaveGroup() => $_ensure(79);

  @$pb.TagNumber(89)
  S_LeaveGroup get sLeaveGroup => $_getN(80);
  @$pb.TagNumber(89)
  set sLeaveGroup(S_LeaveGroup value) => $_setField(89, value);
  @$pb.TagNumber(89)
  $core.bool hasSLeaveGroup() => $_has(80);
  @$pb.TagNumber(89)
  void clearSLeaveGroup() => $_clearField(89);
  @$pb.TagNumber(89)
  S_LeaveGroup ensureSLeaveGroup() => $_ensure(80);

  @$pb.TagNumber(90)
  C_GroupMemberList get cGroupMemberList => $_getN(81);
  @$pb.TagNumber(90)
  set cGroupMemberList(C_GroupMemberList value) => $_setField(90, value);
  @$pb.TagNumber(90)
  $core.bool hasCGroupMemberList() => $_has(81);
  @$pb.TagNumber(90)
  void clearCGroupMemberList() => $_clearField(90);
  @$pb.TagNumber(90)
  C_GroupMemberList ensureCGroupMemberList() => $_ensure(81);

  @$pb.TagNumber(91)
  S_GroupMemberList get sGroupMemberList => $_getN(82);
  @$pb.TagNumber(91)
  set sGroupMemberList(S_GroupMemberList value) => $_setField(91, value);
  @$pb.TagNumber(91)
  $core.bool hasSGroupMemberList() => $_has(82);
  @$pb.TagNumber(91)
  void clearSGroupMemberList() => $_clearField(91);
  @$pb.TagNumber(91)
  S_GroupMemberList ensureSGroupMemberList() => $_ensure(82);

  @$pb.TagNumber(92)
  C_GroupInfo get cGroupInfo => $_getN(83);
  @$pb.TagNumber(92)
  set cGroupInfo(C_GroupInfo value) => $_setField(92, value);
  @$pb.TagNumber(92)
  $core.bool hasCGroupInfo() => $_has(83);
  @$pb.TagNumber(92)
  void clearCGroupInfo() => $_clearField(92);
  @$pb.TagNumber(92)
  C_GroupInfo ensureCGroupInfo() => $_ensure(83);

  @$pb.TagNumber(93)
  S_GroupInfo get sGroupInfo => $_getN(84);
  @$pb.TagNumber(93)
  set sGroupInfo(S_GroupInfo value) => $_setField(93, value);
  @$pb.TagNumber(93)
  $core.bool hasSGroupInfo() => $_has(84);
  @$pb.TagNumber(93)
  void clearSGroupInfo() => $_clearField(93);
  @$pb.TagNumber(93)
  S_GroupInfo ensureSGroupInfo() => $_ensure(84);

  @$pb.TagNumber(94)
  C_EditGroup get cEditGroup => $_getN(85);
  @$pb.TagNumber(94)
  set cEditGroup(C_EditGroup value) => $_setField(94, value);
  @$pb.TagNumber(94)
  $core.bool hasCEditGroup() => $_has(85);
  @$pb.TagNumber(94)
  void clearCEditGroup() => $_clearField(94);
  @$pb.TagNumber(94)
  C_EditGroup ensureCEditGroup() => $_ensure(85);

  @$pb.TagNumber(95)
  S_EditGroup get sEditGroup => $_getN(86);
  @$pb.TagNumber(95)
  set sEditGroup(S_EditGroup value) => $_setField(95, value);
  @$pb.TagNumber(95)
  $core.bool hasSEditGroup() => $_has(86);
  @$pb.TagNumber(95)
  void clearSEditGroup() => $_clearField(95);
  @$pb.TagNumber(95)
  S_EditGroup ensureSEditGroup() => $_ensure(86);

  @$pb.TagNumber(96)
  C_Withdraw get cWithdraw => $_getN(87);
  @$pb.TagNumber(96)
  set cWithdraw(C_Withdraw value) => $_setField(96, value);
  @$pb.TagNumber(96)
  $core.bool hasCWithdraw() => $_has(87);
  @$pb.TagNumber(96)
  void clearCWithdraw() => $_clearField(96);
  @$pb.TagNumber(96)
  C_Withdraw ensureCWithdraw() => $_ensure(87);

  @$pb.TagNumber(97)
  S_Withdraw get sWithdraw => $_getN(88);
  @$pb.TagNumber(97)
  set sWithdraw(S_Withdraw value) => $_setField(97, value);
  @$pb.TagNumber(97)
  $core.bool hasSWithdraw() => $_has(88);
  @$pb.TagNumber(97)
  void clearSWithdraw() => $_clearField(97);
  @$pb.TagNumber(97)
  S_Withdraw ensureSWithdraw() => $_ensure(88);

  @$pb.TagNumber(98)
  C_DeleteGroup get cDeleteGroup => $_getN(89);
  @$pb.TagNumber(98)
  set cDeleteGroup(C_DeleteGroup value) => $_setField(98, value);
  @$pb.TagNumber(98)
  $core.bool hasCDeleteGroup() => $_has(89);
  @$pb.TagNumber(98)
  void clearCDeleteGroup() => $_clearField(98);
  @$pb.TagNumber(98)
  C_DeleteGroup ensureCDeleteGroup() => $_ensure(89);

  @$pb.TagNumber(99)
  S_DeleteGroup get sDeleteGroup => $_getN(90);
  @$pb.TagNumber(99)
  set sDeleteGroup(S_DeleteGroup value) => $_setField(99, value);
  @$pb.TagNumber(99)
  $core.bool hasSDeleteGroup() => $_has(90);
  @$pb.TagNumber(99)
  void clearSDeleteGroup() => $_clearField(99);
  @$pb.TagNumber(99)
  S_DeleteGroup ensureSDeleteGroup() => $_ensure(90);

  /// SYSTEM (100 ~ )
  @$pb.TagNumber(100)
  S_Error get sError => $_getN(91);
  @$pb.TagNumber(100)
  set sError(S_Error value) => $_setField(100, value);
  @$pb.TagNumber(100)
  $core.bool hasSError() => $_has(91);
  @$pb.TagNumber(100)
  void clearSError() => $_clearField(100);
  @$pb.TagNumber(100)
  S_Error ensureSError() => $_ensure(91);

  @$pb.TagNumber(101)
  C_Heartbeat get cHeartbeat => $_getN(92);
  @$pb.TagNumber(101)
  set cHeartbeat(C_Heartbeat value) => $_setField(101, value);
  @$pb.TagNumber(101)
  $core.bool hasCHeartbeat() => $_has(92);
  @$pb.TagNumber(101)
  void clearCHeartbeat() => $_clearField(101);
  @$pb.TagNumber(101)
  C_Heartbeat ensureCHeartbeat() => $_ensure(92);

  @$pb.TagNumber(102)
  S_Heartbeat get sHeartbeat => $_getN(93);
  @$pb.TagNumber(102)
  set sHeartbeat(S_Heartbeat value) => $_setField(102, value);
  @$pb.TagNumber(102)
  $core.bool hasSHeartbeat() => $_has(93);
  @$pb.TagNumber(102)
  void clearSHeartbeat() => $_clearField(102);
  @$pb.TagNumber(102)
  S_Heartbeat ensureSHeartbeat() => $_ensure(93);

  @$pb.TagNumber(103)
  S_CancelSubscription get sCancelSubscription => $_getN(94);
  @$pb.TagNumber(103)
  set sCancelSubscription(S_CancelSubscription value) => $_setField(103, value);
  @$pb.TagNumber(103)
  $core.bool hasSCancelSubscription() => $_has(94);
  @$pb.TagNumber(103)
  void clearSCancelSubscription() => $_clearField(103);
  @$pb.TagNumber(103)
  S_CancelSubscription ensureSCancelSubscription() => $_ensure(94);

  @$pb.TagNumber(104)
  S_AddReaction get sAddReaction => $_getN(95);
  @$pb.TagNumber(104)
  set sAddReaction(S_AddReaction value) => $_setField(104, value);
  @$pb.TagNumber(104)
  $core.bool hasSAddReaction() => $_has(95);
  @$pb.TagNumber(104)
  void clearSAddReaction() => $_clearField(104);
  @$pb.TagNumber(104)
  S_AddReaction ensureSAddReaction() => $_ensure(95);

  @$pb.TagNumber(105)
  S_CreatePoll get sCreatePoll => $_getN(96);
  @$pb.TagNumber(105)
  set sCreatePoll(S_CreatePoll value) => $_setField(105, value);
  @$pb.TagNumber(105)
  $core.bool hasSCreatePoll() => $_has(96);
  @$pb.TagNumber(105)
  void clearSCreatePoll() => $_clearField(105);
  @$pb.TagNumber(105)
  S_CreatePoll ensureSCreatePoll() => $_ensure(96);

  @$pb.TagNumber(106)
  S_Vote get sVote => $_getN(97);
  @$pb.TagNumber(106)
  set sVote(S_Vote value) => $_setField(106, value);
  @$pb.TagNumber(106)
  $core.bool hasSVote() => $_has(97);
  @$pb.TagNumber(106)
  void clearSVote() => $_clearField(106);
  @$pb.TagNumber(106)
  S_Vote ensureSVote() => $_ensure(97);

  @$pb.TagNumber(107)
  S_ClosePoll get sClosePoll => $_getN(98);
  @$pb.TagNumber(107)
  set sClosePoll(S_ClosePoll value) => $_setField(107, value);
  @$pb.TagNumber(107)
  $core.bool hasSClosePoll() => $_has(98);
  @$pb.TagNumber(107)
  void clearSClosePoll() => $_clearField(107);
  @$pb.TagNumber(107)
  S_ClosePoll ensureSClosePoll() => $_ensure(98);

  @$pb.TagNumber(108)
  S_SetAnnouncement get sSetAnnouncement => $_getN(99);
  @$pb.TagNumber(108)
  set sSetAnnouncement(S_SetAnnouncement value) => $_setField(108, value);
  @$pb.TagNumber(108)
  $core.bool hasSSetAnnouncement() => $_has(99);
  @$pb.TagNumber(108)
  void clearSSetAnnouncement() => $_clearField(108);
  @$pb.TagNumber(108)
  S_SetAnnouncement ensureSSetAnnouncement() => $_ensure(99);
}

/// UserInfo
class UserInfo extends $pb.GeneratedMessage {
  factory UserInfo({
    $core.String? userId,
    $core.String? name,
    $core.String? statusMessage,
    $core.String? profileImageUrl,
    $core.String? backgroundImageUrl,
    $core.String? email,
    $core.String? phone,
    $core.int? subGrade,
    $fixnum.Int64? storageCapacityBytes,
    $fixnum.Int64? storageUsageBytes,
    $fixnum.Int64? lastSeen,
    $core.String? status,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (name != null) result.name = name;
    if (statusMessage != null) result.statusMessage = statusMessage;
    if (profileImageUrl != null) result.profileImageUrl = profileImageUrl;
    if (backgroundImageUrl != null)
      result.backgroundImageUrl = backgroundImageUrl;
    if (email != null) result.email = email;
    if (phone != null) result.phone = phone;
    if (subGrade != null) result.subGrade = subGrade;
    if (storageCapacityBytes != null)
      result.storageCapacityBytes = storageCapacityBytes;
    if (storageUsageBytes != null) result.storageUsageBytes = storageUsageBytes;
    if (lastSeen != null) result.lastSeen = lastSeen;
    if (status != null) result.status = status;
    return result;
  }

  UserInfo._();

  factory UserInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'statusMessage')
    ..aOS(4, _omitFieldNames ? '' : 'profileImageUrl')
    ..aOS(5, _omitFieldNames ? '' : 'backgroundImageUrl')
    ..aOS(6, _omitFieldNames ? '' : 'email')
    ..aOS(7, _omitFieldNames ? '' : 'phone')
    ..aI(8, _omitFieldNames ? '' : 'subGrade', fieldType: $pb.PbFieldType.OU3)
    ..aInt64(9, _omitFieldNames ? '' : 'storageCapacityBytes')
    ..aInt64(10, _omitFieldNames ? '' : 'storageUsageBytes')
    ..aInt64(11, _omitFieldNames ? '' : 'lastSeen')
    ..aOS(12, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInfo copyWith(void Function(UserInfo) updates) =>
      super.copyWith((message) => updates(message as UserInfo)) as UserInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInfo create() => UserInfo._();
  @$core.override
  UserInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfo>(create);
  static UserInfo? _defaultInstance;

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
  $core.String get backgroundImageUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set backgroundImageUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBackgroundImageUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearBackgroundImageUrl() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get email => $_getSZ(5);
  @$pb.TagNumber(6)
  set email($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasEmail() => $_has(5);
  @$pb.TagNumber(6)
  void clearEmail() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get phone => $_getSZ(6);
  @$pb.TagNumber(7)
  set phone($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPhone() => $_has(6);
  @$pb.TagNumber(7)
  void clearPhone() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get subGrade => $_getIZ(7);
  @$pb.TagNumber(8)
  set subGrade($core.int value) => $_setUnsignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSubGrade() => $_has(7);
  @$pb.TagNumber(8)
  void clearSubGrade() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get storageCapacityBytes => $_getI64(8);
  @$pb.TagNumber(9)
  set storageCapacityBytes($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasStorageCapacityBytes() => $_has(8);
  @$pb.TagNumber(9)
  void clearStorageCapacityBytes() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get storageUsageBytes => $_getI64(9);
  @$pb.TagNumber(10)
  set storageUsageBytes($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasStorageUsageBytes() => $_has(9);
  @$pb.TagNumber(10)
  void clearStorageUsageBytes() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get lastSeen => $_getI64(10);
  @$pb.TagNumber(11)
  set lastSeen($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasLastSeen() => $_has(10);
  @$pb.TagNumber(11)
  void clearLastSeen() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get status => $_getSZ(11);
  @$pb.TagNumber(12)
  set status($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasStatus() => $_has(11);
  @$pb.TagNumber(12)
  void clearStatus() => $_clearField(12);
}

class DeviceInfo extends $pb.GeneratedMessage {
  factory DeviceInfo({
    $core.String? deviceId,
    $core.String? deviceName,
    $core.String? platform,
    $fixnum.Int64? lastActive,
    $fixnum.Int64? registeredAt,
    $core.String? appVersion,
    $core.bool? isCurrent,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (deviceName != null) result.deviceName = deviceName;
    if (platform != null) result.platform = platform;
    if (lastActive != null) result.lastActive = lastActive;
    if (registeredAt != null) result.registeredAt = registeredAt;
    if (appVersion != null) result.appVersion = appVersion;
    if (isCurrent != null) result.isCurrent = isCurrent;
    return result;
  }

  DeviceInfo._();

  factory DeviceInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..aOS(2, _omitFieldNames ? '' : 'deviceName')
    ..aOS(3, _omitFieldNames ? '' : 'platform')
    ..aInt64(4, _omitFieldNames ? '' : 'lastActive')
    ..aInt64(5, _omitFieldNames ? '' : 'registeredAt')
    ..aOS(6, _omitFieldNames ? '' : 'appVersion')
    ..aOB(7, _omitFieldNames ? '' : 'isCurrent')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceInfo copyWith(void Function(DeviceInfo) updates) =>
      super.copyWith((message) => updates(message as DeviceInfo)) as DeviceInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceInfo create() => DeviceInfo._();
  @$core.override
  DeviceInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeviceInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceInfo>(create);
  static DeviceInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceName => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDeviceName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get platform => $_getSZ(2);
  @$pb.TagNumber(3)
  set platform($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPlatform() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlatform() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get lastActive => $_getI64(3);
  @$pb.TagNumber(4)
  set lastActive($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLastActive() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastActive() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get registeredAt => $_getI64(4);
  @$pb.TagNumber(5)
  set registeredAt($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRegisteredAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearRegisteredAt() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get appVersion => $_getSZ(5);
  @$pb.TagNumber(6)
  set appVersion($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAppVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearAppVersion() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isCurrent => $_getBF(6);
  @$pb.TagNumber(7)
  set isCurrent($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasIsCurrent() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsCurrent() => $_clearField(7);
}

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
    $core.bool? success,
    $core.String? authToken,
    UserInfo? myInfo,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (authToken != null) result.authToken = authToken;
    if (myInfo != null) result.myInfo = myInfo;
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
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'authToken')
    ..aOM<UserInfo>(3, _omitFieldNames ? '' : 'myInfo',
        subBuilder: UserInfo.create)
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
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get authToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set authToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAuthToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthToken() => $_clearField(2);

  @$pb.TagNumber(3)
  UserInfo get myInfo => $_getN(2);
  @$pb.TagNumber(3)
  set myInfo(UserInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMyInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearMyInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  UserInfo ensureMyInfo() => $_ensure(2);
}

class C_Logout extends $pb.GeneratedMessage {
  factory C_Logout({
    $core.String? fcmToken,
    $core.String? deviceId,
  }) {
    final result = create();
    if (fcmToken != null) result.fcmToken = fcmToken;
    if (deviceId != null) result.deviceId = deviceId;
    return result;
  }

  C_Logout._();

  factory C_Logout.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_Logout.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_Logout',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fcmToken')
    ..aOS(2, _omitFieldNames ? '' : 'deviceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_Logout clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_Logout copyWith(void Function(C_Logout) updates) =>
      super.copyWith((message) => updates(message as C_Logout)) as C_Logout;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_Logout create() => C_Logout._();
  @$core.override
  C_Logout createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_Logout getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_Logout>(create);
  static C_Logout? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fcmToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set fcmToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFcmToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearFcmToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => $_clearField(2);
}

class S_Logout extends $pb.GeneratedMessage {
  factory S_Logout({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  S_Logout._();

  factory S_Logout.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_Logout.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_Logout',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_Logout clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_Logout copyWith(void Function(S_Logout) updates) =>
      super.copyWith((message) => updates(message as S_Logout)) as S_Logout;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_Logout create() => S_Logout._();
  @$core.override
  S_Logout createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_Logout getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_Logout>(create);
  static S_Logout? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class C_GetMyDevices extends $pb.GeneratedMessage {
  factory C_GetMyDevices() => create();

  C_GetMyDevices._();

  factory C_GetMyDevices.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_GetMyDevices.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_GetMyDevices',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GetMyDevices clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GetMyDevices copyWith(void Function(C_GetMyDevices) updates) =>
      super.copyWith((message) => updates(message as C_GetMyDevices))
          as C_GetMyDevices;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_GetMyDevices create() => C_GetMyDevices._();
  @$core.override
  C_GetMyDevices createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_GetMyDevices getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_GetMyDevices>(create);
  static C_GetMyDevices? _defaultInstance;
}

class S_GetMyDevices extends $pb.GeneratedMessage {
  factory S_GetMyDevices({
    $core.Iterable<DeviceInfo>? devices,
  }) {
    final result = create();
    if (devices != null) result.devices.addAll(devices);
    return result;
  }

  S_GetMyDevices._();

  factory S_GetMyDevices.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_GetMyDevices.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_GetMyDevices',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..pPM<DeviceInfo>(1, _omitFieldNames ? '' : 'devices',
        subBuilder: DeviceInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GetMyDevices clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GetMyDevices copyWith(void Function(S_GetMyDevices) updates) =>
      super.copyWith((message) => updates(message as S_GetMyDevices))
          as S_GetMyDevices;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_GetMyDevices create() => S_GetMyDevices._();
  @$core.override
  S_GetMyDevices createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_GetMyDevices getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_GetMyDevices>(create);
  static S_GetMyDevices? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DeviceInfo> get devices => $_getList(0);
}

class C_RemoveDevice extends $pb.GeneratedMessage {
  factory C_RemoveDevice({
    $core.String? deviceId,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    return result;
  }

  C_RemoveDevice._();

  factory C_RemoveDevice.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_RemoveDevice.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_RemoveDevice',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_RemoveDevice clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_RemoveDevice copyWith(void Function(C_RemoveDevice) updates) =>
      super.copyWith((message) => updates(message as C_RemoveDevice))
          as C_RemoveDevice;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_RemoveDevice create() => C_RemoveDevice._();
  @$core.override
  C_RemoveDevice createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_RemoveDevice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_RemoveDevice>(create);
  static C_RemoveDevice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);
}

class S_RemoveDevice extends $pb.GeneratedMessage {
  factory S_RemoveDevice({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  S_RemoveDevice._();

  factory S_RemoveDevice.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_RemoveDevice.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_RemoveDevice',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_RemoveDevice clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_RemoveDevice copyWith(void Function(S_RemoveDevice) updates) =>
      super.copyWith((message) => updates(message as S_RemoveDevice))
          as S_RemoveDevice;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_RemoveDevice create() => S_RemoveDevice._();
  @$core.override
  S_RemoveDevice createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_RemoveDevice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_RemoveDevice>(create);
  static S_RemoveDevice? _defaultInstance;

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

class C_FetchMyInfo extends $pb.GeneratedMessage {
  factory C_FetchMyInfo() => create();

  C_FetchMyInfo._();

  factory C_FetchMyInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_FetchMyInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_FetchMyInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FetchMyInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_FetchMyInfo copyWith(void Function(C_FetchMyInfo) updates) =>
      super.copyWith((message) => updates(message as C_FetchMyInfo))
          as C_FetchMyInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_FetchMyInfo create() => C_FetchMyInfo._();
  @$core.override
  C_FetchMyInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_FetchMyInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_FetchMyInfo>(create);
  static C_FetchMyInfo? _defaultInstance;
}

class S_FetchMyInfo extends $pb.GeneratedMessage {
  factory S_FetchMyInfo({
    UserInfo? myInfo,
  }) {
    final result = create();
    if (myInfo != null) result.myInfo = myInfo;
    return result;
  }

  S_FetchMyInfo._();

  factory S_FetchMyInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_FetchMyInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_FetchMyInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOM<UserInfo>(1, _omitFieldNames ? '' : 'myInfo',
        subBuilder: UserInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FetchMyInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_FetchMyInfo copyWith(void Function(S_FetchMyInfo) updates) =>
      super.copyWith((message) => updates(message as S_FetchMyInfo))
          as S_FetchMyInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_FetchMyInfo create() => S_FetchMyInfo._();
  @$core.override
  S_FetchMyInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_FetchMyInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_FetchMyInfo>(create);
  static S_FetchMyInfo? _defaultInstance;

  @$pb.TagNumber(1)
  UserInfo get myInfo => $_getN(0);
  @$pb.TagNumber(1)
  set myInfo(UserInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMyInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearMyInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  UserInfo ensureMyInfo() => $_ensure(0);
}

class C_EditMyInfo extends $pb.GeneratedMessage {
  factory C_EditMyInfo({
    $core.String? name,
    $core.String? statusMessage,
    $core.String? profileImageUrl,
    $core.String? backgroundImageUrl,
    $core.String? phone,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (statusMessage != null) result.statusMessage = statusMessage;
    if (profileImageUrl != null) result.profileImageUrl = profileImageUrl;
    if (backgroundImageUrl != null)
      result.backgroundImageUrl = backgroundImageUrl;
    if (phone != null) result.phone = phone;
    return result;
  }

  C_EditMyInfo._();

  factory C_EditMyInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_EditMyInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_EditMyInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'statusMessage')
    ..aOS(3, _omitFieldNames ? '' : 'profileImageUrl')
    ..aOS(4, _omitFieldNames ? '' : 'backgroundImageUrl')
    ..aOS(5, _omitFieldNames ? '' : 'phone')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_EditMyInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_EditMyInfo copyWith(void Function(C_EditMyInfo) updates) =>
      super.copyWith((message) => updates(message as C_EditMyInfo))
          as C_EditMyInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_EditMyInfo create() => C_EditMyInfo._();
  @$core.override
  C_EditMyInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_EditMyInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_EditMyInfo>(create);
  static C_EditMyInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get statusMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set statusMessage($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatusMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatusMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get profileImageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set profileImageUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasProfileImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearProfileImageUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get backgroundImageUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set backgroundImageUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBackgroundImageUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearBackgroundImageUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get phone => $_getSZ(4);
  @$pb.TagNumber(5)
  set phone($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPhone() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhone() => $_clearField(5);
}

class S_EditMyInfo extends $pb.GeneratedMessage {
  factory S_EditMyInfo({
    $core.bool? success,
    $core.String? message,
    UserInfo? updatedInfo,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (updatedInfo != null) result.updatedInfo = updatedInfo;
    return result;
  }

  S_EditMyInfo._();

  factory S_EditMyInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_EditMyInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_EditMyInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<UserInfo>(3, _omitFieldNames ? '' : 'updatedInfo',
        subBuilder: UserInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_EditMyInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_EditMyInfo copyWith(void Function(S_EditMyInfo) updates) =>
      super.copyWith((message) => updates(message as S_EditMyInfo))
          as S_EditMyInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_EditMyInfo create() => S_EditMyInfo._();
  @$core.override
  S_EditMyInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_EditMyInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_EditMyInfo>(create);
  static S_EditMyInfo? _defaultInstance;

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
  UserInfo get updatedInfo => $_getN(2);
  @$pb.TagNumber(3)
  set updatedInfo(UserInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdatedInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  UserInfo ensureUpdatedInfo() => $_ensure(2);
}

class C_RegisterFcmToken extends $pb.GeneratedMessage {
  factory C_RegisterFcmToken({
    $core.String? fcmToken,
    $core.String? platform,
    $core.String? deviceId,
    $core.String? deviceName,
    $core.String? appVersion,
  }) {
    final result = create();
    if (fcmToken != null) result.fcmToken = fcmToken;
    if (platform != null) result.platform = platform;
    if (deviceId != null) result.deviceId = deviceId;
    if (deviceName != null) result.deviceName = deviceName;
    if (appVersion != null) result.appVersion = appVersion;
    return result;
  }

  C_RegisterFcmToken._();

  factory C_RegisterFcmToken.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_RegisterFcmToken.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_RegisterFcmToken',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fcmToken')
    ..aOS(2, _omitFieldNames ? '' : 'platform')
    ..aOS(3, _omitFieldNames ? '' : 'deviceId')
    ..aOS(4, _omitFieldNames ? '' : 'deviceName')
    ..aOS(5, _omitFieldNames ? '' : 'appVersion')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_RegisterFcmToken clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_RegisterFcmToken copyWith(void Function(C_RegisterFcmToken) updates) =>
      super.copyWith((message) => updates(message as C_RegisterFcmToken))
          as C_RegisterFcmToken;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_RegisterFcmToken create() => C_RegisterFcmToken._();
  @$core.override
  C_RegisterFcmToken createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_RegisterFcmToken getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_RegisterFcmToken>(create);
  static C_RegisterFcmToken? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fcmToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set fcmToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFcmToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearFcmToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get platform => $_getSZ(1);
  @$pb.TagNumber(2)
  set platform($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPlatform() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlatform() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDeviceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get deviceName => $_getSZ(3);
  @$pb.TagNumber(4)
  set deviceName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDeviceName() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get appVersion => $_getSZ(4);
  @$pb.TagNumber(5)
  set appVersion($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAppVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearAppVersion() => $_clearField(5);
}

class S_RegisterFcmToken extends $pb.GeneratedMessage {
  factory S_RegisterFcmToken({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  S_RegisterFcmToken._();

  factory S_RegisterFcmToken.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_RegisterFcmToken.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_RegisterFcmToken',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_RegisterFcmToken clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_RegisterFcmToken copyWith(void Function(S_RegisterFcmToken) updates) =>
      super.copyWith((message) => updates(message as S_RegisterFcmToken))
          as S_RegisterFcmToken;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_RegisterFcmToken create() => S_RegisterFcmToken._();
  @$core.override
  S_RegisterFcmToken createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_RegisterFcmToken getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_RegisterFcmToken>(create);
  static S_RegisterFcmToken? _defaultInstance;

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

class C_ChangeEmail extends $pb.GeneratedMessage {
  factory C_ChangeEmail({
    $core.String? newEmail,
  }) {
    final result = create();
    if (newEmail != null) result.newEmail = newEmail;
    return result;
  }

  C_ChangeEmail._();

  factory C_ChangeEmail.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_ChangeEmail.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_ChangeEmail',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'newEmail')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_ChangeEmail clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_ChangeEmail copyWith(void Function(C_ChangeEmail) updates) =>
      super.copyWith((message) => updates(message as C_ChangeEmail))
          as C_ChangeEmail;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_ChangeEmail create() => C_ChangeEmail._();
  @$core.override
  C_ChangeEmail createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_ChangeEmail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_ChangeEmail>(create);
  static C_ChangeEmail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get newEmail => $_getSZ(0);
  @$pb.TagNumber(1)
  set newEmail($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNewEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearNewEmail() => $_clearField(1);
}

class S_ChangeEmail extends $pb.GeneratedMessage {
  factory S_ChangeEmail({
    $core.bool? success,
    $core.String? message,
    UserInfo? updatedInfo,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (updatedInfo != null) result.updatedInfo = updatedInfo;
    return result;
  }

  S_ChangeEmail._();

  factory S_ChangeEmail.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_ChangeEmail.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_ChangeEmail',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<UserInfo>(3, _omitFieldNames ? '' : 'updatedInfo',
        subBuilder: UserInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_ChangeEmail clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_ChangeEmail copyWith(void Function(S_ChangeEmail) updates) =>
      super.copyWith((message) => updates(message as S_ChangeEmail))
          as S_ChangeEmail;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_ChangeEmail create() => S_ChangeEmail._();
  @$core.override
  S_ChangeEmail createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_ChangeEmail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_ChangeEmail>(create);
  static S_ChangeEmail? _defaultInstance;

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
  UserInfo get updatedInfo => $_getN(2);
  @$pb.TagNumber(3)
  set updatedInfo(UserInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdatedInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  UserInfo ensureUpdatedInfo() => $_ensure(2);
}

class C_ChangePassword extends $pb.GeneratedMessage {
  factory C_ChangePassword({
    $core.String? currentPassword,
    $core.String? newPassword,
  }) {
    final result = create();
    if (currentPassword != null) result.currentPassword = currentPassword;
    if (newPassword != null) result.newPassword = newPassword;
    return result;
  }

  C_ChangePassword._();

  factory C_ChangePassword.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_ChangePassword.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_ChangePassword',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'currentPassword')
    ..aOS(2, _omitFieldNames ? '' : 'newPassword')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_ChangePassword clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_ChangePassword copyWith(void Function(C_ChangePassword) updates) =>
      super.copyWith((message) => updates(message as C_ChangePassword))
          as C_ChangePassword;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_ChangePassword create() => C_ChangePassword._();
  @$core.override
  C_ChangePassword createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_ChangePassword getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_ChangePassword>(create);
  static C_ChangePassword? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get currentPassword => $_getSZ(0);
  @$pb.TagNumber(1)
  set currentPassword($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCurrentPassword() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentPassword() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get newPassword => $_getSZ(1);
  @$pb.TagNumber(2)
  set newPassword($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNewPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewPassword() => $_clearField(2);
}

class S_ChangePassword extends $pb.GeneratedMessage {
  factory S_ChangePassword({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  S_ChangePassword._();

  factory S_ChangePassword.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_ChangePassword.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_ChangePassword',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_ChangePassword clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_ChangePassword copyWith(void Function(S_ChangePassword) updates) =>
      super.copyWith((message) => updates(message as S_ChangePassword))
          as S_ChangePassword;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_ChangePassword create() => S_ChangePassword._();
  @$core.override
  S_ChangePassword createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_ChangePassword getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_ChangePassword>(create);
  static S_ChangePassword? _defaultInstance;

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
    $core.int? durationSec,
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
    ..aI(3, _omitFieldNames ? '' : 'durationSec')
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
  $core.int get durationSec => $_getIZ(2);
  @$pb.TagNumber(3)
  set durationSec($core.int value) => $_setSignedInt32(2, value);
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
  }) {
    final result = create();
    if (message != null) result.message = message;
    if (type != null) result.type = type;
    if (inviteGroupId != null) result.inviteGroupId = inviteGroupId;
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
}

class Audio extends $pb.GeneratedMessage {
  factory Audio({
    $core.String? url,
    $core.int? durationSec,
    $fixnum.Int64? size,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (durationSec != null) result.durationSec = durationSec;
    if (size != null) result.size = size;
    return result;
  }

  Audio._();

  factory Audio.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Audio.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Audio',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aI(2, _omitFieldNames ? '' : 'durationSec')
    ..aInt64(3, _omitFieldNames ? '' : 'size')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Audio clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Audio copyWith(void Function(Audio) updates) =>
      super.copyWith((message) => updates(message as Audio)) as Audio;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Audio create() => Audio._();
  @$core.override
  Audio createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Audio getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Audio>(create);
  static Audio? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get durationSec => $_getIZ(1);
  @$pb.TagNumber(2)
  set durationSec($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDurationSec() => $_has(1);
  @$pb.TagNumber(2)
  void clearDurationSec() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get size => $_getI64(2);
  @$pb.TagNumber(3)
  set size($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearSize() => $_clearField(3);
}

enum ChatPayload_Content { text, image, video, file, system, audio, notSet }

class ChatPayload extends $pb.GeneratedMessage {
  factory ChatPayload({
    Text? text,
    Image? image,
    Video? video,
    File? file,
    SystemMsg? system,
    Audio? audio,
  }) {
    final result = create();
    if (text != null) result.text = text;
    if (image != null) result.image = image;
    if (video != null) result.video = video;
    if (file != null) result.file = file;
    if (system != null) result.system = system;
    if (audio != null) result.audio = audio;
    return result;
  }

  ChatPayload._();

  factory ChatPayload.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatPayload.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ChatPayload_Content>
      _ChatPayload_ContentByTag = {
    1: ChatPayload_Content.text,
    2: ChatPayload_Content.image,
    3: ChatPayload_Content.video,
    4: ChatPayload_Content.file,
    5: ChatPayload_Content.system,
    6: ChatPayload_Content.audio,
    0: ChatPayload_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatPayload',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6])
    ..aOM<Text>(1, _omitFieldNames ? '' : 'text', subBuilder: Text.create)
    ..aOM<Image>(2, _omitFieldNames ? '' : 'image', subBuilder: Image.create)
    ..aOM<Video>(3, _omitFieldNames ? '' : 'video', subBuilder: Video.create)
    ..aOM<File>(4, _omitFieldNames ? '' : 'file', subBuilder: File.create)
    ..aOM<SystemMsg>(5, _omitFieldNames ? '' : 'system',
        subBuilder: SystemMsg.create)
    ..aOM<Audio>(6, _omitFieldNames ? '' : 'audio', subBuilder: Audio.create)
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
  @$pb.TagNumber(6)
  ChatPayload_Content whichContent() =>
      _ChatPayload_ContentByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  void clearContent() => $_clearField($_whichOneof(0));

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

  @$pb.TagNumber(6)
  Audio get audio => $_getN(5);
  @$pb.TagNumber(6)
  set audio(Audio value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasAudio() => $_has(5);
  @$pb.TagNumber(6)
  void clearAudio() => $_clearField(6);
  @$pb.TagNumber(6)
  Audio ensureAudio() => $_ensure(5);
}

class C_Chat extends $pb.GeneratedMessage {
  factory C_Chat({
    $core.String? convId,
    $core.int? clientMsgId,
    ChatPayload? payload,
    $fixnum.Int64? tsClient,
    $fixnum.Int64? replyToSeq,
    $core.String? gcsPath,
    $core.Iterable<$core.String>? mentionedUserIds,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (clientMsgId != null) result.clientMsgId = clientMsgId;
    if (payload != null) result.payload = payload;
    if (tsClient != null) result.tsClient = tsClient;
    if (replyToSeq != null) result.replyToSeq = replyToSeq;
    if (gcsPath != null) result.gcsPath = gcsPath;
    if (mentionedUserIds != null)
      result.mentionedUserIds.addAll(mentionedUserIds);
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
    ..aI(2, _omitFieldNames ? '' : 'clientMsgId')
    ..aOM<ChatPayload>(3, _omitFieldNames ? '' : 'payload',
        subBuilder: ChatPayload.create)
    ..aInt64(4, _omitFieldNames ? '' : 'tsClient')
    ..aInt64(5, _omitFieldNames ? '' : 'replyToSeq')
    ..aOS(6, _omitFieldNames ? '' : 'gcsPath')
    ..pPS(7, _omitFieldNames ? '' : 'mentionedUserIds')
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
  $core.int get clientMsgId => $_getIZ(1);
  @$pb.TagNumber(2)
  set clientMsgId($core.int value) => $_setSignedInt32(1, value);
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

  @$pb.TagNumber(5)
  $fixnum.Int64 get replyToSeq => $_getI64(4);
  @$pb.TagNumber(5)
  set replyToSeq($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReplyToSeq() => $_has(4);
  @$pb.TagNumber(5)
  void clearReplyToSeq() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get gcsPath => $_getSZ(5);
  @$pb.TagNumber(6)
  set gcsPath($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasGcsPath() => $_has(5);
  @$pb.TagNumber(6)
  void clearGcsPath() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get mentionedUserIds => $_getList(6);
}

class S_Chat extends $pb.GeneratedMessage {
  factory S_Chat({
    $core.String? convId,
    $core.int? clientMsgId,
    $fixnum.Int64? msgSeq,
    $core.String? senderId,
    $core.String? senderName,
    ChatPayload? payload,
    $fixnum.Int64? tsServer,
    $fixnum.Int64? replyToSeq,
    $core.String? replyToSenderName,
    $core.String? replyToText,
    $core.bool? isDeleted,
    $core.bool? isEdited,
    $core.int? unreadCount,
    $fixnum.Int64? fileExpiresAt,
    $core.String? fileStatus,
    $core.Iterable<$core.String>? mentionedUserIds,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (clientMsgId != null) result.clientMsgId = clientMsgId;
    if (msgSeq != null) result.msgSeq = msgSeq;
    if (senderId != null) result.senderId = senderId;
    if (senderName != null) result.senderName = senderName;
    if (payload != null) result.payload = payload;
    if (tsServer != null) result.tsServer = tsServer;
    if (replyToSeq != null) result.replyToSeq = replyToSeq;
    if (replyToSenderName != null) result.replyToSenderName = replyToSenderName;
    if (replyToText != null) result.replyToText = replyToText;
    if (isDeleted != null) result.isDeleted = isDeleted;
    if (isEdited != null) result.isEdited = isEdited;
    if (unreadCount != null) result.unreadCount = unreadCount;
    if (fileExpiresAt != null) result.fileExpiresAt = fileExpiresAt;
    if (fileStatus != null) result.fileStatus = fileStatus;
    if (mentionedUserIds != null)
      result.mentionedUserIds.addAll(mentionedUserIds);
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
    ..aI(2, _omitFieldNames ? '' : 'clientMsgId')
    ..aInt64(3, _omitFieldNames ? '' : 'msgSeq')
    ..aOS(4, _omitFieldNames ? '' : 'senderId')
    ..aOS(5, _omitFieldNames ? '' : 'senderName')
    ..aOM<ChatPayload>(6, _omitFieldNames ? '' : 'payload',
        subBuilder: ChatPayload.create)
    ..aInt64(7, _omitFieldNames ? '' : 'tsServer')
    ..aInt64(8, _omitFieldNames ? '' : 'replyToSeq')
    ..aOS(9, _omitFieldNames ? '' : 'replyToSenderName')
    ..aOS(10, _omitFieldNames ? '' : 'replyToText')
    ..aOB(11, _omitFieldNames ? '' : 'isDeleted')
    ..aOB(12, _omitFieldNames ? '' : 'isEdited')
    ..aI(13, _omitFieldNames ? '' : 'unreadCount')
    ..aInt64(14, _omitFieldNames ? '' : 'fileExpiresAt')
    ..aOS(15, _omitFieldNames ? '' : 'fileStatus')
    ..pPS(16, _omitFieldNames ? '' : 'mentionedUserIds')
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
  $core.int get clientMsgId => $_getIZ(1);
  @$pb.TagNumber(2)
  set clientMsgId($core.int value) => $_setSignedInt32(1, value);
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

  @$pb.TagNumber(8)
  $fixnum.Int64 get replyToSeq => $_getI64(7);
  @$pb.TagNumber(8)
  set replyToSeq($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasReplyToSeq() => $_has(7);
  @$pb.TagNumber(8)
  void clearReplyToSeq() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get replyToSenderName => $_getSZ(8);
  @$pb.TagNumber(9)
  set replyToSenderName($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasReplyToSenderName() => $_has(8);
  @$pb.TagNumber(9)
  void clearReplyToSenderName() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get replyToText => $_getSZ(9);
  @$pb.TagNumber(10)
  set replyToText($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasReplyToText() => $_has(9);
  @$pb.TagNumber(10)
  void clearReplyToText() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isDeleted => $_getBF(10);
  @$pb.TagNumber(11)
  set isDeleted($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasIsDeleted() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsDeleted() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get isEdited => $_getBF(11);
  @$pb.TagNumber(12)
  set isEdited($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasIsEdited() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsEdited() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get unreadCount => $_getIZ(12);
  @$pb.TagNumber(13)
  set unreadCount($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasUnreadCount() => $_has(12);
  @$pb.TagNumber(13)
  void clearUnreadCount() => $_clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get fileExpiresAt => $_getI64(13);
  @$pb.TagNumber(14)
  set fileExpiresAt($fixnum.Int64 value) => $_setInt64(13, value);
  @$pb.TagNumber(14)
  $core.bool hasFileExpiresAt() => $_has(13);
  @$pb.TagNumber(14)
  void clearFileExpiresAt() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get fileStatus => $_getSZ(14);
  @$pb.TagNumber(15)
  set fileStatus($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasFileStatus() => $_has(14);
  @$pb.TagNumber(15)
  void clearFileStatus() => $_clearField(15);

  @$pb.TagNumber(16)
  $pb.PbList<$core.String> get mentionedUserIds => $_getList(15);
}

class C_ReadReceipt extends $pb.GeneratedMessage {
  factory C_ReadReceipt({
    $core.String? convId,
    $fixnum.Int64? lastReadSeq,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (lastReadSeq != null) result.lastReadSeq = lastReadSeq;
    return result;
  }

  C_ReadReceipt._();

  factory C_ReadReceipt.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_ReadReceipt.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_ReadReceipt',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aInt64(2, _omitFieldNames ? '' : 'lastReadSeq')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_ReadReceipt clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_ReadReceipt copyWith(void Function(C_ReadReceipt) updates) =>
      super.copyWith((message) => updates(message as C_ReadReceipt))
          as C_ReadReceipt;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_ReadReceipt create() => C_ReadReceipt._();
  @$core.override
  C_ReadReceipt createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_ReadReceipt getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_ReadReceipt>(create);
  static C_ReadReceipt? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get convId => $_getSZ(0);
  @$pb.TagNumber(1)
  set convId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConvId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastReadSeq => $_getI64(1);
  @$pb.TagNumber(2)
  set lastReadSeq($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLastReadSeq() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastReadSeq() => $_clearField(2);
}

class S_ReadReceipt extends $pb.GeneratedMessage {
  factory S_ReadReceipt({
    $core.String? convId,
    $core.String? readerId,
    $fixnum.Int64? lastReadSeq,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (readerId != null) result.readerId = readerId;
    if (lastReadSeq != null) result.lastReadSeq = lastReadSeq;
    return result;
  }

  S_ReadReceipt._();

  factory S_ReadReceipt.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_ReadReceipt.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_ReadReceipt',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aOS(2, _omitFieldNames ? '' : 'readerId')
    ..aInt64(3, _omitFieldNames ? '' : 'lastReadSeq')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_ReadReceipt clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_ReadReceipt copyWith(void Function(S_ReadReceipt) updates) =>
      super.copyWith((message) => updates(message as S_ReadReceipt))
          as S_ReadReceipt;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_ReadReceipt create() => S_ReadReceipt._();
  @$core.override
  S_ReadReceipt createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_ReadReceipt getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_ReadReceipt>(create);
  static S_ReadReceipt? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get convId => $_getSZ(0);
  @$pb.TagNumber(1)
  set convId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConvId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get readerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set readerId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReaderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReaderId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastReadSeq => $_getI64(2);
  @$pb.TagNumber(3)
  set lastReadSeq($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLastReadSeq() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastReadSeq() => $_clearField(3);
}

class C_DeleteMessage extends $pb.GeneratedMessage {
  factory C_DeleteMessage({
    $core.String? convId,
    $fixnum.Int64? msgSeq,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (msgSeq != null) result.msgSeq = msgSeq;
    return result;
  }

  C_DeleteMessage._();

  factory C_DeleteMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_DeleteMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_DeleteMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aInt64(2, _omitFieldNames ? '' : 'msgSeq')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_DeleteMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_DeleteMessage copyWith(void Function(C_DeleteMessage) updates) =>
      super.copyWith((message) => updates(message as C_DeleteMessage))
          as C_DeleteMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_DeleteMessage create() => C_DeleteMessage._();
  @$core.override
  C_DeleteMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_DeleteMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_DeleteMessage>(create);
  static C_DeleteMessage? _defaultInstance;

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

class S_DeleteMessage extends $pb.GeneratedMessage {
  factory S_DeleteMessage({
    $core.bool? success,
    $core.String? convId,
    $fixnum.Int64? msgSeq,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (convId != null) result.convId = convId;
    if (msgSeq != null) result.msgSeq = msgSeq;
    return result;
  }

  S_DeleteMessage._();

  factory S_DeleteMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_DeleteMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_DeleteMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'convId')
    ..aInt64(3, _omitFieldNames ? '' : 'msgSeq')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_DeleteMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_DeleteMessage copyWith(void Function(S_DeleteMessage) updates) =>
      super.copyWith((message) => updates(message as S_DeleteMessage))
          as S_DeleteMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_DeleteMessage create() => S_DeleteMessage._();
  @$core.override
  S_DeleteMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_DeleteMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_DeleteMessage>(create);
  static S_DeleteMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get convId => $_getSZ(1);
  @$pb.TagNumber(2)
  set convId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConvId() => $_has(1);
  @$pb.TagNumber(2)
  void clearConvId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get msgSeq => $_getI64(2);
  @$pb.TagNumber(3)
  set msgSeq($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMsgSeq() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsgSeq() => $_clearField(3);
}

class C_EditMessage extends $pb.GeneratedMessage {
  factory C_EditMessage({
    $core.String? convId,
    $fixnum.Int64? msgSeq,
    $core.String? newText,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (msgSeq != null) result.msgSeq = msgSeq;
    if (newText != null) result.newText = newText;
    return result;
  }

  C_EditMessage._();

  factory C_EditMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_EditMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_EditMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aInt64(2, _omitFieldNames ? '' : 'msgSeq')
    ..aOS(3, _omitFieldNames ? '' : 'newText')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_EditMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_EditMessage copyWith(void Function(C_EditMessage) updates) =>
      super.copyWith((message) => updates(message as C_EditMessage))
          as C_EditMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_EditMessage create() => C_EditMessage._();
  @$core.override
  C_EditMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_EditMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_EditMessage>(create);
  static C_EditMessage? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.String get newText => $_getSZ(2);
  @$pb.TagNumber(3)
  set newText($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNewText() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewText() => $_clearField(3);
}

class S_EditMessage extends $pb.GeneratedMessage {
  factory S_EditMessage({
    $core.bool? success,
    $core.String? convId,
    $fixnum.Int64? msgSeq,
    $core.String? newText,
    $fixnum.Int64? editedAt,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (convId != null) result.convId = convId;
    if (msgSeq != null) result.msgSeq = msgSeq;
    if (newText != null) result.newText = newText;
    if (editedAt != null) result.editedAt = editedAt;
    return result;
  }

  S_EditMessage._();

  factory S_EditMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_EditMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_EditMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'convId')
    ..aInt64(3, _omitFieldNames ? '' : 'msgSeq')
    ..aOS(4, _omitFieldNames ? '' : 'newText')
    ..aInt64(5, _omitFieldNames ? '' : 'editedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_EditMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_EditMessage copyWith(void Function(S_EditMessage) updates) =>
      super.copyWith((message) => updates(message as S_EditMessage))
          as S_EditMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_EditMessage create() => S_EditMessage._();
  @$core.override
  S_EditMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_EditMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_EditMessage>(create);
  static S_EditMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get convId => $_getSZ(1);
  @$pb.TagNumber(2)
  set convId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConvId() => $_has(1);
  @$pb.TagNumber(2)
  void clearConvId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get msgSeq => $_getI64(2);
  @$pb.TagNumber(3)
  set msgSeq($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMsgSeq() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsgSeq() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get newText => $_getSZ(3);
  @$pb.TagNumber(4)
  set newText($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNewText() => $_has(3);
  @$pb.TagNumber(4)
  void clearNewText() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get editedAt => $_getI64(4);
  @$pb.TagNumber(5)
  set editedAt($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEditedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearEditedAt() => $_clearField(5);
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
    $fixnum.Int64? fileRetentionExpiresAt,
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
    if (fileRetentionExpiresAt != null)
      result.fileRetentionExpiresAt = fileRetentionExpiresAt;
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
    ..aInt64(10, _omitFieldNames ? '' : 'fileRetentionExpiresAt')
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

  @$pb.TagNumber(10)
  $fixnum.Int64 get fileRetentionExpiresAt => $_getI64(9);
  @$pb.TagNumber(10)
  set fileRetentionExpiresAt($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasFileRetentionExpiresAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearFileRetentionExpiresAt() => $_clearField(10);
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
    $fixnum.Int64? lastReadSeq,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (messages != null) result.messages.addAll(messages);
    if (unreadCount != null) result.unreadCount = unreadCount;
    if (lastReadSeq != null) result.lastReadSeq = lastReadSeq;
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
    ..aInt64(4, _omitFieldNames ? '' : 'lastReadSeq')
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

  @$pb.TagNumber(4)
  $fixnum.Int64 get lastReadSeq => $_getI64(3);
  @$pb.TagNumber(4)
  set lastReadSeq($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLastReadSeq() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastReadSeq() => $_clearField(4);
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

class C_GetSubscription extends $pb.GeneratedMessage {
  factory C_GetSubscription() => create();

  C_GetSubscription._();

  factory C_GetSubscription.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_GetSubscription.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_GetSubscription',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GetSubscription clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GetSubscription copyWith(void Function(C_GetSubscription) updates) =>
      super.copyWith((message) => updates(message as C_GetSubscription))
          as C_GetSubscription;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_GetSubscription create() => C_GetSubscription._();
  @$core.override
  C_GetSubscription createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_GetSubscription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_GetSubscription>(create);
  static C_GetSubscription? _defaultInstance;
}

class SubscriptionPlan extends $pb.GeneratedMessage {
  factory SubscriptionPlan({
    $core.int? planId,
    $core.String? planType,
    $core.String? name,
    $core.int? grade,
    $fixnum.Int64? storageBytes,
    $fixnum.Int64? maxFileSize,
    $fixnum.Int64? monthlyPrice,
    $core.Iterable<$core.String>? features,
  }) {
    final result = create();
    if (planId != null) result.planId = planId;
    if (planType != null) result.planType = planType;
    if (name != null) result.name = name;
    if (grade != null) result.grade = grade;
    if (storageBytes != null) result.storageBytes = storageBytes;
    if (maxFileSize != null) result.maxFileSize = maxFileSize;
    if (monthlyPrice != null) result.monthlyPrice = monthlyPrice;
    if (features != null) result.features.addAll(features);
    return result;
  }

  SubscriptionPlan._();

  factory SubscriptionPlan.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubscriptionPlan.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubscriptionPlan',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'planId')
    ..aOS(2, _omitFieldNames ? '' : 'planType')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aI(4, _omitFieldNames ? '' : 'grade')
    ..aInt64(5, _omitFieldNames ? '' : 'storageBytes')
    ..aInt64(6, _omitFieldNames ? '' : 'maxFileSize')
    ..aInt64(7, _omitFieldNames ? '' : 'monthlyPrice')
    ..pPS(8, _omitFieldNames ? '' : 'features')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubscriptionPlan clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubscriptionPlan copyWith(void Function(SubscriptionPlan) updates) =>
      super.copyWith((message) => updates(message as SubscriptionPlan))
          as SubscriptionPlan;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscriptionPlan create() => SubscriptionPlan._();
  @$core.override
  SubscriptionPlan createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubscriptionPlan getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscriptionPlan>(create);
  static SubscriptionPlan? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get planId => $_getIZ(0);
  @$pb.TagNumber(1)
  set planId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPlanId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlanId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get planType => $_getSZ(1);
  @$pb.TagNumber(2)
  set planType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPlanType() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlanType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get grade => $_getIZ(3);
  @$pb.TagNumber(4)
  set grade($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGrade() => $_has(3);
  @$pb.TagNumber(4)
  void clearGrade() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get storageBytes => $_getI64(4);
  @$pb.TagNumber(5)
  set storageBytes($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStorageBytes() => $_has(4);
  @$pb.TagNumber(5)
  void clearStorageBytes() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get maxFileSize => $_getI64(5);
  @$pb.TagNumber(6)
  set maxFileSize($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMaxFileSize() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaxFileSize() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get monthlyPrice => $_getI64(6);
  @$pb.TagNumber(7)
  set monthlyPrice($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMonthlyPrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearMonthlyPrice() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbList<$core.String> get features => $_getList(7);
}

class S_GetSubscription extends $pb.GeneratedMessage {
  factory S_GetSubscription({
    $core.bool? success,
    $core.int? currentGrade,
    $core.String? currentPlanName,
    $fixnum.Int64? storageCapacityBytes,
    $fixnum.Int64? storageUsageBytes,
    $fixnum.Int64? expiresAt,
    $core.bool? autoRenew,
    $core.Iterable<SubscriptionPlan>? availablePlans,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (currentGrade != null) result.currentGrade = currentGrade;
    if (currentPlanName != null) result.currentPlanName = currentPlanName;
    if (storageCapacityBytes != null)
      result.storageCapacityBytes = storageCapacityBytes;
    if (storageUsageBytes != null) result.storageUsageBytes = storageUsageBytes;
    if (expiresAt != null) result.expiresAt = expiresAt;
    if (autoRenew != null) result.autoRenew = autoRenew;
    if (availablePlans != null) result.availablePlans.addAll(availablePlans);
    return result;
  }

  S_GetSubscription._();

  factory S_GetSubscription.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_GetSubscription.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_GetSubscription',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aI(2, _omitFieldNames ? '' : 'currentGrade')
    ..aOS(3, _omitFieldNames ? '' : 'currentPlanName')
    ..aInt64(4, _omitFieldNames ? '' : 'storageCapacityBytes')
    ..aInt64(5, _omitFieldNames ? '' : 'storageUsageBytes')
    ..aInt64(6, _omitFieldNames ? '' : 'expiresAt')
    ..aOB(7, _omitFieldNames ? '' : 'autoRenew')
    ..pPM<SubscriptionPlan>(8, _omitFieldNames ? '' : 'availablePlans',
        subBuilder: SubscriptionPlan.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GetSubscription clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GetSubscription copyWith(void Function(S_GetSubscription) updates) =>
      super.copyWith((message) => updates(message as S_GetSubscription))
          as S_GetSubscription;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_GetSubscription create() => S_GetSubscription._();
  @$core.override
  S_GetSubscription createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_GetSubscription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_GetSubscription>(create);
  static S_GetSubscription? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get currentGrade => $_getIZ(1);
  @$pb.TagNumber(2)
  set currentGrade($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCurrentGrade() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentGrade() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get currentPlanName => $_getSZ(2);
  @$pb.TagNumber(3)
  set currentPlanName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCurrentPlanName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentPlanName() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get storageCapacityBytes => $_getI64(3);
  @$pb.TagNumber(4)
  set storageCapacityBytes($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStorageCapacityBytes() => $_has(3);
  @$pb.TagNumber(4)
  void clearStorageCapacityBytes() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get storageUsageBytes => $_getI64(4);
  @$pb.TagNumber(5)
  set storageUsageBytes($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStorageUsageBytes() => $_has(4);
  @$pb.TagNumber(5)
  void clearStorageUsageBytes() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get expiresAt => $_getI64(5);
  @$pb.TagNumber(6)
  set expiresAt($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasExpiresAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpiresAt() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get autoRenew => $_getBF(6);
  @$pb.TagNumber(7)
  set autoRenew($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAutoRenew() => $_has(6);
  @$pb.TagNumber(7)
  void clearAutoRenew() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbList<SubscriptionPlan> get availablePlans => $_getList(7);
}

class C_VerifyPurchase extends $pb.GeneratedMessage {
  factory C_VerifyPurchase({
    $core.String? platform,
    $core.String? productId,
    $core.String? transactionId,
    $core.String? purchaseToken,
  }) {
    final result = create();
    if (platform != null) result.platform = platform;
    if (productId != null) result.productId = productId;
    if (transactionId != null) result.transactionId = transactionId;
    if (purchaseToken != null) result.purchaseToken = purchaseToken;
    return result;
  }

  C_VerifyPurchase._();

  factory C_VerifyPurchase.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_VerifyPurchase.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_VerifyPurchase',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'platform')
    ..aOS(2, _omitFieldNames ? '' : 'productId')
    ..aOS(3, _omitFieldNames ? '' : 'transactionId')
    ..aOS(4, _omitFieldNames ? '' : 'purchaseToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_VerifyPurchase clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_VerifyPurchase copyWith(void Function(C_VerifyPurchase) updates) =>
      super.copyWith((message) => updates(message as C_VerifyPurchase))
          as C_VerifyPurchase;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_VerifyPurchase create() => C_VerifyPurchase._();
  @$core.override
  C_VerifyPurchase createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_VerifyPurchase getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_VerifyPurchase>(create);
  static C_VerifyPurchase? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get platform => $_getSZ(0);
  @$pb.TagNumber(1)
  set platform($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPlatform() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlatform() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get productId => $_getSZ(1);
  @$pb.TagNumber(2)
  set productId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProductId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProductId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get transactionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set transactionId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTransactionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransactionId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get purchaseToken => $_getSZ(3);
  @$pb.TagNumber(4)
  set purchaseToken($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPurchaseToken() => $_has(3);
  @$pb.TagNumber(4)
  void clearPurchaseToken() => $_clearField(4);
}

class S_VerifyPurchase extends $pb.GeneratedMessage {
  factory S_VerifyPurchase({
    $core.bool? success,
    $core.String? message,
    $core.int? newGrade,
    $fixnum.Int64? expiresAt,
    $fixnum.Int64? storageCapacity,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (newGrade != null) result.newGrade = newGrade;
    if (expiresAt != null) result.expiresAt = expiresAt;
    if (storageCapacity != null) result.storageCapacity = storageCapacity;
    return result;
  }

  S_VerifyPurchase._();

  factory S_VerifyPurchase.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_VerifyPurchase.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_VerifyPurchase',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aI(3, _omitFieldNames ? '' : 'newGrade')
    ..aInt64(4, _omitFieldNames ? '' : 'expiresAt')
    ..aInt64(5, _omitFieldNames ? '' : 'storageCapacity')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_VerifyPurchase clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_VerifyPurchase copyWith(void Function(S_VerifyPurchase) updates) =>
      super.copyWith((message) => updates(message as S_VerifyPurchase))
          as S_VerifyPurchase;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_VerifyPurchase create() => S_VerifyPurchase._();
  @$core.override
  S_VerifyPurchase createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_VerifyPurchase getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_VerifyPurchase>(create);
  static S_VerifyPurchase? _defaultInstance;

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
  $core.int get newGrade => $_getIZ(2);
  @$pb.TagNumber(3)
  set newGrade($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNewGrade() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewGrade() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get expiresAt => $_getI64(3);
  @$pb.TagNumber(4)
  set expiresAt($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpiresAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpiresAt() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get storageCapacity => $_getI64(4);
  @$pb.TagNumber(5)
  set storageCapacity($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStorageCapacity() => $_has(4);
  @$pb.TagNumber(5)
  void clearStorageCapacity() => $_clearField(5);
}

class C_CancelSubscription extends $pb.GeneratedMessage {
  factory C_CancelSubscription() => create();

  C_CancelSubscription._();

  factory C_CancelSubscription.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_CancelSubscription.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_CancelSubscription',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_CancelSubscription clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_CancelSubscription copyWith(void Function(C_CancelSubscription) updates) =>
      super.copyWith((message) => updates(message as C_CancelSubscription))
          as C_CancelSubscription;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_CancelSubscription create() => C_CancelSubscription._();
  @$core.override
  C_CancelSubscription createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_CancelSubscription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_CancelSubscription>(create);
  static C_CancelSubscription? _defaultInstance;
}

class S_CancelSubscription extends $pb.GeneratedMessage {
  factory S_CancelSubscription({
    $core.bool? success,
    $core.String? message,
    $fixnum.Int64? graceExpiresAt,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (graceExpiresAt != null) result.graceExpiresAt = graceExpiresAt;
    return result;
  }

  S_CancelSubscription._();

  factory S_CancelSubscription.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_CancelSubscription.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_CancelSubscription',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aInt64(3, _omitFieldNames ? '' : 'graceExpiresAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_CancelSubscription clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_CancelSubscription copyWith(void Function(S_CancelSubscription) updates) =>
      super.copyWith((message) => updates(message as S_CancelSubscription))
          as S_CancelSubscription;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_CancelSubscription create() => S_CancelSubscription._();
  @$core.override
  S_CancelSubscription createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_CancelSubscription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_CancelSubscription>(create);
  static S_CancelSubscription? _defaultInstance;

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
  $fixnum.Int64 get graceExpiresAt => $_getI64(2);
  @$pb.TagNumber(3)
  set graceExpiresAt($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGraceExpiresAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearGraceExpiresAt() => $_clearField(3);
}

class C_Withdraw extends $pb.GeneratedMessage {
  factory C_Withdraw({
    $core.String? password,
    $core.String? reason,
  }) {
    final result = create();
    if (password != null) result.password = password;
    if (reason != null) result.reason = reason;
    return result;
  }

  C_Withdraw._();

  factory C_Withdraw.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_Withdraw.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_Withdraw',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'password')
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_Withdraw clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_Withdraw copyWith(void Function(C_Withdraw) updates) =>
      super.copyWith((message) => updates(message as C_Withdraw)) as C_Withdraw;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_Withdraw create() => C_Withdraw._();
  @$core.override
  C_Withdraw createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_Withdraw getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_Withdraw>(create);
  static C_Withdraw? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get password => $_getSZ(0);
  @$pb.TagNumber(1)
  set password($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPassword() => $_has(0);
  @$pb.TagNumber(1)
  void clearPassword() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => $_clearField(2);
}

class S_Withdraw extends $pb.GeneratedMessage {
  factory S_Withdraw({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  S_Withdraw._();

  factory S_Withdraw.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_Withdraw.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_Withdraw',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_Withdraw clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_Withdraw copyWith(void Function(S_Withdraw) updates) =>
      super.copyWith((message) => updates(message as S_Withdraw)) as S_Withdraw;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_Withdraw create() => S_Withdraw._();
  @$core.override
  S_Withdraw createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_Withdraw getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_Withdraw>(create);
  static S_Withdraw? _defaultInstance;

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
    UserInfo? userInfo,
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
    ..aOM<UserInfo>(2, _omitFieldNames ? '' : 'userInfo',
        subBuilder: UserInfo.create)
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
  UserInfo get userInfo => $_getN(1);
  @$pb.TagNumber(2)
  set userInfo(UserInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUserInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  UserInfo ensureUserInfo() => $_ensure(1);

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

class FriendRequest extends $pb.GeneratedMessage {
  factory FriendRequest({
    UserInfo? requester,
    $fixnum.Int64? requestedAt,
    $core.bool? isReceived,
  }) {
    final result = create();
    if (requester != null) result.requester = requester;
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
    ..aOM<UserInfo>(1, _omitFieldNames ? '' : 'requester',
        subBuilder: UserInfo.create)
    ..aInt64(2, _omitFieldNames ? '' : 'requestedAt')
    ..aOB(3, _omitFieldNames ? '' : 'isReceived')
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
  UserInfo get requester => $_getN(0);
  @$pb.TagNumber(1)
  set requester(UserInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRequester() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequester() => $_clearField(1);
  @$pb.TagNumber(1)
  UserInfo ensureRequester() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get requestedAt => $_getI64(1);
  @$pb.TagNumber(2)
  set requestedAt($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRequestedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestedAt() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isReceived => $_getBF(2);
  @$pb.TagNumber(3)
  set isReceived($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsReceived() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsReceived() => $_clearField(3);
}

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
    UserInfo? updatedFriend,
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
    ..aOM<UserInfo>(3, _omitFieldNames ? '' : 'updatedFriend',
        subBuilder: UserInfo.create)
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
  UserInfo get updatedFriend => $_getN(2);
  @$pb.TagNumber(3)
  set updatedFriend(UserInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdatedFriend() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedFriend() => $_clearField(3);
  @$pb.TagNumber(3)
  UserInfo ensureUpdatedFriend() => $_ensure(2);
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
    $core.Iterable<UserInfo>? friends,
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
    ..pPM<UserInfo>(1, _omitFieldNames ? '' : 'friends',
        subBuilder: UserInfo.create)
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
  $pb.PbList<UserInfo> get friends => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<FriendRequest> get receivedRequests => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<FriendRequest> get sentRequests => $_getList(2);
}

class S_FriendPush extends $pb.GeneratedMessage {
  factory S_FriendPush({
    S_FriendPush_PushType? pushType,
    UserInfo? userInfo,
  }) {
    final result = create();
    if (pushType != null) result.pushType = pushType;
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
    ..aE<S_FriendPush_PushType>(1, _omitFieldNames ? '' : 'pushType',
        enumValues: S_FriendPush_PushType.values)
    ..aOM<UserInfo>(2, _omitFieldNames ? '' : 'userInfo',
        subBuilder: UserInfo.create)
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
  S_FriendPush_PushType get pushType => $_getN(0);
  @$pb.TagNumber(1)
  set pushType(S_FriendPush_PushType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPushType() => $_has(0);
  @$pb.TagNumber(1)
  void clearPushType() => $_clearField(1);

  @$pb.TagNumber(2)
  UserInfo get userInfo => $_getN(1);
  @$pb.TagNumber(2)
  set userInfo(UserInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUserInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  UserInfo ensureUserInfo() => $_ensure(1);
}

class GroupMemberInfo extends $pb.GeneratedMessage {
  factory GroupMemberInfo({
    UserInfo? userInfo,
    GroupRole? role,
    $fixnum.Int64? joinedAt,
  }) {
    final result = create();
    if (userInfo != null) result.userInfo = userInfo;
    if (role != null) result.role = role;
    if (joinedAt != null) result.joinedAt = joinedAt;
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
    ..aOM<UserInfo>(1, _omitFieldNames ? '' : 'userInfo',
        subBuilder: UserInfo.create)
    ..aE<GroupRole>(2, _omitFieldNames ? '' : 'role',
        enumValues: GroupRole.values)
    ..aInt64(3, _omitFieldNames ? '' : 'joinedAt')
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
  UserInfo get userInfo => $_getN(0);
  @$pb.TagNumber(1)
  set userInfo(UserInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUserInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  UserInfo ensureUserInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  GroupRole get role => $_getN(1);
  @$pb.TagNumber(2)
  set role(GroupRole value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get joinedAt => $_getI64(2);
  @$pb.TagNumber(3)
  set joinedAt($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasJoinedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearJoinedAt() => $_clearField(3);
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

  @$pb.TagNumber(6)
  $core.int get memberCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set memberCount($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMemberCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearMemberCount() => $_clearField(6);

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
    GroupInfo? group,
  }) {
    final result = create();
    if (success != null) result.success = success;
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
    ..aOM<GroupInfo>(2, _omitFieldNames ? '' : 'group',
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
  GroupInfo get group => $_getN(1);
  @$pb.TagNumber(2)
  set group(GroupInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasGroup() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroup() => $_clearField(2);
  @$pb.TagNumber(2)
  GroupInfo ensureGroup() => $_ensure(1);
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
  }) {
    final result = create();
    if (success != null) result.success = success;
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
    GroupInfo? group,
  }) {
    final result = create();
    if (success != null) result.success = success;
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
    ..aOM<GroupInfo>(2, _omitFieldNames ? '' : 'group',
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
  GroupInfo get group => $_getN(1);
  @$pb.TagNumber(2)
  set group(GroupInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasGroup() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroup() => $_clearField(2);
  @$pb.TagNumber(2)
  GroupInfo ensureGroup() => $_ensure(1);
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
  }) {
    final result = create();
    if (success != null) result.success = success;
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
}

class C_EditGroup extends $pb.GeneratedMessage {
  factory C_EditGroup({
    $core.String? groupId,
    $core.String? newName,
    $core.String? newDescription,
    $core.String? newImageUrl,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    if (newName != null) result.newName = newName;
    if (newDescription != null) result.newDescription = newDescription;
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
    ..aOS(3, _omitFieldNames ? '' : 'newDescription')
    ..aOS(4, _omitFieldNames ? '' : 'newImageUrl')
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
  $core.String get newDescription => $_getSZ(2);
  @$pb.TagNumber(3)
  set newDescription($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNewDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get newImageUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set newImageUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNewImageUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearNewImageUrl() => $_clearField(4);
}

class S_EditGroup extends $pb.GeneratedMessage {
  factory S_EditGroup({
    $core.bool? success,
    GroupInfo? group,
  }) {
    final result = create();
    if (success != null) result.success = success;
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
    ..aOM<GroupInfo>(2, _omitFieldNames ? '' : 'group',
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
  GroupInfo get group => $_getN(1);
  @$pb.TagNumber(2)
  set group(GroupInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasGroup() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroup() => $_clearField(2);
  @$pb.TagNumber(2)
  GroupInfo ensureGroup() => $_ensure(1);
}

class C_DeleteGroup extends $pb.GeneratedMessage {
  factory C_DeleteGroup({
    $core.String? groupId,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    return result;
  }

  C_DeleteGroup._();

  factory C_DeleteGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_DeleteGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_DeleteGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_DeleteGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_DeleteGroup copyWith(void Function(C_DeleteGroup) updates) =>
      super.copyWith((message) => updates(message as C_DeleteGroup))
          as C_DeleteGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_DeleteGroup create() => C_DeleteGroup._();
  @$core.override
  C_DeleteGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_DeleteGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_DeleteGroup>(create);
  static C_DeleteGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupId => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => $_clearField(1);
}

class S_DeleteGroup extends $pb.GeneratedMessage {
  factory S_DeleteGroup({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  S_DeleteGroup._();

  factory S_DeleteGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_DeleteGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_DeleteGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_DeleteGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_DeleteGroup copyWith(void Function(S_DeleteGroup) updates) =>
      super.copyWith((message) => updates(message as S_DeleteGroup))
          as S_DeleteGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_DeleteGroup create() => S_DeleteGroup._();
  @$core.override
  S_DeleteGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_DeleteGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_DeleteGroup>(create);
  static S_DeleteGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class BlockedUserInfo extends $pb.GeneratedMessage {
  factory BlockedUserInfo({
    $core.String? userId,
    $core.String? name,
    $core.String? profileImg,
    $fixnum.Int64? blockedAt,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (name != null) result.name = name;
    if (profileImg != null) result.profileImg = profileImg;
    if (blockedAt != null) result.blockedAt = blockedAt;
    return result;
  }

  BlockedUserInfo._();

  factory BlockedUserInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BlockedUserInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BlockedUserInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'profileImg')
    ..aInt64(4, _omitFieldNames ? '' : 'blockedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlockedUserInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlockedUserInfo copyWith(void Function(BlockedUserInfo) updates) =>
      super.copyWith((message) => updates(message as BlockedUserInfo))
          as BlockedUserInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockedUserInfo create() => BlockedUserInfo._();
  @$core.override
  BlockedUserInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BlockedUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BlockedUserInfo>(create);
  static BlockedUserInfo? _defaultInstance;

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
  $core.String get profileImg => $_getSZ(2);
  @$pb.TagNumber(3)
  set profileImg($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasProfileImg() => $_has(2);
  @$pb.TagNumber(3)
  void clearProfileImg() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get blockedAt => $_getI64(3);
  @$pb.TagNumber(4)
  set blockedAt($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBlockedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearBlockedAt() => $_clearField(4);
}

class C_BlockUser extends $pb.GeneratedMessage {
  factory C_BlockUser({
    $core.String? targetUserId,
  }) {
    final result = create();
    if (targetUserId != null) result.targetUserId = targetUserId;
    return result;
  }

  C_BlockUser._();

  factory C_BlockUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_BlockUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_BlockUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'targetUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_BlockUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_BlockUser copyWith(void Function(C_BlockUser) updates) =>
      super.copyWith((message) => updates(message as C_BlockUser))
          as C_BlockUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_BlockUser create() => C_BlockUser._();
  @$core.override
  C_BlockUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_BlockUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_BlockUser>(create);
  static C_BlockUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get targetUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set targetUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTargetUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetUserId() => $_clearField(1);
}

class S_BlockUser extends $pb.GeneratedMessage {
  factory S_BlockUser({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  S_BlockUser._();

  factory S_BlockUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_BlockUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_BlockUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_BlockUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_BlockUser copyWith(void Function(S_BlockUser) updates) =>
      super.copyWith((message) => updates(message as S_BlockUser))
          as S_BlockUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_BlockUser create() => S_BlockUser._();
  @$core.override
  S_BlockUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_BlockUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_BlockUser>(create);
  static S_BlockUser? _defaultInstance;

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

class C_UnblockUser extends $pb.GeneratedMessage {
  factory C_UnblockUser({
    $core.String? targetUserId,
  }) {
    final result = create();
    if (targetUserId != null) result.targetUserId = targetUserId;
    return result;
  }

  C_UnblockUser._();

  factory C_UnblockUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_UnblockUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_UnblockUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'targetUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_UnblockUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_UnblockUser copyWith(void Function(C_UnblockUser) updates) =>
      super.copyWith((message) => updates(message as C_UnblockUser))
          as C_UnblockUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_UnblockUser create() => C_UnblockUser._();
  @$core.override
  C_UnblockUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_UnblockUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_UnblockUser>(create);
  static C_UnblockUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get targetUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set targetUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTargetUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetUserId() => $_clearField(1);
}

class S_UnblockUser extends $pb.GeneratedMessage {
  factory S_UnblockUser({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  S_UnblockUser._();

  factory S_UnblockUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_UnblockUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_UnblockUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_UnblockUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_UnblockUser copyWith(void Function(S_UnblockUser) updates) =>
      super.copyWith((message) => updates(message as S_UnblockUser))
          as S_UnblockUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_UnblockUser create() => S_UnblockUser._();
  @$core.override
  S_UnblockUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_UnblockUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_UnblockUser>(create);
  static S_UnblockUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class C_GetBlockedList extends $pb.GeneratedMessage {
  factory C_GetBlockedList() => create();

  C_GetBlockedList._();

  factory C_GetBlockedList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_GetBlockedList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_GetBlockedList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GetBlockedList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_GetBlockedList copyWith(void Function(C_GetBlockedList) updates) =>
      super.copyWith((message) => updates(message as C_GetBlockedList))
          as C_GetBlockedList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_GetBlockedList create() => C_GetBlockedList._();
  @$core.override
  C_GetBlockedList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_GetBlockedList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_GetBlockedList>(create);
  static C_GetBlockedList? _defaultInstance;
}

class S_GetBlockedList extends $pb.GeneratedMessage {
  factory S_GetBlockedList({
    $core.Iterable<BlockedUserInfo>? blockedUsers,
  }) {
    final result = create();
    if (blockedUsers != null) result.blockedUsers.addAll(blockedUsers);
    return result;
  }

  S_GetBlockedList._();

  factory S_GetBlockedList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_GetBlockedList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_GetBlockedList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..pPM<BlockedUserInfo>(1, _omitFieldNames ? '' : 'blockedUsers',
        subBuilder: BlockedUserInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GetBlockedList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_GetBlockedList copyWith(void Function(S_GetBlockedList) updates) =>
      super.copyWith((message) => updates(message as S_GetBlockedList))
          as S_GetBlockedList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_GetBlockedList create() => S_GetBlockedList._();
  @$core.override
  S_GetBlockedList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_GetBlockedList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_GetBlockedList>(create);
  static S_GetBlockedList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BlockedUserInfo> get blockedUsers => $_getList(0);
}

class C_ReportUser extends $pb.GeneratedMessage {
  factory C_ReportUser({
    $core.String? targetUserId,
    $core.String? reason,
    $core.String? detail,
  }) {
    final result = create();
    if (targetUserId != null) result.targetUserId = targetUserId;
    if (reason != null) result.reason = reason;
    if (detail != null) result.detail = detail;
    return result;
  }

  C_ReportUser._();

  factory C_ReportUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_ReportUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_ReportUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'targetUserId')
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..aOS(3, _omitFieldNames ? '' : 'detail')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_ReportUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_ReportUser copyWith(void Function(C_ReportUser) updates) =>
      super.copyWith((message) => updates(message as C_ReportUser))
          as C_ReportUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_ReportUser create() => C_ReportUser._();
  @$core.override
  C_ReportUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_ReportUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_ReportUser>(create);
  static C_ReportUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get targetUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set targetUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTargetUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get detail => $_getSZ(2);
  @$pb.TagNumber(3)
  set detail($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDetail() => $_has(2);
  @$pb.TagNumber(3)
  void clearDetail() => $_clearField(3);
}

class S_ReportUser extends $pb.GeneratedMessage {
  factory S_ReportUser({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  S_ReportUser._();

  factory S_ReportUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_ReportUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_ReportUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_ReportUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_ReportUser copyWith(void Function(S_ReportUser) updates) =>
      super.copyWith((message) => updates(message as S_ReportUser))
          as S_ReportUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_ReportUser create() => S_ReportUser._();
  @$core.override
  S_ReportUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_ReportUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_ReportUser>(create);
  static S_ReportUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class C_AddReaction extends $pb.GeneratedMessage {
  factory C_AddReaction({
    $core.String? convId,
    $fixnum.Int64? msgSeq,
    $core.String? emoji,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (msgSeq != null) result.msgSeq = msgSeq;
    if (emoji != null) result.emoji = emoji;
    return result;
  }

  C_AddReaction._();

  factory C_AddReaction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_AddReaction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_AddReaction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aInt64(2, _omitFieldNames ? '' : 'msgSeq')
    ..aOS(3, _omitFieldNames ? '' : 'emoji')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_AddReaction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_AddReaction copyWith(void Function(C_AddReaction) updates) =>
      super.copyWith((message) => updates(message as C_AddReaction))
          as C_AddReaction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_AddReaction create() => C_AddReaction._();
  @$core.override
  C_AddReaction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_AddReaction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_AddReaction>(create);
  static C_AddReaction? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.String get emoji => $_getSZ(2);
  @$pb.TagNumber(3)
  set emoji($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEmoji() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmoji() => $_clearField(3);
}

class S_AddReaction extends $pb.GeneratedMessage {
  factory S_AddReaction({
    $core.String? convId,
    $fixnum.Int64? msgSeq,
    $core.String? userId,
    $core.String? emoji,
    $core.bool? removed,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (msgSeq != null) result.msgSeq = msgSeq;
    if (userId != null) result.userId = userId;
    if (emoji != null) result.emoji = emoji;
    if (removed != null) result.removed = removed;
    return result;
  }

  S_AddReaction._();

  factory S_AddReaction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_AddReaction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_AddReaction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aInt64(2, _omitFieldNames ? '' : 'msgSeq')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'emoji')
    ..aOB(5, _omitFieldNames ? '' : 'removed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_AddReaction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_AddReaction copyWith(void Function(S_AddReaction) updates) =>
      super.copyWith((message) => updates(message as S_AddReaction))
          as S_AddReaction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_AddReaction create() => S_AddReaction._();
  @$core.override
  S_AddReaction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_AddReaction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_AddReaction>(create);
  static S_AddReaction? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get emoji => $_getSZ(3);
  @$pb.TagNumber(4)
  set emoji($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEmoji() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmoji() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get removed => $_getBF(4);
  @$pb.TagNumber(5)
  set removed($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRemoved() => $_has(4);
  @$pb.TagNumber(5)
  void clearRemoved() => $_clearField(5);
}

class C_CreatePoll extends $pb.GeneratedMessage {
  factory C_CreatePoll({
    $core.String? convId,
    $core.String? question,
    $core.Iterable<$core.String>? options,
    $core.bool? isMultiSelect,
    $core.bool? isAnonymous,
    $fixnum.Int64? expiresAt,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (question != null) result.question = question;
    if (options != null) result.options.addAll(options);
    if (isMultiSelect != null) result.isMultiSelect = isMultiSelect;
    if (isAnonymous != null) result.isAnonymous = isAnonymous;
    if (expiresAt != null) result.expiresAt = expiresAt;
    return result;
  }

  C_CreatePoll._();

  factory C_CreatePoll.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_CreatePoll.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_CreatePoll',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aOS(2, _omitFieldNames ? '' : 'question')
    ..pPS(3, _omitFieldNames ? '' : 'options')
    ..aOB(4, _omitFieldNames ? '' : 'isMultiSelect')
    ..aOB(5, _omitFieldNames ? '' : 'isAnonymous')
    ..aInt64(6, _omitFieldNames ? '' : 'expiresAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_CreatePoll clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_CreatePoll copyWith(void Function(C_CreatePoll) updates) =>
      super.copyWith((message) => updates(message as C_CreatePoll))
          as C_CreatePoll;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_CreatePoll create() => C_CreatePoll._();
  @$core.override
  C_CreatePoll createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_CreatePoll getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_CreatePoll>(create);
  static C_CreatePoll? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get convId => $_getSZ(0);
  @$pb.TagNumber(1)
  set convId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConvId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get question => $_getSZ(1);
  @$pb.TagNumber(2)
  set question($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuestion() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuestion() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get options => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get isMultiSelect => $_getBF(3);
  @$pb.TagNumber(4)
  set isMultiSelect($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsMultiSelect() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsMultiSelect() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isAnonymous => $_getBF(4);
  @$pb.TagNumber(5)
  set isAnonymous($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsAnonymous() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsAnonymous() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get expiresAt => $_getI64(5);
  @$pb.TagNumber(6)
  set expiresAt($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasExpiresAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpiresAt() => $_clearField(6);
}

class S_CreatePoll extends $pb.GeneratedMessage {
  factory S_CreatePoll({
    $core.String? convId,
    $core.String? pollId,
    $fixnum.Int64? msgSeq,
    $core.String? creatorId,
    $core.String? creatorName,
    $core.String? question,
    $core.Iterable<$core.String>? options,
    $core.bool? isMultiSelect,
    $core.bool? isAnonymous,
    $fixnum.Int64? expiresAt,
    $fixnum.Int64? tsServer,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (pollId != null) result.pollId = pollId;
    if (msgSeq != null) result.msgSeq = msgSeq;
    if (creatorId != null) result.creatorId = creatorId;
    if (creatorName != null) result.creatorName = creatorName;
    if (question != null) result.question = question;
    if (options != null) result.options.addAll(options);
    if (isMultiSelect != null) result.isMultiSelect = isMultiSelect;
    if (isAnonymous != null) result.isAnonymous = isAnonymous;
    if (expiresAt != null) result.expiresAt = expiresAt;
    if (tsServer != null) result.tsServer = tsServer;
    return result;
  }

  S_CreatePoll._();

  factory S_CreatePoll.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_CreatePoll.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_CreatePoll',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aOS(2, _omitFieldNames ? '' : 'pollId')
    ..aInt64(3, _omitFieldNames ? '' : 'msgSeq')
    ..aOS(4, _omitFieldNames ? '' : 'creatorId')
    ..aOS(5, _omitFieldNames ? '' : 'creatorName')
    ..aOS(6, _omitFieldNames ? '' : 'question')
    ..pPS(7, _omitFieldNames ? '' : 'options')
    ..aOB(8, _omitFieldNames ? '' : 'isMultiSelect')
    ..aOB(9, _omitFieldNames ? '' : 'isAnonymous')
    ..aInt64(10, _omitFieldNames ? '' : 'expiresAt')
    ..aInt64(11, _omitFieldNames ? '' : 'tsServer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_CreatePoll clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_CreatePoll copyWith(void Function(S_CreatePoll) updates) =>
      super.copyWith((message) => updates(message as S_CreatePoll))
          as S_CreatePoll;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_CreatePoll create() => S_CreatePoll._();
  @$core.override
  S_CreatePoll createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_CreatePoll getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_CreatePoll>(create);
  static S_CreatePoll? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get convId => $_getSZ(0);
  @$pb.TagNumber(1)
  set convId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConvId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pollId => $_getSZ(1);
  @$pb.TagNumber(2)
  set pollId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPollId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPollId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get msgSeq => $_getI64(2);
  @$pb.TagNumber(3)
  set msgSeq($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMsgSeq() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsgSeq() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get creatorId => $_getSZ(3);
  @$pb.TagNumber(4)
  set creatorId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreatorId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatorId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get creatorName => $_getSZ(4);
  @$pb.TagNumber(5)
  set creatorName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCreatorName() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatorName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get question => $_getSZ(5);
  @$pb.TagNumber(6)
  set question($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasQuestion() => $_has(5);
  @$pb.TagNumber(6)
  void clearQuestion() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get options => $_getList(6);

  @$pb.TagNumber(8)
  $core.bool get isMultiSelect => $_getBF(7);
  @$pb.TagNumber(8)
  set isMultiSelect($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasIsMultiSelect() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsMultiSelect() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isAnonymous => $_getBF(8);
  @$pb.TagNumber(9)
  set isAnonymous($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasIsAnonymous() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsAnonymous() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get expiresAt => $_getI64(9);
  @$pb.TagNumber(10)
  set expiresAt($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasExpiresAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearExpiresAt() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get tsServer => $_getI64(10);
  @$pb.TagNumber(11)
  set tsServer($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasTsServer() => $_has(10);
  @$pb.TagNumber(11)
  void clearTsServer() => $_clearField(11);
}

class C_Vote extends $pb.GeneratedMessage {
  factory C_Vote({
    $core.String? convId,
    $core.String? pollId,
    $fixnum.Int64? msgSeq,
    $core.Iterable<$core.int>? selectedOptions,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (pollId != null) result.pollId = pollId;
    if (msgSeq != null) result.msgSeq = msgSeq;
    if (selectedOptions != null) result.selectedOptions.addAll(selectedOptions);
    return result;
  }

  C_Vote._();

  factory C_Vote.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_Vote.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_Vote',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aOS(2, _omitFieldNames ? '' : 'pollId')
    ..aInt64(3, _omitFieldNames ? '' : 'msgSeq')
    ..p<$core.int>(
        4, _omitFieldNames ? '' : 'selectedOptions', $pb.PbFieldType.K3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_Vote clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_Vote copyWith(void Function(C_Vote) updates) =>
      super.copyWith((message) => updates(message as C_Vote)) as C_Vote;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_Vote create() => C_Vote._();
  @$core.override
  C_Vote createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_Vote getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_Vote>(create);
  static C_Vote? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get convId => $_getSZ(0);
  @$pb.TagNumber(1)
  set convId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConvId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pollId => $_getSZ(1);
  @$pb.TagNumber(2)
  set pollId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPollId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPollId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get msgSeq => $_getI64(2);
  @$pb.TagNumber(3)
  set msgSeq($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMsgSeq() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsgSeq() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.int> get selectedOptions => $_getList(3);
}

class S_Vote extends $pb.GeneratedMessage {
  factory S_Vote({
    $core.String? convId,
    $core.String? pollId,
    $fixnum.Int64? msgSeq,
    $core.String? voterId,
    $core.String? voterName,
    $core.Iterable<$core.int>? selectedOptions,
    $core.String? votesJson,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (pollId != null) result.pollId = pollId;
    if (msgSeq != null) result.msgSeq = msgSeq;
    if (voterId != null) result.voterId = voterId;
    if (voterName != null) result.voterName = voterName;
    if (selectedOptions != null) result.selectedOptions.addAll(selectedOptions);
    if (votesJson != null) result.votesJson = votesJson;
    return result;
  }

  S_Vote._();

  factory S_Vote.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_Vote.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_Vote',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aOS(2, _omitFieldNames ? '' : 'pollId')
    ..aInt64(3, _omitFieldNames ? '' : 'msgSeq')
    ..aOS(4, _omitFieldNames ? '' : 'voterId')
    ..aOS(5, _omitFieldNames ? '' : 'voterName')
    ..p<$core.int>(
        6, _omitFieldNames ? '' : 'selectedOptions', $pb.PbFieldType.K3)
    ..aOS(7, _omitFieldNames ? '' : 'votesJson')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_Vote clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_Vote copyWith(void Function(S_Vote) updates) =>
      super.copyWith((message) => updates(message as S_Vote)) as S_Vote;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_Vote create() => S_Vote._();
  @$core.override
  S_Vote createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_Vote getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_Vote>(create);
  static S_Vote? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get convId => $_getSZ(0);
  @$pb.TagNumber(1)
  set convId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConvId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pollId => $_getSZ(1);
  @$pb.TagNumber(2)
  set pollId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPollId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPollId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get msgSeq => $_getI64(2);
  @$pb.TagNumber(3)
  set msgSeq($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMsgSeq() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsgSeq() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get voterId => $_getSZ(3);
  @$pb.TagNumber(4)
  set voterId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVoterId() => $_has(3);
  @$pb.TagNumber(4)
  void clearVoterId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get voterName => $_getSZ(4);
  @$pb.TagNumber(5)
  set voterName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVoterName() => $_has(4);
  @$pb.TagNumber(5)
  void clearVoterName() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.int> get selectedOptions => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get votesJson => $_getSZ(6);
  @$pb.TagNumber(7)
  set votesJson($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasVotesJson() => $_has(6);
  @$pb.TagNumber(7)
  void clearVotesJson() => $_clearField(7);
}

class C_ClosePoll extends $pb.GeneratedMessage {
  factory C_ClosePoll({
    $core.String? convId,
    $core.String? pollId,
    $fixnum.Int64? msgSeq,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (pollId != null) result.pollId = pollId;
    if (msgSeq != null) result.msgSeq = msgSeq;
    return result;
  }

  C_ClosePoll._();

  factory C_ClosePoll.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_ClosePoll.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_ClosePoll',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aOS(2, _omitFieldNames ? '' : 'pollId')
    ..aInt64(3, _omitFieldNames ? '' : 'msgSeq')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_ClosePoll clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_ClosePoll copyWith(void Function(C_ClosePoll) updates) =>
      super.copyWith((message) => updates(message as C_ClosePoll))
          as C_ClosePoll;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_ClosePoll create() => C_ClosePoll._();
  @$core.override
  C_ClosePoll createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_ClosePoll getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_ClosePoll>(create);
  static C_ClosePoll? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get convId => $_getSZ(0);
  @$pb.TagNumber(1)
  set convId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConvId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pollId => $_getSZ(1);
  @$pb.TagNumber(2)
  set pollId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPollId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPollId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get msgSeq => $_getI64(2);
  @$pb.TagNumber(3)
  set msgSeq($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMsgSeq() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsgSeq() => $_clearField(3);
}

class S_ClosePoll extends $pb.GeneratedMessage {
  factory S_ClosePoll({
    $core.String? convId,
    $core.String? pollId,
    $fixnum.Int64? msgSeq,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (pollId != null) result.pollId = pollId;
    if (msgSeq != null) result.msgSeq = msgSeq;
    return result;
  }

  S_ClosePoll._();

  factory S_ClosePoll.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_ClosePoll.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_ClosePoll',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aOS(2, _omitFieldNames ? '' : 'pollId')
    ..aInt64(3, _omitFieldNames ? '' : 'msgSeq')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_ClosePoll clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_ClosePoll copyWith(void Function(S_ClosePoll) updates) =>
      super.copyWith((message) => updates(message as S_ClosePoll))
          as S_ClosePoll;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_ClosePoll create() => S_ClosePoll._();
  @$core.override
  S_ClosePoll createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_ClosePoll getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_ClosePoll>(create);
  static S_ClosePoll? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get convId => $_getSZ(0);
  @$pb.TagNumber(1)
  set convId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConvId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pollId => $_getSZ(1);
  @$pb.TagNumber(2)
  set pollId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPollId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPollId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get msgSeq => $_getI64(2);
  @$pb.TagNumber(3)
  set msgSeq($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMsgSeq() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsgSeq() => $_clearField(3);
}

/// -------------
/// ANNOUNCEMENT (공지)
/// ---------------
class C_SetAnnouncement extends $pb.GeneratedMessage {
  factory C_SetAnnouncement({
    $core.String? convId,
    $fixnum.Int64? msgSeq,
    $core.String? text,
    $core.String? senderName,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (msgSeq != null) result.msgSeq = msgSeq;
    if (text != null) result.text = text;
    if (senderName != null) result.senderName = senderName;
    return result;
  }

  C_SetAnnouncement._();

  factory C_SetAnnouncement.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory C_SetAnnouncement.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'C_SetAnnouncement',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aInt64(2, _omitFieldNames ? '' : 'msgSeq')
    ..aOS(3, _omitFieldNames ? '' : 'text')
    ..aOS(4, _omitFieldNames ? '' : 'senderName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_SetAnnouncement clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  C_SetAnnouncement copyWith(void Function(C_SetAnnouncement) updates) =>
      super.copyWith((message) => updates(message as C_SetAnnouncement))
          as C_SetAnnouncement;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_SetAnnouncement create() => C_SetAnnouncement._();
  @$core.override
  C_SetAnnouncement createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static C_SetAnnouncement getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<C_SetAnnouncement>(create);
  static C_SetAnnouncement? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(2);
  @$pb.TagNumber(3)
  set text($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);
  @$pb.TagNumber(3)
  void clearText() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get senderName => $_getSZ(3);
  @$pb.TagNumber(4)
  set senderName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSenderName() => $_has(3);
  @$pb.TagNumber(4)
  void clearSenderName() => $_clearField(4);
}

class S_SetAnnouncement extends $pb.GeneratedMessage {
  factory S_SetAnnouncement({
    $core.String? convId,
    $fixnum.Int64? msgSeq,
    $core.String? text,
    $core.String? senderName,
    $core.String? setterId,
  }) {
    final result = create();
    if (convId != null) result.convId = convId;
    if (msgSeq != null) result.msgSeq = msgSeq;
    if (text != null) result.text = text;
    if (senderName != null) result.senderName = senderName;
    if (setterId != null) result.setterId = setterId;
    return result;
  }

  S_SetAnnouncement._();

  factory S_SetAnnouncement.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S_SetAnnouncement.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S_SetAnnouncement',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convId')
    ..aInt64(2, _omitFieldNames ? '' : 'msgSeq')
    ..aOS(3, _omitFieldNames ? '' : 'text')
    ..aOS(4, _omitFieldNames ? '' : 'senderName')
    ..aOS(5, _omitFieldNames ? '' : 'setterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_SetAnnouncement clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S_SetAnnouncement copyWith(void Function(S_SetAnnouncement) updates) =>
      super.copyWith((message) => updates(message as S_SetAnnouncement))
          as S_SetAnnouncement;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_SetAnnouncement create() => S_SetAnnouncement._();
  @$core.override
  S_SetAnnouncement createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static S_SetAnnouncement getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<S_SetAnnouncement>(create);
  static S_SetAnnouncement? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(2);
  @$pb.TagNumber(3)
  set text($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);
  @$pb.TagNumber(3)
  void clearText() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get senderName => $_getSZ(3);
  @$pb.TagNumber(4)
  set senderName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSenderName() => $_has(3);
  @$pb.TagNumber(4)
  void clearSenderName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get setterId => $_getSZ(4);
  @$pb.TagNumber(5)
  set setterId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSetterId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSetterId() => $_clearField(5);
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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
