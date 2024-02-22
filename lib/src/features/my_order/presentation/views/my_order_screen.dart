import 'package:daakesh/src/src.export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

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
                    preferredSize: Size(double.infinity, state.myOrderTapBar.isMyOrder ?  17.0.h:70.0.h),
                    child: const Text(''),
                  ),
                  flexibleSpace: OrderTypeTabBar(state: state),
                ),
                SliverPadding(padding: EdgeInsetsDirectional.only(top: 17.0.h)),
                state.myOrderTapBar.isMyOrder
                    ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => MyOrderItem(index: index),
                      childCount: 10),
                ) :state.sendReceiveFlag
                    ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (context, index) => index % 2 == 0
                              ? const ReceiveSwapItem()
                              : const ReceiveDoneDealItem(),
                      childCount: 5),
                ):SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (context, index) => index % 2 == 0
                              ? const WaitingSwapRequestItem()
                              : const AcceptedSwapRequestItem(),
                      childCount: 20),
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









