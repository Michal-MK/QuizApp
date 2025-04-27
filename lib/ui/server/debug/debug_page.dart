import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/ui/server/debug/debug_vm.dart';

class DebugPage extends StatefulWidget {
  const DebugPage({super.key});

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Data"),
        Button(
          child: Text("Seed data"),
          onPressed: () async {
            await context.read<DebugVM>().seedData();
          },
        ),
        Button(
          child: Text("Delete data"),
          onPressed: () async {
            await context.read<DebugVM>().clearData();
          },
        ),
      ],
    );
  }
}
