import 'package:fluent_ui/fluent_ui.dart';

class QuestionInputCombo<T> extends StatelessWidget {
  final String title;
  final String description;
  final void Function(T?) onChange;
  final List<ComboBoxItem<T>> items;
  final T value;

  const QuestionInputCombo({
    required this.title,
    required this.description,
    required this.onChange,
    required this.items,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(title),
          ),
          ComboBox<T>(
            onChanged: onChange,
            items: items,
            placeholder: Text(title),
            value: value,
          ),
        ],
      ),
    );
  }
}