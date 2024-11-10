import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class SwapTrendDealProduct extends StatelessWidget {
  final TrendDealsItem trendDealsItem;

  const SwapTrendDealProduct({
    super.key,
    required this.trendDealsItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openMoreInfoProductScreen(context),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        context.locale.swap_trend_product_tag,
                        textAlign: TextAlign.center,
                        style: context.easyTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 14, color: ColorName.white),
                      ),
                    ),
                  ),
                ),
                CachedImage(
                  imageUrl: trendDealsItem.itemImg!.first.toString(),
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
            padding: const EdgeInsetsDirectional.only(
              start: 16,
            ),
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
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 28.0),
                  child: Text(
                    '${trendDealsItem.title}\n',
                    maxLines: 2,
                    style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                        fontSize: 15,
                        color: ColorName.gray,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Text(
                  '${trendDealsItem.citySwap}, ${trendDealsItem.countrySwap} ',
                  style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                      fontSize: 13,
                      color: ColorName.mediumSilver,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(height: 1.0),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 28.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: '(',
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      fontSize: 15.0, color: ColorName.gray)),
                          TextSpan(
                              text: '${trendDealsItem.offerCount}',
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      fontSize: 15.0, color: ColorName.red)),
                          TextSpan(
                              text: ') ',
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      fontSize: 15.0, color: ColorName.gray)),
                          TextSpan(
                              text: context
                                  .locale.swap_trend_product_offer_submit,
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      fontSize: 15.0, color: ColorName.black)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
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
                            Text(context.locale.swap_trend_product_by_title,
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 13, color: ColorName.gray)),
                            Flexible(
                                child: Text('${trendDealsItem.user!.name}',
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                            fontSize: 13,
                                            overflow: TextOverflow.ellipsis))),
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

  void openMoreInfoProductScreen(context) {
    Utils.openNavNewPage(
        context,
        SwapMoreInfoScreen(
          trendDealsItem: trendDealsItem,
        ));
  }
}
