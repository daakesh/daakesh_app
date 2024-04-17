import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class WhatsNewWidget extends StatelessWidget {
  final String title;
  const WhatsNewWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Assets.png.handmadeIcon.image(),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 12.0, top: 14.0),
          child: Text(
            title,
            style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                color: ColorName.white,
                overflow: TextOverflow.fade,
                fontSize: 25.0),
          ),
        ),
      ],
    );
  }
}
