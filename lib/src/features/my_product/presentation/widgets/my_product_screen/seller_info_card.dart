import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../src.export.dart';

class SellerInfoCard extends StatelessWidget {
  const SellerInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 21.0),
      padding: const EdgeInsetsDirectional.only(start:16.0 ,end:13.0,bottom: 15.0,top: 11.0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: ColorName.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 3.0,
              color: Color.fromRGBO(0, 0, 0, 0.16),
            ),
          ]

      ),
      child: Column(
        children: [
          Row(children: [
            Expanded(child: Text('Seller Info',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 18.0),)),
              InkWell(
                onTap:onEditSellerInfo,
                child: Text(
                  'Edit',
                  style: easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 16.0, color: ColorName.skyBlue),
                ),
              ),
            ],),
          const SizedBox(height: 9.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('USED NAME',style: easyTheme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),),
                  const SizedBox(height: 2.0,),
                  Text('Mahdi Murad',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 14.0),),
                ],),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('USED PHONE',style: easyTheme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),),
                  const SizedBox(height: 2.0,),
                  Text('Xxxxxxxxxxx',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 14.0),),

                ],),
            ),
          ],),
          const SizedBox(height: 8.0,),
          Row(children: [

            Text('Your Store Rate:',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 14.0,color: ColorName.grayish),),
            const SizedBox(width: 2.0,),
            RatingBar.builder(
              direction: Axis.horizontal,
              allowHalfRating: true,
              minRating: 1,
              maxRating: 5,
              ignoreGestures: true,
              initialRating: 5.0,
              itemSize: 18.0,
              tapOnlyMode: true,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
            const SizedBox(width: 4.0,),
            Expanded(child: Text('5.9',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 13.0,color: ColorName.black),)),
            Text('Active',style: easyTheme.textTheme.labelMedium!.copyWith(fontSize: 16.0,color: ColorName.darkGreen),),






          ],),







        ],
      ),
    );
  }

  void onEditSellerInfo() {
    openNewPage(const EditSellerInfoScreen());
  }
}
