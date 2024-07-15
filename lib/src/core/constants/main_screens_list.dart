import 'package:daakesh/src/sharing_widget/guest_alarm_widget.dart';
import 'package:flutter/material.dart';
import '../../src.export.dart';

abstract class MainScreensList {
  static final List<Widget> guestScreens = [
    const HomeScreen(),
    const GuestAlarmWidget(),
    const SwapScreen(),
    const GuestAlarmWidget(),
    const GuestAlarmWidget(),
  ];

  static List<Widget> guestScreensMEthod(StoreType storeType) {
    return [
      storeType == StoreType.SHOP ? const HomeScreen() : const SwapScreen(),
      const GuestAlarmWidget(),
      const Scaffold(body: SizedBox()),
      const GuestAlarmWidget(),
      const GuestAlarmWidget(),
    ];
  }

  // static final List<Widget> shopScreens = [
  //   const HomeScreen(),
  //   const MyProductsScreen(),
  //   const Scaffold(body: SizedBox()),
  //   const MyOrderScreen(),
  //   const ProfileScreen(),
  // ];

  // static final List<Widget> swapScreens = [
  //   const SwapScreen(),
  //   const MyProductsScreen(),
  //   const Scaffold(body: SizedBox()),
  //   const MyOrderScreen(),
  //   const ProfileScreen(),
  // ];

  static List<Widget> screensMethod(StoreType storeType, BuildContext context) {
    return storeType == StoreType.SHOP
        ? [
            const HomeScreen(),
            const MyProductsScreen(),
            const Scaffold(body: SizedBox()),
            MyOrderScreen(
              externalContext: context,
            ),
            const ProfileScreen(),
          ]
        : [
            const SwapScreen(),
            const MyProductsScreen(),
            const Scaffold(body: SizedBox()),
            MyOrderScreen(
              externalContext: context,
            ),
            const ProfileScreen(),
          ];
  }
}
