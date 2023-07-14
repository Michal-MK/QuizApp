import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/question.dart';
import 'package:quiz/model/question_service.dart';
import 'package:quiz/proto_gen/questions.pb.dart';

class HomePaneVM extends ChangeNotifier {
  Question? get activeQuestion => questions.length > _currentQIndex ? questions[_currentQIndex] : null;

  List<String> connectedClients = [];

  Map<int, List<AnswerRequest>> answers = {};

  bool hintVisible = false;

  int _currentQIndex = 0;
  set currentQIndex(int value) {
    if (value < 0 || value >= questions.length) return;
    _currentQIndex = value;
    notifyListeners();
    if (!answers.containsKey(_currentQIndex)) answers[_currentQIndex] = [];
    service.updateQuestion(activeQuestion);
  }

  int get currentQIndex => _currentQIndex;

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
      answers[_currentQIndex]!.add(answer);
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
