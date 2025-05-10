import 'package:flutter/material.dart';
import 'package:quiz/comms/comms_client.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/proto_gen/questions.pb.dart';
import 'package:quiz/ui/client/question_host/question_widgets/question_base.dart';

class TextQuestion extends StatefulWidget {
  final Question question;
  final CommunicationClient client;

  const TextQuestion({
    required this.question,
    required this.client,
    super.key,
  });

  @override
  State<TextQuestion> createState() => _TextQuestionState();
}

class _TextQuestionState extends State<TextQuestion> {
  final TextEditingController _controller = TextEditingController();

  @override
  void didUpdateWidget(covariant TextQuestion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.question != oldWidget.question) {
      _controller.clear();
    }
  }

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
            ..questionId = widget.question.id!
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
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                ),
                enabledBorder: OutlineInputBorder(),
                labelText: 'Odpověď',
                floatingLabelAlignment: FloatingLabelAlignment.start,
                alignLabelWithHint: true,
              ),
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}
