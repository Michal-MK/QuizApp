import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Dialog, Icons;
import 'package:provider/provider.dart';
import 'package:quiz/model/db/question_type.dart';
import 'package:quiz/pages/server/home/home_pane_vm.dart';
import 'package:quiz/widgets/server/home/answer_content.dart';
import 'package:quiz/widgets/server/home/question_background.dart';

class QuestionPresenter extends StatelessWidget {
  const QuestionPresenter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomePaneVM vm = context.watch<HomePaneVM>();
    return QuestionBackground(
      vm: vm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var client in vm.connectedClients)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              client,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            if (vm.answers[vm.currentQIndex]?.map((e) => e.clientName).contains(client) ?? false)
                              const Text(
                                "Answered!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, bottom: 32.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Column(
                  children: [
                    Text("${vm.slide == 0 ? '-' : vm.slide}/${vm.questions.length * 2}"),
                    const Icon(FluentIcons.chevron_left, size: 48),
                  ],
                ),
                onPressed: () {
                  vm.slide--;
                },
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  vm.activeQuestion?.question ?? "Nebyla vybrána žádná otázka",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (vm.hintVisible)
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
                if (vm.activeQuestion!.image != null)
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
                AnswerContent(vm: vm),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: SizedBox(
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      questionTypes[vm.activeQuestion?.type ?? 0].name,
                      style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (vm.slide + 1 != vm.questions.length * 2)
                    IconButton(
                      icon: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(FluentIcons.chevron_right, size: 48),
                          Text("${vm.slide + 1 == vm.questions.length * 2 ? '-' : vm.slide + 2}/${vm.questions.length * 2}"),
                        ],
                      ),
                      onPressed: () {
                        vm.slide++;
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
