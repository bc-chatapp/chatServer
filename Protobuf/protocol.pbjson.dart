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
    {'1': 'ERR_USER_NOT_FOUND', '2': 104},
    {'1': 'ERR_INVALID_PASSWORD', '2': 105},
    {'1': 'ERR_USER_ALREADY_EXISTS', '2': 106},
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
    'UEFTU1dPUkRfUkVRVUlSRUQQZhIVChFFUlJfTkFNRV9SRVFVSVJFRBBnEhYKEkVSUl9VU0VSX0'
    '5PVF9GT1VORBBoEhgKFEVSUl9JTlZBTElEX1BBU1NXT1JEEGkSGwoXRVJSX1VTRVJfQUxSRUFE'
    'WV9FWElTVFMQahIWChFFUlJfUEFZTE9BRF9FTVBUWRDIARIYChNFUlJfSU5WQUxJRF9DT05WX0'
    'lEEMkBEhwKF0VSUl9JTlZBTElEX1JFQ0VJVkVSX0lEEMoBEhQKD0VSUl9JTlZBTElEX0FDSxDL'
    'ARIfChpFUlJfSU5WQUxJRF9GUklFTkRfVVNFUl9JRBCsAhIYChNFUlJfQ0FOTk9UX0FERF9TRU'
    'xGEK0CEhUKEEVSUl9OT1RfQV9GUklFTkQQrgISIQocRVJSX0ZSSUVORF9SRVFVRVNUX05PVF9G'
    'T1VORBCvAhIlCiBFUlJfRklMRV9TRVJWSUNFX05PVF9JTklUSUFMSVpFRBCQAxImCiFFUlJfQ0'
    'xPVURfU1RPUkFHRV9OT1RfSU5JVElBTElaRUQQkQMSGgoVRVJSX0ZJTEVOQU1FX1JFUVVJUkVE'
    'EJIDEhoKFUVSUl9JTlZBTElEX0ZJTEVfU0laRRCTAxIbChZFUlJfTUlNRV9UWVBFX1JFUVVJUk'
    'VEEJQDEh8KGkVSUl9GQUlMRURfVE9fR0VORVJBVEVfVVJMEJUDEhkKFEVSUl9JTlZBTElEX0ZJ'
    'TEVfVVJMEJYD');

@$core.Deprecated('Use envelopeDescriptor instead')
const Envelope$json = {
  '1': 'Envelope',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    {'1': 'request_id', '3': 2, '4': 1, '5': 4, '10': 'requestId'},
    {'1': 'auth_token', '3': 3, '4': 1, '5': 9, '10': 'authToken'},
    {
      '1': 'c_signup',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_SignUp',
      '9': 0,
      '10': 'cSignup'
    },
    {
      '1': 's_signup',
      '3': 11,
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
      '1': 'c_friend_list',
      '3': 40,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_FriendList',
      '9': 0,
      '10': 'cFriendList'
    },
    {
      '1': 's_friend_list',
      '3': 41,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_FriendList',
      '9': 0,
      '10': 'sFriendList'
    },
    {
      '1': 'c_group_list',
      '3': 42,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_GroupList',
      '9': 0,
      '10': 'cGroupList'
    },
    {
      '1': 's_group_list',
      '3': 43,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_GroupList',
      '9': 0,
      '10': 'sGroupList'
    },
    {
      '1': 'c_group_join_request',
      '3': 44,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_GroupJoinRequest',
      '9': 0,
      '10': 'cGroupJoinRequest'
    },
    {
      '1': 's_group_join_request',
      '3': 45,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_GroupJoinRequest',
      '9': 0,
      '10': 'sGroupJoinRequest'
    },
    {
      '1': 'c_group_join_response',
      '3': 46,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_GroupJoinResponse',
      '9': 0,
      '10': 'cGroupJoinResponse'
    },
    {
      '1': 's_group_join_response',
      '3': 47,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_GroupJoinResponse',
      '9': 0,
      '10': 'sGroupJoinResponse'
    },
    {
      '1': 'c_group_join_request_list',
      '3': 48,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_GroupJoinRequestList',
      '9': 0,
      '10': 'cGroupJoinRequestList'
    },
    {
      '1': 's_group_join_request_list',
      '3': 49,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_GroupJoinRequestList',
      '9': 0,
      '10': 'sGroupJoinRequestList'
    },
    {
      '1': 'c_frient_request_find',
      '3': 50,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_FriendRequest_Find',
      '9': 0,
      '10': 'cFrientRequestFind'
    },
    {
      '1': 's_frient_request_find',
      '3': 51,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_FriendRequest_Find',
      '9': 0,
      '10': 'sFrientRequestFind'
    },
    {
      '1': 'c_friend_request_add',
      '3': 52,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_FriendRequest_Add',
      '9': 0,
      '10': 'cFriendRequestAdd'
    },
    {
      '1': 's_friend_request_add',
      '3': 53,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_FriendRequest_Add',
      '9': 0,
      '10': 'sFriendRequestAdd'
    },
    {
      '1': 'c_friend_request_cancel',
      '3': 54,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_FriendRequest_Cancel',
      '9': 0,
      '10': 'cFriendRequestCancel'
    },
    {
      '1': 's_friend_request_cancel',
      '3': 55,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_FriendRequest_Cancel',
      '9': 0,
      '10': 'sFriendRequestCancel'
    },
    {
      '1': 'c_friend_request_remove',
      '3': 56,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_FriendRequest_Remove',
      '9': 0,
      '10': 'cFriendRequestRemove'
    },
    {
      '1': 's_friend_request_remove',
      '3': 57,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_FriendRequest_Remove',
      '9': 0,
      '10': 'sFriendRequestRemove'
    },
    {
      '1': 'c_friend_request_list',
      '3': 58,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_FriendRequest_List',
      '9': 0,
      '10': 'cFriendRequestList'
    },
    {
      '1': 's_friend_request_list',
      '3': 59,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_FriendRequest_List',
      '9': 0,
      '10': 'sFriendRequestList'
    },
    {
      '1': 'c_friend_request_respond',
      '3': 60,
      '4': 1,
      '5': 11,
      '6': '.Protocol.C_FriendRequest_Respond',
      '9': 0,
      '10': 'cFriendRequestRespond'
    },
    {
      '1': 's_friend_request_respond',
      '3': 61,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_FriendRequest_Respond',
      '9': 0,
      '10': 'sFriendRequestRespond'
    },
    {
      '1': 's_friend_request_push',
      '3': 62,
      '4': 1,
      '5': 11,
      '6': '.Protocol.S_FriendRequest_Push',
      '9': 0,
      '10': 'sFriendRequestPush'
    },
  ],
  '8': [
    {'1': 'body'},
  ],
};

/// Descriptor for `Envelope`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List envelopeDescriptor = $convert.base64Decode(
    'CghFbnZlbG9wZRIYCgd2ZXJzaW9uGAEgASgNUgd2ZXJzaW9uEh0KCnJlcXVlc3RfaWQYAiABKA'
    'RSCXJlcXVlc3RJZBIdCgphdXRoX3Rva2VuGAMgASgJUglhdXRoVG9rZW4SLwoIY19zaWdudXAY'
    'CiABKAsyEi5Qcm90b2NvbC5DX1NpZ25VcEgAUgdjU2lnbnVwEi8KCHNfc2lnbnVwGAsgASgLMh'
    'IuUHJvdG9jb2wuU19TaWduVXBIAFIHc1NpZ251cBIsCgdjX2xvZ2luGBQgASgLMhEuUHJvdG9j'
    'b2wuQ19Mb2dpbkgAUgZjTG9naW4SLAoHc19sb2dpbhgVIAEoCzIRLlByb3RvY29sLlNfTG9naW'
    '5IAFIGc0xvZ2luEjwKDWNfam9pbl9kaXJlY3QYFiABKAsyFi5Qcm90b2NvbC5DX0pvaW5EaXJl'
    'Y3RIAFILY0pvaW5EaXJlY3QSOQoMY19qb2luX2dyb3VwGBcgASgLMhUuUHJvdG9jb2wuQ19Kb2'
    'luR3JvdXBIAFIKY0pvaW5Hcm91cBI/Cg5jX2NyZWF0ZV9ncm91cBgYIAEoCzIXLlByb3RvY29s'
    'LkNfQ3JlYXRlR3JvdXBIAFIMY0NyZWF0ZUdyb3VwEj8KDnNfY3JlYXRlX2dyb3VwGBkgASgLMh'
    'cuUHJvdG9jb2wuU19DcmVhdGVHcm91cEgAUgxzQ3JlYXRlR3JvdXASJgoFY19hY2sYGiABKAsy'
    'Dy5Qcm90b2NvbC5DX0Fja0gAUgRjQWNrEiwKB3NfZXJyb3IYGyABKAsyES5Qcm90b2NvbC5TX0'
    'Vycm9ySABSBnNFcnJvchI4CgtjX2hlYXJ0YmVhdBgcIAEoCzIVLlByb3RvY29sLkNfSGVhcnRi'
    'ZWF0SABSCmNIZWFydGJlYXQSOAoLc19oZWFydGJlYXQYHSABKAsyFS5Qcm90b2NvbC5TX0hlYX'
    'J0YmVhdEgAUgpzSGVhcnRiZWF0EikKBmNfY2hhdBgeIAEoCzIQLlByb3RvY29sLkNfQ2hhdEgA'
    'UgVjQ2hhdBIpCgZzX2NoYXQYHyABKAsyEC5Qcm90b2NvbC5TX0NoYXRIAFIFc0NoYXQSQgoPY1'
    '9mZXRjaF9vZmZsaW5lGCAgASgLMhguUHJvdG9jb2wuQ19GZXRjaE9mZmxpbmVIAFINY0ZldGNo'
    'T2ZmbGluZRJCCg9zX21lc3NhZ2VfYmF0Y2gYISABKAsyGC5Qcm90b2NvbC5TX01lc3NhZ2VCYX'
    'RjaEgAUg1zTWVzc2FnZUJhdGNoEjwKDWNfdXBsb2FkX2ZpbGUYIiABKAsyFi5Qcm90b2NvbC5D'
    'X1VwbG9hZEZpbGVIAFILY1VwbG9hZEZpbGUSPAoNc191cGxvYWRfZmlsZRgjIAEoCzIWLlByb3'
    'RvY29sLlNfVXBsb2FkRmlsZUgAUgtzVXBsb2FkRmlsZRI8Cg1jX2ZyaWVuZF9saXN0GCggASgL'
    'MhYuUHJvdG9jb2wuQ19GcmllbmRMaXN0SABSC2NGcmllbmRMaXN0EjwKDXNfZnJpZW5kX2xpc3'
    'QYKSABKAsyFi5Qcm90b2NvbC5TX0ZyaWVuZExpc3RIAFILc0ZyaWVuZExpc3QSOQoMY19ncm91'
    'cF9saXN0GCogASgLMhUuUHJvdG9jb2wuQ19Hcm91cExpc3RIAFIKY0dyb3VwTGlzdBI5CgxzX2'
    'dyb3VwX2xpc3QYKyABKAsyFS5Qcm90b2NvbC5TX0dyb3VwTGlzdEgAUgpzR3JvdXBMaXN0Ek8K'
    'FGNfZ3JvdXBfam9pbl9yZXF1ZXN0GCwgASgLMhwuUHJvdG9jb2wuQ19Hcm91cEpvaW5SZXF1ZX'
    'N0SABSEWNHcm91cEpvaW5SZXF1ZXN0Ek8KFHNfZ3JvdXBfam9pbl9yZXF1ZXN0GC0gASgLMhwu'
    'UHJvdG9jb2wuU19Hcm91cEpvaW5SZXF1ZXN0SABSEXNHcm91cEpvaW5SZXF1ZXN0ElIKFWNfZ3'
    'JvdXBfam9pbl9yZXNwb25zZRguIAEoCzIdLlByb3RvY29sLkNfR3JvdXBKb2luUmVzcG9uc2VI'
    'AFISY0dyb3VwSm9pblJlc3BvbnNlElIKFXNfZ3JvdXBfam9pbl9yZXNwb25zZRgvIAEoCzIdLl'
    'Byb3RvY29sLlNfR3JvdXBKb2luUmVzcG9uc2VIAFISc0dyb3VwSm9pblJlc3BvbnNlElwKGWNf'
    'Z3JvdXBfam9pbl9yZXF1ZXN0X2xpc3QYMCABKAsyIC5Qcm90b2NvbC5DX0dyb3VwSm9pblJlcX'
    'Vlc3RMaXN0SABSFWNHcm91cEpvaW5SZXF1ZXN0TGlzdBJcChlzX2dyb3VwX2pvaW5fcmVxdWVz'
    'dF9saXN0GDEgASgLMiAuUHJvdG9jb2wuU19Hcm91cEpvaW5SZXF1ZXN0TGlzdEgAUhVzR3JvdX'
    'BKb2luUmVxdWVzdExpc3QSUwoVY19mcmllbnRfcmVxdWVzdF9maW5kGDIgASgLMh4uUHJvdG9j'
    'b2wuQ19GcmllbmRSZXF1ZXN0X0ZpbmRIAFISY0ZyaWVudFJlcXVlc3RGaW5kElMKFXNfZnJpZW'
    '50X3JlcXVlc3RfZmluZBgzIAEoCzIeLlByb3RvY29sLlNfRnJpZW5kUmVxdWVzdF9GaW5kSABS'
    'EnNGcmllbnRSZXF1ZXN0RmluZBJQChRjX2ZyaWVuZF9yZXF1ZXN0X2FkZBg0IAEoCzIdLlByb3'
    'RvY29sLkNfRnJpZW5kUmVxdWVzdF9BZGRIAFIRY0ZyaWVuZFJlcXVlc3RBZGQSUAoUc19mcmll'
    'bmRfcmVxdWVzdF9hZGQYNSABKAsyHS5Qcm90b2NvbC5TX0ZyaWVuZFJlcXVlc3RfQWRkSABSEX'
    'NGcmllbmRSZXF1ZXN0QWRkElkKF2NfZnJpZW5kX3JlcXVlc3RfY2FuY2VsGDYgASgLMiAuUHJv'
    'dG9jb2wuQ19GcmllbmRSZXF1ZXN0X0NhbmNlbEgAUhRjRnJpZW5kUmVxdWVzdENhbmNlbBJZCh'
    'dzX2ZyaWVuZF9yZXF1ZXN0X2NhbmNlbBg3IAEoCzIgLlByb3RvY29sLlNfRnJpZW5kUmVxdWVz'
    'dF9DYW5jZWxIAFIUc0ZyaWVuZFJlcXVlc3RDYW5jZWwSWQoXY19mcmllbmRfcmVxdWVzdF9yZW'
    '1vdmUYOCABKAsyIC5Qcm90b2NvbC5DX0ZyaWVuZFJlcXVlc3RfUmVtb3ZlSABSFGNGcmllbmRS'
    'ZXF1ZXN0UmVtb3ZlElkKF3NfZnJpZW5kX3JlcXVlc3RfcmVtb3ZlGDkgASgLMiAuUHJvdG9jb2'
    'wuU19GcmllbmRSZXF1ZXN0X1JlbW92ZUgAUhRzRnJpZW5kUmVxdWVzdFJlbW92ZRJTChVjX2Zy'
    'aWVuZF9yZXF1ZXN0X2xpc3QYOiABKAsyHi5Qcm90b2NvbC5DX0ZyaWVuZFJlcXVlc3RfTGlzdE'
    'gAUhJjRnJpZW5kUmVxdWVzdExpc3QSUwoVc19mcmllbmRfcmVxdWVzdF9saXN0GDsgASgLMh4u'
    'UHJvdG9jb2wuU19GcmllbmRSZXF1ZXN0X0xpc3RIAFISc0ZyaWVuZFJlcXVlc3RMaXN0ElwKGG'
    'NfZnJpZW5kX3JlcXVlc3RfcmVzcG9uZBg8IAEoCzIhLlByb3RvY29sLkNfRnJpZW5kUmVxdWVz'
    'dF9SZXNwb25kSABSFWNGcmllbmRSZXF1ZXN0UmVzcG9uZBJcChhzX2ZyaWVuZF9yZXF1ZXN0X3'
    'Jlc3BvbmQYPSABKAsyIS5Qcm90b2NvbC5TX0ZyaWVuZFJlcXVlc3RfUmVzcG9uZEgAUhVzRnJp'
    'ZW5kUmVxdWVzdFJlc3BvbmQSUwoVc19mcmllbmRfcmVxdWVzdF9wdXNoGD4gASgLMh4uUHJvdG'
    '9jb2wuU19GcmllbmRSZXF1ZXN0X1B1c2hIAFISc0ZyaWVuZFJlcXVlc3RQdXNoQgYKBGJvZHk=');

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

@$core.Deprecated('Use c_SignUpDescriptor instead')
const C_SignUp$json = {
  '1': 'C_SignUp',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'status_message', '3': 4, '4': 1, '5': 9, '10': 'statusMessage'},
  ],
};

/// Descriptor for `C_SignUp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_SignUpDescriptor = $convert.base64Decode(
    'CghDX1NpZ25VcBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSGgoIcGFzc3dvcmQYAiABKAlSCH'
    'Bhc3N3b3JkEhIKBG5hbWUYAyABKAlSBG5hbWUSJQoOc3RhdHVzX21lc3NhZ2UYBCABKAlSDXN0'
    'YXR1c01lc3NhZ2U=');

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
  ],
};

/// Descriptor for `S_Login`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_LoginDescriptor = $convert.base64Decode(
    'CgdTX0xvZ2luEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIdCgphdXRoX3Rva2VuGAIgASgJUg'
    'lhdXRoVG9rZW4=');

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
    {'1': 'requester_user_id', '3': 1, '4': 1, '5': 9, '10': 'requesterUserId'},
    {'1': 'requester_name', '3': 2, '4': 1, '5': 9, '10': 'requesterName'},
    {
      '1': 'requester_status_message',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'requesterStatusMessage'
    },
    {
      '1': 'requester_profile_image_url',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'requesterProfileImageUrl'
    },
    {'1': 'requested_at', '3': 5, '4': 1, '5': 3, '10': 'requestedAt'},
  ],
};

/// Descriptor for `FriendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List friendRequestDescriptor = $convert.base64Decode(
    'Cg1GcmllbmRSZXF1ZXN0EioKEXJlcXVlc3Rlcl91c2VyX2lkGAEgASgJUg9yZXF1ZXN0ZXJVc2'
    'VySWQSJQoOcmVxdWVzdGVyX25hbWUYAiABKAlSDXJlcXVlc3Rlck5hbWUSOAoYcmVxdWVzdGVy'
    'X3N0YXR1c19tZXNzYWdlGAMgASgJUhZyZXF1ZXN0ZXJTdGF0dXNNZXNzYWdlEj0KG3JlcXVlc3'
    'Rlcl9wcm9maWxlX2ltYWdlX3VybBgEIAEoCVIYcmVxdWVzdGVyUHJvZmlsZUltYWdlVXJsEiEK'
    'DHJlcXVlc3RlZF9hdBgFIAEoA1ILcmVxdWVzdGVkQXQ=');

@$core.Deprecated('Use c_FriendListDescriptor instead')
const C_FriendList$json = {
  '1': 'C_FriendList',
};

/// Descriptor for `C_FriendList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_FriendListDescriptor =
    $convert.base64Decode('CgxDX0ZyaWVuZExpc3Q=');

@$core.Deprecated('Use s_FriendListDescriptor instead')
const S_FriendList$json = {
  '1': 'S_FriendList',
  '2': [
    {
      '1': 'friends',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.Protocol.FriendInfo',
      '10': 'friends'
    },
  ],
};

/// Descriptor for `S_FriendList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_FriendListDescriptor = $convert.base64Decode(
    'CgxTX0ZyaWVuZExpc3QSLgoHZnJpZW5kcxgBIAMoCzIULlByb3RvY29sLkZyaWVuZEluZm9SB2'
    'ZyaWVuZHM=');

@$core.Deprecated('Use groupInfoDescriptor instead')
const GroupInfo$json = {
  '1': 'GroupInfo',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 9, '10': 'groupId'},
    {'1': 'group_name', '3': 2, '4': 1, '5': 9, '10': 'groupName'},
    {'1': 'group_code', '3': 3, '4': 1, '5': 9, '10': 'groupCode'},
    {'1': 'creator_id', '3': 4, '4': 1, '5': 9, '10': 'creatorId'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 3, '10': 'createdAt'},
  ],
};

/// Descriptor for `GroupInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupInfoDescriptor = $convert.base64Decode(
    'CglHcm91cEluZm8SGQoIZ3JvdXBfaWQYASABKAlSB2dyb3VwSWQSHQoKZ3JvdXBfbmFtZRgCIA'
    'EoCVIJZ3JvdXBOYW1lEh0KCmdyb3VwX2NvZGUYAyABKAlSCWdyb3VwQ29kZRIdCgpjcmVhdG9y'
    'X2lkGAQgASgJUgljcmVhdG9ySWQSHQoKY3JlYXRlZF9hdBgFIAEoA1IJY3JlYXRlZEF0');

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

@$core.Deprecated('Use c_FriendRequest_FindDescriptor instead')
const C_FriendRequest_Find$json = {
  '1': 'C_FriendRequest_Find',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `C_FriendRequest_Find`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_FriendRequest_FindDescriptor =
    $convert.base64Decode(
        'ChRDX0ZyaWVuZFJlcXVlc3RfRmluZBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQ=');

@$core.Deprecated('Use s_FriendRequest_FindDescriptor instead')
const S_FriendRequest_Find$json = {
  '1': 'S_FriendRequest_Find',
  '2': [
    {'1': 'exist', '3': 1, '4': 1, '5': 8, '10': 'exist'},
    {
      '1': 'user_info',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.Protocol.FriendInfo',
      '10': 'userInfo'
    },
  ],
};

/// Descriptor for `S_FriendRequest_Find`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_FriendRequest_FindDescriptor = $convert.base64Decode(
    'ChRTX0ZyaWVuZFJlcXVlc3RfRmluZBIUCgVleGlzdBgBIAEoCFIFZXhpc3QSMQoJdXNlcl9pbm'
    'ZvGAIgASgLMhQuUHJvdG9jb2wuRnJpZW5kSW5mb1IIdXNlckluZm8=');

@$core.Deprecated('Use c_FriendRequest_AddDescriptor instead')
const C_FriendRequest_Add$json = {
  '1': 'C_FriendRequest_Add',
  '2': [
    {'1': 'friend_user_id', '3': 1, '4': 1, '5': 9, '10': 'friendUserId'},
  ],
};

/// Descriptor for `C_FriendRequest_Add`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_FriendRequest_AddDescriptor = $convert.base64Decode(
    'ChNDX0ZyaWVuZFJlcXVlc3RfQWRkEiQKDmZyaWVuZF91c2VyX2lkGAEgASgJUgxmcmllbmRVc2'
    'VySWQ=');

@$core.Deprecated('Use s_FriendRequest_AddDescriptor instead')
const S_FriendRequest_Add$json = {
  '1': 'S_FriendRequest_Add',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `S_FriendRequest_Add`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_FriendRequest_AddDescriptor = $convert.base64Decode(
    'ChNTX0ZyaWVuZFJlcXVlc3RfQWRkEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2'
    'FnZRgCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use c_FriendRequest_CancelDescriptor instead')
const C_FriendRequest_Cancel$json = {
  '1': 'C_FriendRequest_Cancel',
  '2': [
    {'1': 'friend_user_id', '3': 1, '4': 1, '5': 9, '10': 'friendUserId'},
  ],
};

/// Descriptor for `C_FriendRequest_Cancel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_FriendRequest_CancelDescriptor =
    $convert.base64Decode(
        'ChZDX0ZyaWVuZFJlcXVlc3RfQ2FuY2VsEiQKDmZyaWVuZF91c2VyX2lkGAEgASgJUgxmcmllbm'
        'RVc2VySWQ=');

@$core.Deprecated('Use s_FriendRequest_CancelDescriptor instead')
const S_FriendRequest_Cancel$json = {
  '1': 'S_FriendRequest_Cancel',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `S_FriendRequest_Cancel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_FriendRequest_CancelDescriptor =
    $convert.base64Decode(
        'ChZTX0ZyaWVuZFJlcXVlc3RfQ2FuY2VsEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbW'
        'Vzc2FnZRgCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use c_FriendRequest_RemoveDescriptor instead')
const C_FriendRequest_Remove$json = {
  '1': 'C_FriendRequest_Remove',
  '2': [
    {'1': 'friend_user_id', '3': 1, '4': 1, '5': 9, '10': 'friendUserId'},
  ],
};

/// Descriptor for `C_FriendRequest_Remove`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_FriendRequest_RemoveDescriptor =
    $convert.base64Decode(
        'ChZDX0ZyaWVuZFJlcXVlc3RfUmVtb3ZlEiQKDmZyaWVuZF91c2VyX2lkGAEgASgJUgxmcmllbm'
        'RVc2VySWQ=');

@$core.Deprecated('Use s_FriendRequest_RemoveDescriptor instead')
const S_FriendRequest_Remove$json = {
  '1': 'S_FriendRequest_Remove',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `S_FriendRequest_Remove`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_FriendRequest_RemoveDescriptor =
    $convert.base64Decode(
        'ChZTX0ZyaWVuZFJlcXVlc3RfUmVtb3ZlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbW'
        'Vzc2FnZRgCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use c_FriendRequest_ListDescriptor instead')
const C_FriendRequest_List$json = {
  '1': 'C_FriendRequest_List',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.Protocol.C_FriendRequest_List.RequestType',
      '10': 'type'
    },
  ],
  '4': [C_FriendRequest_List_RequestType$json],
};

@$core.Deprecated('Use c_FriendRequest_ListDescriptor instead')
const C_FriendRequest_List_RequestType$json = {
  '1': 'RequestType',
  '2': [
    {'1': 'RECEIVED', '2': 0},
    {'1': 'SENT', '2': 1},
  ],
};

/// Descriptor for `C_FriendRequest_List`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_FriendRequest_ListDescriptor = $convert.base64Decode(
    'ChRDX0ZyaWVuZFJlcXVlc3RfTGlzdBI+CgR0eXBlGAEgASgOMiouUHJvdG9jb2wuQ19Gcmllbm'
    'RSZXF1ZXN0X0xpc3QuUmVxdWVzdFR5cGVSBHR5cGUiJQoLUmVxdWVzdFR5cGUSDAoIUkVDRUlW'
    'RUQQABIICgRTRU5UEAE=');

@$core.Deprecated('Use s_FriendRequest_ListDescriptor instead')
const S_FriendRequest_List$json = {
  '1': 'S_FriendRequest_List',
  '2': [
    {
      '1': 'requests',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.Protocol.FriendRequest',
      '10': 'requests'
    },
  ],
};

/// Descriptor for `S_FriendRequest_List`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_FriendRequest_ListDescriptor = $convert.base64Decode(
    'ChRTX0ZyaWVuZFJlcXVlc3RfTGlzdBIzCghyZXF1ZXN0cxgBIAMoCzIXLlByb3RvY29sLkZyaW'
    'VuZFJlcXVlc3RSCHJlcXVlc3Rz');

@$core.Deprecated('Use c_FriendRequest_RespondDescriptor instead')
const C_FriendRequest_Respond$json = {
  '1': 'C_FriendRequest_Respond',
  '2': [
    {'1': 'requester_user_id', '3': 1, '4': 1, '5': 9, '10': 'requesterUserId'},
    {'1': 'accept', '3': 2, '4': 1, '5': 8, '10': 'accept'},
  ],
};

/// Descriptor for `C_FriendRequest_Respond`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_FriendRequest_RespondDescriptor =
    $convert.base64Decode(
        'ChdDX0ZyaWVuZFJlcXVlc3RfUmVzcG9uZBIqChFyZXF1ZXN0ZXJfdXNlcl9pZBgBIAEoCVIPcm'
        'VxdWVzdGVyVXNlcklkEhYKBmFjY2VwdBgCIAEoCFIGYWNjZXB0');

@$core.Deprecated('Use s_FriendRequest_RespondDescriptor instead')
const S_FriendRequest_Respond$json = {
  '1': 'S_FriendRequest_Respond',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {
      '1': 'friend_',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Protocol.FriendInfo',
      '10': 'friend'
    },
  ],
};

/// Descriptor for `S_FriendRequest_Respond`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_FriendRequest_RespondDescriptor = $convert.base64Decode(
    'ChdTX0ZyaWVuZFJlcXVlc3RfUmVzcG9uZBIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB2'
    '1lc3NhZ2UYAiABKAlSB21lc3NhZ2USLQoHZnJpZW5kXxgDIAEoCzIULlByb3RvY29sLkZyaWVu'
    'ZEluZm9SBmZyaWVuZA==');

@$core.Deprecated('Use s_FriendRequest_PushDescriptor instead')
const S_FriendRequest_Push$json = {
  '1': 'S_FriendRequest_Push',
  '2': [
    {
      '1': 'event_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.Protocol.S_FriendRequest_Push.EventType',
      '10': 'eventType'
    },
    {
      '1': 'request',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.Protocol.FriendRequest',
      '10': 'request'
    },
    {
      '1': 'friend',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Protocol.FriendInfo',
      '10': 'friend'
    },
    {'1': 'cancelled_user_id', '3': 4, '4': 1, '5': 9, '10': 'cancelledUserId'},
  ],
  '4': [S_FriendRequest_Push_EventType$json],
};

@$core.Deprecated('Use s_FriendRequest_PushDescriptor instead')
const S_FriendRequest_Push_EventType$json = {
  '1': 'EventType',
  '2': [
    {'1': 'REQUEST_RECEIVED', '2': 0},
    {'1': 'REQUEST_ACCEPTED', '2': 1},
    {'1': 'REQUEST_CANCELLED', '2': 2},
  ],
};

/// Descriptor for `S_FriendRequest_Push`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_FriendRequest_PushDescriptor = $convert.base64Decode(
    'ChRTX0ZyaWVuZFJlcXVlc3RfUHVzaBJHCgpldmVudF90eXBlGAEgASgOMiguUHJvdG9jb2wuU1'
    '9GcmllbmRSZXF1ZXN0X1B1c2guRXZlbnRUeXBlUglldmVudFR5cGUSMQoHcmVxdWVzdBgCIAEo'
    'CzIXLlByb3RvY29sLkZyaWVuZFJlcXVlc3RSB3JlcXVlc3QSLAoGZnJpZW5kGAMgASgLMhQuUH'
    'JvdG9jb2wuRnJpZW5kSW5mb1IGZnJpZW5kEioKEWNhbmNlbGxlZF91c2VyX2lkGAQgASgJUg9j'
    'YW5jZWxsZWRVc2VySWQiTgoJRXZlbnRUeXBlEhQKEFJFUVVFU1RfUkVDRUlWRUQQABIUChBSRV'
    'FVRVNUX0FDQ0VQVEVEEAESFQoRUkVRVUVTVF9DQU5DRUxMRUQQAg==');
