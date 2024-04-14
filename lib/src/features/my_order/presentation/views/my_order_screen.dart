import 'package:daakesh/src/features/my_order/presentation/bloc/my_swap_order_bloc/my_swap_order_bloc.export.dart';
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
    SellOrderBloc.get.add(GetMyOrderEvent());
    MySwapOrderBloc.get.add(GetSendSwapRequestEvent());
    MySwapOrderBloc.get.add(GetReceiveSwapRequestEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorName.blueGray,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorName.whiteSmoke,
          body: BlocBuilder<MyOrderBloc, MyOrderState>(builder: (_, state) {
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: HeaderWidget(withArrowBack: false),
                ),
                SliverAppBar(
                  pinned: true,
                  backgroundColor: ColorName.whiteSmoke,
                  surfaceTintColor: ColorName.whiteSmoke,
                  bottom: PreferredSize(
                    preferredSize: Size(double.infinity,
                        state.myOrderTapBar.isMyOrder ? 30.0.h : 85.0.h),
                    child: const Text(''),
                  ),
                  flexibleSpace: OrderTypeTabBar(state: state),
                ),
                state.myOrderTapBar.isMyOrder
                    ? BlocBuilder<SellOrderBloc, SellOrderState>(
                        builder: (context, state) {
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (context, index) => MyOrderItem(
                                    myOrderData: state.myOrderDataList[index]),
                                childCount: state.myOrderDataList.length),
                          );
                        },
                      )
                    : state.sendReceiveFlag
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
                                                state.receiveSwapReqList[index],
                                          )
                                        : ReceiveDoneDealItem(
                                            receiveSwapReqItem:
                                                state.receiveSwapReqList[index],
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
                                            0
                                        ? SendSwapWaitingItem(
                                            sendSwapReqItem:
                                                state.sendSwapReqList[index])
                                        : SendSwapAcceptedItem(
                                            sendSwapReqItem:
                                                state.sendSwapReqList[index]),
                                    childCount: state.sendSwapReqList.length),
                              );
                            },
                          ),
                SliverPadding(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 26.0.h)),
              ],
            );
          }),
        ),
      ),
    );
  }
}
