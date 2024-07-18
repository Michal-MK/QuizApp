import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:provider/provider.dart';
import 'package:quiz/ui/server/home/home_pane_vm.dart';
import 'package:quiz/ui/common/q_panel.dart';

class PreQuizContent extends StatelessWidget {
  const PreQuizContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Info", style: TextStyle(fontSize: 32)),
            const SizedBox(height: 32),
            const Text(
              "TODO Quiz name",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 52),
            ),
            const SizedBox(height: 32),
            const Text(
              "Questions: TODO",
              style: TextStyle(fontSize: 24),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: QPanel(
                child: IconButton(
                  onPressed: context.read<HomePaneVM>().startQuiz,
                  icon: const Icon(Icons.start, size: 48),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
