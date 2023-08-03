import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quiz/model/comms_client.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/proto_gen/questions.pb.dart';
import 'package:quiz/theme/theme.dart';

class QuestionBase extends StatefulWidget {
  final Widget child;
  final Question question;
  final Future<AnswerRequest> Function() onSend;
  final CommunicationClient client;

  const QuestionBase({
    required this.child,
    required this.question,
    required this.onSend,
    required this.client,
    super.key,
  });

  @override
  State<QuestionBase> createState() => _QuestionBaseState();
}

class _QuestionBaseState extends State<QuestionBase> {

  MaterialStatesController controller = MaterialStatesController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: questionTypeColor(widget.question.type).withAlpha(40),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: AutoSizeText(
                    widget.question.question,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    maxFontSize: 48,
                    minFontSize: 18,
                    maxLines: 3,
                  ),
                ),
              ),
            ),
            Expanded(
              child: widget.child,
            ),
            SizedBox(
              width: 200,
              height: 42,
              child: ElevatedButton(
                onPressed: () async {
                  controller.update(MaterialState.disabled, true);
                  widget.client.sendAnswer(await widget.onSend());
                },
                statesController: controller,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: questionTypeColor(widget.question.type),
                ),
                child: const Text('Odeslat'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
