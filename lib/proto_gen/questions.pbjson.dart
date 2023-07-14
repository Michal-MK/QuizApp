//
//  Generated code. Do not modify.
//  source: questions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use questionTypeDescriptor instead')
const QuestionType$json = {
  '1': 'QuestionType',
  '2': [
    {'1': 'text', '2': 0},
    {'1': 'number', '2': 1},
    {'1': 'multipleChoice', '2': 2},
    {'1': 'trueFalse', '2': 3},
    {'1': 'location', '2': 4},
  ],
};

/// Descriptor for `QuestionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List questionTypeDescriptor = $convert.base64Decode(
    'CgxRdWVzdGlvblR5cGUSCAoEdGV4dBAAEgoKBm51bWJlchABEhIKDm11bHRpcGxlQ2hvaWNlEA'
    'ISDQoJdHJ1ZUZhbHNlEAMSDAoIbG9jYXRpb24QBA==');

@$core.Deprecated('Use questionRequestDescriptor instead')
const QuestionRequest$json = {
  '1': 'QuestionRequest',
};

/// Descriptor for `QuestionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List questionRequestDescriptor = $convert.base64Decode(
    'Cg9RdWVzdGlvblJlcXVlc3Q=');

@$core.Deprecated('Use questionStreamResponseDescriptor instead')
const QuestionStreamResponse$json = {
  '1': 'QuestionStreamResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'question', '3': 2, '4': 1, '5': 9, '10': 'question'},
    {'1': 'question_type', '3': 3, '4': 1, '5': 14, '6': '.questions.QuestionType', '10': 'questionType'},
    {'1': 'author', '3': 4, '4': 1, '5': 9, '10': 'author'},
    {'1': 'hint', '3': 5, '4': 1, '5': 9, '10': 'hint'},
    {'1': 'imageBase64', '3': 6, '4': 1, '5': 9, '10': 'imageBase64'},
    {'1': 'answer', '3': 7, '4': 1, '5': 9, '10': 'answer'},
    {'1': 'multichoiceAnswers', '3': 8, '4': 1, '5': 9, '10': 'multichoiceAnswers'},
    {'1': 'multichoiceAnswersCorrectIndex', '3': 9, '4': 1, '5': 5, '10': 'multichoiceAnswersCorrectIndex'},
    {'1': 'category', '3': 10, '4': 1, '5': 9, '10': 'category'},
    {'1': 'jeopardyWeight', '3': 11, '4': 1, '5': 5, '10': 'jeopardyWeight'},
  ],
};

/// Descriptor for `QuestionStreamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List questionStreamResponseDescriptor = $convert.base64Decode(
    'ChZRdWVzdGlvblN0cmVhbVJlc3BvbnNlEg4KAmlkGAEgASgFUgJpZBIaCghxdWVzdGlvbhgCIA'
    'EoCVIIcXVlc3Rpb24SPAoNcXVlc3Rpb25fdHlwZRgDIAEoDjIXLnF1ZXN0aW9ucy5RdWVzdGlv'
    'blR5cGVSDHF1ZXN0aW9uVHlwZRIWCgZhdXRob3IYBCABKAlSBmF1dGhvchISCgRoaW50GAUgAS'
    'gJUgRoaW50EiAKC2ltYWdlQmFzZTY0GAYgASgJUgtpbWFnZUJhc2U2NBIWCgZhbnN3ZXIYByAB'
    'KAlSBmFuc3dlchIuChJtdWx0aWNob2ljZUFuc3dlcnMYCCABKAlSEm11bHRpY2hvaWNlQW5zd2'
    'VycxJGCh5tdWx0aWNob2ljZUFuc3dlcnNDb3JyZWN0SW5kZXgYCSABKAVSHm11bHRpY2hvaWNl'
    'QW5zd2Vyc0NvcnJlY3RJbmRleBIaCghjYXRlZ29yeRgKIAEoCVIIY2F0ZWdvcnkSJgoOamVvcG'
    'FyZHlXZWlnaHQYCyABKAVSDmplb3BhcmR5V2VpZ2h0');

@$core.Deprecated('Use answerRequestDescriptor instead')
const AnswerRequest$json = {
  '1': 'AnswerRequest',
  '2': [
    {'1': 'questionId', '3': 1, '4': 1, '5': 5, '10': 'questionId'},
    {'1': 'clientUuid', '3': 2, '4': 1, '5': 9, '10': 'clientUuid'},
    {'1': 'clientName', '3': 3, '4': 1, '5': 9, '10': 'clientName'},
    {'1': 'answer', '3': 4, '4': 1, '5': 9, '10': 'answer'},
  ],
};

/// Descriptor for `AnswerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List answerRequestDescriptor = $convert.base64Decode(
    'Cg1BbnN3ZXJSZXF1ZXN0Eh4KCnF1ZXN0aW9uSWQYASABKAVSCnF1ZXN0aW9uSWQSHgoKY2xpZW'
    '50VXVpZBgCIAEoCVIKY2xpZW50VXVpZBIeCgpjbGllbnROYW1lGAMgASgJUgpjbGllbnROYW1l'
    'EhYKBmFuc3dlchgEIAEoCVIGYW5zd2Vy');

@$core.Deprecated('Use answerResponseDescriptor instead')
const AnswerResponse$json = {
  '1': 'AnswerResponse',
};

/// Descriptor for `AnswerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List answerResponseDescriptor = $convert.base64Decode(
    'Cg5BbnN3ZXJSZXNwb25zZQ==');

@$core.Deprecated('Use connectRequestDescriptor instead')
const ConnectRequest$json = {
  '1': 'ConnectRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `ConnectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectRequestDescriptor = $convert.base64Decode(
    'Cg5Db25uZWN0UmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1l');

@$core.Deprecated('Use connectResponseDescriptor instead')
const ConnectResponse$json = {
  '1': 'ConnectResponse',
  '2': [
    {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
  ],
};

/// Descriptor for `ConnectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectResponseDescriptor = $convert.base64Decode(
    'Cg9Db25uZWN0UmVzcG9uc2USEgoEdXVpZBgBIAEoCVIEdXVpZA==');

@$core.Deprecated('Use disconnectRequestDescriptor instead')
const DisconnectRequest$json = {
  '1': 'DisconnectRequest',
  '2': [
    {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
  ],
};

/// Descriptor for `DisconnectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disconnectRequestDescriptor = $convert.base64Decode(
    'ChFEaXNjb25uZWN0UmVxdWVzdBISCgR1dWlkGAEgASgJUgR1dWlk');

@$core.Deprecated('Use disconnectResponseDescriptor instead')
const DisconnectResponse$json = {
  '1': 'DisconnectResponse',
};

/// Descriptor for `DisconnectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disconnectResponseDescriptor = $convert.base64Decode(
    'ChJEaXNjb25uZWN0UmVzcG9uc2U=');

