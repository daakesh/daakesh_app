import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class MyOrderItem extends StatelessWidget {
  final int index;
  const MyOrderItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.only(start: 15.0.w,end: 15.0.w,bottom: 11.0.h),
      decoration: BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.all(Radius.circular(11.0.r)),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0,3),
                blurRadius: 3.0,
                color: Color.fromRGBO(0, 0, 0, 0.16)
            )
          ]

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(height: 9.0.h),
        Row(children: [
          SizedBox(width: 14.0.w,),
          Text('Order ID :',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 18.0.sp,color: ColorName.black),),
          SizedBox(width: 3.0.w,),
          Text('#',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 20.0.sp,color: ColorName.black),),
          Text('12354',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 18.0.sp,color: ColorName.black),),
          SizedBox(width: 9.0.w,),
              index % 2 == 0
                  ? Text('On The Way',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 12.0.sp,color: ColorName.ceruleanBlue),)
                  : Text('Delivered',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 12.0.sp,color: ColorName.springGreen),),
          const Spacer(flex: 1,),
          Text(
                '\$88.6',
                style: easyTheme.textTheme.labelLarge!.copyWith(
                    fontSize: 21.0.sp,
                    color: ColorName.black),
              ),
          SizedBox(width: 19.0.w,),
        ],),
        Row(children: [
          SizedBox(width: 14.0.w,),
          Text('Poced In: 12/12/2012',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 14.0.sp,color: ColorName.gray,),),
          const Spacer(flex: 1,),
          Text('Total Price',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 14.0.sp,color: ColorName.gray,),),
          SizedBox(width: 11.0.w,),

        ],),
        SizedBox(height: 11.0.h),
        Container(
          width: double.infinity,
          height: 42.0.h,
          color: ColorName.lightGrayishBlue,
          child: Row(children: [
            SizedBox(width: 14.0.w),
            Assets.png.glasses.image(width: 32.0.w, height: 32.0.h),
            SizedBox(width: 15.0.w),
            Flexible(
                  child: Text(
                    'AquaOasis™ Cool Mist Humidefier (2.2L Water',
                    overflow: TextOverflow.ellipsis,
                    style: easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14.0.sp,color: ColorName.gray),
                  ),
                ),
            SizedBox(width: 15.0.w),
            Text(
              '1 Item',
              overflow: TextOverflow.ellipsis,
              style: easyTheme.textTheme.bodyMedium!
                  .copyWith(fontSize: 14.0.sp,color: ColorName.gray),
            ),
            SizedBox(width: 16.0.w),

              ],
            ),
          ),
        SizedBox(height: 4.0.h),
        Container(
          width: double.infinity,
          height: 42.0.h,
          color: ColorName.white,
          child: Row(children: [
            SizedBox(width: 14.0.w),
            Assets.png.glasses.image(width: 32.0.w,height: 32.0.h),
            SizedBox(width: 15.0.w),
            Flexible(
              child: Text(
                'AquaOasis™ Cool Mist Humidefier (2.2L Water',
                overflow: TextOverflow.ellipsis,
                style: easyTheme.textTheme.bodyMedium!
                    .copyWith(fontSize: 14.0.sp,color: ColorName.gray),
              ),
            ),
            SizedBox(width: 15.0.w),
            Text(
              '1 Item',
              overflow: TextOverflow.ellipsis,
              style: easyTheme.textTheme.bodyMedium!
                  .copyWith(fontSize: 14.0.sp,color: ColorName.gray),
            ),
            SizedBox(width: 16.0.w),

          ],
          ),
        ),
        Divider(color: ColorName.gray,endIndent: 16.5.w,indent: 16.5.w,),
        SizedBox(height: 9.0.h),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 14.0.w),
          child: Text.rich(TextSpan(children: [
            TextSpan(text: 'Shipping to : ',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 14.0)),
            TextSpan(text: 'Jordan , Amman , Tla Ali ,29.',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 14.0,color: ColorName.gray)),
          ])),
        ),
        SizedBox(height: 13.0.h),
        ],),
    );
  }



}
