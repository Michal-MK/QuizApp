import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:quiz/proto_gen/questions.pb.dart';
import 'package:quiz/ui/server/home/home_pane_vm.dart';
import 'package:quiz/ui/server/home/widgets/answer_content/answers_content_vm.dart';
import 'package:quiz/ui/server/home/widgets/question_background.dart';
import 'package:quiz/ui/server/home/widgets/quiz_content/quiz_content_footer.dart';
import 'package:quiz/ui/server/home/widgets/quiz_content/quiz_content_header.dart';

class AnswersContent extends StatefulWidget {
  const AnswersContent({super.key});

  @override
  State<AnswersContent> createState() => _AnswersContentState();
}

class _AnswersContentState extends State<AnswersContent> {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AnswersContentVM>();
    return QuestionBackground(
      activeQuestion: vm.activeQuestion,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          QuizContentHeader(
            slide: vm.slide,
            activeQuestion: vm.activeQuestion,
            slideCount: vm.answers.length,
            backCallback: () {
              vm.slide--;
            },
          ),
          Text("Question: ${vm.activeQuestion?.question}", textAlign: TextAlign.center, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 16),
          Text("Answer: ${vm.activeQuestion?.answer}", textAlign: TextAlign.center, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 16),
          const Text("Answers: ", textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
          Expanded(
            child: Row(
              children: [
                for (var client in vm.connectedClients)
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        AnswerRequest? answer = vm.answers[vm.currentAIndex]!.cast<AnswerRequest?>().firstWhere((f) => f!.clientName == client.name, orElse: () => null);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Mica(
                            backgroundColor: client.color.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(client.name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 24)),
                                if (answer == null) ...[
                                  Expanded(child: Icon(FluentIcons.clear, color: Colors.red, size: 100)),
                                ] else ...[
                                  Text(answer.answer, textAlign: TextAlign.center),
                                ],
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
          QuizContentFooter(
            slide: vm.slide,
            slideCount: vm.answers.length,
            activeQuestion: vm.activeQuestion,
            forwardCallback: () {
              vm.slide++;
            },
            finishCallback: () {
              context.read<HomePaneVM>().reset();
            },
          ),
        ],
      ),
    );
  }
}
