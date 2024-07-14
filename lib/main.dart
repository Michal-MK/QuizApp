import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:nsd/nsd.dart';
import 'package:quiz/configuration/di.dart';
import 'package:quiz/pages/client/home/page/client_home_page.dart';
import 'package:quiz/pages/client/home/page/homepage.dart';
import 'package:quiz/pages/server/host.dart';
import 'package:quiz/model/question_service.dart';
import 'package:nsd/nsd.dart' as nsd;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz/services/localization_cubit.dart';

const int port = 50051;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DI.init(GetIt.instance);

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
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
    return BlocProvider<LocalizationCubit>(
      create: (context) => DI.get(),
      child: FluentApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: ServerHome(service: service),
      ),
    );
  }
}

class ClientApp extends StatelessWidget {
  const ClientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalizationCubit>(
      create: (context) => DI.get(),
      child: BlocBuilder<LocalizationCubit, Locale>(
        builder: (context, state) {
          return MaterialApp(
            locale: state,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            home: const ClientHomePage(),
          );
        },
      ),
    );
  }
}
