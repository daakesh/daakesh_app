import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../src.export.dart';

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

  static void openNavNewPage(BuildContext context, Widget screen,
      {withNavBar = true}) {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: screen,
      withNavBar: withNavBar,
    );
  }

  static GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'Key to navigate without context');

  static BuildContext currentContext = navigatorKey.currentState!.context;

  static String formatDate(String dateString) {
    DateTime date = DateFormat('yyyy-mm-dd').parse(dateString);
    return DateFormat('mm/dd/yyyy').format(date);
  }

  static Future<String> countryCodeToEmoji(String country) async {
    String code = CountriesFlags.flags[country].toString();
    final int firstLetter = code.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = code.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  static Future<void> getBack() {
    return Future<dynamic>.delayed(Duration.zero, () {
      Navigator.pop(navigatorKey.currentState!.context);
    });
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
