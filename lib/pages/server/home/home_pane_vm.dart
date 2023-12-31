import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/model/client_status.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/question.dart';
import 'package:quiz/model/question_service.dart';
import 'package:quiz/proto_gen/questions.pb.dart';

class HomePaneVM extends ChangeNotifier {
  bool showClientStatus = true;
  bool showAnswers = false;

  Question? get activeQuestion => questions.length > currentQIndex ? questions[currentQIndex] : null;

  List<ClientStatus> connectedClients = [
    ClientStatus(name: 'Dummy Client 1'),
  ];

  Map<int, List<AnswerRequest>> answers = {};

  bool hintVisible = false;

  int _slide = -1;
  set slide(int value) {
    if (value < 0 || value > 2 * questions.length) return;
    _slide = value;
    showAnswers = value >= questions.length;
    showClientStatus = !showAnswers;
    _currentQIndex = value % questions.length;

    if (!answers.containsKey(currentQIndex)) answers[currentQIndex] = [];
    service.updateQuestion(activeQuestion);
    connectedClients.forEach((element) {
      element.answered = false;
    });
    notify();
  }

  int get slide => _slide;

  int _currentQIndex = 0;
  int get currentQIndex => _currentQIndex;

  QuestionService get service => _service;
  set service(QuestionService value) {
    _service = value;
    _service.clientConnectedCallback = (name, id) {
      connectedClients.add(ClientStatus(name: name));
      notify();
    };
    _service.clientDisconnectedCallback = (name) {
      connectedClients.remove(name);
      notify();
    };
    _service.answerReceivedCallback = (answer) {
      print('Answer: ${answer.answer} from ${answer.clientName}');
      answers[currentQIndex]!.add(answer);
      connectedClients.firstWhere((element) => element.name == answer.clientName).answered = true;
      notify();
    };
  }

  late QuestionService _service;

  bool preQuiz = true;

  Future reloadQuestions({bool notify = true}) async {
    var loaded = await QuestionEx.getQuestions();
    questions = loaded;
    preQuiz = false;
    if (notify) {
      this.notify();
    }
  }

  String quizName = 'Quiz';

  List<Question> questions = [];

  void toggleHintVisibility() {
    hintVisible ^= true;
    notify();
  }

  void notify() {
    notifyListeners();
  }

  Future reset() async {
    await reloadQuestions(notify: false);
    slide = 0;
    preQuiz = true;
    answers.clear();
    notify();
  }
}
