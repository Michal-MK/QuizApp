import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/configuration/di.dart';
import 'package:quiz/pages/client/home/cubit/home_cubit.dart';
import 'package:quiz/pages/client/home/widgets/client_home_page_content.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => DI.get()..discoverServers(),
      child: const ClientHomePageContent(),
    );
  }
}
