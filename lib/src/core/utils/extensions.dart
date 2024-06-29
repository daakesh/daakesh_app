import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../src.export.dart';

///To capitalize first letter only. [StringExtension]
extension StringExtension on String {
  String get capitalize =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  String get capitalizeFirstOfEach =>
      split(" ").map((str) => str.capitalize).join(" ");
}

///More functionality for swapping between screen in [HomeScreen]
extension HomeScreenStateX on HomeScreenState {
  bool get isSearch => this == HomeScreenState.SEARCH;
  bool get isProductDetails => this == HomeScreenState.PRODUCTDETAILS;
  bool get isSubCategoryResult => this == HomeScreenState.SUBCATEGORYRESULT;
  bool get isCart => this == HomeScreenState.CART;
  bool get isSections => this == HomeScreenState.SECTIONS;
  bool get isShopByBrands => this == HomeScreenState.SHOPBYBRANDS;
  bool get isHomemade => this == HomeScreenState.HOMEMADE;
  bool get isHome => this == HomeScreenState.HOME;
}

extension SwapScreenStateX on SwapScreenState {
  bool get isSearch => this == SwapScreenState.SEARCH;
  bool get isProductDetails => this == SwapScreenState.PRODUCTDETAILS;
  bool get isSubCategoryResult => this == SwapScreenState.SUBCATEGORYRESULT;
  bool get isCart => this == SwapScreenState.CART;
  bool get isSections => this == SwapScreenState.SECTIONS;
  bool get isSendOffer => this == SwapScreenState.SENDOFFER;
  bool get isOfferDetails => this == SwapScreenState.OFFERDETAILS;
  bool get isHome => this == SwapScreenState.HOME;
}

extension AuthMannerX on AuthManner {
  bool get isSignUpIn => this == AuthManner.SIGNUPIN;
  bool get isForgetPassword => this == AuthManner.FORGETPASSWORD;
}

extension GlobalBuildContext on BuildContext {
  ThemeData get easyTheme => Theme.of(this);
  void get disMissKeyboard => FocusScope.of(this).unfocus();
  Size get size => MediaQuery.of(this).size;
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

extension ProductDisplayMethodX on ProductDisplayMethod {
  bool get isSell => this == ProductDisplayMethod.Sell;
  bool get isSwap => this == ProductDisplayMethod.Swap;
  bool get isSaleSwap => this == ProductDisplayMethod.SellSwap;
}

extension MyOrderTapBarX on MyOrderTapBar {
  bool get isMyOrder => this == MyOrderTapBar.MYORDER;
  bool get isSwapRequest => this == MyOrderTapBar.SWAPREQUEST;
}

extension UserTypeX on UserType {
  bool get isSwap => this == UserType.SWAP;
  bool get isSell => this == UserType.SELL;
}

extension AdjustProductX on AdjustProduct {
  bool get isAdd => this == AdjustProduct.ADD;
  bool get isEdit => this == AdjustProduct.EDIT;
}

extension FilterProductTypeX on FilterProductType {
  bool get isAll => this == FilterProductType.All;
  bool get isDaakesh => this == FilterProductType.Daakesh;
  bool get isOther => this == FilterProductType.Other;
}

extension DecimalUtil on double {
  String expToStringAsFixed(int afterDecimal) =>
      '${toString().split('.')[0]}.${toString().split('.')[1].substring(0, afterDecimal)}';
}

extension ShowDialog on BuildContext {
  void get showLoginDialog => showDialog(
        context: this,
        builder: (context) {
          return AlertDialog(
            title: Text(
              context.locale.alarm,
              textAlign: TextAlign.center,
              style: context.easyTheme.textTheme.headlineMedium,
            ),
            content: Text(
              context.locale.login_instruction,
              textAlign: TextAlign.center,
              style: context.easyTheme.textTheme.bodyMedium!
                  .copyWith(fontSize: 18.0, fontWeight: FontWeight.w100),
            ),
            actions: [
              Center(
                child: TextButton(
                  child: Text(context.locale.close,
                      style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Center(
                child: TextButton(
                  child: Text(context.locale.login,
                      style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Utils.openNewPage(const LoginScreen());
                  },
                ),
              ),
            ],
          );
        },
      );

  Future<bool?> showRemoveDialog() async {
    return await showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(
            context.locale.alarm,
            style: context.easyTheme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          content: Text(
            context.locale.are_you_sure_you_wanna_remove_the_item,
            textAlign: TextAlign.center,
            style: context.easyTheme.textTheme.bodyMedium!.copyWith(
              fontSize: 20.0,
              fontWeight: FontWeight.w100,
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                child: Text(
                  context.locale.remove,
                  style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                    color: Colors.red,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ),
            Center(
              child: TextButton(
                child: Text(
                  context.locale.cancel_remove_item,
                  style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
