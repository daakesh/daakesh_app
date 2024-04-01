import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class SwapSectionCategoryItem extends StatelessWidget {
  final SwapCategoryItem swapCategoryItem;
  const SwapSectionCategoryItem({super.key, required this.swapCategoryItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
      child: Container(
        margin: const EdgeInsetsDirectional.only(top: 9.0),
        width: double.infinity,
        decoration: const BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, -0.5),
                blurRadius: 3.0,
              )
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 11.0),
            Container(
              width: 65.0,
              height: 65.0,
              margin: const EdgeInsetsDirectional.only(top: 9.0, bottom: 9.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorName.gray.withOpacity(0.5),
              ),
              child: CachedImage(
                imageUrl: swapCategoryItem.catImg.toString(),
                borderRadius: const BorderRadius.all(Radius.circular(100.0)),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    swapCategoryItem.name.toString(),
                    style: context.easyTheme.textTheme.headlineMedium!.copyWith(
                        fontSize: 20.0,
                        color: ColorName.black.withOpacity(0.68)),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    swapCategoryItem.description.toString(),
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 18.0, color: ColorName.mediumGray),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 18.0, top: 8.0),
              child: Text(
                '(${swapCategoryItem.swapSubCategoryList!.length})',
                style: context.easyTheme.textTheme.labelLarge!
                    .copyWith(fontSize: 16.0, color: ColorName.gray),
              ),
            )
          ],
        ),
      ),
    );
  }
}
