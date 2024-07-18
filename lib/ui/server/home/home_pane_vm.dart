import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/model/client_status.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/question.dart';
import 'package:quiz/model/question_service.dart';
import 'package:quiz/proto_gen/questions.pb.dart';

class HomePaneVM extends ChangeNotifier {

  final QuestionRepo db;
  final QuestionService questionService;

  HomePaneVM(this.questionService, this.db) {
    setupCallbacks();
  }

  bool showClientStatus = true;
  bool showAnswers = false;
  bool showHint = false;

  bool preQuiz = true;

  Question? get activeQuestion => questions.length > currentQIndex ? questions[currentQIndex] : null;
  Map<int, List<AnswerRequest>> answers = {};

  List<ClientStatus> connectedClients = [
    ClientStatus(name: 'Dummy Client 1'),
  ];

  int _slide = -1;
  set slide(int value) {
    if (value < 0 || value > 2 * questions.length) return;
    _slide = value;
    showAnswers = value >= questions.length;
    showClientStatus = !showAnswers;
    currentQIndex = value % questions.length;

    if (!answers.containsKey(currentQIndex)) answers[currentQIndex] = [];
    questionService.updateQuestion(activeQuestion);
    for (var client in connectedClients) {
      client.answered = false;
    }
    notifyListeners();
  }

  int get slide => _slide;

  int currentQIndex = 0;

  void setupCallbacks() {
    questionService.clientConnectedCallback = (name, id) {
      connectedClients.add(ClientStatus(name: name));
      notifyListeners();
    };
    questionService.clientDisconnectedCallback = (name) {
      connectedClients.remove(name);
      notifyListeners();
    };
    questionService.answerReceivedCallback = (answer) {
      print('Answer: ${answer.answer} from ${answer.clientName}');
      answers[currentQIndex]!.add(answer);
      connectedClients.firstWhere((element) => element.name == answer.clientName).answered = true;
      notifyListeners();
    };
  }


  Future reloadQuestions({bool notify = true}) async {
    var loaded = await db.getQuestions();
    questions = loaded;
    preQuiz = false;
    if (notify) {
      notifyListeners();
    }
  }

  String quizName = 'Quiz';

  List<Question> questions = [];

  void toggleHintVisibility() {
    showHint ^= true;
    notifyListeners();;
  }

  Future reset() async {
    await reloadQuestions(notify: false);
    slide = 0;
    preQuiz = true;
    answers.clear();
    notifyListeners();
  }
}
