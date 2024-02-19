import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class PopularCategoriesWidget extends StatelessWidget {
  final SectionModel data;
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
            Expanded(
              child: Padding(
                padding:
                const EdgeInsetsDirectional.only(start: 11.0),
                child: Text(data.name.toString(),
                    style: easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 15.0)),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(18.0),bottomLeft: Radius.circular(18.0)),
                  child: CachedImage(imageUrl: data.secImg.toString())),
            ),
          ],
        ),
      ),
    );
  }
}


///
///       Stack(
///           fit: StackFit.expand,
///           children: [
///             ClipRRect(
///                 borderRadius: const BorderRadius.all(Radius.circular(18.0)),
///                 child: CachedImage(imageUrl:data.secImg.toString())),
///             Padding(
///               padding:
///               EdgeInsetsDirectional.only(start: 11.0.w,top: 5.0.h),
///               child: Text(data.name.toString().capitalize,
///                   style: easyTheme.textTheme.bodyMedium!
///                       .copyWith(fontSize: 16.0.sp)),
///             ),
///
///           ],
///         )
///
///
///
///
///
///