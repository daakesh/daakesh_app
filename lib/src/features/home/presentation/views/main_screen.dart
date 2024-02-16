import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../src.export.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      backgroundColor: ColorName.white,
      screens: const[
        HomeScreen(),
        MyProductsScreen(),
        SwapScreen(),
        MyOrderScreen(),
        ProfileScreen(),
      ],
      items: _navBarsItems(context),
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: false,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      navBarStyle: NavBarStyle.style15,
      padding:  const NavBarPadding.only(bottom: 12.0),
      navBarHeight: 77,
      decoration: const NavBarDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -3),
                blurRadius: 16.0,
                color: Color.fromRGBO(0, 0, 0, 0.16)
            )
          ],
          colorBehindNavBar: ColorName.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0))),
    );
  }
  List<PersistentBottomNavBarItem> _navBarsItems(context) {
    return [

      PersistentBottomNavBarItem(
        icon: bottomNavBarItem(icon:SizedBox(height:24.0,child: Assets.svg.enableHomeIcon.svg(width: 28.0,height: 26.0,)), title: 'Home'),
        inactiveIcon: bottomNavBarItem(icon:SizedBox(height:24.0,child: Assets.svg.disableHomeIcon.svg(width: 28.0,height: 26.0,)), title: 'Home'),

      ),

      PersistentBottomNavBarItem(
        icon: bottomNavBarItem(icon: SizedBox(height: 24.0,child: Assets.svg.enableProductIcon.svg(width: 24.0,height: 24.0,)), title: 'My Product'),
        inactiveIcon: bottomNavBarItem(icon: SizedBox(height: 24.0,child: Assets.svg.disableProductIcon.svg(width: 24.0,height: 24.0,)), title: 'My Product'),
      ),

      PersistentBottomNavBarItem(
        icon: Assets.png.swapIcon.image(),
        textStyle: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 14.0),
        activeColorPrimary: ColorName.white,
      ),

      PersistentBottomNavBarItem(
        icon: bottomNavBarItem(icon: SizedBox(height: 24.0,child: Assets.png.enableMyOrderIcon.image(width: 26.0,height: 26.0,)), title: 'My Order'),
        inactiveIcon: bottomNavBarItem(icon: SizedBox(height: 24.0,child: Assets.png.disableMyOrderIcon.image(width: 26.0,height: 26.0,)), title: 'My Order'),
      ),

      PersistentBottomNavBarItem(
        icon: bottomNavBarItem(icon: SizedBox(height: 24.0,child: Assets.svg.enableProfileIcon.svg(width: 26.0,height: 26.0)), title: 'Profile'),
        inactiveIcon: bottomNavBarItem(icon: SizedBox(height: 24.0,child: Assets.svg.disableProfileIcon.svg(width: 26.0,height: 26.0)), title: 'Profile'),
      ),

    ];
  }

  Widget bottomNavBarItem(
      {required String title,
        required Widget icon,}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 5.5,),
          Material(
              color: ColorName.transparent,
              child: Text(title,
                  style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 14.0)))
        ],
      );

}




class SwapScreen extends StatelessWidget {
  const SwapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Swap Screen'),));
  }
}

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('My Order Screen'),));
  }
}

