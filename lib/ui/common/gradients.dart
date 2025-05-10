import 'package:flutter/material.dart';
import 'package:quiz/theme/theme.dart';

RadialGradient questionGradient(int type) {
  return RadialGradient(
    colors: [
      questionTypeColor(type),
      Colors.white,
    ],
    center: Alignment.topRight,
    radius: 1,
  );
}
