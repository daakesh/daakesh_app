import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../src.export.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///
///To capitalize first letter only.
extension StringExtension on String {
  String capitalize() {
    return
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
///
///
extension HomeScreenStateX on HomeScreenState{
  bool get isSearch => this == HomeScreenState.SEARCH;
  bool get isProductDetails => this == HomeScreenState.PRODUCTDETAILS;
  bool get isSearchResult => this == HomeScreenState.SEARCHRESULT;
  bool get isCart => this == HomeScreenState.CART;
  bool get isHome => this == HomeScreenState.HOME;
}


extension GlobalBuildContext on BuildContext{
  ThemeData get easyTheme => Theme.of(this);
  AppLocalizations get locale => AppLocalizations.of(this)!;
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
}