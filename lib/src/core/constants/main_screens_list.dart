import 'package:daakesh/src/sharing_widget/guest_alarm_widget.dart';
import 'package:flutter/material.dart';
import '../../src.export.dart';

class MainScreensList {
  static final List<Widget> guestScreens = [
    const HomeScreen(),
    const GuestAlarmWidget(),
    const SwapScreen(),
    const GuestAlarmWidget(),
    const GuestAlarmWidget(),
  ];
  static final List<Widget> screens = [
    const HomeScreen(),
    const MyProductsScreen(),
    const SwapScreen(),
    const MyOrderScreen(),
    const ProfileScreen(),
  ];
}
