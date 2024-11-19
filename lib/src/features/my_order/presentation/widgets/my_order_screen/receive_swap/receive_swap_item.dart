import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../../src.export.dart';

class ReceiveSwapWaitingItem extends StatelessWidget {
  final SendReceiveSwapReqItem sendReceiveSwapReqItem;
  const ReceiveSwapWaitingItem({
    super.key,
    required this.sendReceiveSwapReqItem,
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
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 17, top: 7),
              child: Text(
                context.locale.receive_waiting,
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 12, color: ColorName.red),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 12),
              Expanded(
                  child: CachedImage(
                      imageUrl: sendReceiveSwapReqItem.offerItems!.itemImg !=
                              null
                          ? sendReceiveSwapReqItem.offerItems!.itemImg!.first
                          : '')),
              const SizedBox(width: 18),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 80),
                      child: Text(
                        '${sendReceiveSwapReqItem.offerItems!.title}\n',
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
                      '${sendReceiveSwapReqItem.offerItems!.citySwap}, ${sendReceiveSwapReqItem.offerItems!.countrySwap}',
                      style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                        fontSize: 13,
                        color: ColorName.mediumSilver,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: '(',
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      color: ColorName.gray, fontSize: 16)),
                          TextSpan(
                              text:
                                  '${sendReceiveSwapReqItem.offerItems!.offerCount}',
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      color: ColorName.red, fontSize: 16)),
                          TextSpan(
                              text: ') ',
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      color: ColorName.gray, fontSize: 16)),
                          TextSpan(
                              text: context.locale.receive_offers_submitted,
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      color: ColorName.black, fontSize: 15)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 23,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
                child: DefaultButtonWidget(
                    text: context.locale.start_swap,
                    onPressed: () =>
                        onStartSwap(context, sendReceiveSwapReqItem))),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  void onStartSwap(context, SendReceiveSwapReqItem sendReceiveSwapReqItem) {
    Utils.openNavNewPage(context,
        StartSwapScreen(sendReceiveSwapReqItem: sendReceiveSwapReqItem));
  }

  void deleteItem(BuildContext context, int id) {
    context.showRemoveDialog().then((value) {
      if (value != null && value == true) {
        MySwapOrderBloc.get.add(RemoveReceiveOfferItemEvent(id: id));
      }
    });
  }
}
