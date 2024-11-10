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
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(0, 0, 0, 0.16),
                          offset: const Offset(0, 3),
                          blurRadius: 6,
                        )
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 11,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                          child: CachedImage(
                            imageUrl: widget.sendReceiveSwapReqItem.sourceItems!
                                        .itemImg !=
                                    null
                                ? widget.sendReceiveSwapReqItem.sourceItems!
                                    .itemImg!.first
                                : '',
                          ),
                        ),
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 45),
                              child: Text(
                                '${widget.sendReceiveSwapReqItem.sourceItems!.title}',
                                maxLines: 3,
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 20,
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
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                    child: Text(
                                  '${context.locale.swap_in} ${widget.sendReceiveSwapReqItem.sourceItems!.citySwap}, ${widget.sendReceiveSwapReqItem.sourceItems!.countrySwap}',
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(fontSize: 16),
                                  overflow: TextOverflow.fade,
                                )),
                              ],
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Padding(
                                padding: EdgeInsetsDirectional.only(start: 6),
                                child: Text(context.locale.your_product,
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(fontSize: 20))),
                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 13),
                              child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: TextButtonWidget(
                                  text: context.locale.see_details,
                                  style: TextStyle(
                                    fontSize: 14,
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
                        .copyWith(fontSize: 15),
                    children: [
                      TextSpan(text: '${context.locale.select_product}\n'),
                      const TextSpan(text: '('),
                      TextSpan(
                          text:
                              '${widget.sendReceiveSwapReqItem.sourceItems!.offerCount}',
                          style: context.easyTheme.textTheme.headlineMedium!
                              .copyWith(color: ColorName.red, fontSize: 15)),
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
      ..userName = sendReceiveSwapReqItem.sourceUser!.name
      ..itemImage = sendReceiveSwapReqItem.sourceItems!.itemImg
      ..title = sendReceiveSwapReqItem.sourceItems!.title
      ..sectionName = sendReceiveSwapReqItem.sourceItems!.section!.name
      ..sectionArName = sendReceiveSwapReqItem.sourceItems!.section!.arName
      ..brandName = sendReceiveSwapReqItem.sourceItems!.brand!.brandName
      ..brandArName = sendReceiveSwapReqItem.sourceItems!.brand!.arName
      ..categoryName = sendReceiveSwapReqItem.sourceItems!.category!.name
      ..categoryArName = sendReceiveSwapReqItem.sourceItems!.category!.arName
      ..year = sendReceiveSwapReqItem.sourceItems!.year
      ..description = sendReceiveSwapReqItem.sourceItems!.description
      ..citySwap = sendReceiveSwapReqItem.sourceItems!.citySwap
      ..countrySwap = sendReceiveSwapReqItem.sourceItems!.countrySwap
      //..date = sendReceiveSwapReqItem.createdAt
      ..offerCount = sendReceiveSwapReqItem.sourceItems!.offerCount;
    Utils.openNavNewPage(
        context, MySwapPreviewerScreen(previewerModel: previewerModel));
  }
}
