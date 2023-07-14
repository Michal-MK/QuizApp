import 'package:fluent_ui/fluent_ui.dart';

Color questionTypeColor(int questionType) {
    switch (questionType) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.green;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.purple;
      case 4:
        return Colors.red;
      default:
        return Colors.yellow;
    }
  }