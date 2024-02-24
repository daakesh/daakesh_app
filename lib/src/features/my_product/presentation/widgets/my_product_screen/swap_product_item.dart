import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class SwapProductItem extends StatelessWidget {
  const SwapProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((_, index) {
          return Container(
            width: double.infinity,
            margin:EdgeInsetsDirectional.only(
              start: 15.0.w,
              end: 15.0.w,
              bottom: 13.0.h,
            ),
            decoration:  BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0.r)),
              boxShadow: const[
                BoxShadow(
                    offset: Offset(0,3),
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    blurRadius: 6.0
                ),
              ],


            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding:EdgeInsetsDirectional.only(end: 20.0.w, top: 12.0.h),
                    child: Text(
                      'Edit',
                      style: easyTheme.textTheme.bodyLarge!
                          .copyWith(fontSize: 14.0.sp, color: ColorName.skyBlue),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 7.0.w),
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
                          SizedBox(height: 9.0.h),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Swap In :',
                                    style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 15.0.sp,color: ColorName.gray)
                                ),
                                TextSpan(
                                    text: 'Amman, Jordan',
                                    style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 13.0.sp,color: ColorName.black)
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Display:',
                                    style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 15.0.sp,color: ColorName.gray)
                                ),
                                TextSpan(
                                    text: 'Public',
                                    style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 13.0.sp,color: ColorName.black)
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.0.h),
              ],
            ),
          );
        }, childCount: 20));
  }
}
