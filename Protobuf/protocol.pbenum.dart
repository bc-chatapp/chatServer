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

import 'package:protobuf/protobuf.dart' as $pb;

/// 에러 코드 enum (클라이언트-서버 공통)
class ErrorCode extends $pb.ProtobufEnum {
  static const ErrorCode ERR_SUCCESS =
      ErrorCode._(0, _omitEnumNames ? '' : 'ERR_SUCCESS');

  /// 1~99: 공용/시스템 에러
  static const ErrorCode ERR_UNKNOWN =
      ErrorCode._(1, _omitEnumNames ? '' : 'ERR_UNKNOWN');
  static const ErrorCode ERR_SERVER_INTERNAL =
      ErrorCode._(2, _omitEnumNames ? '' : 'ERR_SERVER_INTERNAL');
  static const ErrorCode ERR_INVALID_PACKET =
      ErrorCode._(3, _omitEnumNames ? '' : 'ERR_INVALID_PACKET');
  static const ErrorCode ERR_VERSION_MISMATCH =
      ErrorCode._(4, _omitEnumNames ? '' : 'ERR_VERSION_MISMATCH');
  static const ErrorCode ERR_UNAUTHORIZED =
      ErrorCode._(5, _omitEnumNames ? '' : 'ERR_UNAUTHORIZED');
  static const ErrorCode ERR_INVALID_TOKEN =
      ErrorCode._(6, _omitEnumNames ? '' : 'ERR_INVALID_TOKEN');

  /// 100~199: 인증/사용자 관련
  static const ErrorCode ERR_USER_ID_EMPTY =
      ErrorCode._(100, _omitEnumNames ? '' : 'ERR_USER_ID_EMPTY');
  static const ErrorCode ERR_USER_ID_REQUIRED =
      ErrorCode._(101, _omitEnumNames ? '' : 'ERR_USER_ID_REQUIRED');
  static const ErrorCode ERR_PASSWORD_REQUIRED =
      ErrorCode._(102, _omitEnumNames ? '' : 'ERR_PASSWORD_REQUIRED');
  static const ErrorCode ERR_NAME_REQUIRED =
      ErrorCode._(103, _omitEnumNames ? '' : 'ERR_NAME_REQUIRED');
  static const ErrorCode ERR_EMAIL_REQUIRED =
      ErrorCode._(104, _omitEnumNames ? '' : 'ERR_EMAIL_REQUIRED');
  static const ErrorCode ERR_USER_NOT_FOUND =
      ErrorCode._(105, _omitEnumNames ? '' : 'ERR_USER_NOT_FOUND');
  static const ErrorCode ERR_INVALID_PASSWORD =
      ErrorCode._(106, _omitEnumNames ? '' : 'ERR_INVALID_PASSWORD');
  static const ErrorCode ERR_USER_ALREADY_EXISTS =
      ErrorCode._(107, _omitEnumNames ? '' : 'ERR_USER_ALREADY_EXISTS');
  static const ErrorCode ERR_EMAIL_ALREADY_EXISTS =
      ErrorCode._(108, _omitEnumNames ? '' : 'ERR_EMAIL_ALREADY_EXISTS');

  /// 200~299: 채팅 관련
  static const ErrorCode ERR_PAYLOAD_EMPTY =
      ErrorCode._(200, _omitEnumNames ? '' : 'ERR_PAYLOAD_EMPTY');
  static const ErrorCode ERR_INVALID_CONV_ID =
      ErrorCode._(201, _omitEnumNames ? '' : 'ERR_INVALID_CONV_ID');
  static const ErrorCode ERR_INVALID_RECEIVER_ID =
      ErrorCode._(202, _omitEnumNames ? '' : 'ERR_INVALID_RECEIVER_ID');
  static const ErrorCode ERR_INVALID_ACK =
      ErrorCode._(203, _omitEnumNames ? '' : 'ERR_INVALID_ACK');

  /// 300~399: 친구 요청 관련
  static const ErrorCode ERR_INVALID_FRIEND_USER_ID =
      ErrorCode._(300, _omitEnumNames ? '' : 'ERR_INVALID_FRIEND_USER_ID');
  static const ErrorCode ERR_CANNOT_ADD_SELF =
      ErrorCode._(301, _omitEnumNames ? '' : 'ERR_CANNOT_ADD_SELF');
  static const ErrorCode ERR_NOT_A_FRIEND =
      ErrorCode._(302, _omitEnumNames ? '' : 'ERR_NOT_A_FRIEND');
  static const ErrorCode ERR_FRIEND_REQUEST_NOT_FOUND =
      ErrorCode._(303, _omitEnumNames ? '' : 'ERR_FRIEND_REQUEST_NOT_FOUND');

  /// 400~499: 파일 업로드 관련
  static const ErrorCode ERR_FILE_SERVICE_NOT_INITIALIZED = ErrorCode._(
      400, _omitEnumNames ? '' : 'ERR_FILE_SERVICE_NOT_INITIALIZED');
  static const ErrorCode ERR_CLOUD_STORAGE_NOT_INITIALIZED = ErrorCode._(
      401, _omitEnumNames ? '' : 'ERR_CLOUD_STORAGE_NOT_INITIALIZED');
  static const ErrorCode ERR_FILENAME_REQUIRED =
      ErrorCode._(402, _omitEnumNames ? '' : 'ERR_FILENAME_REQUIRED');
  static const ErrorCode ERR_INVALID_FILE_SIZE =
      ErrorCode._(403, _omitEnumNames ? '' : 'ERR_INVALID_FILE_SIZE');
  static const ErrorCode ERR_MIME_TYPE_REQUIRED =
      ErrorCode._(404, _omitEnumNames ? '' : 'ERR_MIME_TYPE_REQUIRED');
  static const ErrorCode ERR_FAILED_TO_GENERATE_URL =
      ErrorCode._(405, _omitEnumNames ? '' : 'ERR_FAILED_TO_GENERATE_URL');
  static const ErrorCode ERR_INVALID_FILE_URL =
      ErrorCode._(406, _omitEnumNames ? '' : 'ERR_INVALID_FILE_URL');

  static const $core.List<ErrorCode> values = <ErrorCode>[
    ERR_SUCCESS,
    ERR_UNKNOWN,
    ERR_SERVER_INTERNAL,
    ERR_INVALID_PACKET,
    ERR_VERSION_MISMATCH,
    ERR_UNAUTHORIZED,
    ERR_INVALID_TOKEN,
    ERR_USER_ID_EMPTY,
    ERR_USER_ID_REQUIRED,
    ERR_PASSWORD_REQUIRED,
    ERR_NAME_REQUIRED,
    ERR_EMAIL_REQUIRED,
    ERR_USER_NOT_FOUND,
    ERR_INVALID_PASSWORD,
    ERR_USER_ALREADY_EXISTS,
    ERR_EMAIL_ALREADY_EXISTS,
    ERR_PAYLOAD_EMPTY,
    ERR_INVALID_CONV_ID,
    ERR_INVALID_RECEIVER_ID,
    ERR_INVALID_ACK,
    ERR_INVALID_FRIEND_USER_ID,
    ERR_CANNOT_ADD_SELF,
    ERR_NOT_A_FRIEND,
    ERR_FRIEND_REQUEST_NOT_FOUND,
    ERR_FILE_SERVICE_NOT_INITIALIZED,
    ERR_CLOUD_STORAGE_NOT_INITIALIZED,
    ERR_FILENAME_REQUIRED,
    ERR_INVALID_FILE_SIZE,
    ERR_MIME_TYPE_REQUIRED,
    ERR_FAILED_TO_GENERATE_URL,
    ERR_INVALID_FILE_URL,
  ];

  static final $core.Map<$core.int, ErrorCode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ErrorCode? valueOf($core.int value) => _byValue[value];

  const ErrorCode._(super.value, super.name);
}

class C_FriendRequest_List_RequestType extends $pb.ProtobufEnum {
  static const C_FriendRequest_List_RequestType RECEIVED =
      C_FriendRequest_List_RequestType._(0, _omitEnumNames ? '' : 'RECEIVED');
  static const C_FriendRequest_List_RequestType SENT =
      C_FriendRequest_List_RequestType._(1, _omitEnumNames ? '' : 'SENT');

  static const $core.List<C_FriendRequest_List_RequestType> values =
      <C_FriendRequest_List_RequestType>[
    RECEIVED,
    SENT,
  ];

  static final $core.List<C_FriendRequest_List_RequestType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static C_FriendRequest_List_RequestType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const C_FriendRequest_List_RequestType._(super.value, super.name);
}

class S_FriendRequest_Push_EventType extends $pb.ProtobufEnum {
  static const S_FriendRequest_Push_EventType REQUEST_RECEIVED =
      S_FriendRequest_Push_EventType._(
          0, _omitEnumNames ? '' : 'REQUEST_RECEIVED');
  static const S_FriendRequest_Push_EventType REQUEST_ACCEPTED =
      S_FriendRequest_Push_EventType._(
          1, _omitEnumNames ? '' : 'REQUEST_ACCEPTED');
  static const S_FriendRequest_Push_EventType REQUEST_CANCELLED =
      S_FriendRequest_Push_EventType._(
          2, _omitEnumNames ? '' : 'REQUEST_CANCELLED');

  static const $core.List<S_FriendRequest_Push_EventType> values =
      <S_FriendRequest_Push_EventType>[
    REQUEST_RECEIVED,
    REQUEST_ACCEPTED,
    REQUEST_CANCELLED,
  ];

  static final $core.List<S_FriendRequest_Push_EventType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static S_FriendRequest_Push_EventType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const S_FriendRequest_Push_EventType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
