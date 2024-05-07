// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/services.dart';

class RegExpValidator {
  ///Clear leading whitespace
  static FilteringTextInputFormatter beginWhitespace =
      FilteringTextInputFormatter.deny(RegExp(r'^[\s]+'));

  ///Clear trailing whitespace:
  static FilteringTextInputFormatter endWhitespace =
      FilteringTextInputFormatter.deny(RegExp(r'[\s]+$'));

  ///Clear all whitespace:
  static FilteringTextInputFormatter clearWhitespace =
      FilteringTextInputFormatter.deny(RegExp('\\s+'));

  /// clearZero digit:
  static FilteringTextInputFormatter clearZero =
      FilteringTextInputFormatter.deny(RegExp(r'^0+'));
  static FilteringTextInputFormatter allowAllNumber =
      FilteringTextInputFormatter.allow(RegExp('[0-9]'));
  static FilteringTextInputFormatter removeCountryCode =
      FilteringTextInputFormatter.deny(RegExp(r'^94+'));
  static FilteringTextInputFormatter clearSymbol =
      FilteringTextInputFormatter.deny(RegExp('[\\.|\\,|\\@]'));

  ///Insert English language only
  static FilteringTextInputFormatter insertEnglish =
      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'));
  static FilteringTextInputFormatter insertText =
      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'));
  static RegExp checkInsertEnglish =
      RegExp('[a-zA-Z0-9\u0020-\u007E-\u0024-\u00A9]');

  ///

  static bool isValidEmail({required String? email}) {
    const String emailRex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(emailRex).hasMatch(email!);
  }

  static bool isValidPhone({required String? phone}) {
    const String phoneRex =
        '^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}\$';
    return RegExp(phoneRex).hasMatch(phone!);
  }

  static bool passwordStrength({required String password}) {
    const String phoneRex =
        '(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})';
    return RegExp(phoneRex).hasMatch(password);
  }

  static bool isMinimumEightCharacters(String value) {
    bool isValid = RegExp(r'^.{8,}$').hasMatch(value);
    return isValid;
  }

  static bool isContainsNumber(String value) {
    bool isContainsNumber = RegExp(r'\d').hasMatch(value);
    return isContainsNumber;
  }

  static bool isContainsUppercase(String value) {
    bool isContainsUppercase = RegExp(r'[A-Z]').hasMatch(value);
    return isContainsUppercase;
  }

  static bool isContainsSpecialCharacter(String value) {
    bool isContainsSpecialCharacter =
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
    return isContainsSpecialCharacter;
  }
}
