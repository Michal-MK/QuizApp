import 'package:flutter/material.dart';
import 'package:quiz/comms/comms_client.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/proto_gen/questions.pb.dart';
import 'package:quiz/ui/client/question_host/question_widgets/question_base.dart';

class TrueFalseQuestion extends StatefulWidget {
  final Question question;
  final CommunicationClient client;

  const TrueFalseQuestion({
    required this.question,
    required this.client,
    super.key, 
  });

  @override
  State<TrueFalseQuestion> createState() => _TrueFalseQuestionState();
}

class _TrueFalseQuestionState extends State<TrueFalseQuestion> {
  bool? value;

  @override
  Widget build(BuildContext context) {
    return QuestionBase(
      question: widget.question,
      client: widget.client,
      onSend: () {
        if (value == null) {
          return Future.error('No value selected');
        }
        return Future.value(
          AnswerRequest()
            ..answer = value.toString()
            ..questionId = widget.question.id!
            ..clientUuid = widget.client.uuid
            ..clientName = widget.client.clientName,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    value = true;
                  });
                },
                child: Text(
                  'Ano',
                  style: TextStyle(color: Colors.white, fontSize: 48),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    value = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Ne',
                  style: TextStyle(color: Colors.white, fontSize: 48),
                ),
              ),
            ),
            Text(
              value == true ? "Ano" : value == false ? "Ne" : 'Nevybráno',
              style: TextStyle(color: value == true ? Colors.green : value == false ? Colors.red : Colors.black, fontSize: 36),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
