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
    'VfVVJMEJYD');

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
      '1': 'c_join_direct',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_JoinDirect',
      '9': 0,
      '10': 'cJoinDirect'
    },
    {
      '1': 'c_join_group',
      '3': 23,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_JoinGroup',
      '9': 0,
      '10': 'cJoinGroup'
    },
    {
      '1': 'c_create_group',
      '3': 24,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_CreateGroup',
      '9': 0,
      '10': 'cCreateGroup'
    },
    {
      '1': 's_create_group',
      '3': 25,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_CreateGroup',
      '9': 0,
      '10': 'sCreateGroup'
    },
    {
      '1': 'c_ack',
      '3': 26,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_Ack',
      '9': 0,
      '10': 'cAck'
    },
    {
      '1': 's_error',
      '3': 27,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_Error',
      '9': 0,
      '10': 'sError'
    },
    {
      '1': 'c_heartbeat',
      '3': 28,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_Heartbeat',
      '9': 0,
      '10': 'cHeartbeat'
    },
    {
      '1': 's_heartbeat',
      '3': 29,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_Heartbeat',
      '9': 0,
      '10': 'sHeartbeat'
    },
    {
      '1': 'c_chat',
      '3': 30,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_Chat',
      '9': 0,
      '10': 'cChat'
    },
    {
      '1': 's_chat',
      '3': 31,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_Chat',
      '9': 0,
      '10': 'sChat'
    },
    {
      '1': 'c_fetch_offline',
      '3': 32,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_FetchOffline',
      '9': 0,
      '10': 'cFetchOffline'
    },
    {
      '1': 's_message_batch',
      '3': 33,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_MessageBatch',
      '9': 0,
      '10': 'sMessageBatch'
    },
    {
      '1': 'c_upload_file',
      '3': 34,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_UploadFile',
      '9': 0,
      '10': 'cUploadFile'
    },
    {
      '1': 's_upload_file',
      '3': 35,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_UploadFile',
      '9': 0,
      '10': 'sUploadFile'
    },
    {
      '1': 'c_search_user',
      '3': 40,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_SearchUser',
      '9': 0,
      '10': 'cSearchUser'
    },
    {
      '1': 's_search_user',
      '3': 41,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_SearchUser',
      '9': 0,
      '10': 'sSearchUser'
    },
    {
      '1': 'c_friend_action',
      '3': 42,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_FriendAction',
      '9': 0,
      '10': 'cFriendAction'
    },
    {
      '1': 's_friend_action',
      '3': 43,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_FriendAction',
      '9': 0,
      '10': 'sFriendAction'
    },
    {
      '1': 'c_fetch_friend_data',
      '3': 44,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_FetchFriendData',
      '9': 0,
      '10': 'cFetchFriendData'
    },
    {
      '1': 's_fetch_friend_data',
      '3': 45,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_FetchFriendData',
      '9': 0,
      '10': 'sFetchFriendData'
    },
    {
      '1': 's_friend_push',
      '3': 46,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_FriendPush',
      '9': 0,
      '10': 'sFriendPush'
    },
    {
      '1': 'c_group_list',
      '3': 50,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_GroupList',
      '9': 0,
      '10': 'cGroupList'
    },
    {
      '1': 's_group_list',
      '3': 51,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_GroupList',
      '9': 0,
      '10': 'sGroupList'
    },
    {
      '1': 'c_group_join_request',
      '3': 52,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_GroupJoinRequest',
      '9': 0,
      '10': 'cGroupJoinRequest'
    },
    {
      '1': 's_group_join_request',
      '3': 53,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_GroupJoinRequest',
      '9': 0,
      '10': 'sGroupJoinRequest'
    },
    {
      '1': 'c_group_join_response',
      '3': 54,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_GroupJoinResponse',
      '9': 0,
      '10': 'cGroupJoinResponse'
    },
    {
      '1': 's_group_join_response',
      '3': 55,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_GroupJoinResponse',
      '9': 0,
      '10': 'sGroupJoinResponse'
    },
    {
      '1': 'c_group_join_request_list',
      '3': 56,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_GroupJoinRequestList',
      '9': 0,
      '10': 'cGroupJoinRequestList'
    },
    {
      '1': 's_group_join_request_list',
      '3': 57,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_GroupJoinRequestList',
      '9': 0,
      '10': 'sGroupJoinRequestList'
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
    '5TX0xvZ2luSABSBnNMb2dpbhI8Cg1jX2pvaW5fZGlyZWN0GBYgASgLMhYuUHJvdG9jb2wuQ19K'
    'b2luRGlyZWN0SABSC2NKb2luRGlyZWN0EjkKDGNfam9pbl9ncm91cBgXIAEoCzIVLlByb3RvY2'
    '9sLkNfSm9pbkdyb3VwSABSCmNKb2luR3JvdXASPwoOY19jcmVhdGVfZ3JvdXAYGCABKAsyFy5Q'
    'cm90b2NvbC5DX0NyZWF0ZUdyb3VwSABSDGNDcmVhdGVHcm91cBI/Cg5zX2NyZWF0ZV9ncm91cB'
    'gZIAEoCzIXLlByb3RvY29sLlNfQ3JlYXRlR3JvdXBIAFIMc0NyZWF0ZUdyb3VwEiYKBWNfYWNr'
    'GBogASgLMg8uUHJvdG9jb2wuQ19BY2tIAFIEY0FjaxIsCgdzX2Vycm9yGBsgASgLMhEuUHJvdG'
    '9jb2wuU19FcnJvckgAUgZzRXJyb3ISOAoLY19oZWFydGJlYXQYHCABKAsyFS5Qcm90b2NvbC5D'
    'X0hlYXJ0YmVhdEgAUgpjSGVhcnRiZWF0EjgKC3NfaGVhcnRiZWF0GB0gASgLMhUuUHJvdG9jb2'
    'wuU19IZWFydGJlYXRIAFIKc0hlYXJ0YmVhdBIpCgZjX2NoYXQYHiABKAsyEC5Qcm90b2NvbC5D'
    'X0NoYXRIAFIFY0NoYXQSKQoGc19jaGF0GB8gASgLMhAuUHJvdG9jb2wuU19DaGF0SABSBXNDaG'
    'F0EkIKD2NfZmV0Y2hfb2ZmbGluZRggIAEoCzIYLlByb3RvY29sLkNfRmV0Y2hPZmZsaW5lSABS'
    'DWNGZXRjaE9mZmxpbmUSQgoPc19tZXNzYWdlX2JhdGNoGCEgASgLMhguUHJvdG9jb2wuU19NZX'
    'NzYWdlQmF0Y2hIAFINc01lc3NhZ2VCYXRjaBI8Cg1jX3VwbG9hZF9maWxlGCIgASgLMhYuUHJv'
    'dG9jb2wuQ19VcGxvYWRGaWxlSABSC2NVcGxvYWRGaWxlEjwKDXNfdXBsb2FkX2ZpbGUYIyABKA'
    'syFi5Qcm90b2NvbC5TX1VwbG9hZEZpbGVIAFILc1VwbG9hZEZpbGUSPAoNY19zZWFyY2hfdXNl'
    'chgoIAEoCzIWLlByb3RvY29sLkNfU2VhcmNoVXNlckgAUgtjU2VhcmNoVXNlchI8Cg1zX3NlYX'
    'JjaF91c2VyGCkgASgLMhYuUHJvdG9jb2wuU19TZWFyY2hVc2VySABSC3NTZWFyY2hVc2VyEkIK'
    'D2NfZnJpZW5kX2FjdGlvbhgqIAEoCzIYLlByb3RvY29sLkNfRnJpZW5kQWN0aW9uSABSDWNGcm'
    'llbmRBY3Rpb24SQgoPc19mcmllbmRfYWN0aW9uGCsgASgLMhguUHJvdG9jb2wuU19GcmllbmRB'
    'Y3Rpb25IAFINc0ZyaWVuZEFjdGlvbhJMChNjX2ZldGNoX2ZyaWVuZF9kYXRhGCwgASgLMhsuUH'
    'JvdG9jb2wuQ19GZXRjaEZyaWVuZERhdGFIAFIQY0ZldGNoRnJpZW5kRGF0YRJMChNzX2ZldGNo'
    'X2ZyaWVuZF9kYXRhGC0gASgLMhsuUHJvdG9jb2wuU19GZXRjaEZyaWVuZERhdGFIAFIQc0ZldG'
    'NoRnJpZW5kRGF0YRI8Cg1zX2ZyaWVuZF9wdXNoGC4gASgLMhYuUHJvdG9jb2wuU19GcmllbmRQ'
    'dXNoSABSC3NGcmllbmRQdXNoEjkKDGNfZ3JvdXBfbGlzdBgyIAEoCzIVLlByb3RvY29sLkNfR3'
    'JvdXBMaXN0SABSCmNHcm91cExpc3QSOQoMc19ncm91cF9saXN0GDMgASgLMhUuUHJvdG9jb2wu'
    'U19Hcm91cExpc3RIAFIKc0dyb3VwTGlzdBJPChRjX2dyb3VwX2pvaW5fcmVxdWVzdBg0IAEoCz'
    'IcLlByb3RvY29sLkNfR3JvdXBKb2luUmVxdWVzdEgAUhFjR3JvdXBKb2luUmVxdWVzdBJPChRz'
    'X2dyb3VwX2pvaW5fcmVxdWVzdBg1IAEoCzIcLlByb3RvY29sLlNfR3JvdXBKb2luUmVxdWVzdE'
    'gAUhFzR3JvdXBKb2luUmVxdWVzdBJSChVjX2dyb3VwX2pvaW5fcmVzcG9uc2UYNiABKAsyHS5Q'
    'cm90b2NvbC5DX0dyb3VwSm9pblJlc3BvbnNlSABSEmNHcm91cEpvaW5SZXNwb25zZRJSChVzX2'
    'dyb3VwX2pvaW5fcmVzcG9uc2UYNyABKAsyHS5Qcm90b2NvbC5TX0dyb3VwSm9pblJlc3BvbnNl'
    'SABSEnNHcm91cEpvaW5SZXNwb25zZRJcChljX2dyb3VwX2pvaW5fcmVxdWVzdF9saXN0GDggAS'
    'gLMiAuUHJvdG9jb2wuQ19Hcm91cEpvaW5SZXF1ZXN0TGlzdEgAUhVjR3JvdXBKb2luUmVxdWVz'
    'dExpc3QSXAoZc19ncm91cF9qb2luX3JlcXVlc3RfbGlzdBg5IAEoCzIgLlByb3RvY29sLlNfR3'
    'JvdXBKb2luUmVxdWVzdExpc3RIAFIVc0dyb3VwSm9pblJlcXVlc3RMaXN0QgYKBGJvZHk=');

@$core.Deprecated('Use chatPayloadDescriptor instead')
const ChatPayload$json = {
  '1': 'ChatPayload',
  '2': [
    {
      '1': 'text',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.Protocol.TextMsg',
      '9': 0,
      '10': 'text'
    },
    {
      '1': 'image',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.Protocol.ImageMsg',
      '9': 0,
      '10': 'image'
    },
    {
      '1': 'file',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Protocol.FileMsg',
      '9': 0,
      '10': 'file'
    },
  ],
  '8': [
    {'1': 'data'},
  ],
};

/// Descriptor for `ChatPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatPayloadDescriptor = $convert.base64Decode(
    'CgtDaGF0UGF5bG9hZBInCgR0ZXh0GAEgASgLMhEuUHJvdG9jb2wuVGV4dE1zZ0gAUgR0ZXh0Ei'
    'oKBWltYWdlGAIgASgLMhIuUHJvdG9jb2wuSW1hZ2VNc2dIAFIFaW1hZ2USJwoEZmlsZRgDIAEo'
    'CzIRLlByb3RvY29sLkZpbGVNc2dIAFIEZmlsZUIGCgRkYXRh');

@$core.Deprecated('Use textMsgDescriptor instead')
const TextMsg$json = {
  '1': 'TextMsg',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `TextMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textMsgDescriptor =
    $convert.base64Decode('CgdUZXh0TXNnEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use imageMsgDescriptor instead')
const ImageMsg$json = {
  '1': 'ImageMsg',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'thumbnail', '3': 2, '4': 1, '5': 9, '10': 'thumbnail'},
  ],
};

/// Descriptor for `ImageMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageMsgDescriptor = $convert.base64Decode(
    'CghJbWFnZU1zZxIQCgN1cmwYASABKAlSA3VybBIcCgl0aHVtYm5haWwYAiABKAlSCXRodW1ibm'
    'FpbA==');

@$core.Deprecated('Use fileMsgDescriptor instead')
const FileMsg$json = {
  '1': 'FileMsg',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'filename', '3': 2, '4': 1, '5': 9, '10': 'filename'},
    {'1': 'size', '3': 3, '4': 1, '5': 3, '10': 'size'},
  ],
};

/// Descriptor for `FileMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileMsgDescriptor = $convert.base64Decode(
    'CgdGaWxlTXNnEhAKA3VybBgBIAEoCVIDdXJsEhoKCGZpbGVuYW1lGAIgASgJUghmaWxlbmFtZR'
    'ISCgRzaXplGAMgASgDUgRzaXpl');

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
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'auth_token', '3': 2, '4': 1, '5': 9, '10': 'authToken'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `S_Login`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_LoginDescriptor = $convert.base64Decode(
    'CgdTX0xvZ2luEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIdCgphdXRoX3Rva2VuGAIgASgJUg'
    'lhdXRoVG9rZW4SEgoEbmFtZRgDIAEoCVIEbmFtZRIUCgVlbWFpbBgEIAEoCVIFZW1haWw=');

@$core.Deprecated('Use c_JoinDirectDescriptor instead')
const C_JoinDirect$json = {
  '1': 'C_JoinDirect',
  '2': [
    {'1': 'peer_user_id', '3': 1, '4': 1, '5': 9, '10': 'peerUserId'},
  ],
};

/// Descriptor for `C_JoinDirect`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_JoinDirectDescriptor = $convert.base64Decode(
    'CgxDX0pvaW5EaXJlY3QSIAoMcGVlcl91c2VyX2lkGAEgASgJUgpwZWVyVXNlcklk');

@$core.Deprecated('Use c_JoinGroupDescriptor instead')
const C_JoinGroup$json = {
  '1': 'C_JoinGroup',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 9, '10': 'groupId'},
  ],
};

/// Descriptor for `C_JoinGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_JoinGroupDescriptor = $convert
    .base64Decode('CgtDX0pvaW5Hcm91cBIZCghncm91cF9pZBgBIAEoCVIHZ3JvdXBJZA==');

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
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'group_id', '3': 3, '4': 1, '5': 9, '10': 'groupId'},
    {'1': 'group_name', '3': 4, '4': 1, '5': 9, '10': 'groupName'},
    {'1': 'group_code', '3': 5, '4': 1, '5': 9, '10': 'groupCode'},
  ],
};

/// Descriptor for `S_CreateGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_CreateGroupDescriptor = $convert.base64Decode(
    'Cg1TX0NyZWF0ZUdyb3VwEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2FnZRgCIA'
    'EoCVIHbWVzc2FnZRIZCghncm91cF9pZBgDIAEoCVIHZ3JvdXBJZBIdCgpncm91cF9uYW1lGAQg'
    'ASgJUglncm91cE5hbWUSHQoKZ3JvdXBfY29kZRgFIAEoCVIJZ3JvdXBDb2Rl');

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
  ],
};

/// Descriptor for `C_Chat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ChatDescriptor = $convert.base64Decode(
    'CgZDX0NoYXQSFwoHY29udl9pZBgBIAEoCVIGY29udklkEiIKDWNsaWVudF9tc2dfaWQYAiABKA'
    'NSC2NsaWVudE1zZ0lkEi8KB3BheWxvYWQYAyABKAsyFS5Qcm90b2NvbC5DaGF0UGF5bG9hZFIH'
    'cGF5bG9hZBIbCgl0c19jbGllbnQYBCABKANSCHRzQ2xpZW50');

@$core.Deprecated('Use s_ChatDescriptor instead')
const S_Chat$json = {
  '1': 'S_Chat',
  '2': [
    {'1': 'conv_id', '3': 1, '4': 1, '5': 9, '10': 'convId'},
    {'1': 'client_msg_id', '3': 2, '4': 1, '5': 3, '10': 'clientMsgId'},
    {'1': 'server_msg_id', '3': 3, '4': 1, '5': 3, '10': 'serverMsgId'},
    {'1': 'sender_id', '3': 4, '4': 1, '5': 9, '10': 'senderId'},
    {
      '1': 'payload',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.Protocol.ChatPayload',
      '10': 'payload'
    },
    {'1': 'ts_server', '3': 6, '4': 1, '5': 3, '10': 'tsServer'},
  ],
};

/// Descriptor for `S_Chat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_ChatDescriptor = $convert.base64Decode(
    'CgZTX0NoYXQSFwoHY29udl9pZBgBIAEoCVIGY29udklkEiIKDWNsaWVudF9tc2dfaWQYAiABKA'
    'NSC2NsaWVudE1zZ0lkEiIKDXNlcnZlcl9tc2dfaWQYAyABKANSC3NlcnZlck1zZ0lkEhsKCXNl'
    'bmRlcl9pZBgEIAEoCVIIc2VuZGVySWQSLwoHcGF5bG9hZBgFIAEoCzIVLlByb3RvY29sLkNoYX'
    'RQYXlsb2FkUgdwYXlsb2FkEhsKCXRzX3NlcnZlchgGIAEoA1IIdHNTZXJ2ZXI=');

@$core.Deprecated('Use c_UploadFileDescriptor instead')
const C_UploadFile$json = {
  '1': 'C_UploadFile',
  '2': [
    {'1': 'filename', '3': 1, '4': 1, '5': 9, '10': 'filename'},
    {'1': 'size', '3': 2, '4': 1, '5': 3, '10': 'size'},
    {'1': 'mime_type', '3': 3, '4': 1, '5': 9, '10': 'mimeType'},
    {'1': 'is_image', '3': 4, '4': 1, '5': 8, '10': 'isImage'},
  ],
};

/// Descriptor for `C_UploadFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_UploadFileDescriptor = $convert.base64Decode(
    'CgxDX1VwbG9hZEZpbGUSGgoIZmlsZW5hbWUYASABKAlSCGZpbGVuYW1lEhIKBHNpemUYAiABKA'
    'NSBHNpemUSGwoJbWltZV90eXBlGAMgASgJUghtaW1lVHlwZRIZCghpc19pbWFnZRgEIAEoCFIH'
    'aXNJbWFnZQ==');

@$core.Deprecated('Use s_UploadFileDescriptor instead')
const S_UploadFile$json = {
  '1': 'S_UploadFile',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'file_id', '3': 3, '4': 1, '5': 9, '10': 'fileId'},
    {'1': 'upload_url', '3': 4, '4': 1, '5': 9, '10': 'uploadUrl'},
    {'1': 'download_url', '3': 5, '4': 1, '5': 9, '10': 'downloadUrl'},
    {'1': 'thumbnail_url', '3': 6, '4': 1, '5': 9, '10': 'thumbnailUrl'},
    {'1': 'expires_at', '3': 7, '4': 1, '5': 3, '10': 'expiresAt'},
    {'1': 'path', '3': 8, '4': 1, '5': 9, '10': 'path'},
  ],
};

/// Descriptor for `S_UploadFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_UploadFileDescriptor = $convert.base64Decode(
    'CgxTX1VwbG9hZEZpbGUSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYWdlGAIgAS'
    'gJUgdtZXNzYWdlEhcKB2ZpbGVfaWQYAyABKAlSBmZpbGVJZBIdCgp1cGxvYWRfdXJsGAQgASgJ'
    'Ugl1cGxvYWRVcmwSIQoMZG93bmxvYWRfdXJsGAUgASgJUgtkb3dubG9hZFVybBIjCg10aHVtYm'
    '5haWxfdXJsGAYgASgJUgx0aHVtYm5haWxVcmwSHQoKZXhwaXJlc19hdBgHIAEoA1IJZXhwaXJl'
    'c0F0EhIKBHBhdGgYCCABKAlSBHBhdGg=');

@$core.Deprecated('Use c_AckDescriptor instead')
const C_Ack$json = {
  '1': 'C_Ack',
  '2': [
    {'1': 'conv_id', '3': 1, '4': 1, '5': 9, '10': 'convId'},
    {'1': 'server_msg_id', '3': 2, '4': 1, '5': 3, '10': 'serverMsgId'},
  ],
};

/// Descriptor for `C_Ack`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_AckDescriptor = $convert.base64Decode(
    'CgVDX0FjaxIXCgdjb252X2lkGAEgASgJUgZjb252SWQSIgoNc2VydmVyX21zZ19pZBgCIAEoA1'
    'ILc2VydmVyTXNnSWQ=');

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
      '1': 'messages',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.Protocol.S_Chat',
      '10': 'messages'
    },
  ],
};

/// Descriptor for `S_MessageBatch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_MessageBatchDescriptor = $convert.base64Decode(
    'Cg5TX01lc3NhZ2VCYXRjaBIsCghtZXNzYWdlcxgBIAMoCzIQLlByb3RvY29sLlNfQ2hhdFIIbW'
    'Vzc2FnZXM=');

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

@$core.Deprecated('Use friendInfoDescriptor instead')
const FriendInfo$json = {
  '1': 'FriendInfo',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'status_message', '3': 3, '4': 1, '5': 9, '10': 'statusMessage'},
    {'1': 'profile_image_url', '3': 4, '4': 1, '5': 9, '10': 'profileImageUrl'},
    {'1': 'last_seen', '3': 5, '4': 1, '5': 3, '10': 'lastSeen'},
    {'1': 'status', '3': 6, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `FriendInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List friendInfoDescriptor = $convert.base64Decode(
    'CgpGcmllbmRJbmZvEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBISCgRuYW1lGAIgASgJUgRuYW'
    '1lEiUKDnN0YXR1c19tZXNzYWdlGAMgASgJUg1zdGF0dXNNZXNzYWdlEioKEXByb2ZpbGVfaW1h'
    'Z2VfdXJsGAQgASgJUg9wcm9maWxlSW1hZ2VVcmwSGwoJbGFzdF9zZWVuGAUgASgDUghsYXN0U2'
    'VlbhIWCgZzdGF0dXMYBiABKAlSBnN0YXR1cw==');

@$core.Deprecated('Use friendRequestDescriptor instead')
const FriendRequest$json = {
  '1': 'FriendRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'status_message', '3': 3, '4': 1, '5': 9, '10': 'statusMessage'},
    {'1': 'profile_image_url', '3': 4, '4': 1, '5': 9, '10': 'profileImageUrl'},
    {'1': 'requested_at', '3': 5, '4': 1, '5': 3, '10': 'requestedAt'},
    {'1': 'is_received', '3': 6, '4': 1, '5': 8, '10': 'isReceived'},
  ],
};

/// Descriptor for `FriendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List friendRequestDescriptor = $convert.base64Decode(
    'Cg1GcmllbmRSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBISCgRuYW1lGAIgASgJUg'
    'RuYW1lEiUKDnN0YXR1c19tZXNzYWdlGAMgASgJUg1zdGF0dXNNZXNzYWdlEioKEXByb2ZpbGVf'
    'aW1hZ2VfdXJsGAQgASgJUg9wcm9maWxlSW1hZ2VVcmwSIQoMcmVxdWVzdGVkX2F0GAUgASgDUg'
    'tyZXF1ZXN0ZWRBdBIfCgtpc19yZWNlaXZlZBgGIAEoCFIKaXNSZWNlaXZlZA==');

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
      '6': '.Protocol.FriendInfo',
      '10': 'userInfo'
    },
    {'1': 'is_friend', '3': 3, '4': 1, '5': 8, '10': 'isFriend'},
    {'1': 'has_sent_request', '3': 4, '4': 1, '5': 8, '10': 'hasSentRequest'},
  ],
};

/// Descriptor for `S_SearchUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SearchUserDescriptor = $convert.base64Decode(
    'CgxTX1NlYXJjaFVzZXISGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIxCgl1c2VyX2luZm8YAi'
    'ABKAsyFC5Qcm90b2NvbC5GcmllbmRJbmZvUgh1c2VySW5mbxIbCglpc19mcmllbmQYAyABKAhS'
    'CGlzRnJpZW5kEigKEGhhc19zZW50X3JlcXVlc3QYBCABKAhSDmhhc1NlbnRSZXF1ZXN0');

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
      '6': '.Protocol.FriendInfo',
      '10': 'updatedFriend'
    },
  ],
};

/// Descriptor for `S_FriendAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_FriendActionDescriptor = $convert.base64Decode(
    'Cg5TX0ZyaWVuZEFjdGlvbhIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3NhZ2UYAi'
    'ABKAlSB21lc3NhZ2USOwoOdXBkYXRlZF9mcmllbmQYAyABKAsyFC5Qcm90b2NvbC5GcmllbmRJ'
    'bmZvUg11cGRhdGVkRnJpZW5k');

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
      '6': '.Protocol.FriendInfo',
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
    'ChFTX0ZldGNoRnJpZW5kRGF0YRIuCgdmcmllbmRzGAEgAygLMhQuUHJvdG9jb2wuRnJpZW5kSW'
    '5mb1IHZnJpZW5kcxJEChFyZWNlaXZlZF9yZXF1ZXN0cxgCIAMoCzIXLlByb3RvY29sLkZyaWVu'
    'ZFJlcXVlc3RSEHJlY2VpdmVkUmVxdWVzdHMSPAoNc2VudF9yZXF1ZXN0cxgDIAMoCzIXLlByb3'
    'RvY29sLkZyaWVuZFJlcXVlc3RSDHNlbnRSZXF1ZXN0cw==');

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
      '6': '.Protocol.FriendInfo',
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
    {'1': 'REQUEST_ACCEPTED', '2': 1},
    {'1': 'FRIEND_DELETED', '2': 2},
  ],
};

/// Descriptor for `S_FriendPush`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_FriendPushDescriptor = $convert.base64Decode(
    'CgxTX0ZyaWVuZFB1c2gSMwoEdHlwZRgBIAEoDjIfLlByb3RvY29sLlNfRnJpZW5kUHVzaC5QdX'
    'NoVHlwZVIEdHlwZRIxCgl1c2VyX2luZm8YAiABKAsyFC5Qcm90b2NvbC5GcmllbmRJbmZvUgh1'
    'c2VySW5mbyJFCghQdXNoVHlwZRIPCgtORVdfUkVRVUVTVBAAEhQKEFJFUVVFU1RfQUNDRVBURU'
    'QQARISCg5GUklFTkRfREVMRVRFRBAC');

@$core.Deprecated('Use groupInfoDescriptor instead')
const GroupInfo$json = {
  '1': 'GroupInfo',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 9, '10': 'groupId'},
    {'1': 'group_name', '3': 2, '4': 1, '5': 9, '10': 'groupName'},
    {'1': 'group_code', '3': 3, '4': 1, '5': 9, '10': 'groupCode'},
    {'1': 'creator_id', '3': 4, '4': 1, '5': 9, '10': 'creatorId'},
    {'1': 'member_count', '3': 5, '4': 1, '5': 3, '10': 'memberCount'},
  ],
};

/// Descriptor for `GroupInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupInfoDescriptor = $convert.base64Decode(
    'CglHcm91cEluZm8SGQoIZ3JvdXBfaWQYASABKAlSB2dyb3VwSWQSHQoKZ3JvdXBfbmFtZRgCIA'
    'EoCVIJZ3JvdXBOYW1lEh0KCmdyb3VwX2NvZGUYAyABKAlSCWdyb3VwQ29kZRIdCgpjcmVhdG9y'
    'X2lkGAQgASgJUgljcmVhdG9ySWQSIQoMbWVtYmVyX2NvdW50GAUgASgDUgttZW1iZXJDb3VudA'
    '==');

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

@$core.Deprecated('Use c_GroupJoinRequestDescriptor instead')
const C_GroupJoinRequest$json = {
  '1': 'C_GroupJoinRequest',
  '2': [
    {'1': 'group_code', '3': 1, '4': 1, '5': 9, '10': 'groupCode'},
  ],
};

/// Descriptor for `C_GroupJoinRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_GroupJoinRequestDescriptor =
    $convert.base64Decode(
        'ChJDX0dyb3VwSm9pblJlcXVlc3QSHQoKZ3JvdXBfY29kZRgBIAEoCVIJZ3JvdXBDb2Rl');

@$core.Deprecated('Use s_GroupJoinRequestDescriptor instead')
const S_GroupJoinRequest$json = {
  '1': 'S_GroupJoinRequest',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'group_id', '3': 3, '4': 1, '5': 9, '10': 'groupId'},
    {'1': 'group_name', '3': 4, '4': 1, '5': 9, '10': 'groupName'},
  ],
};

/// Descriptor for `S_GroupJoinRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_GroupJoinRequestDescriptor = $convert.base64Decode(
    'ChJTX0dyb3VwSm9pblJlcXVlc3QSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYW'
    'dlGAIgASgJUgdtZXNzYWdlEhkKCGdyb3VwX2lkGAMgASgJUgdncm91cElkEh0KCmdyb3VwX25h'
    'bWUYBCABKAlSCWdyb3VwTmFtZQ==');

@$core.Deprecated('Use c_GroupJoinResponseDescriptor instead')
const C_GroupJoinResponse$json = {
  '1': 'C_GroupJoinResponse',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 9, '10': 'groupId'},
    {'1': 'requester_user_id', '3': 2, '4': 1, '5': 9, '10': 'requesterUserId'},
    {'1': 'accept', '3': 3, '4': 1, '5': 8, '10': 'accept'},
  ],
};

/// Descriptor for `C_GroupJoinResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_GroupJoinResponseDescriptor = $convert.base64Decode(
    'ChNDX0dyb3VwSm9pblJlc3BvbnNlEhkKCGdyb3VwX2lkGAEgASgJUgdncm91cElkEioKEXJlcX'
    'Vlc3Rlcl91c2VyX2lkGAIgASgJUg9yZXF1ZXN0ZXJVc2VySWQSFgoGYWNjZXB0GAMgASgIUgZh'
    'Y2NlcHQ=');

@$core.Deprecated('Use s_GroupJoinResponseDescriptor instead')
const S_GroupJoinResponse$json = {
  '1': 'S_GroupJoinResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `S_GroupJoinResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_GroupJoinResponseDescriptor = $convert.base64Decode(
    'ChNTX0dyb3VwSm9pblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2'
    'FnZRgCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use c_GroupJoinRequestListDescriptor instead')
const C_GroupJoinRequestList$json = {
  '1': 'C_GroupJoinRequestList',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 9, '10': 'groupId'},
  ],
};

/// Descriptor for `C_GroupJoinRequestList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_GroupJoinRequestListDescriptor =
    $convert.base64Decode(
        'ChZDX0dyb3VwSm9pblJlcXVlc3RMaXN0EhkKCGdyb3VwX2lkGAEgASgJUgdncm91cElk');

@$core.Deprecated('Use s_GroupJoinRequestListDescriptor instead')
const S_GroupJoinRequestList$json = {
  '1': 'S_GroupJoinRequestList',
  '2': [
    {
      '1': 'requests',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.Protocol.GroupJoinRequestInfo',
      '10': 'requests'
    },
  ],
};

/// Descriptor for `S_GroupJoinRequestList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_GroupJoinRequestListDescriptor =
    $convert.base64Decode(
        'ChZTX0dyb3VwSm9pblJlcXVlc3RMaXN0EjoKCHJlcXVlc3RzGAEgAygLMh4uUHJvdG9jb2wuR3'
        'JvdXBKb2luUmVxdWVzdEluZm9SCHJlcXVlc3Rz');

@$core.Deprecated('Use groupJoinRequestInfoDescriptor instead')
const GroupJoinRequestInfo$json = {
  '1': 'GroupJoinRequestInfo',
  '2': [
    {'1': 'requester_user_id', '3': 1, '4': 1, '5': 9, '10': 'requesterUserId'},
    {'1': 'requester_name', '3': 2, '4': 1, '5': 9, '10': 'requesterName'},
    {'1': 'requested_at', '3': 3, '4': 1, '5': 3, '10': 'requestedAt'},
  ],
};

/// Descriptor for `GroupJoinRequestInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupJoinRequestInfoDescriptor = $convert.base64Decode(
    'ChRHcm91cEpvaW5SZXF1ZXN0SW5mbxIqChFyZXF1ZXN0ZXJfdXNlcl9pZBgBIAEoCVIPcmVxdW'
    'VzdGVyVXNlcklkEiUKDnJlcXVlc3Rlcl9uYW1lGAIgASgJUg1yZXF1ZXN0ZXJOYW1lEiEKDHJl'
    'cXVlc3RlZF9hdBgDIAEoA1ILcmVxdWVzdGVkQXQ=');
