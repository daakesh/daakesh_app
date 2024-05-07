import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class OrderTypeTabBar extends StatelessWidget {
  final MyOrderState state;
  const OrderTypeTabBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50.0.h,
          margin: EdgeInsetsDirectional.only(
              start: 13.0.w, end: 13.0.w, top: 16.0.h),
          decoration: BoxDecoration(
              color: ColorName.paleGray,
              borderRadius: BorderRadius.all(Radius.circular(8.0.r))),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => toggleTabBar(MyOrderTapBar.MYORDER),
                  child: Container(
                    width: double.infinity,
                    height: 50.0.h,
                    decoration: BoxDecoration(
                        color: state.myOrderTapBar.isMyOrder
                            ? ColorName.amber
                            : ColorName.paleGray,
                        borderRadius: BorderRadius.all(Radius.circular(8.0.r))),
                    child: Center(
                        child: Text(
                      'My Order',
                      style:
                          context.easyTheme.textTheme.headlineMedium!.copyWith(
                        fontSize: ResponsiveText.getResponsiveFontSize(
                            fontSize: 18.0),
                        color: state.myOrderTapBar.isMyOrder
                            ? ColorName.white
                            : ColorName.blueGray,
                      ),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => toggleTabBar(MyOrderTapBar.SWAPREQUEST),
                  child: Container(
                    width: double.infinity,
                    height: 50.0.h,
                    decoration: BoxDecoration(
                        color: state.myOrderTapBar.isSwapRequest
                            ? ColorName.amber
                            : ColorName.paleGray,
                        borderRadius: BorderRadius.all(Radius.circular(8.0.r))),
                    child: Center(
                        child: Text(
                      'Swap Requests',
                      style:
                          context.easyTheme.textTheme.headlineMedium!.copyWith(
                        fontSize: ResponsiveText.getResponsiveFontSize(
                            fontSize: 18.0),
                        color: state.myOrderTapBar.isSwapRequest
                            ? ColorName.white
                            : ColorName.blueGray,
                      ),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
        state.myOrderTapBar.isSwapRequest
            ? Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 17.0.w, end: 13.0.w, top: 13.0.h),
                child: Row(
                  children: [
                    Text(
                      'Send',
                      style: context.easyTheme.textTheme.bodyLarge!.copyWith(
                          fontSize: ResponsiveText.getResponsiveFontSize(
                              fontSize: 18.0)),
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                          value: state.sendReceiveFlag,
                          activeColor: ColorName.amber,
                          hoverColor: ColorName.amber,
                          activeTrackColor: ColorName.amber,
                          focusColor: ColorName.amber,
                          inactiveThumbColor: ColorName.amber,
                          inactiveTrackColor: ColorName.amber,
                          thumbColor:
                              MaterialStateProperty.all(ColorName.white),
                          onChanged: onChange),
                    ),
                    Text(
                      'Receive',
                      style: context.easyTheme.textTheme.bodyLarge!.copyWith(
                          fontSize: ResponsiveText.getResponsiveFontSize(
                              fontSize: 18.0)),
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  void onChange(bool value) {
    MyOrderBloc.get.add(SendReceiveSwitchEvent(sendReceiveFlag: value));
  }

  void toggleTabBar(MyOrderTapBar myOrderTapBar) {
    MyOrderBloc.get.add(ToggleMyOrderTabBarEvent(myOrderTapBar: myOrderTapBar));
  }
}
