import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class PopularCategoriesWidget extends StatelessWidget {
  const PopularCategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 4.0, end: 12.0, top: 4.0, bottom: 12.0),
      child: Container(
        width: 115.0,
        height: 130.0,
        decoration: const BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 6,
              color: Color.fromRGBO(0, 0, 0, 0.16),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 2.0,
            ),
            Padding(
              padding:
              const EdgeInsetsDirectional.only(start: 11.0),
              child: Text('Baby',
                  style: easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 20.0)),
            ),
            Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Assets.png.babyIcon
                    .image(width: 101.0, height: 90.0)),
          ],
        ),
      ),
    );
  }
}
