import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../src.export.dart';

class ResultItemWidget extends StatelessWidget {
  final TodayItem todayItem;
  const ResultItemWidget({super.key, required this.todayItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: ColorName.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.16),
              offset: Offset(0, 3),
              blurRadius: 10.0,
            )
          ]),
      child: Column(
        children: [
          Row(
            children: [
              todayItem.discountPercentage != "0%" &&
                      todayItem.discountPercentage != "0"
                  ? Container(
                      constraints:
                          const BoxConstraints(minWidth: 70.0, maxHeight: 25.0),
                      margin: const EdgeInsetsDirectional.only(start: 4.0),
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 6.0),
                      decoration: const BoxDecoration(
                          color: ColorName.red,
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                      child: Center(
                        child: Text(
                          '${todayItem.discountPercentage} ${context.locale.results_off_title}',
                          style: context.easyTheme.textTheme.labelLarge!
                              .copyWith(fontSize: 14.0),
                        ),
                      ),
                    )
                  : const SizedBox(
                      height: 25,
                    ),
              const Spacer(
                flex: 1,
              ),
              Text(
                context.locale.results_by_title,
                style: context.easyTheme.textTheme.bodyMedium!
                    .copyWith(fontSize: 14.0, color: ColorName.gray),
              ),
              const SizedBox(
                width: 5.0,
              ),
              todayItem.user != null
                  ? Text(
                      '${todayItem.user!.name}',
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 13.0),
                    )
                  : DaakeshLogoWidget(
                      width: 68.0.w,
                    ),
              const SizedBox(
                width: 12.0,
              ),
            ],
          ),
          const SizedBox(
            height: 4.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 12.0,
              ),
              CachedImage(
                imageUrl: todayItem.itemImg != null
                    ? todayItem.itemImg!.first.toString()
                    : '',
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                height: 90.0,
                width: 90.0,
              ),
              const SizedBox(
                width: 18.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 80.0),
                      child: Text(
                        '${todayItem.title}',
                        style: context.easyTheme.textTheme.labelMedium!
                            .copyWith(
                                fontSize: 14.0,
                                color: ColorName.gray,
                                overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          minRating: 1,
                          maxRating: 5,
                          ignoreGestures: true,
                          initialRating: todayItem.averageRating!,
                          itemSize: 20.0,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          Utils.appToStringAsFixed(todayItem.averageRating!, 1),
                          style: context.easyTheme.textTheme.labelMedium!
                              .copyWith(fontSize: 15.0),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '(${todayItem.rateCount})',
                          style: context.easyTheme.textTheme.labelMedium!
                              .copyWith(fontSize: 13.0, color: ColorName.gray),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 38.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '\$${todayItem.priceAfterDiscount!.toInt()} ',
                            style: context.easyTheme.textTheme.labelMedium!
                                .copyWith(fontSize: 21.0),
                          ),
                          todayItem.discountPercentage != "0%"
                              ? Text(
                                  '\$${todayItem.price}',
                                  style: context
                                      .easyTheme.textTheme.labelMedium!
                                      .copyWith(
                                    fontSize: 13.0,
                                    color: ColorName.gray,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                )
                              : const SizedBox(),
                          const Spacer(
                            flex: 1,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                end: 18.0, top: 16.0),
                            child: todayItem.user != null
                                ? const Icon(
                                    Icons.phone,
                                    color: ColorName.silverChalice,
                                  )
                                : Assets.svg.creditCardIcon.svg(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
