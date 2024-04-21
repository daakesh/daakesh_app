import 'package:flutter/material.dart';

import '../src.export.dart';

class HeaderWidget extends StatelessWidget {
  final bool withArrowBack;
  final bool isLight;

  const HeaderWidget({
    super.key,
    this.withArrowBack = true,
    this.isLight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isLight ? ColorName.white : ColorName.blueGray,
        image: DecorationImage(
          image: AssetImage(Assets.png.authScreensBackground.path),
          alignment: AlignmentDirectional.centerEnd,
        ),
      ),
      child: withArrowBack
          ? Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.0.h,
                      ),
                      DaakeshLogoWidget(
                        isLight: isLight ? false : true,
                        width: 184.0.w,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 18.0.w, vertical: 20.0.h),
                    child: Assets.svg.arrowBackIcon.svg(
                        color: isLight ? ColorName.blueGray : ColorName.white,
                        height: 20.0.h,
                        width: 20.0.w),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                SizedBox(
                  height: 40.0.h,
                ),
                DaakeshLogoWidget(
                  isLight: isLight ? false : true,
                  width: 184.0.w,
                ),
              ],
            ),
    );
  }
}
