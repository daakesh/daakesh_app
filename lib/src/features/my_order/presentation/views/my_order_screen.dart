import 'package:daakesh/src/src.export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderScreen extends StatefulWidget {
  final BuildContext externalContext;
  const MyOrderScreen({super.key, required this.externalContext});

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
      builder: (_, myOrderState) {
        return RefreshIndicatorWidget(
          onRefresh: () => getData(),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (_, state) {
              return Scaffold(
                backgroundColor: ColorName.whiteSmoke,
                body: state.storeType == StoreType.SHOP
                    ? SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              context.locale.go_to_swap,
                              style: context.easyTheme.textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: DefaultButtonWidget(
                                text: context.locale.go_to_swap_button,
                                onPressed: () {
                                  HomeBloc.get.add(ActivateSwapEvent(
                                      context: widget.externalContext));
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    : MySwapOrderWidget(state: myOrderState),
              );
            },
          ),
        );
      },
    );
  }
}

class GoToSwapModeWidget extends StatelessWidget {
  const GoToSwapModeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Go To Swap Mode',
              style: context.easyTheme.textTheme.headlineLarge),
          const SizedBox(height: 16),
          DefaultButtonWidget(
            text: 'Swap',
            onPressed: () {
              HomeBloc.get.add(ActivateSwapEvent(context: context));
            },
          )
        ],
      ),
    );
  }
}

class MySwapOrderWidget extends StatelessWidget {
  final MyOrderState state;
  const MySwapOrderWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: HeaderWidget(withArrowBack: false)),
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
            padding:
                const EdgeInsetsDirectional.only(start: 17, end: 13, top: 13),
            child: Text(
              context.locale.swapRequests,
              style: context.easyTheme.textTheme.headlineMedium!.copyWith(
                fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 24.0),
                color: ColorName.blueGray,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 17, end: 13, top: 13),
            child: Row(
              children: [
                Text(
                  context.locale.send_swap_request,
                  style: context.easyTheme.textTheme.bodyLarge!.copyWith(
                      fontSize:
                          ResponsiveText.getResponsiveFontSize(fontSize: 18.0)),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                      value: state.sendReceiveFlag,
                      activeColor: ColorName.amber,
                      inactiveThumbColor: ColorName.amber,
                      inactiveTrackColor: ColorName.amber,
                      focusColor: ColorName.amber,
                      hoverColor: ColorName.amber,
                      activeTrackColor: ColorName.amber,
                      trackOutlineColor: MaterialStateProperty.resolveWith(
                        (final Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return null;
                          }
                          return ColorName.transparent;
                        },
                      ),
                      thumbColor: MaterialStateProperty.all(ColorName.white),
                      thumbIcon: MaterialStateProperty.all(const Icon(
                        Icons.abc,
                        color: ColorName.white,
                      )),
                      onChanged: (value) {
                        MyOrderBloc.get.add(
                            SendReceiveSwitchEvent(sendReceiveFlag: value));
                      }),
                ),
                Text(
                  context.locale.receive_swap_request,
                  style: context.easyTheme.textTheme.bodyLarge!.copyWith(
                      fontSize:
                          ResponsiveText.getResponsiveFontSize(fontSize: 18.0)),
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
                  return state.receiveSwapReqList.isEmpty
                      ? SliverFillRemaining(
                          child: Center(
                              child: Text(
                            context.locale.no_data_avaliable,
                            style: context.easyTheme.textTheme.headlineLarge!
                                .copyWith(fontSize: 26),
                          )),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) =>
                                  state.receiveSwapReqList[index].approved == 0
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
                              childCount: state.receiveSwapReqList.length),
                        );
                },
              )
            : BlocBuilder<MySwapOrderBloc, MySwapOrderState>(
                builder: (context, state) {
                  return state.sendSwapReqList.isEmpty
                      ? SliverFillRemaining(
                          child: Center(
                              child: Text(
                            context.locale.no_data_avaliable,
                            style: context.easyTheme.textTheme.headlineLarge!
                                .copyWith(fontSize: 26),
                          )),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) =>
                                  state.sendSwapReqList[index].approved == 0 ||
                                          state.sendSwapReqList[index]
                                                  .approved ==
                                              -1
                                      ? SendSwapWaitingItem(
                                          sendSwapReqItem:
                                              state.sendSwapReqList[index],
                                          approved: state
                                              .sendSwapReqList[index].approved!,
                                        )
                                      : SendSwapAcceptedItem(
                                          sendSwapReqItem:
                                              state.sendSwapReqList[index]),
                              childCount: state.sendSwapReqList.length),
                        );
                },
              ),
        const SliverPadding(
            padding: EdgeInsetsDirectional.symmetric(vertical: 26)),
        SeeMoreWidget(state: state),
        const SliverPadding(
            padding: EdgeInsetsDirectional.symmetric(vertical: 40)),
      ],
    );
  }
}
