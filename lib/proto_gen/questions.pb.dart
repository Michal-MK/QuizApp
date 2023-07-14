//
//  Generated code. Do not modify.
//  source: questions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'questions.pbenum.dart';

export 'questions.pbenum.dart';

class QuestionRequest extends $pb.GeneratedMessage {
  factory QuestionRequest() => create();
  QuestionRequest._() : super();
  factory QuestionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QuestionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'QuestionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'questions'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QuestionRequest clone() => QuestionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QuestionRequest copyWith(void Function(QuestionRequest) updates) => super.copyWith((message) => updates(message as QuestionRequest)) as QuestionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuestionRequest create() => QuestionRequest._();
  QuestionRequest createEmptyInstance() => create();
  static $pb.PbList<QuestionRequest> createRepeated() => $pb.PbList<QuestionRequest>();
  @$core.pragma('dart2js:noInline')
  static QuestionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QuestionRequest>(create);
  static QuestionRequest? _defaultInstance;
}

class QuestionStreamResponse extends $pb.GeneratedMessage {
  factory QuestionStreamResponse() => create();
  QuestionStreamResponse._() : super();
  factory QuestionStreamResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QuestionStreamResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'QuestionStreamResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'questions'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'question')
    ..e<QuestionType>(3, _omitFieldNames ? '' : 'questionType', $pb.PbFieldType.OE, defaultOrMaker: QuestionType.text, valueOf: QuestionType.valueOf, enumValues: QuestionType.values)
    ..aOS(4, _omitFieldNames ? '' : 'author')
    ..aOS(5, _omitFieldNames ? '' : 'hint')
    ..aOS(6, _omitFieldNames ? '' : 'imageBase64', protoName: 'imageBase64')
    ..aOS(7, _omitFieldNames ? '' : 'answer')
    ..aOS(8, _omitFieldNames ? '' : 'multichoiceAnswers', protoName: 'multichoiceAnswers')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'multichoiceAnswersCorrectIndex', $pb.PbFieldType.O3, protoName: 'multichoiceAnswersCorrectIndex')
    ..aOS(10, _omitFieldNames ? '' : 'category')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'jeopardyWeight', $pb.PbFieldType.O3, protoName: 'jeopardyWeight')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QuestionStreamResponse clone() => QuestionStreamResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QuestionStreamResponse copyWith(void Function(QuestionStreamResponse) updates) => super.copyWith((message) => updates(message as QuestionStreamResponse)) as QuestionStreamResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuestionStreamResponse create() => QuestionStreamResponse._();
  QuestionStreamResponse createEmptyInstance() => create();
  static $pb.PbList<QuestionStreamResponse> createRepeated() => $pb.PbList<QuestionStreamResponse>();
  @$core.pragma('dart2js:noInline')
  static QuestionStreamResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QuestionStreamResponse>(create);
  static QuestionStreamResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get question => $_getSZ(1);
  @$pb.TagNumber(2)
  set question($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQuestion() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuestion() => clearField(2);

  @$pb.TagNumber(3)
  QuestionType get questionType => $_getN(2);
  @$pb.TagNumber(3)
  set questionType(QuestionType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasQuestionType() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuestionType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get author => $_getSZ(3);
  @$pb.TagNumber(4)
  set author($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAuthor() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthor() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get hint => $_getSZ(4);
  @$pb.TagNumber(5)
  set hint($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHint() => $_has(4);
  @$pb.TagNumber(5)
  void clearHint() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get imageBase64 => $_getSZ(5);
  @$pb.TagNumber(6)
  set imageBase64($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasImageBase64() => $_has(5);
  @$pb.TagNumber(6)
  void clearImageBase64() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get answer => $_getSZ(6);
  @$pb.TagNumber(7)
  set answer($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAnswer() => $_has(6);
  @$pb.TagNumber(7)
  void clearAnswer() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get multichoiceAnswers => $_getSZ(7);
  @$pb.TagNumber(8)
  set multichoiceAnswers($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMultichoiceAnswers() => $_has(7);
  @$pb.TagNumber(8)
  void clearMultichoiceAnswers() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get multichoiceAnswersCorrectIndex => $_getIZ(8);
  @$pb.TagNumber(9)
  set multichoiceAnswersCorrectIndex($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMultichoiceAnswersCorrectIndex() => $_has(8);
  @$pb.TagNumber(9)
  void clearMultichoiceAnswersCorrectIndex() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get category => $_getSZ(9);
  @$pb.TagNumber(10)
  set category($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCategory() => $_has(9);
  @$pb.TagNumber(10)
  void clearCategory() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get jeopardyWeight => $_getIZ(10);
  @$pb.TagNumber(11)
  set jeopardyWeight($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasJeopardyWeight() => $_has(10);
  @$pb.TagNumber(11)
  void clearJeopardyWeight() => clearField(11);
}

class AnswerRequest extends $pb.GeneratedMessage {
  factory AnswerRequest() => create();
  AnswerRequest._() : super();
  factory AnswerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnswerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnswerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'questions'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'questionId', $pb.PbFieldType.O3, protoName: 'questionId')
    ..aOS(2, _omitFieldNames ? '' : 'clientUuid', protoName: 'clientUuid')
    ..aOS(3, _omitFieldNames ? '' : 'clientName', protoName: 'clientName')
    ..aOS(4, _omitFieldNames ? '' : 'answer')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnswerRequest clone() => AnswerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnswerRequest copyWith(void Function(AnswerRequest) updates) => super.copyWith((message) => updates(message as AnswerRequest)) as AnswerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnswerRequest create() => AnswerRequest._();
  AnswerRequest createEmptyInstance() => create();
  static $pb.PbList<AnswerRequest> createRepeated() => $pb.PbList<AnswerRequest>();
  @$core.pragma('dart2js:noInline')
  static AnswerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnswerRequest>(create);
  static AnswerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get questionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set questionId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuestionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientUuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientUuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientUuid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get clientName => $_getSZ(2);
  @$pb.TagNumber(3)
  set clientName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClientName() => $_has(2);
  @$pb.TagNumber(3)
  void clearClientName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get answer => $_getSZ(3);
  @$pb.TagNumber(4)
  set answer($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAnswer() => $_has(3);
  @$pb.TagNumber(4)
  void clearAnswer() => clearField(4);
}

class AnswerResponse extends $pb.GeneratedMessage {
  factory AnswerResponse() => create();
  AnswerResponse._() : super();
  factory AnswerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnswerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnswerResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'questions'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnswerResponse clone() => AnswerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnswerResponse copyWith(void Function(AnswerResponse) updates) => super.copyWith((message) => updates(message as AnswerResponse)) as AnswerResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnswerResponse create() => AnswerResponse._();
  AnswerResponse createEmptyInstance() => create();
  static $pb.PbList<AnswerResponse> createRepeated() => $pb.PbList<AnswerResponse>();
  @$core.pragma('dart2js:noInline')
  static AnswerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnswerResponse>(create);
  static AnswerResponse? _defaultInstance;
}

class ConnectRequest extends $pb.GeneratedMessage {
  factory ConnectRequest() => create();
  ConnectRequest._() : super();
  factory ConnectRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConnectRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'questions'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectRequest clone() => ConnectRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectRequest copyWith(void Function(ConnectRequest) updates) => super.copyWith((message) => updates(message as ConnectRequest)) as ConnectRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectRequest create() => ConnectRequest._();
  ConnectRequest createEmptyInstance() => create();
  static $pb.PbList<ConnectRequest> createRepeated() => $pb.PbList<ConnectRequest>();
  @$core.pragma('dart2js:noInline')
  static ConnectRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectRequest>(create);
  static ConnectRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class ConnectResponse extends $pb.GeneratedMessage {
  factory ConnectResponse() => create();
  ConnectResponse._() : super();
  factory ConnectResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConnectResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'questions'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectResponse clone() => ConnectResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectResponse copyWith(void Function(ConnectResponse) updates) => super.copyWith((message) => updates(message as ConnectResponse)) as ConnectResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectResponse create() => ConnectResponse._();
  ConnectResponse createEmptyInstance() => create();
  static $pb.PbList<ConnectResponse> createRepeated() => $pb.PbList<ConnectResponse>();
  @$core.pragma('dart2js:noInline')
  static ConnectResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectResponse>(create);
  static ConnectResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);
}

class DisconnectRequest extends $pb.GeneratedMessage {
  factory DisconnectRequest() => create();
  DisconnectRequest._() : super();
  factory DisconnectRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisconnectRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DisconnectRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'questions'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DisconnectRequest clone() => DisconnectRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DisconnectRequest copyWith(void Function(DisconnectRequest) updates) => super.copyWith((message) => updates(message as DisconnectRequest)) as DisconnectRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisconnectRequest create() => DisconnectRequest._();
  DisconnectRequest createEmptyInstance() => create();
  static $pb.PbList<DisconnectRequest> createRepeated() => $pb.PbList<DisconnectRequest>();
  @$core.pragma('dart2js:noInline')
  static DisconnectRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisconnectRequest>(create);
  static DisconnectRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);
}

class DisconnectResponse extends $pb.GeneratedMessage {
  factory DisconnectResponse() => create();
  DisconnectResponse._() : super();
  factory DisconnectResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisconnectResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DisconnectResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'questions'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DisconnectResponse clone() => DisconnectResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DisconnectResponse copyWith(void Function(DisconnectResponse) updates) => super.copyWith((message) => updates(message as DisconnectResponse)) as DisconnectResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisconnectResponse create() => DisconnectResponse._();
  DisconnectResponse createEmptyInstance() => create();
  static $pb.PbList<DisconnectResponse> createRepeated() => $pb.PbList<DisconnectResponse>();
  @$core.pragma('dart2js:noInline')
  static DisconnectResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisconnectResponse>(create);
  static DisconnectResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
