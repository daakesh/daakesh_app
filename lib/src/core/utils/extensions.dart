
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///
///To capitalize first letter only.
extension StringExtension on String {
  String capitalize() {
    return
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension GlobalAppLocalizations on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)! ;
}