import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:json_theme/json_theme.dart';
import '../../../../../src.export.dart';

class ShopProductItem extends StatelessWidget {
  const ShopProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((_, index) {
          return Container(
            width: double.infinity,
            margin: EdgeInsetsDirectional.only(
              start:15.0.w,
              end:15.0.w,
              bottom:13.0.h,
            ),
            decoration:BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0.r)),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 3),
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    blurRadius: 6.0),
              ],
            ),
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              fit: StackFit.loose,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(end: 20.0.w, top: 12.0.h),
                        child: Text(
                          'Edit',
                          style: easyTheme.textTheme.bodyLarge!
                              .copyWith(fontSize: 12.0.sp, color: ColorName.skyBlue),
                        ),
                      ),
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
                                  style: easyTheme.textTheme.labelMedium!.copyWith(
                                      fontSize: 15.0.sp,
                                      color: ColorName.gray,
                                      overflow: TextOverflow.ellipsis),
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(
                                height: 8.0.h,
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    minRating: 1,
                                    maxRating: 5,
                                    ignoreGestures: true,
                                    initialRating: 5.0,
                                    itemSize: 14.6.h,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                  SizedBox(width: 8.0.w),
                                  Text(
                                    '5.9',
                                    style: easyTheme.textTheme.labelMedium!
                                        .copyWith(fontSize: 15.0.sp),
                                  ),
                                  SizedBox(width: 8.0.w),
                                  Text(
                                    '(200)',
                                    style: easyTheme.textTheme.labelMedium!.copyWith(
                                        fontSize: 13.0.sp, color: ColorName.gray),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 38.0.h,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '\$44',
                                          style: easyTheme.textTheme.labelMedium!
                                              .copyWith(fontSize: 21.0.sp),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 2.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                '99',
                                                style: easyTheme
                                                    .textTheme.labelMedium!
                                                    .copyWith(
                                                    fontSize: 15.0.sp,
                                                    color: ColorName.gray),
                                              ),
                                              SizedBox(width: 8.0.w),
                                              Text(
                                                '\$79.99',
                                                style: easyTheme
                                                    .textTheme.labelMedium!
                                                    .copyWith(
                                                  fontSize: 15.0.sp,
                                                  color: ColorName.gray,
                                                  decoration: TextDecoration.lineThrough,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: ColorName.gray,
                      endIndent: 17.0.w,
                      indent: 17.0.w,
                    ),
                    SizedBox(
                      height: 15.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Entry Date : ',
                                          style: easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                              fontSize: 15.0.sp,
                                              color: ColorName.gray)),
                                      TextSpan(
                                          text: '12/12/2012',
                                          style: easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                              fontSize: 15.0.sp,
                                              color: ColorName.black)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 11.0,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Categories : ',
                                          style: easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                              fontSize: 15.0.sp,
                                              color: ColorName.gray)),
                                      TextSpan(
                                          text: 'MEN',
                                          style: easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                              fontSize: 15.0.sp,
                                              color: ColorName.black)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Quantity : ',
                                          style: easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                              fontSize: 15.0.sp,
                                              color: ColorName.gray)),
                                      TextSpan(
                                          text: '200',

                                          style: easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                              fontSize:15.0.sp,
                                              color: ColorName.black)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 11.0,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Ship To : ',
                                          style: easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                              fontSize: 15.0.sp,
                                              color: ColorName.gray)),
                                      TextSpan(
                                          text: 'ALL',
                                          style: easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                              fontSize: 15.0.sp,
                                              color: ColorName.black)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 14.0.h),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30.0.h,
                      constraints: BoxConstraints(minWidth: 70.0.w,),
                      margin:EdgeInsetsDirectional.symmetric(horizontal: 6.0.w),
                      padding:EdgeInsetsDirectional.symmetric(horizontal: 6.0.w),
                      decoration:BoxDecoration(
                          color: ColorName.red,
                          borderRadius: BorderRadius.all(Radius.circular(4.0.r))),
                      child: Center(
                        child: Text(
                          '23% OFF',
                          style: easyTheme.textTheme.labelLarge!
                              .copyWith(fontSize: 15.0.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }, childCount: 20));
  }
}
