import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';

class QuestionInputEntry extends StatelessWidget {
  final String title;
  final String description;
  final TextEditingController controller;
  final bool numeric;

  const QuestionInputEntry({
    required this.title,
    required this.description,
    required this.controller,
    this.numeric = false,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title),
          const SizedBox(
            height: 8.0,
          ),
          TextBox(
            controller: controller,
            placeholder: title,
            inputFormatters: [
              if (numeric) FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ],
      ),
    );
  }
}
