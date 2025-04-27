import 'package:flutter/material.dart';
import 'package:quiz/comms/comms_client.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/ui/client/question_host/question_widgets/question_base.dart';

class MultichoiceQuestion extends StatefulWidget {
  final Question question;
  final CommunicationClient client;

  const MultichoiceQuestion({
    required this.question,
    required this.client,
    super.key, 
  });

  @override
  State<MultichoiceQuestion> createState() => _MultichoiceQuestionState();
}

class _MultichoiceQuestionState extends State<MultichoiceQuestion> {
  @override
  Widget build(BuildContext context) {
    return QuestionBase(
      child: Placeholder(),
      onSend: () {
        return Future.error('Not implemented');
      },
      question: widget.question,
      client: widget.client,
    );
  }
}
