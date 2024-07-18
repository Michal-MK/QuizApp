import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Dialog, Icons;
import 'package:quiz/ui/server/home/home_pane_vm.dart';
import 'package:quiz/ui/server/home/widgets/quiz_content/quiz_content_bottom_panel.dart';

class QuizContentBody extends StatelessWidget {
  const QuizContentBody({
    super.key,
    required this.vm,
  });

  final HomePaneVM vm;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          vm.activeQuestion?.question ?? "Nebyla vybrána žádná otázka",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (vm.showHint)
          Column(
            children: [
              Button(
                onPressed: vm.toggleHintVisibility,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.visibility_off),
                    SizedBox(width: 8.0),
                    Text("Nápověda"),
                  ],
                ),
              ),
              Text(
                vm.activeQuestion?.hint ?? "Bez nápovědy",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
              ),
            ],
          )
        else
          Center(
            child: Button(
              onPressed: vm.toggleHintVisibility,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.visibility),
                  SizedBox(width: 8.0),
                  Text("Nápověda"),
                ],
              ),
            ),
          ),
        if (vm.activeQuestion!.image != null && vm.activeQuestion!.image!.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 32.0),
            child: SizedBox(
              height: 64,
              child: Button(
                onPressed: () {
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) => Dialog(child: Image.file(File(vm.activeQuestion!.image!))),
                  );
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.image, size: 48),
                    SizedBox(width: 8.0),
                    Text("Obrázek", style: TextStyle(fontSize: 24)),
                  ],
                ),
              ),
            ),
          ),
        QuizContentBottomPanel(vm: vm),
      ],
    );
  }
}
