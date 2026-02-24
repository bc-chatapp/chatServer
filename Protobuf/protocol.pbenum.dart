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

class GroupRole extends $pb.ProtobufEnum {
  static const GroupRole MEMBER =
      GroupRole._(0, _omitEnumNames ? '' : 'MEMBER');
  static const GroupRole ADMIN = GroupRole._(1, _omitEnumNames ? '' : 'ADMIN');
  static const GroupRole OWNER = GroupRole._(2, _omitEnumNames ? '' : 'OWNER');

  static const $core.List<GroupRole> values = <GroupRole>[
    MEMBER,
    ADMIN,
    OWNER,
  ];

  static final $core.List<GroupRole?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static GroupRole? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GroupRole._(super.value, super.name);
}

class ErrorCode extends $pb.ProtobufEnum {
  static const ErrorCode ERR_SUCCESS =
      ErrorCode._(0, _omitEnumNames ? '' : 'ERR_SUCCESS');
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
  static const ErrorCode ERR_PAYLOAD_EMPTY =
      ErrorCode._(200, _omitEnumNames ? '' : 'ERR_PAYLOAD_EMPTY');
  static const ErrorCode ERR_INVALID_CONV_ID =
      ErrorCode._(201, _omitEnumNames ? '' : 'ERR_INVALID_CONV_ID');
  static const ErrorCode ERR_INVALID_RECEIVER_ID =
      ErrorCode._(202, _omitEnumNames ? '' : 'ERR_INVALID_RECEIVER_ID');
  static const ErrorCode ERR_INVALID_ACK =
      ErrorCode._(203, _omitEnumNames ? '' : 'ERR_INVALID_ACK');
  static const ErrorCode ERR_INVALID_FRIEND_USER_ID =
      ErrorCode._(300, _omitEnumNames ? '' : 'ERR_INVALID_FRIEND_USER_ID');
  static const ErrorCode ERR_CANNOT_ADD_SELF =
      ErrorCode._(301, _omitEnumNames ? '' : 'ERR_CANNOT_ADD_SELF');
  static const ErrorCode ERR_NOT_A_FRIEND =
      ErrorCode._(302, _omitEnumNames ? '' : 'ERR_NOT_A_FRIEND');
  static const ErrorCode ERR_FRIEND_REQUEST_NOT_FOUND =
      ErrorCode._(303, _omitEnumNames ? '' : 'ERR_FRIEND_REQUEST_NOT_FOUND');
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
  static const ErrorCode ERR_INVALID_ARGUMENT =
      ErrorCode._(407, _omitEnumNames ? '' : 'ERR_INVALID_ARGUMENT');
  static const ErrorCode ERR_STORAGE_EXCEEDED =
      ErrorCode._(408, _omitEnumNames ? '' : 'ERR_STORAGE_EXCEEDED');
  static const ErrorCode ERR_FILE_TOO_LARGE =
      ErrorCode._(409, _omitEnumNames ? '' : 'ERR_FILE_TOO_LARGE');
  static const ErrorCode ERR_PAYMENT_FAILED =
      ErrorCode._(410, _omitEnumNames ? '' : 'ERR_PAYMENT_FAILED');
  static const ErrorCode ERR_RECEIPT_INVALID =
      ErrorCode._(411, _omitEnumNames ? '' : 'ERR_RECEIPT_INVALID');
  static const ErrorCode ERR_NO_PERMISSION =
      ErrorCode._(500, _omitEnumNames ? '' : 'ERR_NO_PERMISSION');
  static const ErrorCode ERR_ALREADY_BLOCKED =
      ErrorCode._(600, _omitEnumNames ? '' : 'ERR_ALREADY_BLOCKED');
  static const ErrorCode ERR_NOT_BLOCKED =
      ErrorCode._(601, _omitEnumNames ? '' : 'ERR_NOT_BLOCKED');
  static const ErrorCode ERR_CANNOT_BLOCK_SELF =
      ErrorCode._(602, _omitEnumNames ? '' : 'ERR_CANNOT_BLOCK_SELF');
  static const ErrorCode ERR_REPORT_DUPLICATE =
      ErrorCode._(610, _omitEnumNames ? '' : 'ERR_REPORT_DUPLICATE');
  static const ErrorCode ERR_POLL_NOT_FOUND =
      ErrorCode._(700, _omitEnumNames ? '' : 'ERR_POLL_NOT_FOUND');
  static const ErrorCode ERR_POLL_CLOSED =
      ErrorCode._(701, _omitEnumNames ? '' : 'ERR_POLL_CLOSED');
  static const ErrorCode ERR_POLL_INVALID_OPTION =
      ErrorCode._(702, _omitEnumNames ? '' : 'ERR_POLL_INVALID_OPTION');

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
    ERR_INVALID_ARGUMENT,
    ERR_STORAGE_EXCEEDED,
    ERR_FILE_TOO_LARGE,
    ERR_PAYMENT_FAILED,
    ERR_RECEIPT_INVALID,
    ERR_NO_PERMISSION,
    ERR_ALREADY_BLOCKED,
    ERR_NOT_BLOCKED,
    ERR_CANNOT_BLOCK_SELF,
    ERR_REPORT_DUPLICATE,
    ERR_POLL_NOT_FOUND,
    ERR_POLL_CLOSED,
    ERR_POLL_INVALID_OPTION,
  ];

  static final $core.Map<$core.int, ErrorCode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ErrorCode? valueOf($core.int value) => _byValue[value];

  const ErrorCode._(super.value, super.name);
}

class C_UploadFile_UploadType extends $pb.ProtobufEnum {
  static const C_UploadFile_UploadType DIRECT_CHAT =
      C_UploadFile_UploadType._(0, _omitEnumNames ? '' : 'DIRECT_CHAT');
  static const C_UploadFile_UploadType GROUP_CHAT =
      C_UploadFile_UploadType._(1, _omitEnumNames ? '' : 'GROUP_CHAT');
  static const C_UploadFile_UploadType PROFILE_IMG =
      C_UploadFile_UploadType._(2, _omitEnumNames ? '' : 'PROFILE_IMG');
  static const C_UploadFile_UploadType GROUP_PROFILE_IMG =
      C_UploadFile_UploadType._(3, _omitEnumNames ? '' : 'GROUP_PROFILE_IMG');
  static const C_UploadFile_UploadType BACKGROUND_IMG =
      C_UploadFile_UploadType._(4, _omitEnumNames ? '' : 'BACKGROUND_IMG');

  static const $core.List<C_UploadFile_UploadType> values =
      <C_UploadFile_UploadType>[
    DIRECT_CHAT,
    GROUP_CHAT,
    PROFILE_IMG,
    GROUP_PROFILE_IMG,
    BACKGROUND_IMG,
  ];

  static final $core.List<C_UploadFile_UploadType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static C_UploadFile_UploadType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const C_UploadFile_UploadType._(super.value, super.name);
}

class C_FriendAction_ActionType extends $pb.ProtobufEnum {
  static const C_FriendAction_ActionType SEND_REQUEST =
      C_FriendAction_ActionType._(0, _omitEnumNames ? '' : 'SEND_REQUEST');
  static const C_FriendAction_ActionType CANCEL_REQUEST =
      C_FriendAction_ActionType._(1, _omitEnumNames ? '' : 'CANCEL_REQUEST');
  static const C_FriendAction_ActionType ACCEPT_REQUEST =
      C_FriendAction_ActionType._(2, _omitEnumNames ? '' : 'ACCEPT_REQUEST');
  static const C_FriendAction_ActionType REJECT_REQUEST =
      C_FriendAction_ActionType._(3, _omitEnumNames ? '' : 'REJECT_REQUEST');
  static const C_FriendAction_ActionType DELETE_FRIEND =
      C_FriendAction_ActionType._(4, _omitEnumNames ? '' : 'DELETE_FRIEND');

  static const $core.List<C_FriendAction_ActionType> values =
      <C_FriendAction_ActionType>[
    SEND_REQUEST,
    CANCEL_REQUEST,
    ACCEPT_REQUEST,
    REJECT_REQUEST,
    DELETE_FRIEND,
  ];

  static final $core.List<C_FriendAction_ActionType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static C_FriendAction_ActionType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const C_FriendAction_ActionType._(super.value, super.name);
}

class S_FriendPush_PushType extends $pb.ProtobufEnum {
  static const S_FriendPush_PushType NEW_REQUEST =
      S_FriendPush_PushType._(0, _omitEnumNames ? '' : 'NEW_REQUEST');
  static const S_FriendPush_PushType ACCEPTED =
      S_FriendPush_PushType._(1, _omitEnumNames ? '' : 'ACCEPTED');
  static const S_FriendPush_PushType DELETED =
      S_FriendPush_PushType._(2, _omitEnumNames ? '' : 'DELETED');

  static const $core.List<S_FriendPush_PushType> values =
      <S_FriendPush_PushType>[
    NEW_REQUEST,
    ACCEPTED,
    DELETED,
  ];

  static final $core.List<S_FriendPush_PushType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static S_FriendPush_PushType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const S_FriendPush_PushType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
