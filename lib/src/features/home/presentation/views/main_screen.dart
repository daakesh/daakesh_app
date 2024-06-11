import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../src.export.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return PersistentTabView(
        context,
        backgroundColor: ColorName.white,
        controller: HomeBloc.controller,
        onItemSelected: (index) {
          HomeBloc.get.add(SelectTabItemEvent(index: index));
        },
        screens: ValueConstants.userId.isNotEmpty
            ? MainScreensList.screensMethod(state.storeType)
            : MainScreensList.guestScreensMEthod(state.storeType),
        items: MainScreenWidget.navBarsItems(
            context, state.tabIndex, state.storeType),
        resizeToAvoidBottomInset: false,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        navBarStyle: NavBarStyle.style15,
        padding: const NavBarPadding.only(bottom: 12.0),
        popAllScreensOnTapAnyTabs: true,
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
      );
    });
  }
}
