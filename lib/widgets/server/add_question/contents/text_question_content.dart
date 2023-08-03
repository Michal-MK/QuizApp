
import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/widgets/server/add_question/contents/base_content.dart';

class TextQuestionContent extends BaseQuestionContent {
  const TextQuestionContent({
    required super.vm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextBox(
      controller: vm.textAnswerController,
      placeholder: 'Enter your answer here',
      maxLines: 3,
    );
  }
}