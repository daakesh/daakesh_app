import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (_, state) {
      return PersistentTabView(
        context,
        backgroundColor: ColorName.blueGray,
        controller: HomeBloc.controller,
        padding: const EdgeInsets.all(5),
        onItemSelected: (index) {
          HomeBloc.get.add(SelectTabItemEvent(index: index));
        },
        screens: ValueConstants.userId.isNotEmpty
            ? MainScreensList.screensMethod(state.storeType, context)
            : MainScreensList.guestScreensMEthod(state.storeType),
        items: MainScreenWidget.navBarsItems(
            context, state.tabIndex, state.storeType),
        resizeToAvoidBottomInset: false,
        stateManagement: true,
        navBarStyle: NavBarStyle.style15,
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
