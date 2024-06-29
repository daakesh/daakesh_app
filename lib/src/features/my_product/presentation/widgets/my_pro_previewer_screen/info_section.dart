import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class InfoSection extends StatelessWidget {
  final ProPreviewerModel previewerModel;
  const InfoSection({super.key, required this.previewerModel});

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
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.locale.more_info_product_brand_title,
              style: context.easyTheme.textTheme.bodyLarge!
                  .copyWith(color: ColorName.gray, fontSize: 18.0.sp),
            ),
            Text(
              Utils.isEnglish
                  ? previewerModel.brandName.toString()
                  : previewerModel.brandArName.toString(),
              style: context.easyTheme.textTheme.bodyLarge!
                  .copyWith(fontSize: 18.0.sp),
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
              context.locale.more_info_product_model_title,
              style: context.easyTheme.textTheme.bodyLarge!
                  .copyWith(color: ColorName.gray, fontSize: 18.0.sp),
            ),
            Text(
              Utils.isEnglish
                  ? previewerModel.sectionName!.toString()
                  : previewerModel.sectionArName!.toString(),
              style: context.easyTheme.textTheme.bodyLarge!
                  .copyWith(fontSize: 18.0.sp),
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
              context.locale.more_info_product_category_title,
              style: context.easyTheme.textTheme.bodyLarge!
                  .copyWith(color: ColorName.gray, fontSize: 18.0.sp),
            ),
            Text(
              Utils.isEnglish
                  ? previewerModel.categoryName!
                  : previewerModel.categoryArName!,
              style: context.easyTheme.textTheme.bodyLarge!
                  .copyWith(fontSize: 18.0.sp),
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
              context.locale.more_info_product_year_title,
              style: context.easyTheme.textTheme.bodyLarge!
                  .copyWith(color: ColorName.gray, fontSize: 18.0.sp),
            ),
            Text(
              previewerModel.year!,
              style: context.easyTheme.textTheme.bodyLarge!
                  .copyWith(fontSize: 18.0.sp),
            ),
          ],
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          context.locale.more_info_product_description_title,
          style: context.easyTheme.textTheme.bodyLarge!
              .copyWith(color: ColorName.gray, fontSize: 18.0.sp),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          previewerModel.description!,
          style: context.easyTheme.textTheme.bodyLarge!
              .copyWith(fontSize: 18.0.sp),
        ),
        const SizedBox(
          height: 29.0,
        ),
      ],
    );
  }
}
