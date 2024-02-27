import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../../src.export.dart';
class SendSwapAcceptedItem extends StatelessWidget {
  const SendSwapAcceptedItem({super.key});

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
            Text('Swap Requests:',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 18.0.sp,color: ColorName.black),),
            SizedBox(width: 3.0.w,),
            Text('#12354',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 18.0.sp,color: ColorName.black),),
            SizedBox(width: 9.0.w,),
            const Spacer(flex: 1,),
            Text(
              'Accepted',
              style: easyTheme.textTheme.headlineMedium!.copyWith(
                  fontSize: 12.0.sp,
                  color: ColorName.springGreen),
            ),
            SizedBox(width: 15.0.w,),
          ],),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0.w),
            child: Text('Request In: 12/12/2012',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 14.0.sp,color: ColorName.gray,),),
          ),
          SizedBox(height: 8.0.h),
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
              SizedBox(width: 50.0.w),
              Text(
                'Product',
                overflow: TextOverflow.ellipsis,
                style: easyTheme.textTheme.bodyMedium!
                    .copyWith(fontSize: 14.0.sp,color: ColorName.burgundy),
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
              SizedBox(width: 50.0.w),
              Text(
                'Offered',
                overflow: TextOverflow.ellipsis,
                style: easyTheme.textTheme.bodyMedium!
                    .copyWith(fontSize: 14.0.sp,color: ColorName.burgundy),
              ),
              SizedBox(width: 16.0.w),
            ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 60.0.w),
            child: TextButtonWidget(text: 'See All Details', onPressed: ()=>seeAllDetails(context),isBold: true,),
          ),
          Divider(color: ColorName.gray,endIndent: 16.5.w,indent: 16.5.w,),
          Row(children: [
            SizedBox(width: 19.0.w),
            Expanded(
              child: DefaultButtonWidget(
                text: 'CALL',
                onPressed: () {},
                style: easyTheme.elevatedButtonTheme.style,
              ),
            ),
            SizedBox(width: 9.0.w,),
            Expanded(
              child: DefaultButtonWidget(
                text: 'WhatsApp',
                onPressed: () {},
                style: easyTheme.elevatedButtonTheme.style!.copyWith(
                  backgroundColor: MaterialStateProperty.all(ColorName.amber),

                ),
              ),
            ),
            SizedBox(width: 19.0.w),
          ],),
          SizedBox(height: 13.0.h),
        ],
      ),
    );
  }
  void seeAllDetails(context){
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: const SwapRequestDetailsScreen(),
      withNavBar: true,
    );
  }
}
