import 'package:daakesh/src/src.export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    if (ValueConstants.userId.isEmpty) {
      return;
    }

    ///SellOrderBloc.get.add(GetMyOrderEvent());
    MySwapOrderBloc.get.add(GetSendSwapRequestEvent());
    MySwapOrderBloc.get.add(GetReceiveSwapRequestEvent());
    MySwapOrderBloc.get.add(EmptyMyOrderDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrderBloc, MyOrderState>(
      builder: (context, state) {
        return RefreshIndicatorWidget(
          onRefresh: () => getData(),
          child: Container(
            color: ColorName.blueGray,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: ColorName.whiteSmoke,
                body: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: HeaderWidget(withArrowBack: false),
                    ),
                    //SliverAppBar(
                    //  pinned: true,
                    //  backgroundColor: ColorName.whiteSmoke,
                    //  surfaceTintColor: ColorName.whiteSmoke,
                    //  bottom: PreferredSize(
                    //    preferredSize: Size(double.infinity,
                    //        state.myOrderTapBar.isMyOrder ? 30.0.h : 85.0.h),
                    //    child: const Text(''),
                    //  ),
                    //  flexibleSpace: OrderTypeTabBar(state: state),
                    //),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 17.0.w, end: 13.0.w, top: 13.0.h),
                        child: Text(
                          context.locale.swapRequests,
                          style: context.easyTheme.textTheme.headlineMedium!
                              .copyWith(
                            fontSize: ResponsiveText.getResponsiveFontSize(
                                fontSize: 24.0),
                            color: ColorName.blueGray,
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 17.0.w, end: 13.0.w, top: 13.0.h),
                        child: Row(
                          children: [
                            Text(
                              context.locale.send_swap_request,
                              style: context.easyTheme.textTheme.bodyLarge!
                                  .copyWith(
                                      fontSize:
                                          ResponsiveText.getResponsiveFontSize(
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
                                  thumbColor: MaterialStateProperty.all(
                                      ColorName.white),
                                  onChanged: (value) {
                                    MyOrderBloc.get.add(SendReceiveSwitchEvent(
                                        sendReceiveFlag: value));
                                  }),
                            ),
                            Text(
                              context.locale.receive_swap_request,
                              style: context.easyTheme.textTheme.bodyLarge!
                                  .copyWith(
                                      fontSize:
                                          ResponsiveText.getResponsiveFontSize(
                                              fontSize: 18.0)),
                            ),
                            const Spacer(flex: 1),
                          ],
                        ),
                      ),
                    ),
                    // state.myOrderTapBar.isMyOrder
                    //     ? BlocBuilder<SellOrderBloc, SellOrderState>(
                    //         builder: (context, state) {
                    //           return SliverList(
                    //             delegate: SliverChildBuilderDelegate(
                    //                 (context, index) => MyOrderItem(
                    //                     myOrderData: state.myOrderDataList[index]),
                    //                 childCount: state.myOrderDataList.length),
                    //           );
                    //         },
                    //       )
                    state.sendReceiveFlag
                        ? BlocBuilder<MySwapOrderBloc, MySwapOrderState>(
                            builder: (context, state) {
                              return SliverList(
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) => state
                                                .receiveSwapReqList[index]
                                                .approved ==
                                            0
                                        ? ReceiveSwapWaitingItem(
                                            sendReceiveSwapReqItem:
                                                state.receiveSwapReqList[index])
                                        : ReceiveDoneDealItem(
                                            receiveSwapReqItem:
                                                state.receiveSwapReqList[index],
                                            approved: state
                                                .receiveSwapReqList[index]
                                                .approved!,
                                          ),
                                    childCount:
                                        state.receiveSwapReqList.length),
                              );
                            },
                          )
                        : BlocBuilder<MySwapOrderBloc, MySwapOrderState>(
                            builder: (context, state) {
                              return SliverList(
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) => state
                                                    .sendSwapReqList[index]
                                                    .approved ==
                                                0 ||
                                            state.sendSwapReqList[index]
                                                    .approved ==
                                                -1
                                        ? SendSwapWaitingItem(
                                            sendSwapReqItem:
                                                state.sendSwapReqList[index],
                                            approved: state
                                                .sendSwapReqList[index]
                                                .approved!,
                                          )
                                        : SendSwapAcceptedItem(
                                            sendSwapReqItem:
                                                state.sendSwapReqList[index]),
                                    childCount: state.sendSwapReqList.length),
                              );
                            },
                          ),
                    SliverPadding(
                        padding:
                            EdgeInsetsDirectional.symmetric(vertical: 26.0.h)),
                    SeeMoreWidget(state: state),
                    SliverPadding(
                        padding:
                            EdgeInsetsDirectional.symmetric(vertical: 40.0.h)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
