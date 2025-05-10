import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/definitions/answers.dart';
import 'package:quiz/model/client_status.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/question_repo.dart';
import 'package:quiz/services/question_rpc_service.dart';
import 'package:quiz/proto_gen/questions.pb.dart';

class QuizContentVM extends ChangeNotifier {
  QuizContentVM(this.db);

  final QuestionRepo db;
  late QuestionRPCService questionService;

  Question? get activeQuestion => questions.length > currentQIndex ? questions[currentQIndex] : null;
  Map<int, List<AnswerRequest>> answers = {};

  bool showHint = false;

  List<ClientStatus> connectedClients = [];

  int _slide = -1;
  set slide(int value) {
    if (value < 0 || value > questions.length) return;
    _slide = value;
    if (questions.isEmpty) return;
    markNoAnswer();
    currentQIndex = value % questions.length;
    questionService.updateQuestion(activeQuestion);

    handleUnanswered();

    notifyListeners();
  }

  int get slide => _slide;

  int currentQIndex = 0;

  Future reset() async {}

  Future init(QuestionRPCService questionService, List<ClientStatus> connectedClients) async {
    this.connectedClients = connectedClients;
    this.questionService = questionService;
    setupCallbacks();
    await reloadQuestions();
    slide = 0;
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
    questionService.answerReceivedCallback = (answer) {
      print('Answer: ${answer.answer} from ${answer.clientName}');
      addAnswer(answer);
      connectedClients.firstWhere((element) => element.name == answer.clientName).answered = true;
      notifyListeners();
    };
  }

  void addAnswer(AnswerRequest answer) {
    var currentAnswerList = answers[answer.questionId];

    currentAnswerList ??= answers[currentQIndex] = [];

    if (currentAnswerList.any((element) => element.clientUuid == answer.clientUuid && element.answer != NoAnswer)) {
      // Already answered, first answer counts
      return;
    }

    currentAnswerList.add(answer);
  }

  void markNoAnswer() {
    var currentAnswerList = answers[currentQIndex];

    currentAnswerList ??= answers[currentQIndex] = [];

    for (var client in connectedClients) {
      if (currentAnswerList.any((element) => element.clientUuid == client.uuid)) {
        continue;
      } else {
        currentAnswerList.add(
          AnswerRequest()..questionId = questions[currentQIndex].id!
                         ..clientUuid = client.uuid
                         ..clientName = client.name
                         ..answer = NoAnswer,
        );
      }
    }
  }

  void handleUnanswered() {
    var currentAnswerList = answers[currentQIndex];

    currentAnswerList ??= answers[currentQIndex] = [];

    for (var client in connectedClients) {
      if (currentAnswerList.any((element) => element.clientUuid == client.uuid && element.answer != NoAnswer)) {
        client.answered = true;
      } else {
        client.answered = false;
      }
    }
  }

  Future reloadQuestions({bool notify = true}) async {
    questions = await db.getQuestions();
    if (notify) {
      notifyListeners();
    }
  }

  String quizName = 'Quiz';
  List<Question> questions = [];

  void toggleHintVisibility() {
    showHint ^= true;
    notifyListeners();
  }

  Future<void> startQuiz(Quiz quiz) async {
    questionService.updateQuestion(activeQuestion);
  }
}
