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
                SizedBox(
                  height: 16.0.h,
                ),
                Text(
                  context.locale.swap_requests_details,
                  style: context.easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 22.0.sp),
                ),
                SizedBox(
                  height: 21.0.h,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsetsDirectional.symmetric(horizontal: 21.0.w),
                  decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.all(Radius.circular(4.0.r)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(0, 0, 0, 0.16),
                          offset: const Offset(0, 3),
                          blurRadius: 6.0.r,
                        )
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 11.0.w,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 32.0.h),
                          child: CachedImage(
                            imageUrl: sendSwapReqItem
                                .sourceItems!.itemImg!.first
                                .toString(),
                          ),
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
                            SizedBox(
                              height: 20.0.h,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 45.0.w),
                              child: Text(
                                '${sendSwapReqItem.sourceItems!.title}',
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 20.0.sp,
                                        color: ColorName.gray,
                                        overflow: TextOverflow.fade),
                              ),
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Assets.svg.locationPinIcon.svg(
                                    color: ColorName.amber,
                                    height: 22.0.h,
                                    width: 15.0.w),
                                SizedBox(
                                  width: 6.0.w,
                                ),
                                Expanded(
                                    child: Text(
                                  '${context.locale.swap_in} ${sendSwapReqItem.sourceItems!.citySwap}, ${sendSwapReqItem.sourceItems!.countrySwap}',
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(fontSize: 16.0.sp),
                                  overflow: TextOverflow.fade,
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 15.0.h,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(start: 6.0.w),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: '${context.locale.byTitle} ',
                                        style: context
                                            .easyTheme.textTheme.bodyMedium!
                                            .copyWith(
                                                fontSize: 20.0.sp,
                                                color: ColorName.gray)),
                                    TextSpan(
                                        text:
                                            '${sendSwapReqItem.sourceUser!.name}',
                                        style: context
                                            .easyTheme.textTheme.bodyMedium!
                                            .copyWith(fontSize: 20.0.sp)),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 13.0.w),
                              child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: TextButtonWidget(
                                  text: context.locale.see_details,
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(
                                    fontSize: 14.0.sp,
                                    color: ColorName.skyBlue,
                                  ),
                                  onPressed: () => seeSourceDetails(
                                      context, sendSwapReqItem),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12.0.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 13.0.h,
                ),
                SizedBox(
                  height: 50.0.h,
                  width: 50.0.w,
                  child: Assets.png.swapIcon.image(),
                ),
                SizedBox(
                  height: 13.0.h,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsetsDirectional.symmetric(horizontal: 21.0.w),
                  decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.all(Radius.circular(4.0.r)),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 11.0.w,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 32.0.h),
                              child: CachedImage(
                                  imageUrl: sendSwapReqItem
                                      .offerItems!.itemImg!.first
                                      .toString()),
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
                                SizedBox(
                                  height: 20.0.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(end: 45.0.w),
                                  child: Text(
                                    '${sendSwapReqItem.offerItems!.title}',
                                    maxLines: 3,
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                            fontSize: 20.0.sp,
                                            color: ColorName.gray,
                                            overflow: TextOverflow.fade),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Assets.svg.locationPinIcon.svg(
                                        color: ColorName.amber,
                                        height: 22.0.h,
                                        width: 15.0.w),
                                    SizedBox(
                                      width: 6.0.w,
                                    ),
                                    Expanded(
                                        child: Text(
                                      '${context.locale.swap_in} ${sendSwapReqItem.offerItems!.citySwap}, ${sendSwapReqItem.offerItems!.countrySwap}',
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(fontSize: 16.0.sp),
                                      overflow: TextOverflow.fade,
                                    )),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.0.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(start: 6.0.w),
                                  child: Text(context.locale.your_product,
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(fontSize: 20.0.sp)),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      end: 13.0.w, top: 14.0.h),
                                  child: Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: TextButtonWidget(
                                      text: context.locale.see_product_details,
                                      onPressed: () => seeOfferDetails(
                                          context, sendSwapReqItem),
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(
                                        fontSize: 14.0.sp,
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
                        padding: EdgeInsetsDirectional.only(
                            start: 22.0.w, end: 14.0.w),
                        child: Text(
                          context.locale.your_comment,
                          style: context.easyTheme.textTheme.bodyLarge!
                              .copyWith(
                                  fontSize: 18.0.sp,
                                  color: ColorName.black.withOpacity(0.5)),
                        ),
                      ),
                      SizedBox(
                        height: 13.0.h,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 22.0.w, end: 14.0.w, bottom: 20.0.h),
                        child: Text(
                          '${sendSwapReqItem.note}\n',
                          style:
                              context.easyTheme.textTheme.bodyLarge!.copyWith(
                            fontSize: 14.0.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0.h,
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
