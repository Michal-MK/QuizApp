import 'package:flutter/material.dart';
import 'package:quiz/ui/server/home/widgets/quiz_content/quiz_content_vm.dart';

class QuizContentHeader extends StatelessWidget {
  const QuizContentHeader({
    super.key,
    required this.vm,
  });

  final QuizContentVM vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 32.0, bottom: 32.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: IconButton.filled(
          icon: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${vm.slide == 0 ? '-' : vm.slide}/${vm.questions.length * 2}"),
              const Icon(Icons.arrow_back_ios, size: 48),
            ],
          ),
          onPressed: () {
            vm.slide--;
          },
        ),
      ),
    );
  }
}

