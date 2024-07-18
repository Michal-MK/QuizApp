import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/theme/theme.dart';

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
        gradient: RadialGradient(
          colors: [
            questionTypeColor(activeQuestion?.type ?? 0),
            Colors.white,
          ],
          center: Alignment.topRight,
          radius: 1,
        ),
      ),
      child: child,
    );
  }
}
