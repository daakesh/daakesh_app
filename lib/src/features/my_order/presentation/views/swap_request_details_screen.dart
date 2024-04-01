import 'package:flutter/material.dart';

import '../../../../src.export.dart';

class SwapRequestDetailsScreen extends StatelessWidget {
  const SwapRequestDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorName.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorName.whiteSmoke,
          body: LayoutBuilderWidget(
            child: Column(
              children: [
                const HeaderWidget(withArrowBack: true, isLight: true),
                SizedBox(
                  height: 16.0.h,
                ),
                Text(
                  'Swap Requests Details',
                  style: context.easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 22.0.sp),
                ),
                SizedBox(
                  height: 21.0.h,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsetsDirectional.symmetric(horizontal: 21.0.w),
                  decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.all(Radius.circular(4.0.r)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(0, 0, 0, 0.16),
                          offset: const Offset(0, 3),
                          blurRadius: 6.0.r,
                        )
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 11.0.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 32.0.h),
                        child: Assets.png.glasses
                            .image(height: 126.0.h, width: 126.0.w),
                      ),
                      SizedBox(
                        width: 18.0.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.0.h,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 45.0.w),
                              child: Text(
                                'AquaOasis™ Cool Mist Humidefier (2.2L Water',
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 20.0.sp,
                                        color: ColorName.gray,
                                        overflow: TextOverflow.fade),
                              ),
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Assets.svg.locationPinIcon.svg(
                                    color: ColorName.amber,
                                    height: 22.0.h,
                                    width: 15.0.w),
                                SizedBox(
                                  width: 6.0.w,
                                ),
                                Expanded(
                                    child: Text(
                                  'Swap In Amman, Jordan',
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(fontSize: 16.0.sp),
                                  overflow: TextOverflow.fade,
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 15.0.h,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(start: 6.0.w),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'By ',
                                        style: context
                                            .easyTheme.textTheme.bodyMedium!
                                            .copyWith(
                                                fontSize: 20.0.sp,
                                                color: ColorName.gray)),
                                    TextSpan(
                                        text: 'NF Store',
                                        style: context
                                            .easyTheme.textTheme.bodyMedium!
                                            .copyWith(fontSize: 20.0.sp)),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 13.0.w),
                              child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: TextButtonWidget(
                                  text: 'See Details',
                                  onPressed: () {},
                                  isBold: true,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12.0.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 13.0.h,
                ),
                SizedBox(
                  height: 50.0.h,
                  width: 50.0.w,
                  child: Assets.png.swapIcon.image(),
                ),
                SizedBox(
                  height: 13.0.h,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsetsDirectional.symmetric(horizontal: 21.0.w),
                  decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.all(Radius.circular(4.0.r)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(0, 0, 0, 0.16),
                          offset: const Offset(0, 3),
                          blurRadius: 6.0.r,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 11.0.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 32.0.h),
                            child: Assets.png.glasses
                                .image(height: 126.0.h, width: 126.0.w),
                          ),
                          SizedBox(
                            width: 18.0.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20.0.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(end: 45.0.w),
                                  child: Text(
                                    'AquaOasis™ Cool Mist Humidefier (2.2L Water',
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                            fontSize: 20.0.sp,
                                            color: ColorName.gray,
                                            overflow: TextOverflow.fade),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Assets.svg.locationPinIcon.svg(
                                        color: ColorName.amber,
                                        height: 22.0.h,
                                        width: 15.0.w),
                                    SizedBox(
                                      width: 6.0.w,
                                    ),
                                    Expanded(
                                        child: Text(
                                      'Swap In Amman, Jordan',
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(fontSize: 16.0.sp),
                                      overflow: TextOverflow.fade,
                                    )),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(start: 6.0.w),
                                  child: Text('Your Product',
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(fontSize: 20.0.sp)),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      end: 13.0.w, top: 14.0.h),
                                  child: Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: TextButtonWidget(
                                      text: 'See Product Details',
                                      onPressed: () {},
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(
                                        fontSize: 14.0.sp,
                                        fontWeight: FontWeight.bold,
                                        color: ColorName.skyBlue,
                                      ),
                                      isBold: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 22.0.w, end: 14.0.w),
                        child: Text(
                          'Your Comment',
                          style: context.easyTheme.textTheme.bodyLarge!
                              .copyWith(
                                  fontSize: 20.0.sp,
                                  color: ColorName.black.withOpacity(0.5)),
                        ),
                      ),
                      SizedBox(
                        height: 13.0.h,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 22.0.w, end: 14.0.w, bottom: 20.0.h),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore',
                          style:
                              context.easyTheme.textTheme.bodyLarge!.copyWith(
                            fontSize: 14.0.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
