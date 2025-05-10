import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/ui/common/q_client_panel.dart';
import 'package:quiz/ui/server/home/widgets/quiz_content/quiz_content_vm.dart';

class QuizContentBottomPanel extends StatelessWidget {
  const QuizContentBottomPanel({
    super.key,
    required this.vm,
  });

  final QuizContentVM vm;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Expanded(child: SizedBox()),
            SizedBox(
              height: 200,
              width: double.maxFinite,
              child: QClientPanel(clients: vm.connectedClients),
            ),
          ],
        ),
      ),
    );
  }
}
