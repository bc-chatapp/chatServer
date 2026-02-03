// This is a generated file - do not edit.
//
// Generated from protocol.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use groupRoleDescriptor instead')
const GroupRole$json = {
  '1': 'GroupRole',
  '2': [
    {'1': 'MEMBER', '2': 0},
    {'1': 'ADMIN', '2': 1},
    {'1': 'OWNER', '2': 2},
  ],
};

/// Descriptor for `GroupRole`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List groupRoleDescriptor = $convert.base64Decode(
    'CglHcm91cFJvbGUSCgoGTUVNQkVSEAASCQoFQURNSU4QARIJCgVPV05FUhAC');

@$core.Deprecated('Use errorCodeDescriptor instead')
const ErrorCode$json = {
  '1': 'ErrorCode',
  '2': [
    {'1': 'ERR_SUCCESS', '2': 0},
    {'1': 'ERR_UNKNOWN', '2': 1},
    {'1': 'ERR_SERVER_INTERNAL', '2': 2},
    {'1': 'ERR_INVALID_PACKET', '2': 3},
    {'1': 'ERR_VERSION_MISMATCH', '2': 4},
    {'1': 'ERR_UNAUTHORIZED', '2': 5},
    {'1': 'ERR_INVALID_TOKEN', '2': 6},
    {'1': 'ERR_USER_ID_EMPTY', '2': 100},
    {'1': 'ERR_USER_ID_REQUIRED', '2': 101},
    {'1': 'ERR_PASSWORD_REQUIRED', '2': 102},
    {'1': 'ERR_NAME_REQUIRED', '2': 103},
    {'1': 'ERR_EMAIL_REQUIRED', '2': 104},
    {'1': 'ERR_USER_NOT_FOUND', '2': 105},
    {'1': 'ERR_INVALID_PASSWORD', '2': 106},
    {'1': 'ERR_USER_ALREADY_EXISTS', '2': 107},
    {'1': 'ERR_EMAIL_ALREADY_EXISTS', '2': 108},
    {'1': 'ERR_PAYLOAD_EMPTY', '2': 200},
    {'1': 'ERR_INVALID_CONV_ID', '2': 201},
    {'1': 'ERR_INVALID_RECEIVER_ID', '2': 202},
    {'1': 'ERR_INVALID_ACK', '2': 203},
    {'1': 'ERR_INVALID_FRIEND_USER_ID', '2': 300},
    {'1': 'ERR_CANNOT_ADD_SELF', '2': 301},
    {'1': 'ERR_NOT_A_FRIEND', '2': 302},
    {'1': 'ERR_FRIEND_REQUEST_NOT_FOUND', '2': 303},
    {'1': 'ERR_FILE_SERVICE_NOT_INITIALIZED', '2': 400},
    {'1': 'ERR_CLOUD_STORAGE_NOT_INITIALIZED', '2': 401},
    {'1': 'ERR_FILENAME_REQUIRED', '2': 402},
    {'1': 'ERR_INVALID_FILE_SIZE', '2': 403},
    {'1': 'ERR_MIME_TYPE_REQUIRED', '2': 404},
    {'1': 'ERR_FAILED_TO_GENERATE_URL', '2': 405},
    {'1': 'ERR_INVALID_FILE_URL', '2': 406},
    {'1': 'ERR_INVALID_ARGUMENT', '2': 407},
    {'1': 'ERR_NO_PERMISSION', '2': 500},
  ],
};

/// Descriptor for `ErrorCode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List errorCodeDescriptor = $convert.base64Decode(
    'CglFcnJvckNvZGUSDwoLRVJSX1NVQ0NFU1MQABIPCgtFUlJfVU5LTk9XThABEhcKE0VSUl9TRV'
    'JWRVJfSU5URVJOQUwQAhIWChJFUlJfSU5WQUxJRF9QQUNLRVQQAxIYChRFUlJfVkVSU0lPTl9N'
    'SVNNQVRDSBAEEhQKEEVSUl9VTkFVVEhPUklaRUQQBRIVChFFUlJfSU5WQUxJRF9UT0tFThAGEh'
    'UKEUVSUl9VU0VSX0lEX0VNUFRZEGQSGAoURVJSX1VTRVJfSURfUkVRVUlSRUQQZRIZChVFUlJf'
    'UEFTU1dPUkRfUkVRVUlSRUQQZhIVChFFUlJfTkFNRV9SRVFVSVJFRBBnEhYKEkVSUl9FTUFJTF'
    '9SRVFVSVJFRBBoEhYKEkVSUl9VU0VSX05PVF9GT1VORBBpEhgKFEVSUl9JTlZBTElEX1BBU1NX'
    'T1JEEGoSGwoXRVJSX1VTRVJfQUxSRUFEWV9FWElTVFMQaxIcChhFUlJfRU1BSUxfQUxSRUFEWV'
    '9FWElTVFMQbBIWChFFUlJfUEFZTE9BRF9FTVBUWRDIARIYChNFUlJfSU5WQUxJRF9DT05WX0lE'
    'EMkBEhwKF0VSUl9JTlZBTElEX1JFQ0VJVkVSX0lEEMoBEhQKD0VSUl9JTlZBTElEX0FDSxDLAR'
    'IfChpFUlJfSU5WQUxJRF9GUklFTkRfVVNFUl9JRBCsAhIYChNFUlJfQ0FOTk9UX0FERF9TRUxG'
    'EK0CEhUKEEVSUl9OT1RfQV9GUklFTkQQrgISIQocRVJSX0ZSSUVORF9SRVFVRVNUX05PVF9GT1'
    'VORBCvAhIlCiBFUlJfRklMRV9TRVJWSUNFX05PVF9JTklUSUFMSVpFRBCQAxImCiFFUlJfQ0xP'
    'VURfU1RPUkFHRV9OT1RfSU5JVElBTElaRUQQkQMSGgoVRVJSX0ZJTEVOQU1FX1JFUVVJUkVEEJ'
    'IDEhoKFUVSUl9JTlZBTElEX0ZJTEVfU0laRRCTAxIbChZFUlJfTUlNRV9UWVBFX1JFUVVJUkVE'
    'EJQDEh8KGkVSUl9GQUlMRURfVE9fR0VORVJBVEVfVVJMEJUDEhkKFEVSUl9JTlZBTElEX0ZJTE'
    'VfVVJMEJYDEhkKFEVSUl9JTlZBTElEX0FSR1VNRU5UEJcDEhYKEUVSUl9OT19QRVJNSVNTSU9O'
    'EPQD');

@$core.Deprecated('Use envelopeDescriptor instead')
const Envelope$json = {
  '1': 'Envelope',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    {'1': 'request_id', '3': 2, '4': 1, '5': 4, '10': 'requestId'},
    {'1': 'auth_token', '3': 3, '4': 1, '5': 9, '10': 'authToken'},
    {
      '1': 'c_check_id',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_CheckId',
      '9': 0,
      '10': 'cCheckId'
    },
    {
      '1': 's_check_id',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_CheckId',
      '9': 0,
      '10': 'sCheckId'
    },
    {
      '1': 'c_check_email',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_CheckEmail',
      '9': 0,
      '10': 'cCheckEmail'
    },
    {
      '1': 's_check_email',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_CheckEmail',
      '9': 0,
      '10': 'sCheckEmail'
    },
    {
      '1': 'c_req_email_verify',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_RequestEmailVerify',
      '9': 0,
      '10': 'cReqEmailVerify'
    },
    {
      '1': 's_req_email_verify',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_RequestEmailVerify',
      '9': 0,
      '10': 'sReqEmailVerify'
    },
    {
      '1': 'c_confirm_email_verify',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_ConfirmEmailVerify',
      '9': 0,
      '10': 'cConfirmEmailVerify'
    },
    {
      '1': 's_confirm_email_verify',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_ConfirmEmailVerify',
      '9': 0,
      '10': 'sConfirmEmailVerify'
    },
    {
      '1': 'c_signup',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_SignUp',
      '9': 0,
      '10': 'cSignup'
    },
    {
      '1': 's_signup',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_SignUp',
      '9': 0,
      '10': 'sSignup'
    },
    {
      '1': 'c_login',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_Login',
      '9': 0,
      '10': 'cLogin'
    },
    {
      '1': 's_login',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_Login',
      '9': 0,
      '10': 'sLogin'
    },
    {
      '1': 'c_logout',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_Logout',
      '9': 0,
      '10': 'cLogout'
    },
    {
      '1': 's_logout',
      '3': 23,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_Logout',
      '9': 0,
      '10': 'sLogout'
    },
    {
      '1': 'c_get_my_devices',
      '3': 24,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_GetMyDevices',
      '9': 0,
      '10': 'cGetMyDevices'
    },
    {
      '1': 's_get_my_devices',
      '3': 25,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_GetMyDevices',
      '9': 0,
      '10': 'sGetMyDevices'
    },
    {
      '1': 'c_remove_device',
      '3': 26,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_RemoveDevice',
      '9': 0,
      '10': 'cRemoveDevice'
    },
    {
      '1': 's_remove_device',
      '3': 27,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_RemoveDevice',
      '9': 0,
      '10': 'sRemoveDevice'
    },
    {
      '1': 'c_fetch_my_info',
      '3': 30,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_FetchMyInfo',
      '9': 0,
      '10': 'cFetchMyInfo'
    },
    {
      '1': 's_fetch_my_info',
      '3': 31,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_FetchMyInfo',
      '9': 0,
      '10': 'sFetchMyInfo'
    },
    {
      '1': 'c_edit_my_info',
      '3': 32,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_EditMyInfo',
      '9': 0,
      '10': 'cEditMyInfo'
    },
    {
      '1': 's_edit_my_info',
      '3': 33,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_EditMyInfo',
      '9': 0,
      '10': 'sEditMyInfo'
    },
    {
      '1': 'c_register_fcm_token',
      '3': 34,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_RegisterFcmToken',
      '9': 0,
      '10': 'cRegisterFcmToken'
    },
    {
      '1': 's_register_fcm_token',
      '3': 35,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_RegisterFcmToken',
      '9': 0,
      '10': 'sRegisterFcmToken'
    },
    {
      '1': 'c_change_email',
      '3': 36,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_ChangeEmail',
      '9': 0,
      '10': 'cChangeEmail'
    },
    {
      '1': 's_change_email',
      '3': 37,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_ChangeEmail',
      '9': 0,
      '10': 'sChangeEmail'
    },
    {
      '1': 'c_change_password',
      '3': 38,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_ChangePassword',
      '9': 0,
      '10': 'cChangePassword'
    },
    {
      '1': 's_change_password',
      '3': 39,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_ChangePassword',
      '9': 0,
      '10': 'sChangePassword'
    },
    {
      '1': 'c_chat',
      '3': 40,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_Chat',
      '9': 0,
      '10': 'cChat'
    },
    {
      '1': 's_chat',
      '3': 41,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_Chat',
      '9': 0,
      '10': 'sChat'
    },
    {
      '1': 'c_ack',
      '3': 42,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_Ack',
      '9': 0,
      '10': 'cAck'
    },
    {
      '1': 'c_req_history',
      '3': 43,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_ReqHistory',
      '9': 0,
      '10': 'cReqHistory'
    },
    {
      '1': 's_req_history',
      '3': 44,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_ReqHistory',
      '9': 0,
      '10': 'sReqHistory'
    },
    {
      '1': 'c_fetch_offline',
      '3': 45,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_FetchOffline',
      '9': 0,
      '10': 'cFetchOffline'
    },
    {
      '1': 's_message_batch',
      '3': 46,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_MessageBatch',
      '9': 0,
      '10': 'sMessageBatch'
    },
    {
      '1': 'c_upload_file',
      '3': 47,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_UploadFile',
      '9': 0,
      '10': 'cUploadFile'
    },
    {
      '1': 's_upload_file',
      '3': 48,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_UploadFile',
      '9': 0,
      '10': 'sUploadFile'
    },
    {
      '1': 'c_search_user',
      '3': 60,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_SearchUser',
      '9': 0,
      '10': 'cSearchUser'
    },
    {
      '1': 's_search_user',
      '3': 61,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_SearchUser',
      '9': 0,
      '10': 'sSearchUser'
    },
    {
      '1': 'c_friend_action',
      '3': 62,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_FriendAction',
      '9': 0,
      '10': 'cFriendAction'
    },
    {
      '1': 's_friend_action',
      '3': 63,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_FriendAction',
      '9': 0,
      '10': 'sFriendAction'
    },
    {
      '1': 'c_fetch_friend_data',
      '3': 64,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_FetchFriendData',
      '9': 0,
      '10': 'cFetchFriendData'
    },
    {
      '1': 's_fetch_friend_data',
      '3': 65,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_FetchFriendData',
      '9': 0,
      '10': 'sFetchFriendData'
    },
    {
      '1': 's_friend_push',
      '3': 66,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_FriendPush',
      '9': 0,
      '10': 'sFriendPush'
    },
    {
      '1': 'c_create_group',
      '3': 80,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_CreateGroup',
      '9': 0,
      '10': 'cCreateGroup'
    },
    {
      '1': 's_create_group',
      '3': 81,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_CreateGroup',
      '9': 0,
      '10': 'sCreateGroup'
    },
    {
      '1': 'c_group_list',
      '3': 82,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_GroupList',
      '9': 0,
      '10': 'cGroupList'
    },
    {
      '1': 's_group_list',
      '3': 83,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_GroupList',
      '9': 0,
      '10': 'sGroupList'
    },
    {
      '1': 'c_join_group',
      '3': 84,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_JoinGroup',
      '9': 0,
      '10': 'cJoinGroup'
    },
    {
      '1': 's_join_group',
      '3': 85,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_JoinGroup',
      '9': 0,
      '10': 'sJoinGroup'
    },
    {
      '1': 'c_invite_friend',
      '3': 86,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_InviteFriend',
      '9': 0,
      '10': 'cInviteFriend'
    },
    {
      '1': 's_invite_friend',
      '3': 87,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_InviteFriend',
      '9': 0,
      '10': 'sInviteFriend'
    },
    {
      '1': 'c_leave_group',
      '3': 88,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_LeaveGroup',
      '9': 0,
      '10': 'cLeaveGroup'
    },
    {
      '1': 's_leave_group',
      '3': 89,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_LeaveGroup',
      '9': 0,
      '10': 'sLeaveGroup'
    },
    {
      '1': 'c_group_member_list',
      '3': 90,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_GroupMemberList',
      '9': 0,
      '10': 'cGroupMemberList'
    },
    {
      '1': 's_group_member_list',
      '3': 91,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_GroupMemberList',
      '9': 0,
      '10': 'sGroupMemberList'
    },
    {
      '1': 'c_group_info',
      '3': 92,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_GroupInfo',
      '9': 0,
      '10': 'cGroupInfo'
    },
    {
      '1': 's_group_info',
      '3': 93,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_GroupInfo',
      '9': 0,
      '10': 'sGroupInfo'
    },
    {
      '1': 'c_edit_group',
      '3': 94,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_EditGroup',
      '9': 0,
      '10': 'cEditGroup'
    },
    {
      '1': 's_edit_group',
      '3': 95,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_EditGroup',
      '9': 0,
      '10': 'sEditGroup'
    },
    {
      '1': 'c_withdraw',
      '3': 96,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_Withdraw',
      '9': 0,
      '10': 'cWithdraw'
    },
    {
      '1': 's_withdraw',
      '3': 97,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_Withdraw',
      '9': 0,
      '10': 'sWithdraw'
    },
    {
      '1': 's_error',
      '3': 100,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_Error',
      '9': 0,
      '10': 'sError'
    },
    {
      '1': 'c_heartbeat',
      '3': 101,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_Heartbeat',
      '9': 0,
      '10': 'cHeartbeat'
    },
    {
      '1': 's_heartbeat',
      '3': 102,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_Heartbeat',
      '9': 0,
      '10': 'sHeartbeat'
    },
  ],
  '8': [
    {'1': 'body'},
  ],
};

/// Descriptor for `Envelope`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List envelopeDescriptor = $convert.base64Decode(
    'CghFbnZlbG9wZRIYCgd2ZXJzaW9uGAEgASgNUgd2ZXJzaW9uEh0KCnJlcXVlc3RfaWQYAiABKA'
    'RSCXJlcXVlc3RJZBIdCgphdXRoX3Rva2VuGAMgASgJUglhdXRoVG9rZW4SMwoKY19jaGVja19p'
    'ZBgKIAEoCzITLlByb3RvY29sLkNfQ2hlY2tJZEgAUghjQ2hlY2tJZBIzCgpzX2NoZWNrX2lkGA'
    'sgASgLMhMuUHJvdG9jb2wuU19DaGVja0lkSABSCHNDaGVja0lkEjwKDWNfY2hlY2tfZW1haWwY'
    'DCABKAsyFi5Qcm90b2NvbC5DX0NoZWNrRW1haWxIAFILY0NoZWNrRW1haWwSPAoNc19jaGVja1'
    '9lbWFpbBgNIAEoCzIWLlByb3RvY29sLlNfQ2hlY2tFbWFpbEgAUgtzQ2hlY2tFbWFpbBJNChJj'
    'X3JlcV9lbWFpbF92ZXJpZnkYDiABKAsyHi5Qcm90b2NvbC5DX1JlcXVlc3RFbWFpbFZlcmlmeU'
    'gAUg9jUmVxRW1haWxWZXJpZnkSTQoSc19yZXFfZW1haWxfdmVyaWZ5GA8gASgLMh4uUHJvdG9j'
    'b2wuU19SZXF1ZXN0RW1haWxWZXJpZnlIAFIPc1JlcUVtYWlsVmVyaWZ5ElUKFmNfY29uZmlybV'
    '9lbWFpbF92ZXJpZnkYECABKAsyHi5Qcm90b2NvbC5DX0NvbmZpcm1FbWFpbFZlcmlmeUgAUhNj'
    'Q29uZmlybUVtYWlsVmVyaWZ5ElUKFnNfY29uZmlybV9lbWFpbF92ZXJpZnkYESABKAsyHi5Qcm'
    '90b2NvbC5TX0NvbmZpcm1FbWFpbFZlcmlmeUgAUhNzQ29uZmlybUVtYWlsVmVyaWZ5Ei8KCGNf'
    'c2lnbnVwGBIgASgLMhIuUHJvdG9jb2wuQ19TaWduVXBIAFIHY1NpZ251cBIvCghzX3NpZ251cB'
    'gTIAEoCzISLlByb3RvY29sLlNfU2lnblVwSABSB3NTaWdudXASLAoHY19sb2dpbhgUIAEoCzIR'
    'LlByb3RvY29sLkNfTG9naW5IAFIGY0xvZ2luEiwKB3NfbG9naW4YFSABKAsyES5Qcm90b2NvbC'
    '5TX0xvZ2luSABSBnNMb2dpbhIvCghjX2xvZ291dBgWIAEoCzISLlByb3RvY29sLkNfTG9nb3V0'
    'SABSB2NMb2dvdXQSLwoIc19sb2dvdXQYFyABKAsyEi5Qcm90b2NvbC5TX0xvZ291dEgAUgdzTG'
    '9nb3V0EkMKEGNfZ2V0X215X2RldmljZXMYGCABKAsyGC5Qcm90b2NvbC5DX0dldE15RGV2aWNl'
    'c0gAUg1jR2V0TXlEZXZpY2VzEkMKEHNfZ2V0X215X2RldmljZXMYGSABKAsyGC5Qcm90b2NvbC'
    '5TX0dldE15RGV2aWNlc0gAUg1zR2V0TXlEZXZpY2VzEkIKD2NfcmVtb3ZlX2RldmljZRgaIAEo'
    'CzIYLlByb3RvY29sLkNfUmVtb3ZlRGV2aWNlSABSDWNSZW1vdmVEZXZpY2USQgoPc19yZW1vdm'
    'VfZGV2aWNlGBsgASgLMhguUHJvdG9jb2wuU19SZW1vdmVEZXZpY2VIAFINc1JlbW92ZURldmlj'
    'ZRJACg9jX2ZldGNoX215X2luZm8YHiABKAsyFy5Qcm90b2NvbC5DX0ZldGNoTXlJbmZvSABSDG'
    'NGZXRjaE15SW5mbxJACg9zX2ZldGNoX215X2luZm8YHyABKAsyFy5Qcm90b2NvbC5TX0ZldGNo'
    'TXlJbmZvSABSDHNGZXRjaE15SW5mbxI9Cg5jX2VkaXRfbXlfaW5mbxggIAEoCzIWLlByb3RvY2'
    '9sLkNfRWRpdE15SW5mb0gAUgtjRWRpdE15SW5mbxI9Cg5zX2VkaXRfbXlfaW5mbxghIAEoCzIW'
    'LlByb3RvY29sLlNfRWRpdE15SW5mb0gAUgtzRWRpdE15SW5mbxJPChRjX3JlZ2lzdGVyX2ZjbV'
    '90b2tlbhgiIAEoCzIcLlByb3RvY29sLkNfUmVnaXN0ZXJGY21Ub2tlbkgAUhFjUmVnaXN0ZXJG'
    'Y21Ub2tlbhJPChRzX3JlZ2lzdGVyX2ZjbV90b2tlbhgjIAEoCzIcLlByb3RvY29sLlNfUmVnaX'
    'N0ZXJGY21Ub2tlbkgAUhFzUmVnaXN0ZXJGY21Ub2tlbhI/Cg5jX2NoYW5nZV9lbWFpbBgkIAEo'
    'CzIXLlByb3RvY29sLkNfQ2hhbmdlRW1haWxIAFIMY0NoYW5nZUVtYWlsEj8KDnNfY2hhbmdlX2'
    'VtYWlsGCUgASgLMhcuUHJvdG9jb2wuU19DaGFuZ2VFbWFpbEgAUgxzQ2hhbmdlRW1haWwSSAoR'
    'Y19jaGFuZ2VfcGFzc3dvcmQYJiABKAsyGi5Qcm90b2NvbC5DX0NoYW5nZVBhc3N3b3JkSABSD2'
    'NDaGFuZ2VQYXNzd29yZBJIChFzX2NoYW5nZV9wYXNzd29yZBgnIAEoCzIaLlByb3RvY29sLlNf'
    'Q2hhbmdlUGFzc3dvcmRIAFIPc0NoYW5nZVBhc3N3b3JkEikKBmNfY2hhdBgoIAEoCzIQLlByb3'
    'RvY29sLkNfQ2hhdEgAUgVjQ2hhdBIpCgZzX2NoYXQYKSABKAsyEC5Qcm90b2NvbC5TX0NoYXRI'
    'AFIFc0NoYXQSJgoFY19hY2sYKiABKAsyDy5Qcm90b2NvbC5DX0Fja0gAUgRjQWNrEjwKDWNfcm'
    'VxX2hpc3RvcnkYKyABKAsyFi5Qcm90b2NvbC5DX1JlcUhpc3RvcnlIAFILY1JlcUhpc3RvcnkS'
    'PAoNc19yZXFfaGlzdG9yeRgsIAEoCzIWLlByb3RvY29sLlNfUmVxSGlzdG9yeUgAUgtzUmVxSG'
    'lzdG9yeRJCCg9jX2ZldGNoX29mZmxpbmUYLSABKAsyGC5Qcm90b2NvbC5DX0ZldGNoT2ZmbGlu'
    'ZUgAUg1jRmV0Y2hPZmZsaW5lEkIKD3NfbWVzc2FnZV9iYXRjaBguIAEoCzIYLlByb3RvY29sLl'
    'NfTWVzc2FnZUJhdGNoSABSDXNNZXNzYWdlQmF0Y2gSPAoNY191cGxvYWRfZmlsZRgvIAEoCzIW'
    'LlByb3RvY29sLkNfVXBsb2FkRmlsZUgAUgtjVXBsb2FkRmlsZRI8Cg1zX3VwbG9hZF9maWxlGD'
    'AgASgLMhYuUHJvdG9jb2wuU19VcGxvYWRGaWxlSABSC3NVcGxvYWRGaWxlEjwKDWNfc2VhcmNo'
    'X3VzZXIYPCABKAsyFi5Qcm90b2NvbC5DX1NlYXJjaFVzZXJIAFILY1NlYXJjaFVzZXISPAoNc1'
    '9zZWFyY2hfdXNlchg9IAEoCzIWLlByb3RvY29sLlNfU2VhcmNoVXNlckgAUgtzU2VhcmNoVXNl'
    'chJCCg9jX2ZyaWVuZF9hY3Rpb24YPiABKAsyGC5Qcm90b2NvbC5DX0ZyaWVuZEFjdGlvbkgAUg'
    '1jRnJpZW5kQWN0aW9uEkIKD3NfZnJpZW5kX2FjdGlvbhg/IAEoCzIYLlByb3RvY29sLlNfRnJp'
    'ZW5kQWN0aW9uSABSDXNGcmllbmRBY3Rpb24STAoTY19mZXRjaF9mcmllbmRfZGF0YRhAIAEoCz'
    'IbLlByb3RvY29sLkNfRmV0Y2hGcmllbmREYXRhSABSEGNGZXRjaEZyaWVuZERhdGESTAoTc19m'
    'ZXRjaF9mcmllbmRfZGF0YRhBIAEoCzIbLlByb3RvY29sLlNfRmV0Y2hGcmllbmREYXRhSABSEH'
    'NGZXRjaEZyaWVuZERhdGESPAoNc19mcmllbmRfcHVzaBhCIAEoCzIWLlByb3RvY29sLlNfRnJp'
    'ZW5kUHVzaEgAUgtzRnJpZW5kUHVzaBI/Cg5jX2NyZWF0ZV9ncm91cBhQIAEoCzIXLlByb3RvY2'
    '9sLkNfQ3JlYXRlR3JvdXBIAFIMY0NyZWF0ZUdyb3VwEj8KDnNfY3JlYXRlX2dyb3VwGFEgASgL'
    'MhcuUHJvdG9jb2wuU19DcmVhdGVHcm91cEgAUgxzQ3JlYXRlR3JvdXASOQoMY19ncm91cF9saX'
    'N0GFIgASgLMhUuUHJvdG9jb2wuQ19Hcm91cExpc3RIAFIKY0dyb3VwTGlzdBI5CgxzX2dyb3Vw'
    'X2xpc3QYUyABKAsyFS5Qcm90b2NvbC5TX0dyb3VwTGlzdEgAUgpzR3JvdXBMaXN0EjkKDGNfam'
    '9pbl9ncm91cBhUIAEoCzIVLlByb3RvY29sLkNfSm9pbkdyb3VwSABSCmNKb2luR3JvdXASOQoM'
    'c19qb2luX2dyb3VwGFUgASgLMhUuUHJvdG9jb2wuU19Kb2luR3JvdXBIAFIKc0pvaW5Hcm91cB'
    'JCCg9jX2ludml0ZV9mcmllbmQYViABKAsyGC5Qcm90b2NvbC5DX0ludml0ZUZyaWVuZEgAUg1j'
    'SW52aXRlRnJpZW5kEkIKD3NfaW52aXRlX2ZyaWVuZBhXIAEoCzIYLlByb3RvY29sLlNfSW52aX'
    'RlRnJpZW5kSABSDXNJbnZpdGVGcmllbmQSPAoNY19sZWF2ZV9ncm91cBhYIAEoCzIWLlByb3Rv'
    'Y29sLkNfTGVhdmVHcm91cEgAUgtjTGVhdmVHcm91cBI8Cg1zX2xlYXZlX2dyb3VwGFkgASgLMh'
    'YuUHJvdG9jb2wuU19MZWF2ZUdyb3VwSABSC3NMZWF2ZUdyb3VwEkwKE2NfZ3JvdXBfbWVtYmVy'
    'X2xpc3QYWiABKAsyGy5Qcm90b2NvbC5DX0dyb3VwTWVtYmVyTGlzdEgAUhBjR3JvdXBNZW1iZX'
    'JMaXN0EkwKE3NfZ3JvdXBfbWVtYmVyX2xpc3QYWyABKAsyGy5Qcm90b2NvbC5TX0dyb3VwTWVt'
    'YmVyTGlzdEgAUhBzR3JvdXBNZW1iZXJMaXN0EjkKDGNfZ3JvdXBfaW5mbxhcIAEoCzIVLlByb3'
    'RvY29sLkNfR3JvdXBJbmZvSABSCmNHcm91cEluZm8SOQoMc19ncm91cF9pbmZvGF0gASgLMhUu'
    'UHJvdG9jb2wuU19Hcm91cEluZm9IAFIKc0dyb3VwSW5mbxI5CgxjX2VkaXRfZ3JvdXAYXiABKA'
    'syFS5Qcm90b2NvbC5DX0VkaXRHcm91cEgAUgpjRWRpdEdyb3VwEjkKDHNfZWRpdF9ncm91cBhf'
    'IAEoCzIVLlByb3RvY29sLlNfRWRpdEdyb3VwSABSCnNFZGl0R3JvdXASNQoKY193aXRoZHJhdx'
    'hgIAEoCzIULlByb3RvY29sLkNfV2l0aGRyYXdIAFIJY1dpdGhkcmF3EjUKCnNfd2l0aGRyYXcY'
    'YSABKAsyFC5Qcm90b2NvbC5TX1dpdGhkcmF3SABSCXNXaXRoZHJhdxIsCgdzX2Vycm9yGGQgAS'
    'gLMhEuUHJvdG9jb2wuU19FcnJvckgAUgZzRXJyb3ISOAoLY19oZWFydGJlYXQYZSABKAsyFS5Q'
    'cm90b2NvbC5DX0hlYXJ0YmVhdEgAUgpjSGVhcnRiZWF0EjgKC3NfaGVhcnRiZWF0GGYgASgLMh'
    'UuUHJvdG9jb2wuU19IZWFydGJlYXRIAFIKc0hlYXJ0YmVhdEIGCgRib2R5');

@$core.Deprecated('Use userInfoDescriptor instead')
const UserInfo$json = {
  '1': 'UserInfo',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'status_message', '3': 3, '4': 1, '5': 9, '10': 'statusMessage'},
    {'1': 'profile_image_url', '3': 4, '4': 1, '5': 9, '10': 'profileImageUrl'},
    {
      '1': 'background_image_url',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'backgroundImageUrl'
    },
    {'1': 'email', '3': 6, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone', '3': 7, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'sub_grade', '3': 8, '4': 1, '5': 3, '10': 'subGrade'},
    {
      '1': 'storage_capacity_bytes',
      '3': 9,
      '4': 1,
      '5': 3,
      '10': 'storageCapacityBytes'
    },
    {
      '1': 'storage_usage_bytes',
      '3': 10,
      '4': 1,
      '5': 3,
      '10': 'storageUsageBytes'
    },
    {'1': 'last_seen', '3': 11, '4': 1, '5': 3, '10': 'lastSeen'},
    {'1': 'status', '3': 12, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `UserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoDescriptor = $convert.base64Decode(
    'CghVc2VySW5mbxIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSEgoEbmFtZRgCIAEoCVIEbmFtZR'
    'IlCg5zdGF0dXNfbWVzc2FnZRgDIAEoCVINc3RhdHVzTWVzc2FnZRIqChFwcm9maWxlX2ltYWdl'
    'X3VybBgEIAEoCVIPcHJvZmlsZUltYWdlVXJsEjAKFGJhY2tncm91bmRfaW1hZ2VfdXJsGAUgAS'
    'gJUhJiYWNrZ3JvdW5kSW1hZ2VVcmwSFAoFZW1haWwYBiABKAlSBWVtYWlsEhQKBXBob25lGAcg'
    'ASgJUgVwaG9uZRIbCglzdWJfZ3JhZGUYCCABKANSCHN1YkdyYWRlEjQKFnN0b3JhZ2VfY2FwYW'
    'NpdHlfYnl0ZXMYCSABKANSFHN0b3JhZ2VDYXBhY2l0eUJ5dGVzEi4KE3N0b3JhZ2VfdXNhZ2Vf'
    'Ynl0ZXMYCiABKANSEXN0b3JhZ2VVc2FnZUJ5dGVzEhsKCWxhc3Rfc2VlbhgLIAEoA1IIbGFzdF'
    'NlZW4SFgoGc3RhdHVzGAwgASgJUgZzdGF0dXM=');

@$core.Deprecated('Use c_CheckIdDescriptor instead')
const C_CheckId$json = {
  '1': 'C_CheckId',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `C_CheckId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_CheckIdDescriptor =
    $convert.base64Decode('CglDX0NoZWNrSWQSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklk');

@$core.Deprecated('Use s_CheckIdDescriptor instead')
const S_CheckId$json = {
  '1': 'S_CheckId',
  '2': [
    {'1': 'is_available', '3': 1, '4': 1, '5': 8, '10': 'isAvailable'},
  ],
};

/// Descriptor for `S_CheckId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_CheckIdDescriptor = $convert.base64Decode(
    'CglTX0NoZWNrSWQSIQoMaXNfYXZhaWxhYmxlGAEgASgIUgtpc0F2YWlsYWJsZQ==');

@$core.Deprecated('Use c_CheckEmailDescriptor instead')
const C_CheckEmail$json = {
  '1': 'C_CheckEmail',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `C_CheckEmail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_CheckEmailDescriptor =
    $convert.base64Decode('CgxDX0NoZWNrRW1haWwSFAoFZW1haWwYASABKAlSBWVtYWls');

@$core.Deprecated('Use s_CheckEmailDescriptor instead')
const S_CheckEmail$json = {
  '1': 'S_CheckEmail',
  '2': [
    {'1': 'is_available', '3': 1, '4': 1, '5': 8, '10': 'isAvailable'},
  ],
};

/// Descriptor for `S_CheckEmail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_CheckEmailDescriptor = $convert.base64Decode(
    'CgxTX0NoZWNrRW1haWwSIQoMaXNfYXZhaWxhYmxlGAEgASgIUgtpc0F2YWlsYWJsZQ==');

@$core.Deprecated('Use c_RequestEmailVerifyDescriptor instead')
const C_RequestEmailVerify$json = {
  '1': 'C_RequestEmailVerify',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `C_RequestEmailVerify`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_RequestEmailVerifyDescriptor =
    $convert.base64Decode(
        'ChRDX1JlcXVlc3RFbWFpbFZlcmlmeRIUCgVlbWFpbBgBIAEoCVIFZW1haWw=');

@$core.Deprecated('Use s_RequestEmailVerifyDescriptor instead')
const S_RequestEmailVerify$json = {
  '1': 'S_RequestEmailVerify',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `S_RequestEmailVerify`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RequestEmailVerifyDescriptor = $convert.base64Decode(
    'ChRTX1JlcXVlc3RFbWFpbFZlcmlmeRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3'
    'NhZ2UYAiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use c_ConfirmEmailVerifyDescriptor instead')
const C_ConfirmEmailVerify$json = {
  '1': 'C_ConfirmEmailVerify',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `C_ConfirmEmailVerify`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ConfirmEmailVerifyDescriptor = $convert.base64Decode(
    'ChRDX0NvbmZpcm1FbWFpbFZlcmlmeRIUCgVlbWFpbBgBIAEoCVIFZW1haWwSEgoEY29kZRgCIA'
    'EoCVIEY29kZQ==');

@$core.Deprecated('Use s_ConfirmEmailVerifyDescriptor instead')
const S_ConfirmEmailVerify$json = {
  '1': 'S_ConfirmEmailVerify',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `S_ConfirmEmailVerify`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_ConfirmEmailVerifyDescriptor =
    $convert.base64Decode(
        'ChRTX0NvbmZpcm1FbWFpbFZlcmlmeRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use c_SignUpDescriptor instead')
const C_SignUp$json = {
  '1': 'C_SignUp',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `C_SignUp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_SignUpDescriptor = $convert.base64Decode(
    'CghDX1NpZ25VcBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSGgoIcGFzc3dvcmQYAiABKAlSCH'
    'Bhc3N3b3JkEhIKBG5hbWUYAyABKAlSBG5hbWUSFAoFZW1haWwYBCABKAlSBWVtYWls');

@$core.Deprecated('Use s_SignUpDescriptor instead')
const S_SignUp$json = {
  '1': 'S_SignUp',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `S_SignUp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SignUpDescriptor = $convert.base64Decode(
    'CghTX1NpZ25VcBIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3NhZ2UYAiABKAlSB2'
    '1lc3NhZ2USFwoHdXNlcl9pZBgDIAEoCVIGdXNlcklk');

@$core.Deprecated('Use c_LoginDescriptor instead')
const C_Login$json = {
  '1': 'C_Login',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `C_Login`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_LoginDescriptor = $convert.base64Decode(
    'CgdDX0xvZ2luEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIaCghwYXNzd29yZBgCIAEoCVIIcG'
    'Fzc3dvcmQ=');

@$core.Deprecated('Use s_LoginDescriptor instead')
const S_Login$json = {
  '1': 'S_Login',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'auth_token', '3': 2, '4': 1, '5': 9, '10': 'authToken'},
    {
      '1': 'my_info',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Protocol.UserInfo',
      '10': 'myInfo'
    },
  ],
};

/// Descriptor for `S_Login`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_LoginDescriptor = $convert.base64Decode(
    'CgdTX0xvZ2luEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSHQoKYXV0aF90b2tlbhgCIAEoCV'
    'IJYXV0aFRva2VuEisKB215X2luZm8YAyABKAsyEi5Qcm90b2NvbC5Vc2VySW5mb1IGbXlJbmZv');

@$core.Deprecated('Use c_LogoutDescriptor instead')
const C_Logout$json = {
  '1': 'C_Logout',
  '2': [
    {'1': 'fcm_token', '3': 1, '4': 1, '5': 9, '10': 'fcmToken'},
    {'1': 'device_id', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `C_Logout`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_LogoutDescriptor = $convert.base64Decode(
    'CghDX0xvZ291dBIbCglmY21fdG9rZW4YASABKAlSCGZjbVRva2VuEhsKCWRldmljZV9pZBgCIA'
    'EoCVIIZGV2aWNlSWQ=');

@$core.Deprecated('Use s_LogoutDescriptor instead')
const S_Logout$json = {
  '1': 'S_Logout',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `S_Logout`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_LogoutDescriptor =
    $convert.base64Decode('CghTX0xvZ291dBIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use c_FetchMyInfoDescriptor instead')
const C_FetchMyInfo$json = {
  '1': 'C_FetchMyInfo',
};

/// Descriptor for `C_FetchMyInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_FetchMyInfoDescriptor =
    $convert.base64Decode('Cg1DX0ZldGNoTXlJbmZv');

@$core.Deprecated('Use s_FetchMyInfoDescriptor instead')
const S_FetchMyInfo$json = {
  '1': 'S_FetchMyInfo',
  '2': [
    {
      '1': 'my_info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.Protocol.UserInfo',
      '10': 'myInfo'
    },
  ],
};

/// Descriptor for `S_FetchMyInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_FetchMyInfoDescriptor = $convert.base64Decode(
    'Cg1TX0ZldGNoTXlJbmZvEisKB215X2luZm8YASABKAsyEi5Qcm90b2NvbC5Vc2VySW5mb1IGbX'
    'lJbmZv');

@$core.Deprecated('Use c_EditMyInfoDescriptor instead')
const C_EditMyInfo$json = {
  '1': 'C_EditMyInfo',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'status_message', '3': 2, '4': 1, '5': 9, '10': 'statusMessage'},
    {'1': 'profile_image_url', '3': 3, '4': 1, '5': 9, '10': 'profileImageUrl'},
    {
      '1': 'background_image_url',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'backgroundImageUrl'
    },
    {'1': 'phone', '3': 5, '4': 1, '5': 9, '10': 'phone'},
  ],
};

/// Descriptor for `C_EditMyInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_EditMyInfoDescriptor = $convert.base64Decode(
    'CgxDX0VkaXRNeUluZm8SEgoEbmFtZRgBIAEoCVIEbmFtZRIlCg5zdGF0dXNfbWVzc2FnZRgCIA'
    'EoCVINc3RhdHVzTWVzc2FnZRIqChFwcm9maWxlX2ltYWdlX3VybBgDIAEoCVIPcHJvZmlsZUlt'
    'YWdlVXJsEjAKFGJhY2tncm91bmRfaW1hZ2VfdXJsGAQgASgJUhJiYWNrZ3JvdW5kSW1hZ2VVcm'
    'wSFAoFcGhvbmUYBSABKAlSBXBob25l');

@$core.Deprecated('Use s_EditMyInfoDescriptor instead')
const S_EditMyInfo$json = {
  '1': 'S_EditMyInfo',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {
      '1': 'updated_info',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Protocol.UserInfo',
      '10': 'updatedInfo'
    },
  ],
};

/// Descriptor for `S_EditMyInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_EditMyInfoDescriptor = $convert.base64Decode(
    'CgxTX0VkaXRNeUluZm8SGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYWdlGAIgAS'
    'gJUgdtZXNzYWdlEjUKDHVwZGF0ZWRfaW5mbxgDIAEoCzISLlByb3RvY29sLlVzZXJJbmZvUgt1'
    'cGRhdGVkSW5mbw==');

@$core.Deprecated('Use c_RegisterFcmTokenDescriptor instead')
const C_RegisterFcmToken$json = {
  '1': 'C_RegisterFcmToken',
  '2': [
    {'1': 'fcm_token', '3': 1, '4': 1, '5': 9, '10': 'fcmToken'},
    {'1': 'platform', '3': 2, '4': 1, '5': 9, '10': 'platform'},
    {'1': 'device_id', '3': 3, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'device_name', '3': 4, '4': 1, '5': 9, '10': 'deviceName'},
    {'1': 'app_version', '3': 5, '4': 1, '5': 9, '10': 'appVersion'},
  ],
};

/// Descriptor for `C_RegisterFcmToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_RegisterFcmTokenDescriptor = $convert.base64Decode(
    'ChJDX1JlZ2lzdGVyRmNtVG9rZW4SGwoJZmNtX3Rva2VuGAEgASgJUghmY21Ub2tlbhIaCghwbG'
    'F0Zm9ybRgCIAEoCVIIcGxhdGZvcm0SGwoJZGV2aWNlX2lkGAMgASgJUghkZXZpY2VJZBIfCgtk'
    'ZXZpY2VfbmFtZRgEIAEoCVIKZGV2aWNlTmFtZRIfCgthcHBfdmVyc2lvbhgFIAEoCVIKYXBwVm'
    'Vyc2lvbg==');

@$core.Deprecated('Use s_RegisterFcmTokenDescriptor instead')
const S_RegisterFcmToken$json = {
  '1': 'S_RegisterFcmToken',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `S_RegisterFcmToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RegisterFcmTokenDescriptor = $convert.base64Decode(
    'ChJTX1JlZ2lzdGVyRmNtVG9rZW4SGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYW'
    'dlGAIgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use deviceInfoDescriptor instead')
const DeviceInfo$json = {
  '1': 'DeviceInfo',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'device_name', '3': 2, '4': 1, '5': 9, '10': 'deviceName'},
    {'1': 'platform', '3': 3, '4': 1, '5': 9, '10': 'platform'},
    {'1': 'last_active', '3': 4, '4': 1, '5': 3, '10': 'lastActive'},
    {'1': 'registered_at', '3': 5, '4': 1, '5': 3, '10': 'registeredAt'},
    {'1': 'app_version', '3': 6, '4': 1, '5': 9, '10': 'appVersion'},
    {'1': 'is_current', '3': 7, '4': 1, '5': 8, '10': 'isCurrent'},
  ],
};

/// Descriptor for `DeviceInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceInfoDescriptor = $convert.base64Decode(
    'CgpEZXZpY2VJbmZvEhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aWNlSWQSHwoLZGV2aWNlX25hbW'
    'UYAiABKAlSCmRldmljZU5hbWUSGgoIcGxhdGZvcm0YAyABKAlSCHBsYXRmb3JtEh8KC2xhc3Rf'
    'YWN0aXZlGAQgASgDUgpsYXN0QWN0aXZlEiMKDXJlZ2lzdGVyZWRfYXQYBSABKANSDHJlZ2lzdG'
    'VyZWRBdBIfCgthcHBfdmVyc2lvbhgGIAEoCVIKYXBwVmVyc2lvbhIdCgppc19jdXJyZW50GAcg'
    'ASgIUglpc0N1cnJlbnQ=');

@$core.Deprecated('Use c_GetMyDevicesDescriptor instead')
const C_GetMyDevices$json = {
  '1': 'C_GetMyDevices',
};

/// Descriptor for `C_GetMyDevices`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_GetMyDevicesDescriptor =
    $convert.base64Decode('Cg5DX0dldE15RGV2aWNlcw==');

@$core.Deprecated('Use s_GetMyDevicesDescriptor instead')
const S_GetMyDevices$json = {
  '1': 'S_GetMyDevices',
  '2': [
    {
      '1': 'devices',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.Protocol.DeviceInfo',
      '10': 'devices'
    },
  ],
};

/// Descriptor for `S_GetMyDevices`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_GetMyDevicesDescriptor = $convert.base64Decode(
    'Cg5TX0dldE15RGV2aWNlcxIuCgdkZXZpY2VzGAEgAygLMhQuUHJvdG9jb2wuRGV2aWNlSW5mb1'
    'IHZGV2aWNlcw==');

@$core.Deprecated('Use c_RemoveDeviceDescriptor instead')
const C_RemoveDevice$json = {
  '1': 'C_RemoveDevice',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `C_RemoveDevice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_RemoveDeviceDescriptor = $convert.base64Decode(
    'Cg5DX1JlbW92ZURldmljZRIbCglkZXZpY2VfaWQYASABKAlSCGRldmljZUlk');

@$core.Deprecated('Use s_RemoveDeviceDescriptor instead')
const S_RemoveDevice$json = {
  '1': 'S_RemoveDevice',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `S_RemoveDevice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RemoveDeviceDescriptor = $convert.base64Decode(
    'Cg5TX1JlbW92ZURldmljZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3NhZ2UYAi'
    'ABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use c_ChangeEmailDescriptor instead')
const C_ChangeEmail$json = {
  '1': 'C_ChangeEmail',
  '2': [
    {'1': 'new_email', '3': 1, '4': 1, '5': 9, '10': 'newEmail'},
  ],
};

/// Descriptor for `C_ChangeEmail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ChangeEmailDescriptor = $convert.base64Decode(
    'Cg1DX0NoYW5nZUVtYWlsEhsKCW5ld19lbWFpbBgBIAEoCVIIbmV3RW1haWw=');

@$core.Deprecated('Use s_ChangeEmailDescriptor instead')
const S_ChangeEmail$json = {
  '1': 'S_ChangeEmail',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {
      '1': 'updated_info',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Protocol.UserInfo',
      '10': 'updatedInfo'
    },
  ],
};

/// Descriptor for `S_ChangeEmail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_ChangeEmailDescriptor = $convert.base64Decode(
    'Cg1TX0NoYW5nZUVtYWlsEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2FnZRgCIA'
    'EoCVIHbWVzc2FnZRI1Cgx1cGRhdGVkX2luZm8YAyABKAsyEi5Qcm90b2NvbC5Vc2VySW5mb1IL'
    'dXBkYXRlZEluZm8=');

@$core.Deprecated('Use c_ChangePasswordDescriptor instead')
const C_ChangePassword$json = {
  '1': 'C_ChangePassword',
  '2': [
    {'1': 'current_password', '3': 1, '4': 1, '5': 9, '10': 'currentPassword'},
    {'1': 'new_password', '3': 2, '4': 1, '5': 9, '10': 'newPassword'},
  ],
};

/// Descriptor for `C_ChangePassword`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ChangePasswordDescriptor = $convert.base64Decode(
    'ChBDX0NoYW5nZVBhc3N3b3JkEikKEGN1cnJlbnRfcGFzc3dvcmQYASABKAlSD2N1cnJlbnRQYX'
    'Nzd29yZBIhCgxuZXdfcGFzc3dvcmQYAiABKAlSC25ld1Bhc3N3b3Jk');

@$core.Deprecated('Use s_ChangePasswordDescriptor instead')
const S_ChangePassword$json = {
  '1': 'S_ChangePassword',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `S_ChangePassword`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_ChangePasswordDescriptor = $convert.base64Decode(
    'ChBTX0NoYW5nZVBhc3N3b3JkEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2FnZR'
    'gCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use textDescriptor instead')
const Text$json = {
  '1': 'Text',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `Text`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textDescriptor =
    $convert.base64Decode('CgRUZXh0EhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use imageDescriptor instead')
const Image$json = {
  '1': 'Image',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'thumbnail', '3': 2, '4': 1, '5': 9, '10': 'thumbnail'},
    {'1': 'size', '3': 3, '4': 1, '5': 3, '10': 'size'},
  ],
};

/// Descriptor for `Image`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageDescriptor = $convert.base64Decode(
    'CgVJbWFnZRIQCgN1cmwYASABKAlSA3VybBIcCgl0aHVtYm5haWwYAiABKAlSCXRodW1ibmFpbB'
    'ISCgRzaXplGAMgASgDUgRzaXpl');

@$core.Deprecated('Use videoDescriptor instead')
const Video$json = {
  '1': 'Video',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'thumbnail', '3': 2, '4': 1, '5': 9, '10': 'thumbnail'},
    {'1': 'duration_sec', '3': 3, '4': 1, '5': 3, '10': 'durationSec'},
    {'1': 'size', '3': 4, '4': 1, '5': 3, '10': 'size'},
  ],
};

/// Descriptor for `Video`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List videoDescriptor = $convert.base64Decode(
    'CgVWaWRlbxIQCgN1cmwYASABKAlSA3VybBIcCgl0aHVtYm5haWwYAiABKAlSCXRodW1ibmFpbB'
    'IhCgxkdXJhdGlvbl9zZWMYAyABKANSC2R1cmF0aW9uU2VjEhIKBHNpemUYBCABKANSBHNpemU=');

@$core.Deprecated('Use fileDescriptor instead')
const File$json = {
  '1': 'File',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'filename', '3': 2, '4': 1, '5': 9, '10': 'filename'},
    {'1': 'size', '3': 3, '4': 1, '5': 3, '10': 'size'},
    {'1': 'mime_type', '3': 4, '4': 1, '5': 9, '10': 'mimeType'},
  ],
};

/// Descriptor for `File`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDescriptor = $convert.base64Decode(
    'CgRGaWxlEhAKA3VybBgBIAEoCVIDdXJsEhoKCGZpbGVuYW1lGAIgASgJUghmaWxlbmFtZRISCg'
    'RzaXplGAMgASgDUgRzaXplEhsKCW1pbWVfdHlwZRgEIAEoCVIIbWltZVR5cGU=');

@$core.Deprecated('Use systemMsgDescriptor instead')
const SystemMsg$json = {
  '1': 'SystemMsg',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    {'1': 'type', '3': 2, '4': 1, '5': 3, '10': 'type'},
    {'1': 'invite_group_id', '3': 3, '4': 1, '5': 9, '10': 'inviteGroupId'},
  ],
};

/// Descriptor for `SystemMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List systemMsgDescriptor = $convert.base64Decode(
    'CglTeXN0ZW1Nc2cSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZRISCgR0eXBlGAIgASgDUgR0eX'
    'BlEiYKD2ludml0ZV9ncm91cF9pZBgDIAEoCVINaW52aXRlR3JvdXBJZA==');

@$core.Deprecated('Use chatPayloadDescriptor instead')
const ChatPayload$json = {
  '1': 'ChatPayload',
  '2': [
    {
      '1': 'text',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.Protocol.Text',
      '9': 0,
      '10': 'text'
    },
    {
      '1': 'image',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.Protocol.Image',
      '9': 0,
      '10': 'image'
    },
    {
      '1': 'video',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Protocol.Video',
      '9': 0,
      '10': 'video'
    },
    {
      '1': 'file',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.Protocol.File',
      '9': 0,
      '10': 'file'
    },
    {
      '1': 'system',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.Protocol.SystemMsg',
      '9': 0,
      '10': 'system'
    },
  ],
  '8': [
    {'1': 'data'},
  ],
};

/// Descriptor for `ChatPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatPayloadDescriptor = $convert.base64Decode(
    'CgtDaGF0UGF5bG9hZBIkCgR0ZXh0GAEgASgLMg4uUHJvdG9jb2wuVGV4dEgAUgR0ZXh0EicKBW'
    'ltYWdlGAIgASgLMg8uUHJvdG9jb2wuSW1hZ2VIAFIFaW1hZ2USJwoFdmlkZW8YAyABKAsyDy5Q'
    'cm90b2NvbC5WaWRlb0gAUgV2aWRlbxIkCgRmaWxlGAQgASgLMg4uUHJvdG9jb2wuRmlsZUgAUg'
    'RmaWxlEi0KBnN5c3RlbRgFIAEoCzITLlByb3RvY29sLlN5c3RlbU1zZ0gAUgZzeXN0ZW1CBgoE'
    'ZGF0YQ==');

@$core.Deprecated('Use c_ChatDescriptor instead')
const C_Chat$json = {
  '1': 'C_Chat',
  '2': [
    {'1': 'conv_id', '3': 1, '4': 1, '5': 9, '10': 'convId'},
    {'1': 'client_msg_id', '3': 2, '4': 1, '5': 3, '10': 'clientMsgId'},
    {
      '1': 'payload',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Protocol.ChatPayload',
      '10': 'payload'
    },
    {'1': 'ts_client', '3': 4, '4': 1, '5': 3, '10': 'tsClient'},
    {'1': 'reply_to_seq', '3': 5, '4': 1, '5': 3, '10': 'replyToSeq'},
  ],
};

/// Descriptor for `C_Chat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ChatDescriptor = $convert.base64Decode(
    'CgZDX0NoYXQSFwoHY29udl9pZBgBIAEoCVIGY29udklkEiIKDWNsaWVudF9tc2dfaWQYAiABKA'
    'NSC2NsaWVudE1zZ0lkEi8KB3BheWxvYWQYAyABKAsyFS5Qcm90b2NvbC5DaGF0UGF5bG9hZFIH'
    'cGF5bG9hZBIbCgl0c19jbGllbnQYBCABKANSCHRzQ2xpZW50EiAKDHJlcGx5X3RvX3NlcRgFIA'
    'EoA1IKcmVwbHlUb1NlcQ==');

@$core.Deprecated('Use s_ChatDescriptor instead')
const S_Chat$json = {
  '1': 'S_Chat',
  '2': [
    {'1': 'conv_id', '3': 1, '4': 1, '5': 9, '10': 'convId'},
    {'1': 'client_msg_id', '3': 2, '4': 1, '5': 3, '10': 'clientMsgId'},
    {'1': 'msg_seq', '3': 3, '4': 1, '5': 3, '10': 'msgSeq'},
    {'1': 'sender_id', '3': 4, '4': 1, '5': 9, '10': 'senderId'},
    {'1': 'sender_name', '3': 5, '4': 1, '5': 9, '10': 'senderName'},
    {
      '1': 'payload',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.Protocol.ChatPayload',
      '10': 'payload'
    },
    {'1': 'ts_server', '3': 7, '4': 1, '5': 3, '10': 'tsServer'},
    {'1': 'reply_to_seq', '3': 8, '4': 1, '5': 3, '10': 'replyToSeq'},
  ],
};

/// Descriptor for `S_Chat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_ChatDescriptor = $convert.base64Decode(
    'CgZTX0NoYXQSFwoHY29udl9pZBgBIAEoCVIGY29udklkEiIKDWNsaWVudF9tc2dfaWQYAiABKA'
    'NSC2NsaWVudE1zZ0lkEhcKB21zZ19zZXEYAyABKANSBm1zZ1NlcRIbCglzZW5kZXJfaWQYBCAB'
    'KAlSCHNlbmRlcklkEh8KC3NlbmRlcl9uYW1lGAUgASgJUgpzZW5kZXJOYW1lEi8KB3BheWxvYW'
    'QYBiABKAsyFS5Qcm90b2NvbC5DaGF0UGF5bG9hZFIHcGF5bG9hZBIbCgl0c19zZXJ2ZXIYByAB'
    'KANSCHRzU2VydmVyEiAKDHJlcGx5X3RvX3NlcRgIIAEoA1IKcmVwbHlUb1NlcQ==');

@$core.Deprecated('Use c_ReqHistoryDescriptor instead')
const C_ReqHistory$json = {
  '1': 'C_ReqHistory',
  '2': [
    {'1': 'conv_id', '3': 1, '4': 1, '5': 9, '10': 'convId'},
    {'1': 'last_msg_seq', '3': 2, '4': 1, '5': 3, '10': 'lastMsgSeq'},
    {'1': 'limit', '3': 3, '4': 1, '5': 3, '10': 'limit'},
  ],
};

/// Descriptor for `C_ReqHistory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ReqHistoryDescriptor = $convert.base64Decode(
    'CgxDX1JlcUhpc3RvcnkSFwoHY29udl9pZBgBIAEoCVIGY29udklkEiAKDGxhc3RfbXNnX3NlcR'
    'gCIAEoA1IKbGFzdE1zZ1NlcRIUCgVsaW1pdBgDIAEoA1IFbGltaXQ=');

@$core.Deprecated('Use s_ReqHistoryDescriptor instead')
const S_ReqHistory$json = {
  '1': 'S_ReqHistory',
  '2': [
    {'1': 'conv_id', '3': 1, '4': 1, '5': 9, '10': 'convId'},
    {
      '1': 'messages',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.Protocol.S_Chat',
      '10': 'messages'
    },
    {'1': 'is_end', '3': 3, '4': 1, '5': 8, '10': 'isEnd'},
  ],
};

/// Descriptor for `S_ReqHistory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_ReqHistoryDescriptor = $convert.base64Decode(
    'CgxTX1JlcUhpc3RvcnkSFwoHY29udl9pZBgBIAEoCVIGY29udklkEiwKCG1lc3NhZ2VzGAIgAy'
    'gLMhAuUHJvdG9jb2wuU19DaGF0UghtZXNzYWdlcxIVCgZpc19lbmQYAyABKAhSBWlzRW5k');

@$core.Deprecated('Use c_UploadFileDescriptor instead')
const C_UploadFile$json = {
  '1': 'C_UploadFile',
  '2': [
    {'1': 'filename', '3': 1, '4': 1, '5': 9, '10': 'filename'},
    {'1': 'size', '3': 2, '4': 1, '5': 3, '10': 'size'},
    {'1': 'mime_type', '3': 3, '4': 1, '5': 9, '10': 'mimeType'},
    {'1': 'is_image', '3': 4, '4': 1, '5': 8, '10': 'isImage'},
    {
      '1': 'upload_type',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.Protocol.C_UploadFile.UploadType',
      '10': 'uploadType'
    },
    {'1': 'target_id', '3': 6, '4': 1, '5': 9, '10': 'targetId'},
  ],
  '4': [C_UploadFile_UploadType$json],
};

@$core.Deprecated('Use c_UploadFileDescriptor instead')
const C_UploadFile_UploadType$json = {
  '1': 'UploadType',
  '2': [
    {'1': 'DIRECT_CHAT', '2': 0},
    {'1': 'GROUP_CHAT', '2': 1},
    {'1': 'PROFILE_IMG', '2': 2},
    {'1': 'GROUP_PROFILE_IMG', '2': 3},
    {'1': 'BACKGROUND_IMG', '2': 4},
  ],
};

/// Descriptor for `C_UploadFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_UploadFileDescriptor = $convert.base64Decode(
    'CgxDX1VwbG9hZEZpbGUSGgoIZmlsZW5hbWUYASABKAlSCGZpbGVuYW1lEhIKBHNpemUYAiABKA'
    'NSBHNpemUSGwoJbWltZV90eXBlGAMgASgJUghtaW1lVHlwZRIZCghpc19pbWFnZRgEIAEoCFIH'
    'aXNJbWFnZRJCCgt1cGxvYWRfdHlwZRgFIAEoDjIhLlByb3RvY29sLkNfVXBsb2FkRmlsZS5VcG'
    'xvYWRUeXBlUgp1cGxvYWRUeXBlEhsKCXRhcmdldF9pZBgGIAEoCVIIdGFyZ2V0SWQiaQoKVXBs'
    'b2FkVHlwZRIPCgtESVJFQ1RfQ0hBVBAAEg4KCkdST1VQX0NIQVQQARIPCgtQUk9GSUxFX0lNRx'
    'ACEhUKEUdST1VQX1BST0ZJTEVfSU1HEAMSEgoOQkFDS0dST1VORF9JTUcQBA==');

@$core.Deprecated('Use s_UploadFileDescriptor instead')
const S_UploadFile$json = {
  '1': 'S_UploadFile',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'file_id', '3': 3, '4': 1, '5': 9, '10': 'fileId'},
    {'1': 'upload_url', '3': 4, '4': 1, '5': 9, '10': 'uploadUrl'},
    {'1': 'download_url', '3': 5, '4': 1, '5': 9, '10': 'downloadUrl'},
    {'1': 'thumb_upload_url', '3': 6, '4': 1, '5': 9, '10': 'thumbUploadUrl'},
    {'1': 'thumbnail_url', '3': 7, '4': 1, '5': 9, '10': 'thumbnailUrl'},
    {'1': 'expires_at', '3': 8, '4': 1, '5': 3, '10': 'expiresAt'},
    {'1': 'path', '3': 9, '4': 1, '5': 9, '10': 'path'},
  ],
};

/// Descriptor for `S_UploadFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_UploadFileDescriptor = $convert.base64Decode(
    'CgxTX1VwbG9hZEZpbGUSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYWdlGAIgAS'
    'gJUgdtZXNzYWdlEhcKB2ZpbGVfaWQYAyABKAlSBmZpbGVJZBIdCgp1cGxvYWRfdXJsGAQgASgJ'
    'Ugl1cGxvYWRVcmwSIQoMZG93bmxvYWRfdXJsGAUgASgJUgtkb3dubG9hZFVybBIoChB0aHVtYl'
    '91cGxvYWRfdXJsGAYgASgJUg50aHVtYlVwbG9hZFVybBIjCg10aHVtYm5haWxfdXJsGAcgASgJ'
    'Ugx0aHVtYm5haWxVcmwSHQoKZXhwaXJlc19hdBgIIAEoA1IJZXhwaXJlc0F0EhIKBHBhdGgYCS'
    'ABKAlSBHBhdGg=');

@$core.Deprecated('Use c_AckDescriptor instead')
const C_Ack$json = {
  '1': 'C_Ack',
  '2': [
    {'1': 'conv_id', '3': 1, '4': 1, '5': 9, '10': 'convId'},
    {'1': 'msg_seq', '3': 2, '4': 1, '5': 3, '10': 'msgSeq'},
  ],
};

/// Descriptor for `C_Ack`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_AckDescriptor = $convert.base64Decode(
    'CgVDX0FjaxIXCgdjb252X2lkGAEgASgJUgZjb252SWQSFwoHbXNnX3NlcRgCIAEoA1IGbXNnU2'
    'Vx');

@$core.Deprecated('Use c_FetchOfflineDescriptor instead')
const C_FetchOffline$json = {
  '1': 'C_FetchOffline',
  '2': [
    {'1': 'since_ts', '3': 1, '4': 1, '5': 3, '10': 'sinceTs'},
  ],
};

/// Descriptor for `C_FetchOffline`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_FetchOfflineDescriptor = $convert.base64Decode(
    'Cg5DX0ZldGNoT2ZmbGluZRIZCghzaW5jZV90cxgBIAEoA1IHc2luY2VUcw==');

@$core.Deprecated('Use s_MessageBatchDescriptor instead')
const S_MessageBatch$json = {
  '1': 'S_MessageBatch',
  '2': [
    {
      '1': 'batches',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.Protocol.S_MessageBatch.ConversationBatch',
      '10': 'batches'
    },
  ],
  '3': [S_MessageBatch_ConversationBatch$json],
};

@$core.Deprecated('Use s_MessageBatchDescriptor instead')
const S_MessageBatch_ConversationBatch$json = {
  '1': 'ConversationBatch',
  '2': [
    {'1': 'conv_id', '3': 1, '4': 1, '5': 9, '10': 'convId'},
    {
      '1': 'messages',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.Protocol.S_Chat',
      '10': 'messages'
    },
    {'1': 'unread_count', '3': 3, '4': 1, '5': 3, '10': 'unreadCount'},
  ],
};

/// Descriptor for `S_MessageBatch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_MessageBatchDescriptor = $convert.base64Decode(
    'Cg5TX01lc3NhZ2VCYXRjaBJECgdiYXRjaGVzGAEgAygLMiouUHJvdG9jb2wuU19NZXNzYWdlQm'
    'F0Y2guQ29udmVyc2F0aW9uQmF0Y2hSB2JhdGNoZXMafQoRQ29udmVyc2F0aW9uQmF0Y2gSFwoH'
    'Y29udl9pZBgBIAEoCVIGY29udklkEiwKCG1lc3NhZ2VzGAIgAygLMhAuUHJvdG9jb2wuU19DaG'
    'F0UghtZXNzYWdlcxIhCgx1bnJlYWRfY291bnQYAyABKANSC3VucmVhZENvdW50');

@$core.Deprecated('Use friendRequestDescriptor instead')
const FriendRequest$json = {
  '1': 'FriendRequest',
  '2': [
    {
      '1': 'requester',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.Protocol.UserInfo',
      '10': 'requester'
    },
    {'1': 'requested_at', '3': 2, '4': 1, '5': 3, '10': 'requestedAt'},
    {'1': 'is_received', '3': 3, '4': 1, '5': 8, '10': 'isReceived'},
  ],
};

/// Descriptor for `FriendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List friendRequestDescriptor = $convert.base64Decode(
    'Cg1GcmllbmRSZXF1ZXN0EjAKCXJlcXVlc3RlchgBIAEoCzISLlByb3RvY29sLlVzZXJJbmZvUg'
    'lyZXF1ZXN0ZXISIQoMcmVxdWVzdGVkX2F0GAIgASgDUgtyZXF1ZXN0ZWRBdBIfCgtpc19yZWNl'
    'aXZlZBgDIAEoCFIKaXNSZWNlaXZlZA==');

@$core.Deprecated('Use c_SearchUserDescriptor instead')
const C_SearchUser$json = {
  '1': 'C_SearchUser',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `C_SearchUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_SearchUserDescriptor = $convert
    .base64Decode('CgxDX1NlYXJjaFVzZXISFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklk');

@$core.Deprecated('Use s_SearchUserDescriptor instead')
const S_SearchUser$json = {
  '1': 'S_SearchUser',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {
      '1': 'user_info',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.Protocol.UserInfo',
      '10': 'userInfo'
    },
    {'1': 'is_friend', '3': 3, '4': 1, '5': 8, '10': 'isFriend'},
    {'1': 'has_sent_request', '3': 4, '4': 1, '5': 8, '10': 'hasSentRequest'},
  ],
};

/// Descriptor for `S_SearchUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SearchUserDescriptor = $convert.base64Decode(
    'CgxTX1NlYXJjaFVzZXISGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIvCgl1c2VyX2luZm8YAi'
    'ABKAsyEi5Qcm90b2NvbC5Vc2VySW5mb1IIdXNlckluZm8SGwoJaXNfZnJpZW5kGAMgASgIUghp'
    'c0ZyaWVuZBIoChBoYXNfc2VudF9yZXF1ZXN0GAQgASgIUg5oYXNTZW50UmVxdWVzdA==');

@$core.Deprecated('Use c_FriendActionDescriptor instead')
const C_FriendAction$json = {
  '1': 'C_FriendAction',
  '2': [
    {
      '1': 'action',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.Protocol.C_FriendAction.ActionType',
      '10': 'action'
    },
    {'1': 'target_user_id', '3': 2, '4': 1, '5': 9, '10': 'targetUserId'},
  ],
  '4': [C_FriendAction_ActionType$json],
};

@$core.Deprecated('Use c_FriendActionDescriptor instead')
const C_FriendAction_ActionType$json = {
  '1': 'ActionType',
  '2': [
    {'1': 'SEND_REQUEST', '2': 0},
    {'1': 'CANCEL_REQUEST', '2': 1},
    {'1': 'ACCEPT_REQUEST', '2': 2},
    {'1': 'REJECT_REQUEST', '2': 3},
    {'1': 'DELETE_FRIEND', '2': 4},
  ],
};

/// Descriptor for `C_FriendAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_FriendActionDescriptor = $convert.base64Decode(
    'Cg5DX0ZyaWVuZEFjdGlvbhI7CgZhY3Rpb24YASABKA4yIy5Qcm90b2NvbC5DX0ZyaWVuZEFjdG'
    'lvbi5BY3Rpb25UeXBlUgZhY3Rpb24SJAoOdGFyZ2V0X3VzZXJfaWQYAiABKAlSDHRhcmdldFVz'
    'ZXJJZCJtCgpBY3Rpb25UeXBlEhAKDFNFTkRfUkVRVUVTVBAAEhIKDkNBTkNFTF9SRVFVRVNUEA'
    'ESEgoOQUNDRVBUX1JFUVVFU1QQAhISCg5SRUpFQ1RfUkVRVUVTVBADEhEKDURFTEVURV9GUklF'
    'TkQQBA==');

@$core.Deprecated('Use s_FriendActionDescriptor instead')
const S_FriendAction$json = {
  '1': 'S_FriendAction',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {
      '1': 'updated_friend',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Protocol.UserInfo',
      '10': 'updatedFriend'
    },
  ],
};

/// Descriptor for `S_FriendAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_FriendActionDescriptor = $convert.base64Decode(
    'Cg5TX0ZyaWVuZEFjdGlvbhIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3NhZ2UYAi'
    'ABKAlSB21lc3NhZ2USOQoOdXBkYXRlZF9mcmllbmQYAyABKAsyEi5Qcm90b2NvbC5Vc2VySW5m'
    'b1INdXBkYXRlZEZyaWVuZA==');

@$core.Deprecated('Use c_FetchFriendDataDescriptor instead')
const C_FetchFriendData$json = {
  '1': 'C_FetchFriendData',
};

/// Descriptor for `C_FetchFriendData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_FetchFriendDataDescriptor =
    $convert.base64Decode('ChFDX0ZldGNoRnJpZW5kRGF0YQ==');

@$core.Deprecated('Use s_FetchFriendDataDescriptor instead')
const S_FetchFriendData$json = {
  '1': 'S_FetchFriendData',
  '2': [
    {
      '1': 'friends',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.Protocol.UserInfo',
      '10': 'friends'
    },
    {
      '1': 'received_requests',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.Protocol.FriendRequest',
      '10': 'receivedRequests'
    },
    {
      '1': 'sent_requests',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.Protocol.FriendRequest',
      '10': 'sentRequests'
    },
  ],
};

/// Descriptor for `S_FetchFriendData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_FetchFriendDataDescriptor = $convert.base64Decode(
    'ChFTX0ZldGNoRnJpZW5kRGF0YRIsCgdmcmllbmRzGAEgAygLMhIuUHJvdG9jb2wuVXNlckluZm'
    '9SB2ZyaWVuZHMSRAoRcmVjZWl2ZWRfcmVxdWVzdHMYAiADKAsyFy5Qcm90b2NvbC5GcmllbmRS'
    'ZXF1ZXN0UhByZWNlaXZlZFJlcXVlc3RzEjwKDXNlbnRfcmVxdWVzdHMYAyADKAsyFy5Qcm90b2'
    'NvbC5GcmllbmRSZXF1ZXN0UgxzZW50UmVxdWVzdHM=');

@$core.Deprecated('Use s_FriendPushDescriptor instead')
const S_FriendPush$json = {
  '1': 'S_FriendPush',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.Protocol.S_FriendPush.PushType',
      '10': 'type'
    },
    {
      '1': 'user_info',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.Protocol.UserInfo',
      '10': 'userInfo'
    },
  ],
  '4': [S_FriendPush_PushType$json],
};

@$core.Deprecated('Use s_FriendPushDescriptor instead')
const S_FriendPush_PushType$json = {
  '1': 'PushType',
  '2': [
    {'1': 'NEW_REQUEST', '2': 0},
    {'1': 'ACCEPTED', '2': 1},
    {'1': 'DELETED', '2': 2},
  ],
};

/// Descriptor for `S_FriendPush`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_FriendPushDescriptor = $convert.base64Decode(
    'CgxTX0ZyaWVuZFB1c2gSMwoEdHlwZRgBIAEoDjIfLlByb3RvY29sLlNfRnJpZW5kUHVzaC5QdX'
    'NoVHlwZVIEdHlwZRIvCgl1c2VyX2luZm8YAiABKAsyEi5Qcm90b2NvbC5Vc2VySW5mb1IIdXNl'
    'ckluZm8iNgoIUHVzaFR5cGUSDwoLTkVXX1JFUVVFU1QQABIMCghBQ0NFUFRFRBABEgsKB0RFTE'
    'VURUQQAg==');

@$core.Deprecated('Use groupMemberInfoDescriptor instead')
const GroupMemberInfo$json = {
  '1': 'GroupMemberInfo',
  '2': [
    {
      '1': 'user_info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.Protocol.UserInfo',
      '10': 'userInfo'
    },
    {
      '1': 'role',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.Protocol.GroupRole',
      '10': 'role'
    },
    {'1': 'joined_at', '3': 3, '4': 1, '5': 3, '10': 'joinedAt'},
  ],
};

/// Descriptor for `GroupMemberInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupMemberInfoDescriptor = $convert.base64Decode(
    'Cg9Hcm91cE1lbWJlckluZm8SLwoJdXNlcl9pbmZvGAEgASgLMhIuUHJvdG9jb2wuVXNlckluZm'
    '9SCHVzZXJJbmZvEicKBHJvbGUYAiABKA4yEy5Qcm90b2NvbC5Hcm91cFJvbGVSBHJvbGUSGwoJ'
    'am9pbmVkX2F0GAMgASgDUghqb2luZWRBdA==');

@$core.Deprecated('Use groupInfoDescriptor instead')
const GroupInfo$json = {
  '1': 'GroupInfo',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 9, '10': 'groupId'},
    {'1': 'group_name', '3': 2, '4': 1, '5': 9, '10': 'groupName'},
    {'1': 'group_code', '3': 3, '4': 1, '5': 9, '10': 'groupCode'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {'1': 'group_image_url', '3': 5, '4': 1, '5': 9, '10': 'groupImageUrl'},
    {'1': 'member_count', '3': 6, '4': 1, '5': 5, '10': 'memberCount'},
    {
      '1': 'storage_capacity_bytes',
      '3': 7,
      '4': 1,
      '5': 3,
      '10': 'storageCapacityBytes'
    },
    {
      '1': 'storage_usage_bytes',
      '3': 8,
      '4': 1,
      '5': 3,
      '10': 'storageUsageBytes'
    },
  ],
};

/// Descriptor for `GroupInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupInfoDescriptor = $convert.base64Decode(
    'CglHcm91cEluZm8SGQoIZ3JvdXBfaWQYASABKAlSB2dyb3VwSWQSHQoKZ3JvdXBfbmFtZRgCIA'
    'EoCVIJZ3JvdXBOYW1lEh0KCmdyb3VwX2NvZGUYAyABKAlSCWdyb3VwQ29kZRIgCgtkZXNjcmlw'
    'dGlvbhgEIAEoCVILZGVzY3JpcHRpb24SJgoPZ3JvdXBfaW1hZ2VfdXJsGAUgASgJUg1ncm91cE'
    'ltYWdlVXJsEiEKDG1lbWJlcl9jb3VudBgGIAEoBVILbWVtYmVyQ291bnQSNAoWc3RvcmFnZV9j'
    'YXBhY2l0eV9ieXRlcxgHIAEoA1IUc3RvcmFnZUNhcGFjaXR5Qnl0ZXMSLgoTc3RvcmFnZV91c2'
    'FnZV9ieXRlcxgIIAEoA1IRc3RvcmFnZVVzYWdlQnl0ZXM=');

@$core.Deprecated('Use c_CreateGroupDescriptor instead')
const C_CreateGroup$json = {
  '1': 'C_CreateGroup',
  '2': [
    {'1': 'group_name', '3': 1, '4': 1, '5': 9, '10': 'groupName'},
  ],
};

/// Descriptor for `C_CreateGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_CreateGroupDescriptor = $convert.base64Decode(
    'Cg1DX0NyZWF0ZUdyb3VwEh0KCmdyb3VwX25hbWUYASABKAlSCWdyb3VwTmFtZQ==');

@$core.Deprecated('Use s_CreateGroupDescriptor instead')
const S_CreateGroup$json = {
  '1': 'S_CreateGroup',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {
      '1': 'group',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.Protocol.GroupInfo',
      '10': 'group'
    },
  ],
};

/// Descriptor for `S_CreateGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_CreateGroupDescriptor = $convert.base64Decode(
    'Cg1TX0NyZWF0ZUdyb3VwEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSKQoFZ3JvdXAYAiABKA'
    'syEy5Qcm90b2NvbC5Hcm91cEluZm9SBWdyb3Vw');

@$core.Deprecated('Use c_GroupListDescriptor instead')
const C_GroupList$json = {
  '1': 'C_GroupList',
};

/// Descriptor for `C_GroupList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_GroupListDescriptor =
    $convert.base64Decode('CgtDX0dyb3VwTGlzdA==');

@$core.Deprecated('Use s_GroupListDescriptor instead')
const S_GroupList$json = {
  '1': 'S_GroupList',
  '2': [
    {
      '1': 'groups',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.Protocol.GroupInfo',
      '10': 'groups'
    },
  ],
};

/// Descriptor for `S_GroupList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_GroupListDescriptor = $convert.base64Decode(
    'CgtTX0dyb3VwTGlzdBIrCgZncm91cHMYASADKAsyEy5Qcm90b2NvbC5Hcm91cEluZm9SBmdyb3'
    'Vwcw==');

@$core.Deprecated('Use c_GroupInfoDescriptor instead')
const C_GroupInfo$json = {
  '1': 'C_GroupInfo',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 9, '10': 'groupId'},
  ],
};

/// Descriptor for `C_GroupInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_GroupInfoDescriptor = $convert
    .base64Decode('CgtDX0dyb3VwSW5mbxIZCghncm91cF9pZBgBIAEoCVIHZ3JvdXBJZA==');

@$core.Deprecated('Use s_GroupInfoDescriptor instead')
const S_GroupInfo$json = {
  '1': 'S_GroupInfo',
  '2': [
    {
      '1': 'group',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.Protocol.GroupInfo',
      '10': 'group'
    },
    {
      '1': 'my_role',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.Protocol.GroupRole',
      '10': 'myRole'
    },
  ],
};

/// Descriptor for `S_GroupInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_GroupInfoDescriptor = $convert.base64Decode(
    'CgtTX0dyb3VwSW5mbxIpCgVncm91cBgBIAEoCzITLlByb3RvY29sLkdyb3VwSW5mb1IFZ3JvdX'
    'ASLAoHbXlfcm9sZRgCIAEoDjITLlByb3RvY29sLkdyb3VwUm9sZVIGbXlSb2xl');

@$core.Deprecated('Use c_InviteFriendDescriptor instead')
const C_InviteFriend$json = {
  '1': 'C_InviteFriend',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 9, '10': 'groupId'},
    {'1': 'friend_user_ids', '3': 2, '4': 3, '5': 9, '10': 'friendUserIds'},
  ],
};

/// Descriptor for `C_InviteFriend`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_InviteFriendDescriptor = $convert.base64Decode(
    'Cg5DX0ludml0ZUZyaWVuZBIZCghncm91cF9pZBgBIAEoCVIHZ3JvdXBJZBImCg9mcmllbmRfdX'
    'Nlcl9pZHMYAiADKAlSDWZyaWVuZFVzZXJJZHM=');

@$core.Deprecated('Use s_InviteFriendDescriptor instead')
const S_InviteFriend$json = {
  '1': 'S_InviteFriend',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `S_InviteFriend`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_InviteFriendDescriptor = $convert
    .base64Decode('Cg5TX0ludml0ZUZyaWVuZBIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use c_JoinGroupDescriptor instead')
const C_JoinGroup$json = {
  '1': 'C_JoinGroup',
  '2': [
    {'1': 'group_code', '3': 1, '4': 1, '5': 9, '10': 'groupCode'},
  ],
};

/// Descriptor for `C_JoinGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_JoinGroupDescriptor = $convert.base64Decode(
    'CgtDX0pvaW5Hcm91cBIdCgpncm91cF9jb2RlGAEgASgJUglncm91cENvZGU=');

@$core.Deprecated('Use s_JoinGroupDescriptor instead')
const S_JoinGroup$json = {
  '1': 'S_JoinGroup',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {
      '1': 'group',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.Protocol.GroupInfo',
      '10': 'group'
    },
  ],
};

/// Descriptor for `S_JoinGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_JoinGroupDescriptor = $convert.base64Decode(
    'CgtTX0pvaW5Hcm91cBIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEikKBWdyb3VwGAIgASgLMh'
    'MuUHJvdG9jb2wuR3JvdXBJbmZvUgVncm91cA==');

@$core.Deprecated('Use c_GroupMemberListDescriptor instead')
const C_GroupMemberList$json = {
  '1': 'C_GroupMemberList',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 9, '10': 'groupId'},
  ],
};

/// Descriptor for `C_GroupMemberList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_GroupMemberListDescriptor = $convert.base64Decode(
    'ChFDX0dyb3VwTWVtYmVyTGlzdBIZCghncm91cF9pZBgBIAEoCVIHZ3JvdXBJZA==');

@$core.Deprecated('Use s_GroupMemberListDescriptor instead')
const S_GroupMemberList$json = {
  '1': 'S_GroupMemberList',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 9, '10': 'groupId'},
    {
      '1': 'members',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.Protocol.GroupMemberInfo',
      '10': 'members'
    },
  ],
};

/// Descriptor for `S_GroupMemberList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_GroupMemberListDescriptor = $convert.base64Decode(
    'ChFTX0dyb3VwTWVtYmVyTGlzdBIZCghncm91cF9pZBgBIAEoCVIHZ3JvdXBJZBIzCgdtZW1iZX'
    'JzGAIgAygLMhkuUHJvdG9jb2wuR3JvdXBNZW1iZXJJbmZvUgdtZW1iZXJz');

@$core.Deprecated('Use c_LeaveGroupDescriptor instead')
const C_LeaveGroup$json = {
  '1': 'C_LeaveGroup',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 9, '10': 'groupId'},
  ],
};

/// Descriptor for `C_LeaveGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_LeaveGroupDescriptor = $convert
    .base64Decode('CgxDX0xlYXZlR3JvdXASGQoIZ3JvdXBfaWQYASABKAlSB2dyb3VwSWQ=');

@$core.Deprecated('Use s_LeaveGroupDescriptor instead')
const S_LeaveGroup$json = {
  '1': 'S_LeaveGroup',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `S_LeaveGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_LeaveGroupDescriptor = $convert
    .base64Decode('CgxTX0xlYXZlR3JvdXASGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use c_EditGroupDescriptor instead')
const C_EditGroup$json = {
  '1': 'C_EditGroup',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 9, '10': 'groupId'},
    {'1': 'new_name', '3': 2, '4': 1, '5': 9, '10': 'newName'},
    {'1': 'new_description', '3': 3, '4': 1, '5': 9, '10': 'newDescription'},
    {'1': 'new_image_url', '3': 4, '4': 1, '5': 9, '10': 'newImageUrl'},
  ],
};

/// Descriptor for `C_EditGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_EditGroupDescriptor = $convert.base64Decode(
    'CgtDX0VkaXRHcm91cBIZCghncm91cF9pZBgBIAEoCVIHZ3JvdXBJZBIZCghuZXdfbmFtZRgCIA'
    'EoCVIHbmV3TmFtZRInCg9uZXdfZGVzY3JpcHRpb24YAyABKAlSDm5ld0Rlc2NyaXB0aW9uEiIK'
    'DW5ld19pbWFnZV91cmwYBCABKAlSC25ld0ltYWdlVXJs');

@$core.Deprecated('Use s_EditGroupDescriptor instead')
const S_EditGroup$json = {
  '1': 'S_EditGroup',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {
      '1': 'group',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.Protocol.GroupInfo',
      '10': 'group'
    },
  ],
};

/// Descriptor for `S_EditGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_EditGroupDescriptor = $convert.base64Decode(
    'CgtTX0VkaXRHcm91cBIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEikKBWdyb3VwGAIgASgLMh'
    'MuUHJvdG9jb2wuR3JvdXBJbmZvUgVncm91cA==');

@$core.Deprecated('Use c_WithdrawDescriptor instead')
const C_Withdraw$json = {
  '1': 'C_Withdraw',
  '2': [
    {'1': 'password', '3': 1, '4': 1, '5': 9, '10': 'password'},
    {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `C_Withdraw`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_WithdrawDescriptor = $convert.base64Decode(
    'CgpDX1dpdGhkcmF3EhoKCHBhc3N3b3JkGAEgASgJUghwYXNzd29yZBIWCgZyZWFzb24YAiABKA'
    'lSBnJlYXNvbg==');

@$core.Deprecated('Use s_WithdrawDescriptor instead')
const S_Withdraw$json = {
  '1': 'S_Withdraw',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `S_Withdraw`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_WithdrawDescriptor = $convert.base64Decode(
    'CgpTX1dpdGhkcmF3EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2FnZRgCIAEoCV'
    'IHbWVzc2FnZQ==');

@$core.Deprecated('Use s_ErrorDescriptor instead')
const S_Error$json = {
  '1': 'S_Error',
  '2': [
    {
      '1': 'error_code',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.Protocol.ErrorCode',
      '10': 'errorCode'
    },
    {'1': 'code', '3': 2, '4': 1, '5': 13, '10': 'code'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `S_Error`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_ErrorDescriptor = $convert.base64Decode(
    'CgdTX0Vycm9yEjIKCmVycm9yX2NvZGUYASABKA4yEy5Qcm90b2NvbC5FcnJvckNvZGVSCWVycm'
    '9yQ29kZRISCgRjb2RlGAIgASgNUgRjb2RlEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use c_HeartbeatDescriptor instead')
const C_Heartbeat$json = {
  '1': 'C_Heartbeat',
};

/// Descriptor for `C_Heartbeat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_HeartbeatDescriptor =
    $convert.base64Decode('CgtDX0hlYXJ0YmVhdA==');

@$core.Deprecated('Use s_HeartbeatDescriptor instead')
const S_Heartbeat$json = {
  '1': 'S_Heartbeat',
};

/// Descriptor for `S_Heartbeat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_HeartbeatDescriptor =
    $convert.base64Decode('CgtTX0hlYXJ0YmVhdA==');
