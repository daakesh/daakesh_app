import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../../src.export.dart';

class ReceiveSwapItem extends StatelessWidget {
  const ReceiveSwapItem({super.key});

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
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Padding(
              padding: EdgeInsetsDirectional.only(end: 17.0.w, top: 7.0.h),
              child: Text(
                'Waiting',
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 12.0.sp, color: ColorName.red),
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
                      height: 8.0.h,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: '(',
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      color: ColorName.gray,
                                      fontSize: 16.0.sp)),
                          TextSpan(
                              text: '25',
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      color: ColorName.red, fontSize: 16.0.sp)),
                          TextSpan(
                              text: ') ',
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      color: ColorName.gray,
                                      fontSize: 16.0.sp)),
                          TextSpan(
                              text: 'Offers Submitted',
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
            height: 23.0.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Center(
                child: DefaultButtonWidget(
                    text: 'START SWAP', onPressed: () => onStartSwap(context))),
          ),
          SizedBox(
            height: 16.0.h,
          ),
        ],
      ),
    );
  }

  void onStartSwap(context) {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: const StartSwapScreen(),
      withNavBar: true, // OPTIONAL VALUE. True by default.
    );
  }
}
