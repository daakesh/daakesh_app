import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../src.export.dart';

class DetailsSection extends StatelessWidget {
  final TodayItem todayDealItem;
  const DetailsSection({super.key, required this.todayDealItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.locale.more_info_product_details_title,
          style: context.easyTheme.textTheme.headlineMedium!
              .copyWith(fontSize: 22.0),
        ),
        const SizedBox(
          height: 21.0,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                context.locale.more_info_product_brand_title,
                style: context.easyTheme.textTheme.bodyLarge!
                    .copyWith(color: ColorName.gray, fontSize: 18.0),
              ),
            ),
            Text(
              Utils.isEnglish
                  ? '${todayDealItem.brand!.brandName}'
                  : '${todayDealItem.brand!.arName}',
              style: context.easyTheme.textTheme.bodyLarge!
                  .copyWith(fontSize: 18.0),
            ),
          ],
        ),
        const SizedBox(
          height: 13.0,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                context.locale.more_info_product_model_title,
                style: context.easyTheme.textTheme.bodyLarge!
                    .copyWith(color: ColorName.gray, fontSize: 18.0),
              ),
            ),
            Text(
              Utils.isEnglish
                  ? todayDealItem.section!.name.toString()
                  : todayDealItem.section!.arName.toString(),
              style: context.easyTheme.textTheme.bodyLarge!
                  .copyWith(fontSize: 18.0),
            ),
          ],
        ),
        const SizedBox(
          height: 13.0,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                context.locale.more_info_product_category_title,
                style: context.easyTheme.textTheme.bodyLarge!
                    .copyWith(color: ColorName.gray, fontSize: 18.0),
              ),
            ),
            Text(
              Utils.isEnglish
                  ? '${todayDealItem.category!.name}'
                  : '${todayDealItem.category!.arName}',
              style: context.easyTheme.textTheme.bodyLarge!
                  .copyWith(fontSize: 18.0),
            ),
          ],
        ),
        const SizedBox(
          height: 13.0,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                context.locale.more_info_product_year_title,
                style: context.easyTheme.textTheme.bodyLarge!
                    .copyWith(color: ColorName.gray, fontSize: 18.0),
              ),
            ),
            Text(
              '${todayDealItem.year}',
              style: context.easyTheme.textTheme.bodyLarge!
                  .copyWith(fontSize: 18.0),
            ),
          ],
        ),
        const SizedBox(
          height: 13.0,
        ),
        Text(
          context.locale.more_info_product_description_title,
          style: context.easyTheme.textTheme.bodyLarge!
              .copyWith(color: ColorName.gray, fontSize: 18.0),
        ),
        const SizedBox(
          height: 13.0,
        ),
        Text(
          '${todayDealItem.description}',
          style:
              context.easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18.0),
        ),
        const SizedBox(
          height: 29.0,
        ),
      ],
    );
  }
}
