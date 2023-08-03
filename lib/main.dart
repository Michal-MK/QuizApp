import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:grpc/grpc.dart';
import 'package:nsd/nsd.dart';
import 'package:quiz/pages/client/home.dart';
import 'package:quiz/pages/server/host.dart';
import 'package:quiz/model/question_service.dart';
import 'package:nsd/nsd.dart' as nsd;

const int port = 50051;

Future main() async {
  if (Platform.isWindows) {
    WidgetsFlutterBinding.ensureInitialized();
    await register(
      const nsd.Service(name: 'Quiz Server', type: '_rpc._tcp', port: port),
    );

    QuestionService service = QuestionService();
    Server server = Server.create(services: [service]);
    server.serve(port: port, security: null);
    runApp(ServerApp(service: service));
  } else {
    runApp(const ClientApp());
  }
}

class ServerApp extends StatelessWidget {

  final QuestionService service;

  const ServerApp({
    required this.service,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      home: ServerHome(service: service),
    );
  }
}

class ClientApp extends StatelessWidget {
  const ClientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      home: ClientHome(),
    );
  }
}
