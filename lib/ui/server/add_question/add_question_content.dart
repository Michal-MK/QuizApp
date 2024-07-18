import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:quiz/model/db/question_type.dart';
import 'package:quiz/ui/server/add_question/add_question_vm.dart';
import 'package:quiz/ui/server/add_question/widgets/contents/location_question_content.dart';
import 'package:quiz/ui/server/add_question/widgets/contents/multichoice_question_content.dart';
import 'package:quiz/ui/server/add_question/widgets/contents/number_question_content.dart';
import 'package:quiz/ui/server/add_question/widgets/contents/text_question_content.dart';
import 'package:quiz/ui/server/add_question/widgets/contents/truefalse_question_content.dart';
import 'package:quiz/ui/server/add_question/widgets/question_input_combo.dart';
import 'package:quiz/ui/server/add_question/widgets/question_input_entry.dart';

class AddQuestionContent extends StatefulWidget {
  const AddQuestionContent({super.key});

  @override
  State<AddQuestionContent> createState() => _AddQuestionContentState();
}

class _AddQuestionContentState extends State<AddQuestionContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddQuestionVM>(
      builder: (context, vm, _) {
        return SingleChildScrollView(
          child: Column(
            children: [
              QuestionInputEntry(
                title: "Question",
                description: "The primary text to be rendered.",
                controller: vm.questionController,
              ),
              QuestionInputEntry(
                title: "Hint",
                description: "[OPTIONAL] Hint to display to the user on request.",
                controller: vm.hintController,
              ),
              QuestionInputEntry(
                title: "Author",
                description: "[OPTIONAL] Author of the question.",
                controller: vm.authorController,
              ),
              QuestionInputEntry(
                title: "Jeopardy Weight",
                description: "Weight for the game Jeopardy.",
                controller: vm.jeopardyWeightController,
                numeric: true,
              ),
              QuestionInputEntry(
                title: "Category",
                description: "Weight for the game Jeopardy.",
                controller: vm.categoryController,
              ),
              QuestionInputCombo(
                title: "Question Type",
                description: "The type of question.",
                onChange: vm.questionTypeChanged,
                items: vm.questionTypesList,
                value: vm.selectedQuestionType,
              ),
              renderQuestionTypeContent(vm.selectedQuestionType, vm),
              const SizedBox(height: 8.0),
              SizedBox(
                width: 120,
                height: 32,
                child: Button(
                  onPressed: vm.saveQuestion,
                  child: Center(child: const Text('Save')),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget renderQuestionTypeContent(int selectedQuestionType, AddQuestionVM vm) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[40],
        ),
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.grey[20],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text("${questionTypes[selectedQuestionType].name} Answer", style: const TextStyle(fontSize: 18.0)),
          ),
          childOfQuestionType(selectedQuestionType, vm),
        ],
      ),
    ),
  );
}

Widget childOfQuestionType(int selectedQuestionType, AddQuestionVM vm) {
  switch (selectedQuestionType) {
    case 0:
      return TextQuestionContent(vm: vm);
    case 1:
      return NumberQuestionContent(vm: vm);
    case 2:
      return MultiChoiceQuestionContent(vm: vm);
    case 3:
      return TrueFalseQuestionContent(vm: vm);
    case 4:
      return LocationQuestionContent(vm: vm);
  }
  return Container();
}