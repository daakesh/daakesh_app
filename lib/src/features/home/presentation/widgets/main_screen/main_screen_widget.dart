import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../src.export.dart';

class MainScreenWidget {
  static List<PersistentBottomNavBarItem> navBarsItems(
      BuildContext context, int index, StoreType storeType) {
    return [
      PersistentBottomNavBarItem(
        icon: bottomNavBarItem(
          context: context,
          icon: SizedBox(
            height: 28.0.h,
            child: 0 == index
                ? Assets.svg.enableHomeIcon
                    .svg(width: 28.0, height: 24.0, fit: BoxFit.fill)
                : Assets.svg.disableHomeIcon
                    .svg(width: 28.0, height: 24.0, fit: BoxFit.fill),
          ),
          title: context.locale.home_bottom_nav_tab,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: bottomNavBarItem(
            context: context,
            icon: SizedBox(
                height: 28.0.h,
                child: 1 == index
                    ? Assets.svg.enableProductIcon
                        .svg(width: 24.0, height: 24.0, fit: BoxFit.fill)
                    : Assets.svg.disableProductIcon
                        .svg(width: 24.0, height: 24.0, fit: BoxFit.fill)),
            title: context.locale.my_product_bottom_nav_tab),
        // inactiveIcon: bottomNavBarItem(
        //     context: context,
        //     icon: SizedBox(
        //         height: 24.0,
        //         child: Assets.svg.disableProductIcon.svg(
        //           width: 24.0,
        //           height: 24.0,
        //         )),
        //     title: context.locale.my_product_bottom_nav_tab),
      ),
      PersistentBottomNavBarItem(
          icon: Assets.png.swapIcon.image(),
          textStyle: context.easyTheme.textTheme.bodyMedium!
              .copyWith(fontSize: 12.0, color: ColorName.white),
          activeColorPrimary: ColorName.white,
          title: storeType == StoreType.SWAP
              ? context.locale.go_to_shop
              : context.locale.go_to_Swap,
          onPressed: (_) {
            HomeBloc.get.add(ActivateSwapEvent(context: context));
          }),
      PersistentBottomNavBarItem(
        icon: bottomNavBarItem(
          context: context,
          icon: SizedBox(
              height: 28.0.h,
              child: 3 == index
                  ? Assets.png.enableMyOrderIcon
                      .image(width: 26.0, height: 24.0, fit: BoxFit.fill)
                  : Assets.png.disableMyOrderIcon
                      .image(width: 26.0, height: 24.0, fit: BoxFit.fill)),
          title: context.locale.my_order_bottom_nav_tab,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: bottomNavBarItem(
            context: context,
            icon: SizedBox(
                height: 28.0.h,
                child: 4 == index
                    ? Assets.svg.enableProfileIcon
                        .svg(width: 26.0, height: 24.0, fit: BoxFit.fill)
                    : Assets.svg.disableProfileIcon
                        .svg(width: 26.0, height: 24.0, fit: BoxFit.fill)),
            title: context.locale.profile_bottom_nav_tab),
        // inactiveIcon: bottomNavBarItem(
        //     context: context,
        //     icon: SizedBox(
        //         height: 24.0,
        //         child: Assets.svg.disableProfileIcon
        //             .svg(width: 26.0, height: 26.0)),
        //     title: context.locale.profile_bottom_nav_tab),
      ),
    ];
  }

  static Widget bottomNavBarItem({
    required BuildContext context,
    required String title,
    required Widget icon,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(
            height: 5.5,
          ),
          Material(
              color: ColorName.transparent,
              child: Text(title,
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 14.0.sp, color: Colors.white)))
        ],
      );
}
