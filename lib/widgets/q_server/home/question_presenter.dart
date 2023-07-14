import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:provider/provider.dart';
import 'package:quiz/model/db/question_type.dart';
import 'package:quiz/widgets/q_server/home/home_pane_vm.dart';

class QuestionPresenter extends StatelessWidget {
  const QuestionPresenter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomePaneVM vm = context.watch<HomePaneVM>();
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            questionTypeColor(vm.activeQuestion?.type ?? 0),
            Colors.white,
          ],
          center: Alignment.topRight,
          radius: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var client in vm.connectedClients)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              client,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            if (vm.answers[vm.currentQIndex]?.map((e) => e.clientName).contains(client) ?? false)
                              const Text(
                                "Answered!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(FluentIcons.chevron_left, size: 48),
                onPressed: () {
                  vm.currentQIndex--;
                },
              ),
            ),
          ),
          Text(
            vm.activeQuestion?.question ?? "No question selected",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (vm.hintVisible)
            Column(
              children: [
                Text(
                  vm.activeQuestion?.hint ?? "No hints",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),
                Tooltip(
                  message: "Hide hint",
                  child: Button(
                    onPressed: vm.toggleHintVisibility,
                    child: const Icon(Icons.visibility_off),
                  ),
                ),
              ],
            )
          else
            Center(
              child: Tooltip(
                message: "Show hint",
                child: Button(
                  onPressed: vm.toggleHintVisibility,
                  child: const Icon(Icons.visibility),
                ),
              ),
            ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [
                Text(
                  questionTypes[vm.activeQuestion?.type ?? 0].name,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(FluentIcons.chevron_right, size: 48),
                  onPressed: () {
                    vm.currentQIndex++;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color questionTypeColor(int questionType) {
    switch (questionType) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.green;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.purple;
      case 4:
        return Colors.red;
      default:
        return Colors.yellow;
    }
  }
}
