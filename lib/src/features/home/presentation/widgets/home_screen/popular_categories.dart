import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class PopularCategoriesWidget extends StatelessWidget {
  final SectionItemModel data;
  final int? secIndex;
  final int? index;
  const PopularCategoriesWidget({
    super.key, required this.data, this.index, this.secIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 4.0, end: 12.0, top: 4.0, bottom: 12.0),
      child: Container(
        width: 115.0,
        height: 130.0,
        decoration:  const BoxDecoration(
          color:ColorName.white,
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 6,
              color: Color.fromRGBO(0, 0, 0, 0.16),
            ),
          ],
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            FadeInImageWidget(imageUrl: data.secImg.toString(),isCircle: false),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 11.0),
                child: Text(data.name.toString(), style: easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 15.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


