import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/widgets/q_server/add_question/add_question_vm.dart';

abstract class BaseQuestionContent extends StatelessWidget {
  final AddQuestionVM vm;

  const BaseQuestionContent({
    required this.vm,
    super.key,
  });
}