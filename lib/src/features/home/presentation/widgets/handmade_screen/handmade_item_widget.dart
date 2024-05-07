import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class HandmadeItemWidget extends StatelessWidget {
  final HandmadeItem handmadeItem;
  const HandmadeItemWidget({super.key, required this.handmadeItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => getItemsByHandMade(context, handmadeItem.id!),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
        child: Container(
          margin: const EdgeInsetsDirectional.only(top: 9.0),
          width: double.infinity,
          decoration: const BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, -0.5),
                  blurRadius: 3.0,
                )
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 11.0),
              CachedImage(
                imageUrl: handmadeItem.itemImg.toString(),
                fit: BoxFit.fill,
                width: 65.0,
                height: 65.0,
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      handmadeItem.title.toString().toString(),
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(
                              fontSize: 20.0,
                              color: ColorName.black.withOpacity(0.68)),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      handmadeItem.description.toString().toString(),
                      style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                          fontSize: 18.0, color: ColorName.mediumGray),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getItemsByHandMade(BuildContext context, int homemadeID) {
    //HandmadeBloc.get.add(GetItemsByHomemadeEvent(homemadeID: homemadeID));
    //HandmadeBloc.get.add(ResetHandmadeValueEvent());
    //Utils.openNavNewPage(context, const HandMadeItemScreen());
  }
}
