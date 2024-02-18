import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../src.export.dart';

class SellerInfoCard extends StatelessWidget {
  const SellerInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.symmetric(horizontal: 21.0.w),
      padding: EdgeInsetsDirectional.only(start:16.0.w ,end:13.0.w,bottom: 15.0.h,top: 11.0.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
          color: ColorName.white,
          boxShadow: const [
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
            Expanded(child: Text('Seller Info',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 19.0.sp),)),
              InkWell(
                onTap:onEditSellerInfo,
                child: Text(
                  'Edit',
                  style: easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 14.0.sp, color: ColorName.skyBlue),
                ),
              ),
            ],),
           SizedBox(height: 9.0.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('USED NAME',style: easyTheme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600,fontSize: 13.0.sp),),
                   SizedBox(height: 2.0.h,),
                  Text('Mahdi Murad',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 14.0.sp),),
                ],),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('USED PHONE',style: easyTheme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600,fontSize: 13.0.sp),),
                  SizedBox(height: 2.0.h,),
                  Text('Xxxxxxxxxxx',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 14.0.sp),),

                ],),
            ),
          ],),
          SizedBox(height: 8.0.h,),
          Row(children: [
            Text('Your Store Rate:',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 13.0.sp,color: ColorName.grayish),),
            SizedBox(width: 8.0.w,),
            RatingBar.builder(
              direction: Axis.horizontal,
              allowHalfRating: true,
              minRating: 1,
              maxRating: 5,
              ignoreGestures: true,
              initialRating: 5.0,
              itemSize: 14.0.sp,
              tapOnlyMode: true,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
            SizedBox(width: 9.0.sp,),
            Expanded(child: Text('5.9',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 13.0.sp,color: ColorName.black),)),
            Text('Active',style: easyTheme.textTheme.labelMedium!.copyWith(fontSize: 16.0.sp,color: ColorName.darkGreen),),
          ],),

        ],
      ),
    );
  }

  void onEditSellerInfo() {
    openNewPage(EditSellerInfoScreen());
  }
}
