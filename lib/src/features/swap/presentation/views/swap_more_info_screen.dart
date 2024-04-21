import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class SwapMoreInfoScreen extends StatelessWidget {
  SwapMoreInfoScreen({super.key});

  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SwapPassDataBloc, SwapPassDataState>(
        builder: (_, state) {
          return CustomScrollView(
            slivers: [
              const SwapAppBarWidget(),
              SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 17.5, end: 26.0, top: 12.0),
                      child: SwapProductCarousalSlider(state: state))),
              const SliverToBoxAdapter(
                  child: Divider(color: ColorName.gray, thickness: 3.0)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 17.5, end: 24.0, bottom: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.trendDealsListData.first.title}',
                        style: context.easyTheme.textTheme.bodyMedium!
                            .copyWith(fontSize: 24.0, color: ColorName.gray),
                      ),
                      const SizedBox(height: 18.0),
                      Row(
                        children: [
                          Assets.svg.locationPinIcon.svg(
                              height: 21.0,
                              width: 21.0,
                              color: ColorName.amber),
                          const SizedBox(
                            width: 6.5,
                          ),
                          Text.rich(
                            TextSpan(
                              style: context.easyTheme.textTheme.bodyMedium!
                                  .copyWith(
                                fontSize: 16.0,
                              ),
                              children: [
                                TextSpan(
                                  text: context
                                      .locale.swap_more_info_swap_in_title,
                                ),
                                TextSpan(
                                  text:
                                      '${state.trendDealsListData.first.citySwap}, ',
                                ),
                                TextSpan(
                                  text:
                                      '${state.trendDealsListData.first.countrySwap}, ',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: '(',
                                      style: context
                                          .easyTheme.textTheme.labelLarge!
                                          .copyWith(
                                              fontSize: 23.0,
                                              color: ColorName.gray)),
                                  TextSpan(
                                      text: '25',
                                      style: context
                                          .easyTheme.textTheme.labelLarge!
                                          .copyWith(
                                              fontSize: 23.0,
                                              color: ColorName.red)),
                                  TextSpan(
                                      text: ') ',
                                      style: context
                                          .easyTheme.textTheme.labelLarge!
                                          .copyWith(
                                              fontSize: 23.0,
                                              color: ColorName.gray)),
                                  TextSpan(
                                      text:
                                          context.locale.offer_submitted_title,
                                      style: context
                                          .easyTheme.textTheme.labelLarge!
                                          .copyWith(
                                              fontSize: 23.0,
                                              color: ColorName.black)),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            '${state.trendDealsListData.first.date}',
                            style: context.easyTheme.textTheme.bodyMedium!
                                .copyWith(
                                    fontSize: 15.0,
                                    color: ColorName.grayishBlue),
                          )
                        ],
                      ),
                      const SizedBox(height: 28.0),
                      SwapDetailsSection(
                        state: state,
                      ),
                      Center(
                          child: DefaultButtonWidget(
                              text: context.locale.swap_offer_create_button,
                              onPressed: () => onSendOffer(context))),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void onSendOffer(context) {
    SwapProBloc.get.add(GetSwapProductEvent());
    openSendOfferScreen(context);
  }

  void openSendOfferScreen(context) =>
      Utils.openNavNewPage(context, SendOfferScreen());
}
