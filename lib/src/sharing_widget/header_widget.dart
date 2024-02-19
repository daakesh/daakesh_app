import 'package:flutter/material.dart';

import '../src.export.dart';

class HeaderWidget extends StatelessWidget {
  final bool withArrowBack;

  const HeaderWidget({
    super.key,
    this.withArrowBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorName.blueGray,
        image: DecorationImage(
          image: AssetImage(Assets.png.authScreensBackground.path),
          alignment: AlignmentDirectional.centerEnd,
        ),
      ),
      child:withArrowBack
          ? Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 53.0.h,),
                DaakeshLogoWidget(
                  isLight: true,
                  height: 44.0.h,
                ),
              ],
            ),
          ),
          IconButton(onPressed: ()=>Navigator.pop(context), icon: const Icon(Icons.arrow_back,color: ColorName.white,))
        ],
      )
          : Column(
            children: [
              SizedBox(height: 53.0.h,),
              DaakeshLogoWidget(isLight: true, width: 184.0.w,),
            ],
          ),
    );
  }
}
