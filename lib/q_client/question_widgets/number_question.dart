import 'package:flutter/material.dart';
import 'package:quiz/model/comms_client.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/decimal_input_formatter.dart';
import 'package:quiz/proto_gen/questions.pb.dart';
import 'package:quiz/q_client/question_widgets/question_base.dart';

class NumberQuestion extends StatefulWidget {
  final Question question;
  final CommunicationClient client;

  const NumberQuestion({
    required this.question,
     required this.client,
    super.key,
  });

  @override
  State<NumberQuestion> createState() => NumberQuestionState();
}

class NumberQuestionState extends State<NumberQuestion> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return QuestionBase(
      question: widget.question,
      client: widget.client,
      onSend: () {
        if (_controller.text.isEmpty) {
          return Future.error('No text entered');
        }
        return Future.value(
          AnswerRequest()
            ..answer = _controller.text
            ..questionId = widget.question.id
            ..clientUuid = widget.client.uuid
            ..clientName = widget.client.clientName,
        );
      },
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            height: 128,
            child: TextField(
              controller: _controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Odpověď', floatingLabelAlignment: FloatingLabelAlignment.start, alignLabelWithHint: true),
              inputFormatters: [
                DecimalNumberFormatter(
                  allowSign: true,
                )
              ],
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}
