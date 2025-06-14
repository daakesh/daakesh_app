import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../core.export.dart';

class ShowToastSnackBar {
  static Future<bool?> displayToast({
    required String? message,
    bool isError = false,
    bool isSuccess = false,
  }) {
    return Fluttertoast.showToast(
        msg: message!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        textColor: Colors.white,
        backgroundColor: const Color(0xff7A3FE1),
        fontSize: 14.0);
  }

  static void showSnackBars(
      {required String? message,
      bool isError = false,
      bool isSuccess = false,
      Duration? duration,
      SnackBarAction? snackBarAction}) {
    ScaffoldMessenger.of(Utils.navigatorKey.currentState!.context)
        .showSnackBar(SnackBar(
      content: Text(
        message!,
      ),
      duration: duration ?? const Duration(seconds: 3),
      action: snackBarAction,
      backgroundColor: isError
          ? Colors.red[800]
          : isSuccess
              ? Colors.green[800]
              : null,
    ));
  }

  /// Show custom error dialog instead of snack bar
  static void showErrorDialog({
    required String message,
    String? title,
    VoidCallback? onOkPressed,
    bool barrierDismissible = true,
  }) {
    CustomErrorDialog.show(
      message: message,
      title: title,
      onOkPressed: onOkPressed,
      barrierDismissible: barrierDismissible,
    );
  }

  /// Show custom success dialog instead of snack bar
  static void showSuccessDialog({
    required String message,
    String? title,
    VoidCallback? onOkPressed,
    bool barrierDismissible = true,
  }) {
    CustomErrorDialog.showSuccess(
      message: message,
      title: title,
      onOkPressed: onOkPressed,
      barrierDismissible: barrierDismissible,
    );
  }
}
