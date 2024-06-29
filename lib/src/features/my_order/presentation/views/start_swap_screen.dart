import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class StartSwapScreen extends StatefulWidget {
  final SendReceiveSwapReqItem sendReceiveSwapReqItem;
  final bool isPreviewer;
  const StartSwapScreen({
    super.key,
    required this.sendReceiveSwapReqItem,
    this.isPreviewer = false,
  });
  @override
  State<StartSwapScreen> createState() => _StartSwapScreenState();
}

class _StartSwapScreenState extends State<StartSwapScreen> {
  @override
  void initState() {
    super.initState();
    getMyOffer();
  }

  void getMyOffer() {
    if (widget.isPreviewer) {
      return;
    }
    MySwapProBloc.get.add(GetMySwapProEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorName.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorName.whiteSmoke,
          body: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: HeaderWidget(withArrowBack: true, isLight: true),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 15.0)),
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsetsDirectional.symmetric(horizontal: 21.0),
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
                          padding: const EdgeInsets.only(top: 32.0),
                          child: CachedImage(
                            imageUrl: widget.sendReceiveSwapReqItem.offerItems!
                                        .itemImg !=
                                    null
                                ? widget.sendReceiveSwapReqItem.offerItems!
                                    .itemImg!.first
                                : '',
                          ),
                        ),
                      ),
                      SizedBox(width: 18.0.w),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 45.0.w),
                              child: Text(
                                '${widget.sendReceiveSwapReqItem.offerItems!.title}',
                                maxLines: 3,
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 20.0.sp,
                                        color: ColorName.gray,
                                        overflow: TextOverflow.fade),
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
                                  height: 20.0.h,
                                  width: 20.0.w,
                                ),
                                SizedBox(
                                  width: 6.0.w,
                                ),
                                Expanded(
                                    child: Text(
                                  '${context.locale.swap_in} ${widget.sendReceiveSwapReqItem.offerItems!.citySwap}, ${widget.sendReceiveSwapReqItem.offerItems!.countrySwap}',
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(fontSize: 16.0.sp),
                                  overflow: TextOverflow.fade,
                                )),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.only(start: 6.0.w),
                                child: Text(context.locale.your_product,
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(fontSize: 20.0.sp))),
                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 13.0.w),
                              child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: TextButtonWidget(
                                  text: context.locale.see_details,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: ColorName.skyBlue,
                                  ),
                                  onPressed: () => seeOfferDetails(
                                      context, widget.sendReceiveSwapReqItem),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 13.0,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: Assets.png.swapIcon.image(),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 8.0,
                ),
              ),
              SliverToBoxAdapter(
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 15.0.sp),
                    children: [
                      TextSpan(text: '${context.locale.select_product}\n'),
                      const TextSpan(text: '('),
                      TextSpan(
                          text:
                              '${widget.sendReceiveSwapReqItem.offerItems!.offerCount}',
                          style: context.easyTheme.textTheme.headlineMedium!
                              .copyWith(
                                  color: ColorName.red, fontSize: 15.0.sp)),
                      const TextSpan(text: ') '),
                      TextSpan(text: context.locale.offers_submitted),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 13.0,
                ),
              ),
              MySwapProductCardWidget(
                  sendReceiveSwapReqItem: widget.sendReceiveSwapReqItem,
                  isPreviewer: widget.isPreviewer),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 50.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void seeOfferDetails(
      BuildContext context, SendReceiveSwapReqItem sendReceiveSwapReqItem) {
    ProPreviewerModel previewerModel = ProPreviewerModel();
    previewerModel
      ..userName = sendReceiveSwapReqItem.offerUser!.name
      ..itemImage = sendReceiveSwapReqItem.offerItems!.itemImg
      ..title = sendReceiveSwapReqItem.offerItems!.title
      ..sectionName = sendReceiveSwapReqItem.offerItems!.section!.name
      ..sectionArName = sendReceiveSwapReqItem.offerItems!.section!.arName
      ..brandName = sendReceiveSwapReqItem.offerItems!.brand!.brandName
      ..brandArName = sendReceiveSwapReqItem.offerItems!.brand!.arName
      ..categoryName = sendReceiveSwapReqItem.offerItems!.category!.name
      ..categoryArName = sendReceiveSwapReqItem.offerItems!.category!.arName
      ..year = sendReceiveSwapReqItem.offerItems!.year
      ..description = sendReceiveSwapReqItem.offerItems!.description
      ..citySwap = sendReceiveSwapReqItem.offerItems!.citySwap
      ..countrySwap = sendReceiveSwapReqItem.offerItems!.countrySwap
      //..date = sendReceiveSwapReqItem.createdAt
      ..offerCount = sendReceiveSwapReqItem.offerItems!.offerCount;
    Utils.openNavNewPage(
        context, MySwapPreviewerScreen(previewerModel: previewerModel));
  }
}
