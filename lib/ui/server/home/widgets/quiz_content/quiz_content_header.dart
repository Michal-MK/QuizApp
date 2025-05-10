import 'package:flutter/material.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/theme/theme.dart';

class QuizContentHeader extends StatelessWidget {
  const QuizContentHeader({
    super.key,
    required this.slide,
    required this.slideCount,
    required this.activeQuestion,
    required this.backCallback,
  });

  final int slide;
  final int slideCount;
  final Question? activeQuestion;
  final VoidCallback backCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 32.0, bottom: 32.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: IconButton.outlined(
          style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(color: questionTypeColor(activeQuestion?.type ?? 0))),
          ),
          icon: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${slide == 0 ? '-' : slide}/$slideCount"),
              const Icon(Icons.arrow_back, size: 48),
            ],
          ),
          onPressed: backCallback,
        ),
      ),
    );
  }
}

