import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class WhatsNewWidget extends StatelessWidget {
  const WhatsNewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 202.0,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 4.0, end: 12.0, top: 4.0, bottom: 12.0),
        child: Stack(
          children: [
            Container(
              width: 194.0,
              height: 200.0,
              decoration: const BoxDecoration(
                color: ColorName.gray,
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                  ),
                ],
              ),
              child: Assets.png.handmadeIcon.image(fit: BoxFit.fill),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 12.0,top: 14.0),
              child: SizedBox(
                width: 148.0,
                child: Text('Handmade',
                  style: easyTheme.textTheme.bodyMedium!.copyWith(
                    color: ColorName.white,
                    overflow:TextOverflow.fade,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
