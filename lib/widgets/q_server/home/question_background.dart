import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/widgets/q_server/home/home_pane_vm.dart';

class QuestionBackground extends StatelessWidget {
  final HomePaneVM vm;
  final Widget child;

  const QuestionBackground({
    required this.vm,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      child: child,
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
