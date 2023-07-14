import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/proto_gen/questions.pbgrpc.dart';
import 'package:nsd/nsd.dart' as nsd;

class CommunicationClient extends ChangeNotifier {
  final String clientName;
  late QuestionServiceClient client;
  late String uuid;

  Question? current;

  late ResponseStream<QuestionStreamResponse> questionStream;

  CommunicationClient(
    nsd.Service discovery, {
    required this.clientName,
  }) {
    print("Connecting to ${discovery.host}:${discovery.port}");
    client = QuestionServiceClient(
      ClientChannel(
        discovery.host.toString(),
        port: discovery.port!,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      ),
    );
  }

  Stream<Question> questions() async* {
    questionStream = client.getQuestionStream(QuestionRequest());
    await for (var question in questionStream) {
      current = Question(
        id: question.id,
        author: question.author,
        question: question.question,
        answer: question.answer,
        category: question.category,
        hint: question.hint,
        type: question.questionType.value,
        jeopardyWeight: question.jeopardyWeight,
      );
      yield current!;
    }
  }

  Future connect() async {
    var response = await client.connect(ConnectRequest()..name = clientName);
    uuid = response.uuid;
  }

  void disconnect() {
    questionStream.cancel();
    client.disconnect(DisconnectRequest()..uuid = uuid);
  }

  void sendAnswer(AnswerRequest answer) {
    client.sendAnswer(answer);
  }
}
