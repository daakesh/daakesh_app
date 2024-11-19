import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../src.export.dart';

class PriceRateSection extends StatelessWidget {
  final TodayItem todayDealItem;
  final bool isDaakeshTodayDeal;
  const PriceRateSection(
      {super.key,
      required this.todayDealItem,
      required this.isDaakeshTodayDeal});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30.0,
        ),
        Text(
          todayDealItem.title.toString(),
          style: context.easyTheme.textTheme.bodyMedium!
              .copyWith(fontSize: 24.0, color: ColorName.gray),
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
            todayDealItem.discountPercentage == '0%'
                ? Text(
                    '${context.locale.jordan_dinar} ${todayDealItem.priceAfterDiscount} ',
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 30.0, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  )
                : Row(
                    children: [
                      Text(
                        '${context.locale.jordan_dinar} ${todayDealItem.priceAfterDiscount} ',
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 30.0, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${context.locale.jordan_dinar} ${todayDealItem.price}',
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
            !isDaakeshTodayDeal
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
