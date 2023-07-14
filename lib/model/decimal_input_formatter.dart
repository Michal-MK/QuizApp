import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DecimalNumberFormatter extends TextInputFormatter {
  final bool allowSign;

  DecimalNumberFormatter({
    required this.allowSign,
  });

  // Regex matching any floating point number
  late RegExp valid = RegExp('^${(allowSign ? "[-+]?" : "")}[0-9]*[\.,]?[0-9]*\$', multiLine: false);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (!valid.hasMatch(newValue.text)) {
      return oldValue;
    }
    int numCommas = newValue.text.characters.where((w) => w == ',').length;

    if (numCommas > 0) {
      newValue = newValue.copyWith(text: newValue.text.replaceAll(',', '.'));
    }

    return newValue;
  }
}
