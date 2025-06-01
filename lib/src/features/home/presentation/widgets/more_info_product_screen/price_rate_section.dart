import 'package:daakesh/src/features/favourite/presentation/bloc/favourite_bloc/favourite_bloc.export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../src.export.dart';

class PriceRateSection extends StatefulWidget {
  final TodayItem todayDealItem;
  final bool isDaakeshTodayDeal;
  const PriceRateSection(
      {super.key,
      required this.todayDealItem,
      required this.isDaakeshTodayDeal});

  @override
  State<PriceRateSection> createState() => _PriceRateSectionState();
}

class _PriceRateSectionState extends State<PriceRateSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.todayDealItem.title.toString(),
              style: context.easyTheme.textTheme.bodyMedium!
                  .copyWith(fontSize: 24.0, color: ColorName.gray),
            ),
            TextButtonWidget(
                text: 'Show on map',
                onPressed: () async {
                  final googleMapsUrl = Uri.parse(
                      "https://www.google.com/maps/search/?api=1&query=${widget.todayDealItem.latitude},${widget.todayDealItem.longitude}");

                  if (await canLaunchUrl(googleMapsUrl)) {
                    await launchUrl(googleMapsUrl,
                        mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not open the map.';
                  }
                }),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        BlocBuilder<RateBloc, RateState>(
          builder: (context, state) {
            return Row(
              children: [
                RatingBar.builder(
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  minRating: 1,
                  maxRating: 5,
                  ignoreGestures: true,
                  initialRating: state.rateAverage,
                  itemSize: 25,
                  tapOnlyMode: true,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Flexible(
                  child: Text(
                    '${state.rateAverage}',
                    style: context.easyTheme.textTheme.labelLarge!.copyWith(
                        fontSize: 23.0,
                        color: ColorName.black,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),

                BlocBuilder<CommentBloc, CommentState>(
                  builder: (context, state) {
                    return Flexible(
                      child: Text(
                        '(${state.rateCount})',
                        style: context.easyTheme.textTheme.labelLarge!.copyWith(
                            fontSize: 21.0,
                            color: ColorName.gray,
                            overflow: TextOverflow.ellipsis),
                      ),
                    );
                  },
                ),
                const Spacer(),

                //!!_______________________________ Favourite button

                BlocProvider(
                  create: (_) => FavouriteBloc(
                    isFromProdScreen: true,
                    isFavouriteFromProd:
                        widget.todayDealItem.isFavorite ?? false,
                    itemID: widget.todayDealItem.id ?? 0,
                  ),
                  child: BlocBuilder<FavouriteBloc, FavouriteState>(
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          final bloc = context.read<FavouriteBloc>();
                          bloc.add(SetFavouriteEvent(
                              isFavourite: bloc.isFavouriteItem));

                          if (context.read<FavouriteBloc>().isFavouriteItem ==
                              false) {
                            context.read<FavouriteBloc>().add(AddFavouriteEvent(
                                  itemId: widget.todayDealItem.id ?? 0,
                                ));
                          } else {
                            context
                                .read<FavouriteBloc>()
                                .add(RemoveFavouriteEvent(
                                  itemId: bloc.favouriteItemId,
                                ));
                          }
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: context.read<FavouriteBloc>().isFavouriteItem
                              ? Colors.red
                              : Colors.grey,
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
        const SizedBox(
          height: 1.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            widget.todayDealItem.discountPercentage == '0%'
                ? Text(
                    '${context.locale.jordan_dinar} ${widget.todayDealItem.priceAfterDiscount} ',
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 30.0, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  )
                : Row(
                    children: [
                      Text(
                        '${context.locale.jordan_dinar} ${widget.todayDealItem.priceAfterDiscount} ',
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 30.0, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${context.locale.jordan_dinar} ${widget.todayDealItem.price}',
                        style: context.easyTheme.textTheme.headlineMedium!
                            .copyWith(
                          fontSize: 20,
                          decoration: TextDecoration.lineThrough,
                          color: ColorName.gray,
                        ),
                      ),
                    ],
                  ),
            const Spacer(
              flex: 1,
            ),
            !widget.isDaakeshTodayDeal
                ? Assets.svg.creditCardIcon.svg(
                    width: 30.0,
                    height: 22.0,
                  )
                : const Icon(
                    Icons.phone,
                    color: ColorName.silverChalice,
                    size: 30.0,
                  ),
          ],
        ),
        const SizedBox(height: 17.0),
      ],
    );
  }
}
