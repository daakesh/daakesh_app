import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../src.export.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final int index;
  const CartItemWidget({
    super.key,
    required this.cartItem,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(
          horizontal: 13.0, vertical: 16.0),
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: ColorName.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.16),
              offset: Offset(0, 3),
              blurRadius: 10.0,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 4.0,
              ),
              Container(
                height: 25.0,
                constraints: const BoxConstraints(minWidth: 70.0),
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 6.0),
                decoration: const BoxDecoration(
                    color: ColorName.red,
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                child: cartItem.item!.discountPercentage != '0%'
                    ? Center(
                        child: Text(
                          '${cartItem.item!.discountPercentage} ${context.locale.cart_off_title}',
                          style: context.easyTheme.textTheme.labelLarge!
                              .copyWith(fontSize: 14.0),
                        ),
                      )
                    : const SizedBox(),
              ),
              const Spacer(
                flex: 1,
              ),
              Text(
                context.locale.by_title,
                style: context.easyTheme.textTheme.bodyMedium!
                    .copyWith(fontSize: 14.0, color: ColorName.gray),
              ),
              const SizedBox(
                width: 5.0,
              ),
              DaakeshLogoWidget(
                width: 68.0.w,
              ),
              const SizedBox(
                width: 12.0,
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 12.0,
              ),
              Expanded(
                  child: CachedImage(
                      imageUrl: cartItem.item!.itemImg!.first.toString())),
              const SizedBox(
                width: 18.0,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 80.0),
                      child: Text(
                        '${cartItem.item!.title}\n\n',
                        style: context.easyTheme.textTheme.labelMedium!
                            .copyWith(
                                fontSize: 14.0,
                                color: ColorName.gray,
                                overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          minRating: 1,
                          maxRating: 5,
                          ignoreGestures: true,
                          initialRating: 5.0,
                          itemSize: 20.0,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '5.9',
                          style: context.easyTheme.textTheme.labelMedium!
                              .copyWith(fontSize: 15.0),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '(200)',
                          style: context.easyTheme.textTheme.labelMedium!
                              .copyWith(fontSize: 13.0, color: ColorName.gray),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          context.locale.see_details_text_button,
                          style: context.easyTheme.textTheme.bodyLarge!
                              .copyWith(fontSize: 14, color: ColorName.skyBlue),
                        )),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18.0,
          ),
          Row(
            children: [
              const SizedBox(
                width: 11.0,
              ),
              Container(
                height: 28.0,
                width: 123.0,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: ColorName.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                        offset: Offset(0, 2),
                        blurRadius: 10.0,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => CartBloc.get
                          .add(DecreaseItemCountEvent(index: index)),
                      child: Container(
                        height: 28.0,
                        width: 34.0,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                            color: ColorName.lightSilver),
                        child: Center(child: Assets.svg.deleteIcon.svg()),
                      ),
                    ),
                    Text(
                      '${cartItem.quantity}',
                      style: context.easyTheme.textTheme.labelMedium!
                          .copyWith(fontSize: 21.0),
                    ),
                    GestureDetector(
                      onTap: () => CartBloc.get
                          .add(IncreaseItemCountEvent(index: index)),
                      child: Container(
                        height: 28.0,
                        width: 34.0,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                            color: ColorName.lightSilver),
                        child: Center(child: Assets.svg.plusIcon.svg()),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: context.locale.cart_item_price_title,
                        style: context.easyTheme.textTheme.labelMedium!
                            .copyWith(fontSize: 21.0)),
                    TextSpan(
                        text:
                            '\$${Utils.appToStringAsFixed(cartItem.item!.priceAfterDiscount * cartItem.quantity!, 1)}',
                        style: context.easyTheme.textTheme.labelMedium!
                            .copyWith(fontSize: 21.0)),
                  ],
                ),
              ),
              const SizedBox(
                width: 11.0,
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
