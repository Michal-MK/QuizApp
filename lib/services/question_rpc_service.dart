import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/db/question_type.dart';
import 'package:quiz/proto_gen/questions.pbgrpc.dart';
import 'package:uuid/uuid.dart';

class QuestionRPCService extends QuestionServiceBase {
  StreamController<QuestionStreamResponse> _controller = StreamController.broadcast();


  void Function(String, String)? clientConnectedCallback;
  void Function(String)? clientDisconnectedCallback;
  void Function(AnswerRequest)? answerReceivedCallback;

  @override
  Stream<QuestionStreamResponse> getQuestionStream(ServiceCall call, QuestionRequest request) async* {
    _controller = StreamController<QuestionStreamResponse>.broadcast();
    yield* _controller.stream;
  }

  @override
  Future<ConnectResponse> connect(ServiceCall call, ConnectRequest request) async {
    var uuid = const Uuid().v4();
    clientConnectedCallback?.call((request).name, uuid);
    return ConnectResponse()..uuid = uuid;
  }

  @override
  Future<DisconnectResponse> disconnect(ServiceCall call, DisconnectRequest request) async {
    clientDisconnectedCallback?.call((request).uuid);
    _controller.close();
    return DisconnectResponse();
  }

  void updateQuestion(Question? question) {
    _controller.add(QuestionStreamResponse()
      ..question = '${question?.question}'
      ..questionType = questionTypesRev[question?.type ?? QuestionType.text.value]!);
  }

  @override
  Future<AnswerResponse> sendAnswer(ServiceCall call, AnswerRequest request) {
    answerReceivedCallback?.call(request);
    return Future.value(AnswerResponse());
  }
}
