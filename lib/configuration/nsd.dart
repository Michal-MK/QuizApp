import 'package:grpc/grpc.dart';
import 'package:nsd/nsd.dart' as nsd;
import 'package:quiz/configuration/di.dart';
import 'package:quiz/services/question_rpc_service.dart';

class NSD {
  static Future<Server?> init(int port) async {
    try {
      await nsd.register(
        nsd.Service(name: 'Quiz App Server', type: '_rpc._tcp', port: port),
      );
    } catch (e) {
      print('Error registering service: $e');
      return null;
    }

    final questionService = DI.get<QuestionRPCService>();
    try {
      Server server = Server.create(services: [
        questionService,
      ]);
      server.serve(port: port, security: null);
      DI.instance.registerSingleton(server);
      
      return server;
    } catch (e) {
      print('Error creating server: $e');
      return null;
    }
  }
}
