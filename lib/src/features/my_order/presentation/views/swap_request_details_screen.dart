import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class SwapRequestDetailsScreen extends StatelessWidget {
  final SendReceiveSwapReqItem sendSwapReqItem;
  final bool isSend;
  const SwapRequestDetailsScreen(
      {super.key, required this.sendSwapReqItem, this.isSend = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorName.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorName.whiteSmoke,
          body: LayoutBuilderWidget(
            child: Column(
              children: [
                HeaderWidget(
                  withArrowBack: true,
                  isLight: true,
                  requestID: sendSwapReqItem.id,
                  isSend: isSend,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  context.locale.swap_requests_details,
                  style: context.easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 22),
                ),
                const SizedBox(
                  height: 21,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 21),
                  decoration: const BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        )
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 11,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: CachedImage(
                              imageUrl: sendSwapReqItem
                                  .sourceItems!.itemImg!.first
                                  .toString(),
                            ),
                          ),
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
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 45),
                              child: Text(
                                '${sendSwapReqItem.sourceItems!.title}',
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 20,
                                        color: ColorName.gray,
                                        overflow: TextOverflow.fade),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Assets.svg.locationPinIcon.svg(
                                    color: ColorName.amber,
                                    height: 22,
                                    width: 15),
                                const SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                    child: Text(
                                  '${context.locale.swap_in} ${sendSwapReqItem.sourceItems!.citySwap}, ${sendSwapReqItem.sourceItems!.countrySwap}',
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(fontSize: 16),
                                  overflow: TextOverflow.fade,
                                )),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 6),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: '${context.locale.byTitle} ',
                                        style: context
                                            .easyTheme.textTheme.bodyMedium!
                                            .copyWith(
                                                fontSize: 20,
                                                color: ColorName.gray)),
                                    TextSpan(
                                        text:
                                            '${sendSwapReqItem.sourceUser!.name}',
                                        style: context
                                            .easyTheme.textTheme.bodyMedium!
                                            .copyWith(fontSize: 20)),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 13),
                              child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: TextButtonWidget(
                                  text: context.locale.see_details,
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(
                                    fontSize: 14,
                                    color: ColorName.skyBlue,
                                  ),
                                  onPressed: () => seeSourceDetails(
                                      context, sendSwapReqItem),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Assets.png.swapIcon.image(),
                ),
                const SizedBox(
                  height: 13,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 21),
                  decoration: const BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 11,
                          ),
                          Expanded(
                            child: Padding(
                              padding: sendSwapReqItem
                                      .offerItems!.itemImg!.first.isNotEmpty
                                  ? const EdgeInsets.all(8)
                                  : const EdgeInsets.only(top: 32),
                              child: CachedImage(
                                  imageUrl: sendSwapReqItem
                                      .offerItems!.itemImg!.first
                                      .toString()),
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
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsetsDirectional.only(end: 45),
                                  child: Text(
                                    '${sendSwapReqItem.offerItems!.title}',
                                    maxLines: 3,
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                            fontSize: 20,
                                            color: ColorName.gray,
                                            overflow: TextOverflow.fade),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Assets.svg.locationPinIcon.svg(
                                        color: ColorName.amber,
                                        height: 22,
                                        width: 15),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Expanded(
                                        child: Text(
                                      '${context.locale.swap_in} ${sendSwapReqItem.offerItems!.citySwap}, ${sendSwapReqItem.offerItems!.countrySwap}',
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(fontSize: 16),
                                      overflow: TextOverflow.fade,
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 6),
                                  child: Text(context.locale.your_product,
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(fontSize: 20)),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 13, top: 14),
                                  child: Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: TextButtonWidget(
                                      text: context.locale.see_product_details,
                                      onPressed: () => seeOfferDetails(
                                          context, sendSwapReqItem),
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(
                                        fontSize: 14,
                                        color: ColorName.skyBlue,
                                      ),
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
                                  fontSize: 18,
                                  color: ColorName.black.withOpacity(0.5)),
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 22, end: 14, bottom: 20),
                        child: Text(
                          '${sendSwapReqItem.note}\n',
                          style:
                              context.easyTheme.textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void seeSourceDetails(
      BuildContext context, SendReceiveSwapReqItem sendSwapReqItem) {
    ProPreviewerModel previewerModel = ProPreviewerModel();
    previewerModel
      ..userName = sendSwapReqItem.sourceUser!.name
      ..itemImage = sendSwapReqItem.sourceItems!.itemImg
      ..title = sendSwapReqItem.sourceItems!.title
      ..sectionName = sendSwapReqItem.sourceItems!.section!.name
      ..sectionArName = sendSwapReqItem.sourceItems!.section!.arName
      ..brandName = sendSwapReqItem.sourceItems!.brand!.brandName
      ..brandArName = sendSwapReqItem.sourceItems!.brand!.arName
      ..categoryName = sendSwapReqItem.sourceItems!.category!.name
      ..categoryArName = sendSwapReqItem.sourceItems!.category!.arName
      ..year = sendSwapReqItem.sourceItems!.year
      ..description = sendSwapReqItem.sourceItems!.description
      ..citySwap = sendSwapReqItem.sourceItems!.citySwap
      ..countrySwap = sendSwapReqItem.sourceItems!.countrySwap
      ..date = sendSwapReqItem.createdAt
      ..offerCount = sendSwapReqItem.sourceItems!.offerCount;
    Utils.openNavNewPage(
        context, MySwapPreviewerScreen(previewerModel: previewerModel));
  }

  void seeOfferDetails(
      BuildContext context, SendReceiveSwapReqItem sendSwapReqItem) {
    ProPreviewerModel previewerModel = ProPreviewerModel();
    previewerModel
      ..userName = sendSwapReqItem.offerUser!.name
      ..itemImage = sendSwapReqItem.offerItems!.itemImg
      ..title = sendSwapReqItem.offerItems!.title
      ..sectionName = sendSwapReqItem.offerItems!.section!.name
      ..sectionArName = sendSwapReqItem.offerItems!.section!.arName
      ..brandName = sendSwapReqItem.offerItems!.brand!.brandName
      ..brandArName = sendSwapReqItem.offerItems!.brand!.arName
      ..categoryName = sendSwapReqItem.offerItems!.category!.name
      ..categoryArName = sendSwapReqItem.offerItems!.category!.arName
      ..year = sendSwapReqItem.offerItems!.year
      ..description = sendSwapReqItem.offerItems!.description
      ..citySwap = sendSwapReqItem.offerItems!.citySwap
      ..countrySwap = sendSwapReqItem.offerItems!.countrySwap
      ..date = sendSwapReqItem.createdAt
      ..offerCount = sendSwapReqItem.offerItems!.offerCount;
    Utils.openNavNewPage(
        context, MySwapPreviewerScreen(previewerModel: previewerModel));
  }
}
