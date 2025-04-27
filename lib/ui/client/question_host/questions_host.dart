import 'package:flutter/material.dart';
import 'package:nsd/nsd.dart';
import 'package:quiz/comms/comms_client.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/ui/client/question_host/question_widgets/location_question.dart';
import 'package:quiz/ui/client/question_host/question_widgets/multichoice_question.dart';
import 'package:quiz/ui/client/question_host/question_widgets/number_question.dart';
import 'package:quiz/ui/client/question_host/question_widgets/text_question.dart';
import 'package:quiz/ui/client/question_host/question_widgets/truefalse_question.dart';

class QuestionsHost extends StatefulWidget {
  final Service discovery;
  final String name;

  const QuestionsHost({
    required this.discovery,
    required this.name,
    super.key,
  });

  @override
  State<QuestionsHost> createState() => _QuestionsHostState();
}

class _QuestionsHostState extends State<QuestionsHost> with WidgetsBindingObserver {
  late final CommunicationClient client;

  Stream<Question>? questionStream;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    client = CommunicationClient(widget.discovery, clientName: widget.name);
    client.connect().then((value) {
      setState(() {
        questionStream = client.questions();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      client.disconnect();
    }
    if (state == AppLifecycleState.resumed) {
      setState(() {
        CommunicationClient(widget.discovery, clientName: widget.name);
        questionStream = client.questions();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<Question>(
        stream: questionStream,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text("Waiting..."),
            );
          }
          return buildQuestion(snapshot.data!, client);
        },
      ),
    );
  }

  Widget buildQuestion(Question question, CommunicationClient client) {
    switch (question.type) {
      case 0:
        return TextQuestion(question: question, client: client);
      case 1:
        return NumberQuestion(question: question, client: client);
      case 2:
        return MultichoiceQuestion(question: question, client: client);
      case 3:
        return TrueFalseQuestion(question: question, client: client);
      case 4:
        return LocationQuestion(question: question, client: client);
      default:
        return Center(
          child: Text("Unknown question type: ${question.type}"),
        );
    }
  }
}
