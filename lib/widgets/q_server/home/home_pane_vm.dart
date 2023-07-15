import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/question.dart';
import 'package:quiz/model/question_service.dart';
import 'package:quiz/proto_gen/questions.pb.dart';

class HomePaneVM extends ChangeNotifier {
  Question? get activeQuestion => questions.length > currentQIndex ? questions[currentQIndex] : null;

  List<String> connectedClients = [];

  Map<int, List<AnswerRequest>> answers = {};

  bool hintVisible = false;

  int _slide = -1;
  set slide(int value) {
    if (value < 0 || value >= 2 * questions.length) return;
    _slide = value;
    withAnswers = value >= questions.length;
    _currentQIndex = value % questions.length;

    if (!answers.containsKey(currentQIndex)) answers[currentQIndex] = [];
    service.updateQuestion(activeQuestion);
    notifyListeners();
  }

  int get slide => _slide;

  int _currentQIndex = 0;
  int get currentQIndex => _currentQIndex;

  bool withAnswers = false;

  QuestionService get service => _service;
  set service(QuestionService value) {
    _service = value;
    _service.clientConnectedCallback = (name, id) {
      connectedClients.add(name);
      notifyListeners();
    };
    _service.clientDisconnectedCallback = (name) {
      connectedClients.remove(name);
      notifyListeners();
    };
    _service.answerReceivedCallback = (answer) {
      print('Answer: ${answer.answer} from ${answer.clientName}');
      answers[currentQIndex]!.add(answer);
      notifyListeners();
    };
  }

  late QuestionService _service;

  bool preQuiz = true;

  Future reloadQuestions() async {
    var loaded = await QuestionEx.getQuestions();
    questions = loaded;
    preQuiz = false;
    notifyListeners();
  }

  List<Question> questions = [];

  void toggleHintVisibility() {
    hintVisible ^= true;
    notifyListeners();
  }
}
