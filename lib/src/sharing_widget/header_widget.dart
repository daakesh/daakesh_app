import 'package:flutter/material.dart';

import '../src.export.dart';

class HeaderWidget extends StatelessWidget {
  final bool withArrowBack;
  final bool isLight;
  final double? height;

  const HeaderWidget({
    super.key,
    this.withArrowBack = true,
    this.isLight = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isLight ? 130.h : 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isLight ? ColorName.white : ColorName.blueGray,
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Opacity(
              opacity: 0.3,
              child: Assets.svg.line
                  .svg(alignment: AlignmentDirectional.bottomEnd),
            ),
            withArrowBack
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
                              horizontal: 18.0.w, vertical: 16.0.h),
                          child: Assets.svg.arrowBackIcon.svg(
                              color: isLight
                                  ? ColorName.blueGray
                                  : ColorName.white,
                              height: 20.0.h,
                              width: 20.0.w),
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: DaakeshLogoWidget(
                          isLight: isLight ? false : true,
                          width: 184.0.w,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
