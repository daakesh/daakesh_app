import 'package:flutter/material.dart';

import '../../../../../../src.export.dart';

class ReceiveDoneDealItem extends StatelessWidget {
  const ReceiveDoneDealItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.only(
          start: 15.0.w, end: 15.0.w, bottom: 11.0.h),
      decoration: BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.all(Radius.circular(11.0.r)),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 3.0,
                color: Color.fromRGBO(0, 0, 0, 0.16))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 19.0.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 12.0.w),
              Assets.png.glasses.image(height: 90.0.h, width: 90.0.w),
              SizedBox(width: 18.0.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 80.0.w),
                      child: Text(
                        'AquaOasis™ Cool Mist Humidefier (2.2L Water',
                        style: context.easyTheme.textTheme.labelMedium!
                            .copyWith(
                                fontSize: 15.0.sp,
                                color: ColorName.gray,
                                overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    Text(
                      'Amman, Jordan',
                      style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                        fontSize: 13.0.sp,
                        color: ColorName.mediumSilver,
                      ),
                    ),
                    SizedBox(
                      height: 12.0.h,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'You Made A Deal With ',
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      color: ColorName.springGreen,
                                      fontSize: 16.0.sp)),
                          TextSpan(
                              text: 'NF Store',
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      color: ColorName.black,
                                      fontSize: 15.0.sp)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 18.0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 15.0.w),
                child: Text('Swap Product',
                    style: context.easyTheme.textTheme.labelLarge!
                        .copyWith(fontSize: 15.0.sp, color: ColorName.black)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(end: 15.0.w),
                child: TextButtonWidget(
                  text: 'See Offer Details',
                  style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                    fontSize: 14.0.sp,
                    color: ColorName.skyBlue,
                    fontFamily: FontFamily.apercuBold,
                  ),
                  onPressed: () {},
                  isBold: true,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3.0.h,
          ),
          Container(
            width: double.infinity,
            height: 42.0.h,
            color: ColorName.lightGrayishBlue,
            child: Row(
              children: [
                SizedBox(width: 14.0.w),
                Assets.png.glasses.image(width: 32.0.w, height: 32.0.h),
                SizedBox(width: 15.0.w),
                Flexible(
                  child: Text(
                    'AquaOasis™ Cool Mist Humidefier (2.2L Water',
                    overflow: TextOverflow.ellipsis,
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14.0.sp, color: ColorName.gray),
                  ),
                ),
                SizedBox(width: 15.0.w),
                Text(
                  'Product',
                  overflow: TextOverflow.ellipsis,
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 14.0.sp, color: ColorName.burgundy),
                ),
                SizedBox(width: 16.0.w),
              ],
            ),
          ),
          SizedBox(
            height: 17.0.h,
          ),
          Divider(
            color: ColorName.gray,
            indent: 15.0.w,
            endIndent: 15.0.w,
          ),
          Row(
            children: [
              SizedBox(
                width: 17.0.w,
              ),
              Expanded(
                  child: DefaultButtonWidget(text: 'CALL', onPressed: () {})),
              SizedBox(
                width: 9.0.w,
              ),
              Expanded(
                child: DefaultButtonWidget(
                  text: 'WhatsApp',
                  onPressed: () {},
                  style: context.easyTheme.elevatedButtonTheme.style!.copyWith(
                      backgroundColor:
                          MaterialStateProperty.all(ColorName.amber)),
                ),
              ),
              SizedBox(
                width: 17.0.w,
              ),
            ],
          ),
          SizedBox(
            height: 16.0.h,
          ),
        ],
      ),
    );
  }
}
