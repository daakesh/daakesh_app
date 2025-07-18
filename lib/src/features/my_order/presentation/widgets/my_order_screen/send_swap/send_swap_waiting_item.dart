import 'package:flutter/material.dart';
import '../../../../../../src.export.dart';

class SendSwapWaitingItem extends StatelessWidget {
  final SendReceiveSwapReqItem sendSwapReqItem;
  final int approved;
  const SendSwapWaitingItem(
      {super.key, required this.sendSwapReqItem, required this.approved});

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
          const SizedBox(height: 9),
          Row(
            children: [
              const SizedBox(width: 14),
              Text(
                context.locale.swap_request_title,
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 18, color: ColorName.black),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                '#${sendSwapReqItem.offerId ?? "12345"}',
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 18, color: ColorName.black),
              ),
              const SizedBox(
                width: 9,
              ),
              const Spacer(
                flex: 1,
              ),
              Text(
                approved == 0
                    ? context.locale.send_waiting_title
                    : context.locale.send_rejected_title,
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 14, color: ColorName.red),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              '${context.locale.request_in} ${Utils.formatDate(sendSwapReqItem.createdAt.toString())}',
              style: context.easyTheme.textTheme.labelLarge!.copyWith(
                fontSize: 14,
                color: ColorName.gray,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 50,
            color: ColorName.lightGrayishBlue,
            child: Row(
              children: [
                const SizedBox(width: 14),
                Expanded(
                    child: CachedImage(
                  imageUrl: sendSwapReqItem.sourceItems!.itemImg != null
                      ? sendSwapReqItem.sourceItems!.itemImg!.first
                      : '',
                )),
                const SizedBox(width: 15),
                Expanded(
                  flex: 4,
                  child: Text(
                    sendSwapReqItem.sourceItems!.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, color: ColorName.gray),
                  ),
                ),
                const SizedBox(width: 50),
                Text(
                  context.locale.send_product_title,
                  overflow: TextOverflow.ellipsis,
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 14, color: ColorName.burgundy),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            height: 50,
            color: ColorName.white,
            child: Row(
              children: [
                const SizedBox(width: 14),
                Expanded(
                    child: CachedImage(
                  imageUrl: sendSwapReqItem.offerItems!.itemImg!.isNotEmpty
                      ? sendSwapReqItem.offerItems!.itemImg!.first
                      : '',
                )),
                const SizedBox(width: 15),
                Expanded(
                  flex: 4,
                  child: Text(
                    sendSwapReqItem.offerItems!.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, color: ColorName.gray),
                  ),
                ),
                const SizedBox(width: 50),
                Text(
                  context.locale.send_offer_title,
                  overflow: TextOverflow.ellipsis,
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 14, color: ColorName.burgundy),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 78),
            child: TextButtonWidget(
              text: context.locale.see_all_details,
              onPressed: () => seeAllDetails(context, sendSwapReqItem),
            ),
          ),
          const Divider(
            color: ColorName.gray,
            endIndent: 16.5,
            indent: 16.5,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: context.locale.hidden_number_title,
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14)),
              ])),
            ),
          ),
          const SizedBox(height: 13),
          Row(
            children: [
              const SizedBox(width: 19),
              Expanded(
                child: DefaultButtonWidget(
                  text: context.locale.call_button,
                  onPressed: () {},
                  style: context.easyTheme.elevatedButtonTheme.style!.copyWith(
                    minimumSize: WidgetStateProperty.all(const Size(387, 40)),
                    backgroundColor: WidgetStateProperty.all(
                        ColorName.blueGray.withOpacity(0.5)),
                  ),
                ),
              ),
              const SizedBox(
                width: 9,
              ),
              Expanded(
                child: DefaultButtonWidget(
                  text: context.locale.whatsApp_title,
                  onPressed: () {},
                  style: context.easyTheme.elevatedButtonTheme.style!.copyWith(
                    minimumSize: WidgetStateProperty.all(const Size(387, 40)),
                    backgroundColor: WidgetStateProperty.all(
                        ColorName.amber.withOpacity(0.5)),
                  ),
                ),
              ),
              const SizedBox(width: 19),
            ],
          ),
          const SizedBox(height: 13),
        ],
      ),
    );
  }

  void seeAllDetails(context, SendReceiveSwapReqItem sendSwapReqItem) {
    Utils.openNavNewPage(
        context,
        SwapRequestDetailsScreen(
          sendSwapReqItem: sendSwapReqItem,
          isSend: true,
        ));
  }

  void deleteItem(BuildContext context, int id) {
    context.showRemoveDialog().then((value) {
      if (value != null && value == true) {
        MySwapOrderBloc.get.add(RemoveSendOfferItemEvent(id: id));
      }
    });
  }
}
