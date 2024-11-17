import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../src.export.dart';

class TodayDealProduct extends StatelessWidget {
  final bool isDaakeshTodayDeal;
  final TodayItem todayDealItem;

  const TodayDealProduct({
    super.key,
    this.isDaakeshTodayDeal = false,
    required this.todayDealItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CommentBloc.get.add(GetCommentByItemEvent(itemId: todayDealItem.id!));
        Utils.openNavNewPage(
            context,
            MoreInfoProductScreen(
              todayDealItem: todayDealItem,
              isDaakeshTodayDeal: isDaakeshTodayDeal,
            ));
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: ColorName.lavenderGray,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6.0,
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 75),
                    height: 22,
                    margin:
                        const EdgeInsetsDirectional.only(top: 1.0, start: 4.0),
                    padding: const EdgeInsets.only(top: 2),
                    decoration: const BoxDecoration(
                      color: ColorName.red,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: todayDealItem.discountPercentage != '0%'
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              '${todayDealItem.discountPercentage} ${context.locale.home_off_title}',
                              textAlign: TextAlign.center,
                              style: context.easyTheme.textTheme.headlineMedium!
                                  .copyWith(
                                      fontSize: 14, color: ColorName.white),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ),
                CachedImage(
                  imageUrl: todayDealItem.itemImg != null
                      ? todayDealItem.itemImg!.first
                      : '',
                  height: 85.0,
                  width: 85.0,
                ),
                const SizedBox(
                  height: 12.0,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(start: 16),
            decoration: const BoxDecoration(
              color: ColorName.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6.0,
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                ),
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '${todayDealItem.title}\n',
                  maxLines: 2,
                  style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                      fontSize: 15,
                      color: ColorName.gray,
                      overflow: TextOverflow.ellipsis),
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: todayDealItem.averageRating!,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      ignoreGestures: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Flexible(
                      child: Text(
                        todayDealItem.averageRating.toString(),
                        style: context.easyTheme.textTheme.headlineMedium!
                            .copyWith(
                                fontSize: 14, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Flexible(
                      child: Text(
                        '(${todayDealItem.rateCount})',
                        style: context.easyTheme.textTheme.headlineMedium!
                            .copyWith(
                                fontSize: 13,
                                color: ColorName.gray,
                                overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                todayDealItem.discountPercentage == '0%'
                    ? Text(
                        '${context.locale.jordan_dinar} ${todayDealItem.priceAfterDiscount} ',
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      )
                    : Row(
                        children: [
                          Flexible(
                              child: Text(
                            '${context.locale.jordan_dinar} ${todayDealItem.priceAfterDiscount} ',
                            style: context.easyTheme.textTheme.bodyMedium!
                                .copyWith(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          )),
                          Text(
                            '${context.locale.jordan_dinar} ${todayDealItem.price}',
                            style: context.easyTheme.textTheme.headlineMedium!
                                .copyWith(
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                              color: ColorName.gray,
                            ),
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 10.0,
                ),
                !isDaakeshTodayDeal
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Assets.svg.creditCardIcon.svg(),
                          Row(
                            children: [
                              Text(context.locale.home_by_title,
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(
                                          fontSize: 13, color: ColorName.gray)),
                              const DaakeshLogoWidget(
                                width: 63,
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.phone,
                            color: ColorName.silverChalice,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(context.locale.home_by_title,
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 13,
                                              color: ColorName.gray)),
                                  Flexible(
                                      child: Text('${todayDealItem.user!.name}',
                                          style: context
                                              .easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 13,
                                                  overflow:
                                                      TextOverflow.ellipsis))),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 10.0,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
