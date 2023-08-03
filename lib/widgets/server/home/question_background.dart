import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:quiz/pages/server/home/home_pane_vm.dart';
import 'package:quiz/theme/theme.dart';

class QuestionBackground extends StatelessWidget {
  final Widget child;

  const QuestionBackground({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePaneVM>(
      builder: (context, vm, _) {
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
      },
    );
  }
}
