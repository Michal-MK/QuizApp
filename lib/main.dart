import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz/configuration/di.dart';
import 'package:quiz/configuration/nsd.dart';
import 'package:quiz/ui/client/home/page/client_home_page.dart';
import 'package:quiz/ui/server/host.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz/services/localization_cubit.dart';

const int port = 50051;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DI.init(GetIt.instance);

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await NSD.init(port);
    runApp(const ServerApp());
  } else {
    runApp(const ClientApp());
  }
}

class ServerApp extends StatelessWidget {
  const ServerApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalizationCubit>(
      create: (context) => DI.get(),
      child: const FluentApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: ServerHome(),
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
