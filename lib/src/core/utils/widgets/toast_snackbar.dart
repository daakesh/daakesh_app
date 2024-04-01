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
}
