import 'package:flutter/material.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/db/question_type.dart';
import 'package:quiz/theme/theme.dart';

class QuizContentFooter extends StatelessWidget {
  const QuizContentFooter({
    super.key,
    required this.slide,
    required this.slideCount,
    required this.activeQuestion,
    required this.forwardCallback,
    required this.finishCallback,
  });

  final int slide;
  final int slideCount;
  final Question? activeQuestion;
  final VoidCallback forwardCallback;
  final VoidCallback finishCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: SizedBox(
        height: 84,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                questionTypes[activeQuestion?.type ?? 0].name,
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            if (slide + 1 != slideCount)
              IconButton.outlined(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(color: questionTypeColor(activeQuestion?.type ?? 0))),
                ),
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_forward, size: 48),
                    Text("${slide + 1 == slideCount ? '-' : slide + 2}/$slideCount"),
                  ],
                ),
                onPressed: forwardCallback
              )
              else 
                IconButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide(color: questionTypeColor(activeQuestion?.type ?? 0))),
                  ),
                  icon: const Icon(Icons.flag_rounded, size: 48),
                  color: questionTypeColor(activeQuestion?.type ?? 0),
                  onPressed: finishCallback,
                ),
          ],
        ),
      ),
    );
  }
}
