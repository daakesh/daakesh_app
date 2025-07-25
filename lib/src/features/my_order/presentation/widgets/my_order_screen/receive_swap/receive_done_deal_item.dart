import 'package:flutter/material.dart';
import '../../../../../../src.export.dart';

class ReceiveDoneDealItem extends StatelessWidget {
  final SendReceiveSwapReqItem receiveSwapReqItem;
  final int approved;
  const ReceiveDoneDealItem({
    super.key,
    required this.receiveSwapReqItem,
    required this.approved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.only(start: 15, end: 15, bottom: 11),
      decoration: const BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.all(Radius.circular(11)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 3.0,
                color: Color.fromRGBO(0, 0, 0, 0.16))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 19,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 12),
              Expanded(
                child: CachedImage(
                    imageUrl: receiveSwapReqItem.offerItems!.itemImg != null
                        ? receiveSwapReqItem.offerItems!.itemImg!.first
                        : ''),
              ),
              const SizedBox(width: 18),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 80),
                      child: Text(
                        '${receiveSwapReqItem.offerItems!.title}\n',
                        style: context.easyTheme.textTheme.labelMedium!
                            .copyWith(
                                fontSize: 15,
                                color: ColorName.gray,
                                overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Text(
                      '${receiveSwapReqItem.offerItems!.citySwap}, ${receiveSwapReqItem.offerItems!.countrySwap}',
                      style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                        fontSize: 13,
                        color: ColorName.mediumSilver,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: approved == 1
                                  ? context.locale.you_made_a_deal_title
                                  : context.locale.you_not_made_a_deal_title,
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      color: approved == 1
                                          ? ColorName.springGreen
                                          : ColorName.red,
                                      fontSize: 14)),
                          TextSpan(
                              text: '${receiveSwapReqItem.offerUser!.name}',
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      color: ColorName.black, fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 15),
                child: Text(context.locale.swap_product_title,
                    style: context.easyTheme.textTheme.labelLarge!
                        .copyWith(fontSize: 15, color: ColorName.black)),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 15),
                child: TextButtonWidget(
                  text: context.locale.see_offer_details,
                  style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    color: ColorName.skyBlue,
                  ),
                  onPressed: () {
                    Utils.openNavNewPage(
                        context,
                        StartSwapScreen(
                          sendReceiveSwapReqItem: receiveSwapReqItem,
                          isPreviewer: true,
                        ));
                  },
                  isBold: true,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            width: double.infinity,
            height: 50,
            color: ColorName.lightGrayishBlue,
            child: Row(
              children: [
                const SizedBox(width: 14),
                Expanded(
                  child: CachedImage(
                      imageUrl: receiveSwapReqItem.sourceItems!.itemImg != null
                          ? receiveSwapReqItem.sourceItems!.itemImg!.first
                          : ''),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 4,
                  child: Text(
                    '${receiveSwapReqItem.sourceItems!.title}',
                    overflow: TextOverflow.ellipsis,
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, color: ColorName.gray),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  context.locale.product_title,
                  overflow: TextOverflow.ellipsis,
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 14, color: ColorName.burgundy),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          approved == 1
              ? const Divider(
                  color: ColorName.gray,
                  indent: 15,
                  endIndent: 15,
                )
              : const SizedBox(),
          approved == 1
              ? Row(
                  children: [
                    const SizedBox(
                      width: 17,
                    ),
                    Expanded(
                        child: DefaultButtonWidget(
                            text: context.locale.call_button_title,
                            style: context.easyTheme.elevatedButtonTheme.style!
                                .copyWith(
                              minimumSize: WidgetStateProperty.all(
                                  const Size(387.0, 40)),
                            ),
                            onPressed: () => Utils.lunchCall(receiveSwapReqItem
                                .offerUser!.phoneNumber
                                .toString()))),
                    const SizedBox(
                      width: 9,
                    ),
                    Expanded(
                      child: DefaultButtonWidget(
                        text: context.locale.whatsApp_button_title,
                        onPressed: () => Utils.lunchWhatsApp(receiveSwapReqItem
                            .offerUser!.phoneNumber
                            .toString()),
                        style: context.easyTheme.elevatedButtonTheme.style!
                            .copyWith(
                                minimumSize: WidgetStateProperty.all(
                                    const Size(387.0, 40)),
                                backgroundColor:
                                    WidgetStateProperty.all(ColorName.amber)),
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                  ],
                )
              : const SizedBox(),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  void deleteItem(BuildContext context, int id) {
    context.showRemoveDialog().then((value) {
      if (value != null && value == true) {
        MySwapOrderBloc.get.add(RemoveReceiveOfferItemEvent(id: id));
      }
    });
  }
}
