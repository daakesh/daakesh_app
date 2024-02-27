import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class PopularCategoriesWidget extends StatelessWidget {
  final SectionItemModel data;
  const PopularCategoriesWidget({
    super.key, required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 4.0, end: 12.0, top: 4.0, bottom: 12.0),
      child: Container(
        width: 115.0,
        height: 130.0,
        decoration:  BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
          image: DecorationImage(
            image: NetworkImage(data.secImg.toString()),
            alignment: AlignmentDirectional.bottomStart
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 6,
              color: Color.fromRGBO(0, 0, 0, 0.16),
            ),
          ],
        ),
        child: Stack(
          children: [
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


