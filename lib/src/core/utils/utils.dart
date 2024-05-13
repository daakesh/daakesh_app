import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../src.export.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Utils {
  static Future<void> openNewPage(Widget widget,
      {bool popPreviousPages = false}) {
    return Future<dynamic>.delayed(Duration.zero, () {
      if (!popPreviousPages) {
        return navigatorKey.currentState!.push(
          MaterialPageRoute(
            builder: (_) => widget,
            settings: RouteSettings(arguments: widget),
          ),
        );
      }
      return navigatorKey.currentState!.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => widget,
            settings: RouteSettings(
              arguments: widget,
            ),
          ),
          (Route<dynamic> route) => false);
    });
  }

  static Future<void> openPageWithoutAnimation(Widget widget,
      {bool popPreviousPages = false}) {
    return Future<dynamic>.delayed(Duration.zero, () {
      if (!popPreviousPages) {
        return navigatorKey.currentState!.push(
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => widget,
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      }
      return navigatorKey.currentState!.pushAndRemoveUntil(
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => widget,
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
          (Route<dynamic> route) => false);
    });
  }

  static bool get isEnglish => ValueConstants.language == 'en';

  static Future<void> openNavNewPage(BuildContext context, Widget screen,
      {withNavBar = true}) async {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: screen,
      withNavBar: withNavBar,
    );
  }

  static GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'Key to navigate without context');

  static BuildContext currentContext = navigatorKey.currentState!.context;

  static AppLocalizations get locale => AppLocalizations.of(currentContext)!;

  static String formatDate(String dateString) {
    DateTime date = DateFormat('yyyy-mm-dd').parse(dateString);
    return DateFormat('mm/dd/yyyy').format(date);
  }

  static String countryCodeToEmoji(String country) {
    String code = CountriesFlags.flags[country].toString();
    final int firstLetter = code.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = code.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  static String handleCountry(countryCode) {
    switch (countryCode) {
      case '+962':
        return countryCodeToEmoji('Jordan');
      case '+964':
        return countryCodeToEmoji('Iraq');
      case '+966':
        return countryCodeToEmoji('Saudi Arabia');
      case '+20':
        return countryCodeToEmoji('Egypt');
      case '+971':
        return countryCodeToEmoji('United Arab Emirates');
      case '+213':
        return countryCodeToEmoji('Algeria');
      default:
        return countryCodeToEmoji('Jordan');
    }
  }

  static Future<void> getBack() {
    return Future<dynamic>.delayed(Duration.zero, () {
      Navigator.pop(navigatorKey.currentState!.context);
    });
  }

  static String appToStringAsFixed(double number, int afterDecimal) {
    return '${number.toString().split('.')[0]}.${number.toString().split('.')[1].substring(0, afterDecimal)}';
  }

  static double getScreenWidth(BuildContext context, {bool realWidth = false}) {
    if (realWidth) {
      return MediaQuery.of(context).size.width;
    } //to preview widget like phone scale in preview

    if (kIsWeb) {
      return MediaQuery.of(context).orientation == Orientation.landscape
          ? MediaQuery.of(context).size.width / 4
          : MediaQuery.of(context).size.height / 4;
    }

    return MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
  }

  static double getScreenHeight(BuildContext context,
      {bool realHeight = false}) {
    if (realHeight) {
      return MediaQuery.of(context).size.height;
    } //to preview widget like phone scale in preview
    if (kIsWeb) {
      return MediaQuery.of(context).orientation == Orientation.landscape
          ? MediaQuery.of(context).size.height / 1.4
          : MediaQuery.of(context).size.width / 1.4;
    }
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.height
        : MediaQuery.of(context).size.width;
  }

  static void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static bool isOpenKeyboard(context) =>
      MediaQuery.of(context).viewInsets.bottom == 0;
  static bool isLightTheme(BuildContext context) =>
      context.easyTheme.brightness == Brightness.light;

  ///static bool getTextDirection(context) =>Directionality.of(context) == TextDirection.rtl;
  static void lunchWhatsApp(String contact) async {
    var phone = contact;
    var androidUrl = "whatsapp://send?phone=$phone&text=Hi, Whats up";
    var iosUrl = "https://wa.me/$phone?text=${Uri.parse('Hi, Whats up')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      ShowToastSnackBar.showSnackBars(message: 'WhatsApp is not installed.');
    }
  }

  static void lunchCall(String contact) async {
    var phone = contact;
    launchUrlString("tel://$phone");
  }

  static String calculate(String initialTime) {
    // Define the initial time
    DateTime initialDateTime = DateTime.parse(initialTime);

    // Get the current time
    DateTime currentDateTime = DateTime.now();

    // Calculate the time difference
    Duration difference = currentDateTime.difference(initialDateTime);

    // Extract time difference in various units
    int minutes = difference.inMinutes;
    int hours = difference.inHours;
    int days = difference.inDays;
    int weeks = (days / 7).floor();
    int months = currentDateTime.month -
        initialDateTime.month +
        (currentDateTime.year - initialDateTime.year) * 12;
    int years = currentDateTime.year - initialDateTime.year;

    // Determine the largest time unit present in the difference
    if (years > 0) {
      return '$years year';
    } else if (months > 0) {
      return '$months month';
    } else if (weeks > 0) {
      return '$weeks week';
    } else if (days > 0) {
      return '$days day';
    } else if (hours > 0) {
      return '$hours hour';
    } else {
      return '$minutes minute';
    }
  }
}

class ProgressCircleDialog {
  static void show() {
    showDialog(
        context: Utils.navigatorKey.currentState!.context,
        builder: (_) => const Center(
                child: CircularProgressIndicator(
              color: ColorName.blueGray,
            )),
        barrierDismissible: false);
  }

  static dismiss() {
    Navigator.pop(Utils.navigatorKey.currentState!.context);
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('onCreate -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint(
        'onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('onClose -- bloc: ${bloc.runtimeType}');
  }
}
