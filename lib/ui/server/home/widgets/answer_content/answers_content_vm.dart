import 'package:flutter/foundation.dart';
import 'package:quiz/model/client_status.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/proto_gen/questions.pb.dart';

class AnswersContentVM extends ChangeNotifier {
  List<ClientStatus> connectedClients = [];
  List<Question> questions = [];
  Map<int, List<AnswerRequest>> answers = {};

  int currentAIndex = 0;
  Question? get activeQuestion => questions.length > currentAIndex ? questions[currentAIndex] : null;

  int _slide = -1;
  set slide(int value) {
    if (value < 0 || value > answers.length) return;
    _slide = value;
    currentAIndex = value % answers.length;

    if (!answers.containsKey(currentAIndex)) answers[currentAIndex] = [];
    notifyListeners();
  }

  int get slide => _slide;

  Future<void> init(List<Question> questions, Map<int, List<AnswerRequest>> answers, List<ClientStatus> clients) async {
    this.answers = answers;
    this.questions = questions;
    connectedClients = clients;
    slide = 0;
  }
}
