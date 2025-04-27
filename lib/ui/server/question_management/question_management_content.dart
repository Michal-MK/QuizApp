import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/ui/server/question_management/question_management_vm.dart';

class QuestionManagementContent extends StatelessWidget {
  const QuestionManagementContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionManagementVM>(builder: (context, vm, _) {
      return DataTable(
        columnSpacing: 16,
        columns: const [
          DataColumn(label: Text("Question")),
          DataColumn(label: Text("Hint")),
          DataColumn(label: Text("Answer")),
          DataColumn(label: Text("Author")),
          DataColumn(label: Text("Jeopardy Weight"), numeric: true),
          DataColumn(label: Text("Type"), numeric: true),
          DataColumn(label: Text("Categories")),
          DataColumn(label: Text("Actions", textAlign: TextAlign.center)),
        ],

        rows: vm.questions
            .map(
              (m) => DataRow(
                cells: [
                  DataCell(Text(m.question)),
                  DataCell(Text(m.hint ?? "")),
                  DataCell(Text("**********")),
                  DataCell(Text(m.author)),
                  DataCell(Text(m.jeopardyWeight.toString())),
                  DataCell(Text(m.type.toString())),
                  DataCell(Text(m.category)),
                  DataCell(Row(
                    children: [
                      Button(
                        child: const Icon(FluentIcons.edit),
                        onPressed: () => vm.editQuestion(m.id!),
                      ),
                      const SizedBox(width: 8),
                      Button(
                        child: const Icon(FluentIcons.delete),
                        onPressed: () => vm.deleteQuestion(m.id!),
                      ),
                    ],
                  )),
                ],
              ),
            )
            .toList(),
      );
    });
  }
}
