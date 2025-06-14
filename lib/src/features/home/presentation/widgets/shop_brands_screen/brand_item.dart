import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class BrandItemWidget extends StatelessWidget {
  final BrandItem brandItem;
  const BrandItemWidget({super.key, required this.brandItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => getItemsByBrand(context, brandItem.id!),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 11.0),
            CachedImage(
                imageUrl: brandItem.brandImg.toString(),
                fit: BoxFit.fill,
                width: 65.0,
                height: 65.0),
            const SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    Utils.isEnglish
                        ? brandItem.brandName.toString()
                        : brandItem.arName.toString(),
                    textAlign: TextAlign.center,
                    style: context.easyTheme.textTheme.headlineMedium!.copyWith(
                        fontSize: 20.0,
                        color: ColorName.black.withOpacity(0.68)),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    brandItem.description.toString(),
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 18.0, color: ColorName.mediumGray),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getItemsByBrand(BuildContext context, int brandID) {
    BrandsBloc.get.add(GetItemsByBrandsEvent(brandID: brandID));
    BrandsBloc.get.add(ResetValueEvent());
    BrandsBloc.get.add(GetBrandsCitiesEvent());
    Utils.openNavNewPage(context, const BrandsItemScreen());
  }
}
