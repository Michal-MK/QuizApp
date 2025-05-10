import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/ui/server/settings/settings_vm.dart';

class SettingsContent extends StatefulWidget {
  const SettingsContent({super.key});

  @override
  State<SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SettingsVM>();

    return Column(
      children: [
        const Text("Language"),
        DropDownButton(
          items: [(name: "English", value: "en"), (name: "Čeština", value: "cs")]
              .map((e) => MenuFlyoutItem(
                    onPressed: () => vm.setLanguage(e.value),
                    text: Text(e.name),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
