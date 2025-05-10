import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/ui/common/gradients.dart';

class QuestionBackground extends StatelessWidget {
  final Widget child;
  final Question? activeQuestion;

  const QuestionBackground({
    required this.child,
    required this.activeQuestion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: questionGradient(activeQuestion?.type ?? 0),
      ),
      child: child,
    );
  }
}
