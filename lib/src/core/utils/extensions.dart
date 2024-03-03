import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../src.export.dart';

///To capitalize first letter only.
extension StringExtension on String {
  String get capitalize => "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}
///More functionality for swapping between screen in [HomeScreen]
extension HomeScreenStateX on HomeScreenState{
  bool get isSearch => this == HomeScreenState.SEARCH;
  bool get isProductDetails => this == HomeScreenState.PRODUCTDETAILS;
  bool get isSearchResult => this == HomeScreenState.SEARCHRESULT;
  bool get isCart => this == HomeScreenState.CART;
  bool get isSections => this == HomeScreenState.SECTIONS;
  bool get isShopByBrands => this == HomeScreenState.SHOPBYBRANDS;
  bool get isHomemade => this == HomeScreenState.HOMEMADE ;
  bool get isHome => this == HomeScreenState.HOME;
}


extension GlobalBuildContext on BuildContext{
  ThemeData get easyTheme => Theme.of(this);
  void get disMissKeyboard=> FocusScope.of(this).unfocus();
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


extension ProductDisplayMethodX on ProductDisplayMethod{
  bool get isSale => this == ProductDisplayMethod.SALE;
  bool get isSwap => this == ProductDisplayMethod.SWAP;
  bool get isSaleSwap => this == ProductDisplayMethod.SALESWAP;
}

extension MyOrderTapBarX on MyOrderTapBar{
  bool get isMyOrder => this == MyOrderTapBar.MYORDER;
  bool get isSwapRequest => this == MyOrderTapBar.SWAPREQUEST;
}

