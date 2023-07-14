//
//  Generated code. Do not modify.
//  source: questions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'questions.pb.dart' as $0;

export 'questions.pb.dart';

@$pb.GrpcServiceName('questions.QuestionService')
class QuestionServiceClient extends $grpc.Client {
  static final _$getQuestionStream = $grpc.ClientMethod<$0.QuestionRequest, $0.QuestionStreamResponse>(
      '/questions.QuestionService/GetQuestionStream',
      ($0.QuestionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.QuestionStreamResponse.fromBuffer(value));
  static final _$sendAnswer = $grpc.ClientMethod<$0.AnswerRequest, $0.AnswerResponse>(
      '/questions.QuestionService/SendAnswer',
      ($0.AnswerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AnswerResponse.fromBuffer(value));
  static final _$disconnect = $grpc.ClientMethod<$0.DisconnectRequest, $0.DisconnectResponse>(
      '/questions.QuestionService/Disconnect',
      ($0.DisconnectRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DisconnectResponse.fromBuffer(value));
  static final _$connect = $grpc.ClientMethod<$0.ConnectRequest, $0.ConnectResponse>(
      '/questions.QuestionService/Connect',
      ($0.ConnectRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ConnectResponse.fromBuffer(value));

  QuestionServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$0.QuestionStreamResponse> getQuestionStream($0.QuestionRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getQuestionStream, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.AnswerResponse> sendAnswer($0.AnswerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendAnswer, request, options: options);
  }

  $grpc.ResponseFuture<$0.DisconnectResponse> disconnect($0.DisconnectRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$disconnect, request, options: options);
  }

  $grpc.ResponseFuture<$0.ConnectResponse> connect($0.ConnectRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$connect, request, options: options);
  }
}

@$pb.GrpcServiceName('questions.QuestionService')
abstract class QuestionServiceBase extends $grpc.Service {
  $core.String get $name => 'questions.QuestionService';

  QuestionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.QuestionRequest, $0.QuestionStreamResponse>(
        'GetQuestionStream',
        getQuestionStream_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.QuestionRequest.fromBuffer(value),
        ($0.QuestionStreamResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AnswerRequest, $0.AnswerResponse>(
        'SendAnswer',
        sendAnswer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AnswerRequest.fromBuffer(value),
        ($0.AnswerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DisconnectRequest, $0.DisconnectResponse>(
        'Disconnect',
        disconnect_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DisconnectRequest.fromBuffer(value),
        ($0.DisconnectResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ConnectRequest, $0.ConnectResponse>(
        'Connect',
        connect_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ConnectRequest.fromBuffer(value),
        ($0.ConnectResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.QuestionStreamResponse> getQuestionStream_Pre($grpc.ServiceCall call, $async.Future<$0.QuestionRequest> request) async* {
    yield* getQuestionStream(call, await request);
  }

  $async.Future<$0.AnswerResponse> sendAnswer_Pre($grpc.ServiceCall call, $async.Future<$0.AnswerRequest> request) async {
    return sendAnswer(call, await request);
  }

  $async.Future<$0.DisconnectResponse> disconnect_Pre($grpc.ServiceCall call, $async.Future<$0.DisconnectRequest> request) async {
    return disconnect(call, await request);
  }

  $async.Future<$0.ConnectResponse> connect_Pre($grpc.ServiceCall call, $async.Future<$0.ConnectRequest> request) async {
    return connect(call, await request);
  }

  $async.Stream<$0.QuestionStreamResponse> getQuestionStream($grpc.ServiceCall call, $0.QuestionRequest request);
  $async.Future<$0.AnswerResponse> sendAnswer($grpc.ServiceCall call, $0.AnswerRequest request);
  $async.Future<$0.DisconnectResponse> disconnect($grpc.ServiceCall call, $0.DisconnectRequest request);
  $async.Future<$0.ConnectResponse> connect($grpc.ServiceCall call, $0.ConnectRequest request);
}
