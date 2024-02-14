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
      height: 150.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorName.blueGray,
        image: DecorationImage(
          image: AssetImage(Assets.png.authScreensBackground.path),
          alignment: AlignmentDirectional.centerEnd,
        ),
      ),
      child:withArrowBack ? Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          const Center(
            child: DaakeshLogoWidget(
              isLight: true,
              height: 44.0,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 38.0,start: 20.0),
            child: IconButton(onPressed: ()=>Navigator.pop(context), icon: const Icon(Icons.arrow_back,color: ColorName.white,)),
          )
        ],
      ):const Center(
        child: DaakeshLogoWidget(
          isLight: true,
          height: 44.0,
        ),
      ),
    );
  }
}
