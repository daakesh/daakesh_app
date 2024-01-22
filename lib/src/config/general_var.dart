import 'package:daakesh/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations get getLoc => AppLocalizations.of(navigatorKey.currentState!.context)!;

List<Locale> get supportedLocales => [
  const Locale('en'), // English
  const Locale('ar'), // Arabic
];

Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates => [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];