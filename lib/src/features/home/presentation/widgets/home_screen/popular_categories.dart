import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class PopularCategoriesWidget extends StatelessWidget {
  final SectionItemModel data;
  final int? index;
  final bool withSelected;
  const PopularCategoriesWidget({
    super.key,
    required this.data,
    this.index,
    this.withSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 4.0, end: 12.0, top: 4.0, bottom: 12.0),
      child: BlocBuilder<SectionsBloc, SectionsState>(
        builder: (context, state) {
          return Container(
            width: 115.0,
            height: 130.0,
            decoration: BoxDecoration(
              color: state.sectionIndex == index
                  ? const Color(0xFFf2cd98)
                  : Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(18.0)),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    color: Color.fromRGBO(0, 0, 0, 0.16)),
              ],
            ),
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 11.0),
                    child: Text(
                        Utils.isEnglish
                            ? data.name.toString()
                            : data.arName.toString(),
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 15.0,
                            color: state.sectionIndex == index
                                ? ColorName.white
                                : ColorName.black)),
                  ),
                ),
                Expanded(
                  child: CachedImage(
                    imageUrl: data.secImg.toString(),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(18.0),
                        bottomLeft: Radius.circular(18.0)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
