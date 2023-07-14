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

class QuestionType extends $pb.ProtobufEnum {
  static const QuestionType text = QuestionType._(0, _omitEnumNames ? '' : 'text');
  static const QuestionType number = QuestionType._(1, _omitEnumNames ? '' : 'number');
  static const QuestionType multipleChoice = QuestionType._(2, _omitEnumNames ? '' : 'multipleChoice');
  static const QuestionType trueFalse = QuestionType._(3, _omitEnumNames ? '' : 'trueFalse');
  static const QuestionType location = QuestionType._(4, _omitEnumNames ? '' : 'location');

  static const $core.List<QuestionType> values = <QuestionType> [
    text,
    number,
    multipleChoice,
    trueFalse,
    location,
  ];

  static final $core.Map<$core.int, QuestionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static QuestionType? valueOf($core.int value) => _byValue[value];

  const QuestionType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
