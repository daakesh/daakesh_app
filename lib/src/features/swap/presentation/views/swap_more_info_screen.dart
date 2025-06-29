import 'package:daakesh/src/features/favourite/presentation/bloc/favourite_bloc/favourite_bloc.export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../src.export.dart';

class SwapMoreInfoScreen extends StatelessWidget {
  final TrendDealsItem trendDealsItem;
  const SwapMoreInfoScreen({super.key, required this.trendDealsItem});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        SwapPassDataBloc.get.add(ResetSwapPassValuesEvent());
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SwapAppBarWidget(),
            SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 17.5, end: 26.0, top: 12.0),
                    child: SwapProductCarousalSlider(
                        trendDealsItem: trendDealsItem))),
            const SliverToBoxAdapter(
                child: Divider(color: ColorName.gray, thickness: 3.0)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 17.5, end: 24.0, bottom: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //!!
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${trendDealsItem.title}',
                          style: context.easyTheme.textTheme.bodyMedium!
                              .copyWith(fontSize: 24.0, color: ColorName.gray),
                        ),

                        //!!_______________________________ Favourite button

                        BlocProvider(
                          create: (_) => FavouriteBloc(
                            isFromProdScreen: true,
                            isFavouriteFromProd:
                                trendDealsItem.isFavorite ?? false,
                            itemID: trendDealsItem.id ?? 0,
                          ),
                          child: BlocBuilder<FavouriteBloc, FavouriteState>(
                            builder: (context, state) {
                              // Show loading indicator when determining favorite status
                              if (state is FavouriteLoadingState) {
                                return Container(
                                  width: 48.0,
                                  height: 48.0,
                                  padding: const EdgeInsets.all(12.0),
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2.0,
                                    color: Colors.red,
                                  ),
                                );
                              }

                              return IconButton(
                                onPressed: () {
                                  final bloc = context.read<FavouriteBloc>();
                                  bloc.add(SetFavouriteEvent(
                                      isFavourite: bloc.isFavouriteItem));

                                  if (context
                                          .read<FavouriteBloc>()
                                          .isFavouriteItem ==
                                      false) {
                                    context
                                        .read<FavouriteBloc>()
                                        .add(AddFavouriteEvent(
                                          itemId: trendDealsItem.id ?? 0,
                                        ));
                                  } else {
                                    context
                                        .read<FavouriteBloc>()
                                        .add(RemoveFavouriteEvent(
                                          itemId: bloc.favouriteItemId,
                                          actualItemId: trendDealsItem.id ?? 0,
                                        ));
                                  }
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: context
                                          .read<FavouriteBloc>()
                                          .isFavouriteItem
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 18.0),
                    InkWell(
                      onTap: trendDealsItem.latitude != '' &&
                              trendDealsItem.longitude != ''
                          ? () async {
                              final googleMapsUrl = Uri.parse(
                                  "https://www.google.com/maps/search/?api=1&query=${trendDealsItem.latitude},${trendDealsItem.longitude}");

                              if (await canLaunchUrl(googleMapsUrl)) {
                                await launchUrl(googleMapsUrl,
                                    mode: LaunchMode.externalApplication);
                              } else {
                                throw 'Could not open the map.';
                              }
                            }
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
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
                                    text: ' ${trendDealsItem.citySwap} , ',
                                  ),
                                  TextSpan(
                                    text: '${trendDealsItem.countrySwap}',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                    text: '${trendDealsItem.offerCount}',
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
                                    text: context.locale.offer_submitted_title,
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
                          '${trendDealsItem.date}',
                          style: context.easyTheme.textTheme.bodyMedium!
                              .copyWith(
                                  fontSize: 15.0, color: ColorName.grayishBlue),
                        )
                      ],
                    ),
                    const SizedBox(height: 28.0),
                    SwapDetailsSection(
                      trendDealsItem: trendDealsItem,
                    ),
                    ValueConstants.userId != (trendDealsItem.user?.id ?? '')
                        ? Center(
                            child: DefaultButtonWidget(
                                text: context.locale.swap_offer_create_button,
                                onPressed: () => onSendOffer(context)))
                        : Center(
                            child: DefaultButtonWidget(
                            text: context.locale.swap_offer_create_button,
                            style: context.easyTheme.elevatedButtonTheme.style!
                                .copyWith(
                                    backgroundColor: WidgetStateProperty.all(
                                        ColorName.blueGray.withOpacity(0.5))),
                            onPressed: () {},
                          )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSendOffer(BuildContext context) {
    if (ValueConstants.userId.isEmpty) {
      context.showLoginDialog;
      return;
    }
    SwapProBloc.get.add(GetSwapProductEvent());
    openSendOfferScreen(context);
  }

  void openSendOfferScreen(context) => Utils.openNavNewPage(
      context, SendOfferScreen(trendDealsItem: trendDealsItem));
}
