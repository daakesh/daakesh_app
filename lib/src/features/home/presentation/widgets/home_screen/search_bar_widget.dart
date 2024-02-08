import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorName.blueGray,
        image:DecorationImage(
          image: AssetImage(Assets.png.authScreensBackground.path),
          alignment: AlignmentDirectional.centerEnd,
        ),

      ),
      child: const Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 53.0,
            ),
            Center(
                child: DaakeshLogoWidget(
              isLight: true,
              height: 44.0,
            )),

          ],
        ),
      ),
    );
  }
}
