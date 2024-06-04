import 'package:carousel_slider/carousel_slider.dart';
import 'package:daakesh/src/features/my_order/data/models/start_swap_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class MySwapProductCardWidget extends StatelessWidget {
  final SendReceiveSwapReqItem sendReceiveSwapReqItem;
  final bool isPreviewer;

  const MySwapProductCardWidget({
    super.key,
    required this.sendReceiveSwapReqItem,
    this.isPreviewer = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: BlocBuilder<MySwapProBloc, MySwapProState>(
      builder: (context, state) {
        return !isPreviewer
            ? CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 1,
                    initialPage: 0,
                    height: Utils.getScreenHeight(context) * 0.65,
                    scrollDirection: Axis.horizontal,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {}),
                items: state.mySwapProductListData.map((i) {
                  final controller = TextEditingController();
                  return Padding(
                    padding: const EdgeInsetsDirectional.only(start: 21.0),
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(
                          end: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                          color: ColorName.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0.r)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(0, 0, 0, 0.16),
                              offset: const Offset(0, 3),
                              blurRadius: 6.0.r,
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsetsDirectional.only(
                                    top: 3.0, start: 12.0.w),
                                constraints: BoxConstraints(
                                    minHeight: 22.0, minWidth: 66.0.w),
                                decoration: BoxDecoration(
                                  color: ColorName.darkGreen,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0.r)),
                                ),
                                child: Center(
                                    child: Text(
                                  context.locale.new_title,
                                  style: context.easyTheme.textTheme.labelLarge!
                                      .copyWith(fontSize: 14.0.sp),
                                )),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 11.0.w,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 32.0),
                                  child: CachedImage(
                                      imageUrl: i.itemImg != null
                                          ? i.itemImg!.first.toString()
                                          : ''),
                                ),
                              ),
                              SizedBox(
                                width: 18.0.w,
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
                                        '${i.title}\n\n\n',
                                        maxLines: 3,
                                        style: context
                                            .easyTheme.textTheme.bodyMedium!
                                            .copyWith(
                                                fontSize: 20.0,
                                                color: ColorName.gray,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Assets.svg.locationPinIcon.svg(
                                            color: ColorName.amber,
                                            height: 22.0,
                                            width: 15.0.w),
                                        SizedBox(
                                          width: 6.0.w,
                                        ),
                                        Expanded(
                                            child: Text(
                                          '${context.locale.swap_in} ${i.citySwap}, ${i.countrySwap}',
                                          style: context
                                              .easyTheme.textTheme.bodyMedium!
                                              .copyWith(fontSize: 16.0.sp),
                                          overflow: TextOverflow.fade,
                                        )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 6.0.w),
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                  text:
                                                      '${context.locale.byTitle} ',
                                                  style: context.easyTheme
                                                      .textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontSize: 20.0.sp,
                                                          color:
                                                              ColorName.gray)),
                                              TextSpan(
                                                  text: i.user!.name.toString(),
                                                  style: context.easyTheme
                                                      .textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontSize: 20.0.sp)),
                                            ],
                                          ),
                                        )),
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 13.0.w, top: 14.0),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional.centerEnd,
                                        child: TextButtonWidget(
                                          text: context
                                              .locale.see_product_details,
                                          onPressed: () =>
                                              seeOfferDetails(context, i),
                                          style: context
                                              .easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                            fontSize: 14.0.sp,
                                            fontWeight: FontWeight.bold,
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
                            padding: EdgeInsetsDirectional.only(
                                start: 22.0.w, end: 14.0.w),
                            child: Text(
                              context.locale.your_comment,
                              style: context.easyTheme.textTheme.bodyLarge!
                                  .copyWith(
                                      fontSize: 20.0.sp,
                                      color: ColorName.black.withOpacity(0.5)),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 22.0.w, end: 22.0.w, bottom: 17.0),
                            child: Container(
                              height: 150.0,
                              width: double.infinity,
                              padding: const EdgeInsetsDirectional.only(
                                  start: 10.0, end: 10, top: 7.0),
                              decoration: const BoxDecoration(
                                  color: ColorName.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 6.0,
                                        color: Color.fromRGBO(0, 0, 0, 0.16),
                                        offset: Offset(0, 6))
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.0))),
                              child: TextFormFieldWidget(
                                controller: controller,
                                isUnderlineOn: true,
                                maxLines: 5,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 13.0.w,
                              ),
                              Expanded(
                                child: DefaultButtonWidget(
                                  text: context.locale.accept_offer,
                                  style: context
                                      .easyTheme.elevatedButtonTheme.style!
                                      .copyWith(
                                    textStyle: MaterialStateProperty.all(context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(fontSize: 13.0.sp)),
                                  ),
                                  onPressed: () => acceptOffer(
                                      context,
                                      sendReceiveSwapReqItem.sourceItem!,
                                      sendReceiveSwapReqItem.offerItem!,
                                      1,
                                      sendReceiveSwapReqItem.sourceUser!.id
                                          .toString(),
                                      sendReceiveSwapReqItem.offerUser!.id
                                          .toString(),
                                      sendReceiveSwapReqItem.id!,
                                      controller.text),
                                ),
                              ),
                              SizedBox(
                                width: 8.0.w,
                              ),
                              Expanded(
                                child: DefaultButtonWidget(
                                  text: context.locale.reject,
                                  style: context
                                      .easyTheme.elevatedButtonTheme.style!
                                      .copyWith(
                                    textStyle: MaterialStateProperty.all(context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                      fontSize: 13.0.sp,
                                    )),
                                    backgroundColor: MaterialStateProperty.all(
                                        ColorName.red),
                                  ),
                                  onPressed: () => MySwapOrderBloc.get.add(
                                      UpdateOfferEvent(
                                          comment: controller.text,
                                          context: context,
                                          approved: -1,
                                          itemId: sendReceiveSwapReqItem.id!)),
                                ),
                              ),
                              SizedBox(
                                width: 13.0.w,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList())
            : Padding(
                padding: const EdgeInsetsDirectional.only(start: 21.0),
                child: Container(
                  margin:
                      const EdgeInsetsDirectional.only(end: 20.0, bottom: 20.0),
                  decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.0.r)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(0, 0, 0, 0.16),
                          offset: const Offset(0, 3),
                          blurRadius: 6.0.r,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsetsDirectional.only(
                                top: 3.0, start: 12.0.w),
                            constraints: BoxConstraints(
                                minHeight: 22.0, minWidth: 66.0.w),
                            decoration: BoxDecoration(
                              color: ColorName.darkGreen,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0.r)),
                            ),
                            child: Center(
                                child: Text(
                              context.locale.new_title,
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(fontSize: 14.0.sp),
                            )),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 11.0.w,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 32.0),
                              child: CachedImage(
                                  imageUrl: sendReceiveSwapReqItem
                                              .sourceItems!.itemImg !=
                                          null
                                      ? sendReceiveSwapReqItem
                                          .sourceItems!.itemImg!.first
                                          .toString()
                                      : ''),
                            ),
                          ),
                          SizedBox(
                            width: 18.0.w,
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
                                    '${sendReceiveSwapReqItem.sourceItems!.title}\n\n\n',
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
                                        height: 22.0,
                                        width: 15.0.w),
                                    SizedBox(
                                      width: 6.0.w,
                                    ),
                                    Expanded(
                                        child: Text(
                                      '${context.locale.swap_in} ${sendReceiveSwapReqItem.sourceItems!.citySwap}, ${sendReceiveSwapReqItem.sourceItems!.countrySwap}',
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(fontSize: 16.0.sp),
                                      overflow: TextOverflow.fade,
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        start: 6.0.w),
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                              text:
                                                  '${context.locale.byTitle} ',
                                              style: context.easyTheme.textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontSize: 20.0.sp,
                                                      color: ColorName.gray)),
                                          TextSpan(
                                              text: sendReceiveSwapReqItem
                                                  .sourceUser!.name
                                                  .toString(),
                                              style: context.easyTheme.textTheme
                                                  .bodyMedium!
                                                  .copyWith(fontSize: 20.0.sp)),
                                        ],
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      end: 13.0.w, top: 14.0),
                                  child: Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: TextButtonWidget(
                                      text: context.locale.see_product_details,
                                      onPressed: () => seeProductDetails(
                                          context, sendReceiveSwapReqItem),
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(
                                        fontSize: 14.0.sp,
                                        fontWeight: FontWeight.bold,
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
                        padding: EdgeInsetsDirectional.only(
                            start: 22.0.w, end: 14.0.w),
                        child: Text(
                          context.locale.your_comment,
                          style: context.easyTheme.textTheme.bodyLarge!
                              .copyWith(
                                  fontSize: 20.0.sp,
                                  color: ColorName.black.withOpacity(0.5)),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 22.0.w, end: 12.0.w, bottom: 17.0),
                        child: Text(
                          '${sendReceiveSwapReqItem.note}\n\n\n\n\n\n\n',
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                          style:
                              context.easyTheme.textTheme.bodyLarge!.copyWith(
                            fontSize: 14.0.sp,
                          ),
                        ),
                      ),
                      !isPreviewer
                          ? Row(
                              children: [
                                SizedBox(
                                  width: 13.0.w,
                                ),
                                Expanded(
                                  child: DefaultButtonWidget(
                                    text: context.locale.accept_offer,
                                    style: context
                                        .easyTheme.elevatedButtonTheme.style!
                                        .copyWith(
                                      textStyle: MaterialStateProperty.all(
                                          context
                                              .easyTheme.textTheme.bodyMedium!
                                              .copyWith(fontSize: 13.0.sp)),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0.w,
                                ),
                                Expanded(
                                  child: DefaultButtonWidget(
                                    text: context.locale.reject,
                                    style: context
                                        .easyTheme.elevatedButtonTheme.style!
                                        .copyWith(
                                      textStyle: MaterialStateProperty.all(
                                          context
                                              .easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                        fontSize: 13.0.sp,
                                      )),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              ColorName.red),
                                    ),
                                    onPressed: () => MySwapOrderBloc.get.add(
                                        UpdateOfferEvent(
                                            comment: '',
                                            context: context,
                                            approved: 0,
                                            itemId:
                                                sendReceiveSwapReqItem.id!)),
                                  ),
                                ),
                                SizedBox(
                                  width: 13.0.w,
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

  void seeOfferDetails(BuildContext context, MyProductItem myProductItem) {
    ProPreviewerModel previewerModel = ProPreviewerModel();
    previewerModel
      ..userName = myProductItem.user!.name
      ..itemImage = myProductItem.itemImg
      ..title = myProductItem.title
      ..sectionName = myProductItem.section!.name.toString()
      ..sectionArName = myProductItem.section!.arName.toString()
      ..brandName = myProductItem.brand!.brandName
      ..brandArName = myProductItem.brand!.arName
      ..categoryName = myProductItem.category!.name
      ..categoryArName = myProductItem.category!.arName
      ..year = myProductItem.year
      ..description = myProductItem.description
      ..citySwap = myProductItem.citySwap
      ..countrySwap = myProductItem.countrySwap
      ..date = myProductItem.date
      ..offerCount = myProductItem.offerCount;
    Utils.openNavNewPage(
        context, MySwapPreviewerScreen(previewerModel: previewerModel));
  }

  void seeProductDetails(
      BuildContext context, SendReceiveSwapReqItem myProductItem) {
    ProPreviewerModel previewerModel = ProPreviewerModel();
    previewerModel
      ..userName = myProductItem.sourceUser!.name
      ..itemImage = myProductItem.sourceItems!.itemImg
      ..title = myProductItem.sourceItems!.title
      ..sectionName = myProductItem.sourceItems!.section!.name.toString()
      ..sectionArName = myProductItem.sourceItems!.section!.arName.toString()
      ..brandName = myProductItem.sourceItems!.brand!.brandName
      ..brandArName = myProductItem.sourceItems!.brand!.arName
      ..categoryName = myProductItem.sourceItems!.category!.name
      ..categoryArName = myProductItem.sourceItems!.category!.arName
      ..year = myProductItem.sourceItems!.year
      ..description = myProductItem.sourceItems!.description
      ..citySwap = myProductItem.sourceItems!.citySwap
      ..countrySwap = myProductItem.sourceItems!.countrySwap
      ..date = myProductItem.sourceItems!.date
      ..offerCount = myProductItem.sourceItems!.offerCount;
    Utils.openNavNewPage(
        context, MySwapPreviewerScreen(previewerModel: previewerModel));
  }
}
