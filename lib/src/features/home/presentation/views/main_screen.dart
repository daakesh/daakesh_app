import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../src.export.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    getHomeScreenData();
  }

  void getHomeScreenData() {
    AdvBloc.get.add(GetAdvertisementDataEvent());
    HomeBloc.get.add(GetSectionDataEvent());
    HandmadeBloc.get.add(GetHandmadeDataEvent());
    BrandsBloc.get.add(GetBrandsDataEvent());
    TodayDealsBloc.get.add(GetToadyDealsDataEvent());
    CartBloc.get.add(GetCartItemsEvent());
    ContactInfoBloc.get.add(GetContactInfoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: PersistentTabView(
        context,
        backgroundColor: ColorName.white,
        screens: MainScreensList.screens,
        items: MainScreenWidget.navBarsItems(context),
        resizeToAvoidBottomInset: false,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        navBarStyle: NavBarStyle.style15,
        padding: const NavBarPadding.only(bottom: 12.0),
        navBarHeight: Utils.isOpenKeyboard(context) ? 77 : 0.0,
        decoration: const NavBarDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -3),
                  blurRadius: 16.0,
                  color: Color.fromRGBO(0, 0, 0, 0.16))
            ],
            colorBehindNavBar: ColorName.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0))),
      ),
    );
  }
}
