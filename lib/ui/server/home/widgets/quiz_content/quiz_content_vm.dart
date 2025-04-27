import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/model/client_status.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/question_repo.dart';
import 'package:quiz/services/question_rpc_service.dart';
import 'package:quiz/proto_gen/questions.pb.dart';

class QuizContentVM extends ChangeNotifier {

  QuizContentVM(this.db, this.questionService) {
    setupCallbacks();
  }

  final QuestionRepo db;
  final QuestionRPCService questionService;
  
  Question? get activeQuestion => questions.length > currentQIndex ? questions[currentQIndex] : null;
  Map<int, List<AnswerRequest>> answers = {};

    bool showClientStatus = true;
  bool showAnswers = false;
  bool showHint = false;

  List<ClientStatus> connectedClients = [
    ClientStatus(name: 'Dummy Client 1'),
    ClientStatus(name: 'Dummy Client 2'),
    ClientStatus(name: 'Dummy Client 3'),
    ClientStatus(name: 'Dummy Client 4'),
    ClientStatus(name: 'Dummy Client 5'),
  ];

  int _slide = -1;
  set slide(int value) {
    if (value < 0 || value > 2 * questions.length) return;
    _slide = value;
    showAnswers = value >= questions.length;
    showClientStatus = !showAnswers;
    if(questions.isEmpty) return;
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

  Future reset() async {
  
  }

  Future init() async {
    await reloadQuestions();
    slide = 0;
  }

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
    questions = await db.getQuestions();
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

  Future<void> startQuiz(Quiz quiz) async {
    
  }

}