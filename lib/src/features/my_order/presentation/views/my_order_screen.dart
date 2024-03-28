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
                        ? SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (context, index) => index % 2 == 0
                                    ? const ReceiveSwapItem()
                                    : const ReceiveDoneDealItem(),
                                childCount: 2),
                          )
                        : SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (context, index) => index % 2 == 0
                                    ? const SendSwapWaitingItem()
                                    : const SendSwapAcceptedItem(),
                                childCount: 2),
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
