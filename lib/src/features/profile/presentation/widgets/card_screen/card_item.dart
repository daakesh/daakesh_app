import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class CardItem extends StatelessWidget {
  final String title;
  final int index;
  final int activeIndex;
  final VoidCallback onTap;
  final EdgeInsetsGeometry margin;

  ///
  final CardsTypes cardType;

  const CardItem({
    super.key,
    required this.title,
    required this.index,
    required this.activeIndex,
    required this.onTap,
    this.cardType = CardsTypes.None,
    this.margin = const EdgeInsetsDirectional.symmetric(horizontal: 0.0),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: ColorName.transparent,
      splashColor: ColorName.transparent,
      highlightColor: ColorName.transparent,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: margin,
        height: 51,
        decoration: const BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 3),
                color: Color.fromRGBO(0, 0, 0, 0.16),
                blurRadius: 6.0)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorName.gray),
                  color:
                      activeIndex == index ? ColorName.amber : ColorName.white,
                ),
              ),
              const SizedBox(
                width: 11.0,
              ),
              Text(
                title,
                style: context.easyTheme.textTheme.bodyLarge!
                    .copyWith(fontSize: 18.0, color: ColorName.black),
              ),
              const Spacer(
                flex: 1,
              ),
              cardsTypeHandler(cardType),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardsTypeHandler(cardType) {
    switch (cardType) {
      case CardsTypes.VISA:
        return Assets.png.visaIcon.image(width: 26.0, height: 26.0);
      case CardsTypes.MASTERCARD:
        return Assets.png.mastercardIcon.image(width: 26.0, height: 26.0);
      case CardsTypes.AMIRICANEXPRESS:
        return Assets.png.americanExpressIcon.image(width: 26.0, height: 26.0);
      default:
        return const SizedBox();
    }
  }
}
