import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/widgets/server/add_question/contents/base_content.dart';

class NumberQuestionContent extends BaseQuestionContent {
  const NumberQuestionContent({
    required super.vm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextBox(
      controller: vm.numberAnswerController,
      placeholder: 'The numeric answer',
      maxLines: 1,
      keyboardType: TextInputType.number,
    );
  }
}
