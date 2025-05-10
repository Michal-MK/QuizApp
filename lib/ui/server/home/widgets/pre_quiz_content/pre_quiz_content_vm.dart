import 'package:flutter/foundation.dart';
import 'package:quiz/model/client_status.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/quiz_repo.dart';
import 'package:quiz/services/question_rpc_service.dart';

class PreQuizContentVM extends ChangeNotifier {
  final QuizRepo quizRepo;

  final  QuestionRPCService questionService;
  List<ClientStatus> connectedClients = [
    ClientStatus(uuid: '1', name: 'Client 1'),
    ClientStatus(uuid: '2', name: 'Client 2'),
  ];

  Quiz? quiz;
  List<Question>? questions;

  Map<int, List<Question>> questionsByType = {};

  PreQuizContentVM(this.quizRepo, this.questionService);

  Future<void> load(int quizId) async {
    setupCallbacks();

    quiz = await quizRepo.getById(quizId);
    questions = await quizRepo.getLinkedQuestions(quizId);

    questionsByType = questions!.fold<Map<int, List<Question>>>(
      {},
      (acc, question) {
        if (!acc.containsKey(question.type)) {
          acc[question.type] = [];
        }
        acc[question.type]!.add(question);
        return acc;
      },
    );

    notifyListeners();
  }

    void setupCallbacks() {
    questionService.clientConnectedCallback = (name, id) {
      connectedClients.add(ClientStatus(uuid: id, name: name));
      notifyListeners();
    };
    questionService.clientDisconnectedCallback = (name) {
      connectedClients.remove(name);
      notifyListeners();
    };
  }
}