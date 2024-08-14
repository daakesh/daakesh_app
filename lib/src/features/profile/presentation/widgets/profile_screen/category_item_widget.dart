import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class CategoryItemWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onTap;

  const CategoryItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: ColorName.transparent,
      splashColor: ColorName.transparent,
      highlightColor: ColorName.transparent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 23, end: 40.0, bottom: 20.0),
        child: Row(
          children: [
            SizedBox(
              width: 23.0,
              height: 23.0,
              child: icon,
            ),
            const SizedBox(
              width: 12.0,
            ),
            Text(
              title,
              style: context.easyTheme.textTheme.labelLarge!
                  .copyWith(fontSize: 16.0, color: ColorName.blueGray),
            ),
            const Spacer(
              flex: 1,
            ),
            Utils.flipWidget(
                Assets.svg.arrowRightIcon.svg(height: 16.0, width: 16.0)),
          ],
        ),
      ),
    );
  }
}
