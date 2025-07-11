//import 'package:daakesh/src/services/firebase/firebase_options.dart';
//import 'package:device_preview/device_preview.dart';
import 'dart:convert';
import 'package:daakesh/src/core/notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/src.export.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Utils.immobilizeDeviceOrientation;
  await Firebase.initializeApp();
  await FirebaseMessagingService.initialize();
  // Set up notification tap handler for navigation
  FirebaseMessagingService.onNotificationTap = (data) async {
    final notificationType = data['notification_type']?.toString();
    Map<String, dynamic>? itemJson;
    if (data['item'] is String) {
      try {
        itemJson = await compute<String, Map<String, dynamic>>(
            _parseJson, data['item']);
      } catch (e, stack) {
        itemJson = {};
        debugPrint('Error parsing item JSON: $e\n$stack');
      }
    } else if (data['item'] is Map<String, dynamic>) {
      itemJson = data['item'] as Map<String, dynamic>?;
    }
    // Support both offerID and offerId keys
    final offerId = data['offerID'] != null
        ? int.tryParse(data['offerID'].toString())
        : (data['offerId'] != null
            ? int.tryParse(data['offerId'].toString())
            : null);
    final context = Utils.navigatorKey.currentContext;
    if (context == null) {
      debugPrint('Notification tap: context is null, cannot navigate.');
      return;
    }
    if (notificationType == 'comment' &&
        itemJson != null &&
        itemJson.isNotEmpty) {
      Utils.openNavNewPage(
        context,
        MoreInfoProductScreen(
          todayDealItem: TodayItem.fromJson(itemJson),
          isDaakeshTodayDeal: true,
        ),
      );
      return;
    }
    if (notificationType == 'offer' && offerId != null) {
      Utils.openNavNewPage(
        context,
        MyOrderScreen(externalContext: context),
      );
      return;
    }
    // Add more types as needed
    debugPrint(
        'Notification tap: Unhandled notification type or missing data. Type: $notificationType, Data: $data');
    // Optionally, show a snackbar or dialog to inform the user
  };
  configureDependencies(env: ValueConstants.dev);
  runApp(const AppWidget());
  //runApp(DevicePreview(builder: (BuildContext context) => const AppWidget()));
  Bloc.observer = MyBlocObserver();
}

// Helper for background isolate JSON parsing
Map<String, dynamic> _parseJson(String jsonString) =>
    jsonDecode(jsonString) as Map<String, dynamic>;
