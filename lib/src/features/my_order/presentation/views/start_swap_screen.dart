import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class StartSwapScreen extends StatefulWidget {
  final SendReceiveSwapReqItem sendReceiveSwapReqItem;
  const StartSwapScreen({super.key, required this.sendReceiveSwapReqItem});
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
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 15.0,
                ),
              ),
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
                              padding: EdgeInsetsDirectional.only(end: 45.0.w),
                              child: Text(
                                '${widget.sendReceiveSwapReqItem.offerItems!.title}\n',
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
                                    height: 22.0,
                                    width: 15.0.w),
                                SizedBox(
                                  width: 6.0.w,
                                ),
                                Expanded(
                                    child: Text(
                                  'Swap In ${widget.sendReceiveSwapReqItem.offerItems!.citySwap}, ${widget.sendReceiveSwapReqItem.offerItems!.countrySwap}',
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
                                child: Text('Your Product',
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(fontSize: 20.0.sp))),
                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 13.0.w),
                              child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: TextButtonWidget(
                                  text: 'See Details',
                                  onPressed: () => seeOfferDetails(
                                      context, widget.sendReceiveSwapReqItem),
                                  isBold: true,
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
                      const TextSpan(
                          text: 'Select The Product You Want To Trade\n'),
                      const TextSpan(text: '('),
                      TextSpan(
                          text: '25',
                          style: context.easyTheme.textTheme.headlineMedium!
                              .copyWith(
                                  color: ColorName.red, fontSize: 15.0.sp)),
                      const TextSpan(text: ') '),
                      const TextSpan(text: 'Offers Submitted'),
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
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.svg.iosArrowBack.svg(),
                    const SizedBox(
                      width: 6.0,
                    ),
                    Assets.svg.iosArrowForward.svg(),
                  ],
                ),
              ),
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
      ..brandName = "Unknown"
      ..categoryName = "Unknown"
      ..year = sendReceiveSwapReqItem.offerItems!.year
      ..description = sendReceiveSwapReqItem.offerItems!.description
      ..offerCount = 0;
    Utils.openNavNewPage(
        context, MySwapPreviewerScreen(previewerModel: previewerModel));
  }
}
