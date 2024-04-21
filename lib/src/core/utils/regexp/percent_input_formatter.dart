import 'package:flutter/services.dart';

class PercentInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;
    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final parsed = int.tryParse(newText.replaceAll('%', ''));
    if (parsed != null && parsed >= 0 && parsed <= 100) {
      return TextEditingValue(
        text: '$parsed%',
        selection: TextSelection.collapsed(offset: ('$parsed%').length - 1),
      );
    }
    return oldValue;
  }

}
