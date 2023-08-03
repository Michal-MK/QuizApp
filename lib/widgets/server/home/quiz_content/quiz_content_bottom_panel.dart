import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/pages/server/home/home_pane_vm.dart';
import 'package:quiz/proto_gen/questions.pb.dart';
import 'package:quiz/widgets/panel.dart';

class QuizContentBottomPanel extends StatelessWidget {
  const QuizContentBottomPanel({
    super.key,
    required this.vm,
  });

  final HomePaneVM vm;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            SizedBox(
              height: vm.showAnswers ? 400 : 200,
              width: double.maxFinite,
              child: QPanel(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (vm.showClientStatus)
                        for (var client in vm.connectedClients)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Mica(
                                backgroundColor: client.color.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                                child: Column(
                                  children: [
                                    Text(client.name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 24)),
                                    Lottie.asset(
                                      "lib/assets/lottie/${client.answered ? 'ready' : 'thinking'}.json",
                                      height: 100,
                                      width: 100,
                                      reverse: client.answered ? false : Random().nextBool(),
                                      animate: true,
                                      repeat: !client.answered,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      if (vm.showAnswers)
                        for (var client in vm.connectedClients)
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                AnswerRequest? answer = vm.answers[vm.currentQIndex]!.cast<AnswerRequest?>().firstWhere((f) => f!.clientName == client.name, orElse: () => null);
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Mica(
                                    backgroundColor: client.color.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                    child: Column(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
