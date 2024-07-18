import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/ui/server/add_question/widgets/contents/base_content.dart';

class TrueFalseQuestionContent extends BaseQuestionContent {
  const TrueFalseQuestionContent({
    required super.vm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('False'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ToggleSwitch(checked: vm.boolQuestionAnswer, onChanged: vm.boolQuestionAnswerChanged),
        ),
        Text('True'),
      ],
    ));
  }
}
