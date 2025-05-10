import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';

class ClientStatus {
  String uuid;
  String name;
  late Color color;
  bool answered = false;

  ClientStatus({
    required this.uuid,
    required this.name,
    this.answered = false,
  }) {
    color = randomHsvColor();
  }

  Color randomHsvColor() {
    final hue = Random().nextInt(360);
    return HSVColor.fromAHSV(1, hue.toDouble(), 1, 1).toColor();
  }
}
