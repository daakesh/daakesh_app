import 'package:daakesh/src/features/my_order/data/models/start_swap_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class MySwapProductCardWidget extends StatefulWidget {
  final SendReceiveSwapReqItem sendReceiveSwapReqItem;
  final bool isPreviewer;

  const MySwapProductCardWidget({
    super.key,
    required this.sendReceiveSwapReqItem,
    this.isPreviewer = false,
  });

  @override
  State<MySwapProductCardWidget> createState() =>
      _MySwapProductCardWidgetState();
}

class _MySwapProductCardWidgetState extends State<MySwapProductCardWidget> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: BlocBuilder<MySwapProBloc, MySwapProState>(
      builder: (context, state) {
        return !widget.isPreviewer
            ? Padding(
                padding: const EdgeInsetsDirectional.only(start: 21.0),
                child: Container(
                  margin:
                      const EdgeInsetsDirectional.only(end: 20.0, bottom: 20.0),
                  decoration: const BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsetsDirectional.only(
                                top: 3.0, start: 12),
                            constraints: const BoxConstraints(
                                minHeight: 22.0, minWidth: 66),
                            decoration: const BoxDecoration(
                              color: ColorName.darkGreen,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                            child: Center(
                                child: Text(
                              context.locale.new_title,
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(fontSize: 14),
                            )),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 11,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 32.0),
                              child: CachedImage(
                                  imageUrl: widget.sendReceiveSwapReqItem
                                              .offerItems!.itemImg !=
                                          null
                                      ? widget.sendReceiveSwapReqItem
                                          .offerItems!.itemImg!.first
                                          .toString()
                                      : ''),
                            ),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 30.0),
                                  child: Text(
                                    '${widget.sendReceiveSwapReqItem.offerItems!.title}',
                                    maxLines: 3,
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                            fontSize: 20.0,
                                            color: ColorName.gray,
                                            overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Assets.svg.locationPinIcon.svg(
                                        color: ColorName.amber,
                                        height: 20,
                                        width: 20),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Expanded(
                                        child: Text(
                                      '${context.locale.swap_in} ${widget.sendReceiveSwapReqItem.offerItems!.citySwap}, ${widget.sendReceiveSwapReqItem.offerItems!.countrySwap}',
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(fontSize: 16),
                                      overflow: TextOverflow.fade,
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 6),
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                              text:
                                                  '${context.locale.byTitle} ',
                                              style: context.easyTheme.textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontSize: 20,
                                                      color: ColorName.gray)),
                                          TextSpan(
                                              text: widget
                                                  .sendReceiveSwapReqItem
                                                  .offerUser!
                                                  .name
                                                  .toString(),
                                              style: context.easyTheme.textTheme
                                                  .bodyMedium!
                                                  .copyWith(fontSize: 20)),
                                        ],
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 13, top: 14.0),
                                  child: Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: TextButtonWidget(
                                      text: context.locale.see_product_details,
                                      onPressed: () => seeOfferDetails(context,
                                          widget.sendReceiveSwapReqItem),
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(
                                        fontSize: 12,
                                        color: ColorName.skyBlue,
                                      ),
                                      isBold: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 22, end: 14),
                        child: Text(
                          context.locale.your_comment,
                          style: context.easyTheme.textTheme.bodyLarge!
                              .copyWith(
                                  fontSize: 20,
                                  color: ColorName.black.withOpacity(0.5)),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 22, end: 22, bottom: 17.0),
                        child: Text(
                          widget.sendReceiveSwapReqItem.note ?? '',
                          maxLines: 7,
                          overflow: TextOverflow.fade,
                          style:
                              context.easyTheme.textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),

                      /// Padding(
                      ///   padding: const EdgeInsetsDirectional.only(
                      ///       start: 22, end: 22, bottom: 17.0),
                      ///   child: Container(
                      ///     height: 150.0,
                      ///     width: double.infinity,
                      ///     padding: const EdgeInsetsDirectional.only(
                      ///         start: 10.0, end: 10, top: 7.0),
                      ///     decoration: BoxDecoration(
                      ///         color: ColorName.white,
                      ///         border: Border.all(
                      ///             color: ColorName.gray.withOpacity(0.15)),
                      ///         borderRadius:
                      ///             const BorderRadius.all(Radius.circular(6.0))),
                      ///     child: TextFormFieldWidget(
                      ///       controller: controller,
                      ///       isUnderlineOn: true,
                      ///       maxLines: 5,
                      ///     ),
                      ///   ),
                      /// ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 13,
                          ),
                          Expanded(
                            child: DefaultButtonWidget(
                              text: context.locale.accept_offer,
                              style: context
                                  .easyTheme.elevatedButtonTheme.style!
                                  .copyWith(
                                minimumSize: WidgetStateProperty.all(
                                    const Size(387.0, 40)),
                                textStyle: WidgetStateProperty.all(context
                                    .easyTheme.textTheme.bodyMedium!
                                    .copyWith(fontSize: 13)),
                              ),
                              onPressed: () {
                                final sourceItem =
                                    widget.sendReceiveSwapReqItem.sourceItem ??
                                        0;
                                final offerItem =
                                    widget.sendReceiveSwapReqItem.offerItem ??
                                        0;
                                final sourceUser = widget
                                        .sendReceiveSwapReqItem.sourceUser?.id
                                        ?.toString() ??
                                    '';
                                final offerUser = widget
                                        .sendReceiveSwapReqItem.offerUser?.id
                                        ?.toString() ??
                                    '';
                                final itemId =
                                    widget.sendReceiveSwapReqItem.id ?? 0;
                                acceptOffer(
                                  context,
                                  sourceItem,
                                  offerItem,
                                  1,
                                  sourceUser,
                                  offerUser,
                                  itemId,
                                  controller.text,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: DefaultButtonWidget(
                              text: context.locale.reject,
                              style: context
                                  .easyTheme.elevatedButtonTheme.style!
                                  .copyWith(
                                minimumSize: WidgetStateProperty.all(
                                    const Size(387.0, 40)),
                                textStyle: WidgetStateProperty.all(context
                                    .easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                  fontSize: 12,
                                )),
                                backgroundColor:
                                    WidgetStateProperty.all(ColorName.red),
                              ),
                              onPressed: () => MySwapOrderBloc.get.add(
                                  UpdateOfferEvent(
                                      comment: controller.text,
                                      context: context,
                                      approved: -1,
                                      itemId:
                                          widget.sendReceiveSwapReqItem.id!)),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsetsDirectional.only(start: 21.0),
                child: Container(
                  margin:
                      const EdgeInsetsDirectional.only(end: 20.0, bottom: 20.0),
                  decoration: const BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsetsDirectional.only(
                                top: 3.0, start: 12),
                            constraints: const BoxConstraints(
                                minHeight: 22.0, minWidth: 66),
                            decoration: const BoxDecoration(
                              color: ColorName.darkGreen,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                            child: Center(
                                child: Text(
                              context.locale.new_title,
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(fontSize: 14),
                            )),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 11,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 32.0),
                              child: CachedImage(
                                  imageUrl: widget.sendReceiveSwapReqItem
                                              .offerItems!.itemImg !=
                                          null
                                      ? widget.sendReceiveSwapReqItem
                                          .offerItems!.itemImg!.first
                                          .toString()
                                      : ''),
                            ),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 30.0),
                                  child: Text(
                                    '${widget.sendReceiveSwapReqItem.offerItems!.title}',
                                    maxLines: 3,
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                            fontSize: 20.0,
                                            color: ColorName.gray,
                                            overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Assets.svg.locationPinIcon.svg(
                                        color: ColorName.amber,
                                        height: 20,
                                        width: 20),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Expanded(
                                        child: Text(
                                      '${context.locale.swap_in} ${widget.sendReceiveSwapReqItem.offerItems!.citySwap}, ${widget.sendReceiveSwapReqItem.offerItems!.countrySwap}',
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(fontSize: 16),
                                      overflow: TextOverflow.fade,
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 4),
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                              text:
                                                  '${context.locale.byTitle} ',
                                              style: context.easyTheme.textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontSize: 20,
                                                      color: ColorName.gray)),
                                          TextSpan(
                                              text: widget
                                                  .sendReceiveSwapReqItem
                                                  .offerUser!
                                                  .name
                                                  .toString(),
                                              style: context.easyTheme.textTheme
                                                  .bodyMedium!
                                                  .copyWith(fontSize: 20)),
                                        ],
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 13, top: 14.0),
                                  child: Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: TextButtonWidget(
                                      text: context.locale.see_product_details,
                                      onPressed: () => seeProductDetails(
                                          context,
                                          widget.sendReceiveSwapReqItem),
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(
                                        fontSize: 14,
                                        color: ColorName.skyBlue,
                                      ),
                                      isBold: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 22, end: 14),
                        child: Text(
                          context.locale.your_comment,
                          style: context.easyTheme.textTheme.bodyLarge!
                              .copyWith(
                                  fontSize: 20,
                                  color: ColorName.black.withOpacity(0.5)),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 22, end: 12, bottom: 17.0),
                        child: Text(
                          '${widget.sendReceiveSwapReqItem.note}',
                          maxLines: 7,
                          overflow: TextOverflow.fade,
                          style:
                              context.easyTheme.textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      !widget.isPreviewer
                          ? Row(
                              children: [
                                const SizedBox(
                                  width: 13,
                                ),
                                Expanded(
                                  child: DefaultButtonWidget(
                                    text: context.locale.accept_offer,
                                    style: context
                                        .easyTheme.elevatedButtonTheme.style!
                                        .copyWith(
                                      textStyle: WidgetStateProperty.all(context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(fontSize: 13)),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: DefaultButtonWidget(
                                    text: context.locale.reject,
                                    style: context
                                        .easyTheme.elevatedButtonTheme.style!
                                        .copyWith(
                                      textStyle: WidgetStateProperty.all(context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(
                                        fontSize: 13,
                                      )),
                                      backgroundColor: WidgetStateProperty.all(
                                          ColorName.red),
                                    ),
                                    onPressed: () => MySwapOrderBloc.get.add(
                                        UpdateOfferEvent(
                                            comment: '',
                                            context: context,
                                            approved: 0,
                                            itemId: widget
                                                .sendReceiveSwapReqItem.id!)),
                                  ),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                              ],
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  ),
                ),
              );
      },
    ));
  }

  void acceptOffer(
    BuildContext context,
    int sourceItem,
    int offerItem,
    int approved,
    String sourceUser,
    String offerUser,
    int itemId,
    String comment,
  ) {
    StartSwapModel startSwapModel = StartSwapModel();
    startSwapModel
      ..sourceItem = sourceItem
      ..offerItem = offerItem
      ..approved = approved
      ..sourceUser = sourceUser
      ..comment = comment
      ..offerUser = offerUser;

    MySwapOrderBloc.get.add(UpdateOfferEvent(
      comment: comment,
      context: context,
      itemId: itemId,
      approved: 1,
    ));
  }

  void seeOfferDetails(
      BuildContext context, SendReceiveSwapReqItem sendReceiveSwapReqItem) {
    ProPreviewerModel previewerModel = ProPreviewerModel();
    previewerModel
      ..userName = sendReceiveSwapReqItem.offerUser!.name
      ..itemImage = sendReceiveSwapReqItem.offerItems!.itemImg
      ..title = sendReceiveSwapReqItem.offerItems!.title
      ..sectionName =
          sendReceiveSwapReqItem.offerItems!.section!.name.toString()
      ..sectionArName =
          sendReceiveSwapReqItem.offerItems!.section!.arName.toString()
      ..brandName = sendReceiveSwapReqItem.offerItems!.brand!.brandName
      ..brandArName = sendReceiveSwapReqItem.offerItems!.brand!.arName
      ..categoryName = sendReceiveSwapReqItem.offerItems!.category!.name
      ..categoryArName = sendReceiveSwapReqItem.offerItems!.category!.arName
      ..year = sendReceiveSwapReqItem.offerItems!.year
      ..description = sendReceiveSwapReqItem.offerItems!.description
      ..citySwap = sendReceiveSwapReqItem.offerItems!.citySwap
      ..countrySwap = sendReceiveSwapReqItem.offerItems!.countrySwap
      ..date = sendReceiveSwapReqItem.offerItems!.date
      ..offerCount = sendReceiveSwapReqItem.offerItems!.offerCount;
    Utils.openNavNewPage(
        context, MySwapPreviewerScreen(previewerModel: previewerModel));
  }

  void seeProductDetails(
      BuildContext context, SendReceiveSwapReqItem myProductItem) {
    ProPreviewerModel previewerModel = ProPreviewerModel();
    previewerModel
      ..userName = myProductItem.offerUser!.name
      ..itemImage = myProductItem.offerItems!.itemImg
      ..title = myProductItem.offerItems!.title
      ..sectionName = myProductItem.offerItems!.section!.name.toString()
      ..sectionArName = myProductItem.offerItems!.section!.arName.toString()
      ..brandName = myProductItem.offerItems!.brand!.brandName
      ..brandArName = myProductItem.offerItems!.brand!.arName
      ..categoryName = myProductItem.offerItems!.category!.name
      ..categoryArName = myProductItem.offerItems!.category!.arName
      ..year = myProductItem.offerItems!.year
      ..description = myProductItem.offerItems!.description
      ..citySwap = myProductItem.offerItems!.citySwap
      ..countrySwap = myProductItem.offerItems!.countrySwap
      ..date = myProductItem.offerItems!.date
      ..offerCount = myProductItem.offerItems!.offerCount;
    Utils.openNavNewPage(
        context, MySwapPreviewerScreen(previewerModel: previewerModel));
  }
}
