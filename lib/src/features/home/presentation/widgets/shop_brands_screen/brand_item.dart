import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class BrandItemWidget extends StatelessWidget {
  final BrandItem brandItem;
  const BrandItemWidget({super.key, required this.brandItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
      child: Container(
        margin: const EdgeInsetsDirectional.only(top: 9.0),
        width: double.infinity,
        decoration:  const BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, -0.5),
                blurRadius: 3.0,
              )
            ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 11.0),
            CachedImage(
              imageUrl: brandItem.brandImg.toString(),
              fit: BoxFit.fill,
              width: 65.0,
              height: 65.0,

            ),
            const SizedBox(width: 12.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0,),
                  Text(brandItem.brandName.toString().toString(),style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 20.0,color: ColorName.black.withOpacity(0.68)),),
                  const SizedBox(height: 4.0),
                  Text(brandItem.description.toString().toString(),style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.mediumGray),),
                  const SizedBox(height: 10.0,),

                ],),
            ),
          ],
        ),
      ),
    );
  }
}
