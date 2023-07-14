import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:quiz/widgets/q_server/home/home_pane_vm.dart';


class PreQuizContent extends StatelessWidget {

  final HomePaneVM homePaneModel;

  const PreQuizContent({
    required this.homePaneModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("data"),
          Button(
            onPressed: homePaneModel.reloadQuestions,
            child: const Icon(Icons.start),
          ),
        ],
      ),
    );
  }
}
