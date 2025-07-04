import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class SwapDetailsSection extends StatelessWidget {
  final TrendDealsItem trendDealsItem;
  const SwapDetailsSection({super.key, required this.trendDealsItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.locale.swap_offer_details_title,
          style: context.easyTheme.textTheme.headlineMedium!
              .copyWith(fontSize: 22.0),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.locale.swap_offer_brand_title,
              style: context.easyTheme.textTheme.bodyLarge!
                  .copyWith(color: ColorName.gray, fontSize: 18),
            ),
            Text(
              Utils.isEnglish
                  ? (trendDealsItem.brand?.brandName ?? '-')
                  : (trendDealsItem.brand?.arName ?? '-'),
              style:
                  context.easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18),
            ),
          ],
        ),
        const SizedBox(
          height: 6.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.locale.swap_offer_model_title,
              style: context.easyTheme.textTheme.bodyLarge!
                  .copyWith(color: ColorName.gray, fontSize: 18),
            ),
            Text(
              Utils.isEnglish
                  ? (trendDealsItem.section?.name ?? '-')
                  : (trendDealsItem.section?.arName ?? '-'),
              style:
                  context.easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18),
            ),
          ],
        ),
        const SizedBox(
          height: 6.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.locale.swap_offer_category_title,
              style: context.easyTheme.textTheme.bodyLarge!
                  .copyWith(color: ColorName.gray, fontSize: 18),
            ),
            Text(
              Utils.isEnglish
                  ? (trendDealsItem.category?.name ?? '-')
                  : (trendDealsItem.category?.arName ?? '-'),
              style:
                  context.easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18),
            ),
          ],
        ),
        const SizedBox(
          height: 6.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.locale.swap_offer_year_title,
              style: context.easyTheme.textTheme.bodyLarge!
                  .copyWith(color: ColorName.gray, fontSize: 18),
            ),
            Text(
              trendDealsItem.year ?? '-',
              style:
                  context.easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18),
            ),
          ],
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          context.locale.swap_offer_description_title,
          style: context.easyTheme.textTheme.bodyLarge!
              .copyWith(color: ColorName.gray, fontSize: 18),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          trendDealsItem.description ?? '-',
          style: context.easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18),
        ),
        const SizedBox(
          height: 29.0,
        ),
      ],
    );
  }
}
