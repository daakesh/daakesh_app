import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../src.export.dart';

class SeeMoreWidget extends StatelessWidget {
  final MyOrderState state;
  const SeeMoreWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: state.myOrderTapBar.isSwapRequest
          ? seeMoreHandler(context, state)
          : const SizedBox(),
    );
  }

  Widget seeMoreHandler(BuildContext context, MyOrderState flagState) =>
      BlocBuilder<MySwapOrderBloc, MySwapOrderState>(
        builder: (context, state) {
          return switch (flagState.sendReceiveFlag) {
            ///Receive Swap Offers.
            true => Center(
                child: !state.isReceiveMoreData
                    ? state.mySwapOrderStateStatus.isLoadingMore
                        ? const CircularProgressIndicatorWidget()
                        : TextButtonWidget(
                            text: 'See More',
                            isBold: true,
                            onPressed: () => onSeeMoreTap(
                                context, flagState.sendReceiveFlag),
                          )
                    : const SizedBox(),
              ),

            ///Send Swap Offers.
            false => Center(
                child: !state.isSendMoreData
                    ? state.mySwapOrderStateStatus.isLoadingMore
                        ? const CircularProgressIndicatorWidget()
                        : TextButtonWidget(
                            text: 'See More',
                            isBold: true,
                            onPressed: () => onSeeMoreTap(
                                context, flagState.sendReceiveFlag),
                          )
                    : const SizedBox(),
              ),
          };
        },
      );

  void onSeeMoreTap(BuildContext context, bool sendReceiveFlag) {
    if (sendReceiveFlag) {
      MySwapOrderBloc.get.add(GetReceiveSwapRequestEvent(isSeeMore: true));
    } else {
      MySwapOrderBloc.get.add(GetSendSwapRequestEvent(isSeeMore: true));
    }
  }
}
