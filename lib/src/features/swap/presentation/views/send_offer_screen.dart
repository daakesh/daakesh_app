import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';
import 'package:collection/collection.dart';

// ignore: must_be_immutable
class SendOfferScreen extends StatefulWidget {
  final TrendDealsItem trendDealsItem;
  const SendOfferScreen({super.key, required this.trendDealsItem});

  @override
  State<SendOfferScreen> createState() => _SendOfferScreenState();
}

class _SendOfferScreenState extends State<SendOfferScreen> {
  final commentController = TextEditingController();

  int index = 0;

  final controller = PageController(viewportFraction: 0.85, initialPage: 0);

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        loadMore();
      }
    });
  }

  void loadMore() {
    SwapProBloc.get.add(GetSwapProductEvent(isSeeMore: true));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        SwapProBloc.get.add(ResetMySwapItemDataEvent());
      },
      child: Scaffold(
        backgroundColor: ColorName.whiteSmoke,
        body: CustomScrollView(
          slivers: [
            const SwapAppBarWidget(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 8.0,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 21.0),
                decoration: const BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                        offset: Offset(0, 3),
                        blurRadius: 6.0,
                      )
                    ]),
                child: BlocBuilder<SwapPassDataBloc, SwapPassDataState>(
                  builder: (context, state) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 11.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 32.0),
                            child: CachedImage(
                                imageUrl: widget.trendDealsItem.itemImg != null
                                    ? widget.trendDealsItem.itemImg!.first
                                        .toString()
                                    : ''),
                          ),
                        ),
                        const SizedBox(
                          width: 18.0,
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
                                padding:
                                    const EdgeInsetsDirectional.only(end: 20.0),
                                child: Text(
                                  '${widget.trendDealsItem.title}\n\n',
                                  maxLines: 3,
                                  style: context.easyTheme.textTheme.bodyMedium!
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
                                      width: 15.0),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  Expanded(
                                      child: Text(
                                    '${context.locale.swap_in_title} ${widget.trendDealsItem.citySwap}, ${widget.trendDealsItem.countrySwap}',
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(fontSize: 16.0),
                                    overflow: TextOverflow.fade,
                                  )),
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 6.0),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text:
                                              '${context.locale.swap_by_title} ',
                                          style: context
                                              .easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 20.0,
                                                  color: ColorName.gray)),
                                      TextSpan(
                                          text:
                                              '${widget.trendDealsItem.user!.name}',
                                          style: context
                                              .easyTheme.textTheme.bodyMedium!
                                              .copyWith(fontSize: 20.0)),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(end: 13.0),
                                child: Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: TextButtonWidget(
                                    text: context.locale.see_details_title,
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                            fontSize: 14.0,
                                            color: ColorName.skyBlue),
                                    onPressed: () => seeSourceDetails(
                                        context, widget.trendDealsItem),
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
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 8.0,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  context.locale.swap_offer_instruction,
                  textAlign: TextAlign.center,
                  style: context.easyTheme.textTheme.headlineMedium!.copyWith(
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 15.0,
              ),
            ),
            // BlocBuilder<SwapProBloc, SwapProState>(
            //   builder: (context, state) {
            //     return SliverToBoxAdapter(
            //       child: state.mySwapProductListData.isNotEmpty
            //           ? CarouselSlider(
            //               options: CarouselOptions(
            //                 viewportFraction: 0.85,
            //                 initialPage: 0,
            //                 enableInfiniteScroll: false,
            //                 scrollDirection: Axis.horizontal,
            //                 onPageChanged: (index, reason) {
            //                   SwapPassDataBloc.get
            //                       .add(PassMySwapProductDataEvent(index: index));
            //                   this.index = index;
            //                 },
            //               ),
            //               items:
            //                   state.mySwapProductListData.mapIndexed((index, i) {
            //                 return BlocBuilder<SwapPassDataBloc,
            //                     SwapPassDataState>(
            //                   builder: (context, passState) {
            //                     return Container(
            //                       width: double.infinity,
            //                       margin: const EdgeInsetsDirectional.only(
            //                           start: 8, end: 8.0, bottom: 8.0),
            //                       decoration: BoxDecoration(
            //                           color: ColorName.white,
            //                           borderRadius: const BorderRadius.all(
            //                               Radius.circular(4.0)),
            //                           border: passState.itemIndex == index
            //                               ? Border.all(
            //                                   color: Colors.amber, width: 2.0)
            //                               : null,
            //                           boxShadow: const [
            //                             BoxShadow(
            //                               color: Color.fromRGBO(0, 0, 0, 0.16),
            //                               offset: Offset(0, 3),
            //                               blurRadius: 6.0,
            //                             )
            //                           ]),
            //                       child: Row(
            //                         crossAxisAlignment: CrossAxisAlignment.start,
            //                         children: [
            //                           const SizedBox(
            //                             width: 11.0,
            //                           ),
            //                           Expanded(
            //                             child: Padding(
            //                               padding:
            //                                   const EdgeInsets.only(top: 32.0),
            //                               child: CachedImage(
            //                                   imageUrl:
            //                                       i.itemImg!.first.toString()),
            //                             ),
            //                           ),
            //                           const SizedBox(
            //                             width: 18.0,
            //                           ),
            //                           Expanded(
            //                             flex: 2,
            //                             child: Column(
            //                               crossAxisAlignment:
            //                                   CrossAxisAlignment.start,
            //                               children: [
            //                                 const SizedBox(
            //                                   height: 20.0,
            //                                 ),
            //                                 Flexible(
            //                                   child: Padding(
            //                                     padding:
            //                                         const EdgeInsetsDirectional
            //                                             .only(end: 8.0),
            //                                     child: Text(
            //                                       '${i.title}\n\n\n',
            //                                       maxLines: 3,
            //                                       style: context.easyTheme
            //                                           .textTheme.bodyMedium!
            //                                           .copyWith(
            //                                               fontSize: 20.0,
            //                                               color: ColorName.gray,
            //                                               overflow: TextOverflow
            //                                                   .ellipsis),
            //                                     ),
            //                                   ),
            //                                 ),
            //                                 const SizedBox(
            //                                   height: 10.0,
            //                                 ),
            //                                 Container(
            //                                   constraints: const BoxConstraints(
            //                                       maxWidth: 66.0),
            //                                   decoration: BoxDecoration(
            //                                     color: ColorName.red,
            //                                     borderRadius: BorderRadius.all(
            //                                         Radius.circular(4.0.r)),
            //                                   ),
            //                                   child: Center(
            //                                     child: Text(
            //                                       context.locale.swap_tag_title,
            //                                       textAlign: TextAlign.center,
            //                                       style: context.easyTheme
            //                                           .textTheme.headlineMedium!
            //                                           .copyWith(
            //                                               fontSize: 14.0,
            //                                               color: ColorName.white),
            //                                     ),
            //                                   ),
            //                                 ),
            //                                 const SizedBox(
            //                                   height: 6.0,
            //                                 ),
            //                                 TextButtonWidget(
            //                                   text: context.locale
            //                                       .see_details_my_swap_product,
            //                                   onPressed: () =>
            //                                       seeOfferDetails(context, i),
            //                                   style: context
            //                                       .easyTheme.textTheme.bodyMedium!
            //                                       .copyWith(
            //                                           fontSize: 14.0,
            //                                           color: ColorName.skyBlue),
            //                                 ),
            //                                 const SizedBox(
            //                                   height: 12.0,
            //                                 ),
            //                               ],
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     );
            //                   },
            //                 );
            //               }).toList(),
            //             )
            //           : const SizedBox(),
            //     );
            //   },
            // ),
            SliverToBoxAdapter(
              child: BlocBuilder<SwapProBloc, SwapProState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 220,
                    child: PageView.builder(
                        controller: controller,
                        itemCount: !state.isMoreData
                            ? state.mySwapProductListData.length + 1
                            : state.mySwapProductListData.length,
                        onPageChanged: (index) {
                          if (index < state.mySwapProductListData.length) {
                            SwapPassDataBloc.get
                                .add(PassMySwapProductDataEvent(index: index));
                            this.index = index;
                          }
                        },
                        itemBuilder: (ctx, index) {
                          if (index < state.mySwapProductListData.length) {
                            final model = state.mySwapProductListData[index];
                            return BlocBuilder<SwapPassDataBloc,
                                    SwapPassDataState>(
                                builder: (context, passState) {
                              return Container(
                                width: double.infinity,
                                margin: const EdgeInsetsDirectional.only(
                                    start: 8, end: 8.0, bottom: 8.0),
                                decoration: BoxDecoration(
                                    color: ColorName.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    border: passState.itemIndex == index
                                        ? Border.all(
                                            color: Colors.amber, width: 2.0)
                                        : null,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.16),
                                        offset: Offset(0, 3),
                                        blurRadius: 6.0,
                                      )
                                    ]),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 11.0,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 32.0),
                                        child: CachedImage(
                                            imageUrl: model.itemImg!.first
                                                .toString()),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 18.0,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .only(end: 8.0),
                                              child: Text(
                                                '${model.title}\n\n\n',
                                                maxLines: 3,
                                                style: context.easyTheme
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                        fontSize: 20.0,
                                                        color: ColorName.gray,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 66.0),
                                            decoration: BoxDecoration(
                                              color: ColorName.red,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0.r)),
                                            ),
                                            child: Center(
                                              child: Text(
                                                context.locale.swap_tag_title,
                                                textAlign: TextAlign.center,
                                                style: context.easyTheme
                                                    .textTheme.headlineMedium!
                                                    .copyWith(
                                                        fontSize: 14.0,
                                                        color: ColorName.white),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          TextButtonWidget(
                                            text: context.locale
                                                .see_details_my_swap_product,
                                            onPressed: () =>
                                                seeOfferDetails(context, model),
                                            style: context
                                                .easyTheme.textTheme.bodyMedium!
                                                .copyWith(
                                                    fontSize: 14.0,
                                                    color: ColorName.skyBlue),
                                          ),
                                          const SizedBox(
                                            height: 12.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                          } else {
                            return !state.isMoreData
                                ? const Center(
                                    child: CircularProgressIndicatorWidget())
                                : const SizedBox();
                          }
                        }),
                  );
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 15.0,
              ),
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
                height: 13.0,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.locale.comment_instruction_title,
                      style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                          fontSize: 18.0,
                          color: ColorName.black.withOpacity(0.5)),
                    ),
                    Container(
                      height: 103.0,
                      width: double.infinity,
                      padding: const EdgeInsetsDirectional.only(
                          start: 10.0, end: 10, top: 7.0),
                      decoration: const BoxDecoration(
                          color: ColorName.white,
                          borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      child: TextFormFieldWidget(
                        controller: commentController,
                        hintText: context.locale.add_swap_comment_hint,
                        isUnderlineOn: true,
                        maxLines: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40.0,
              ),
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<SwapProBloc, SwapProState>(
                builder: (context, state) {
                  return Center(
                      child: DefaultButtonWidget(
                          text: context.locale.send_offer_button_title,
                          style: context.easyTheme.elevatedButtonTheme.style!
                              .copyWith(
                            backgroundColor: MaterialStateProperty.all(
                                state.mySwapProductListData.isNotEmpty
                                    ? ColorName.blueGray
                                    : ColorName.blueGray.withOpacity(0.5)),
                          ),
                          onPressed: () =>
                              state.mySwapProductListData.isNotEmpty
                                  ? sendOffer(context, index)
                                  : () {}));
                },
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 50.0)),
          ],
        ),
      ),
    );
  }

  void sendOffer(BuildContext context, int index) {
    passAllData(context, index);
  }

  void passAllData(context, int index) {
    SwapPassDataBloc.get
        .add(PassSwapCommentEvent(comment: commentController.text));
    SwapPassDataBloc.get.add(PassMySwapProductDataEvent(index: index));
    openSwapOfferDetailsScreen(context);
  }

  void openSwapOfferDetailsScreen(context) {
    Utils.openNavNewPage(
        context, SwapOfferDetailsScreen(trendDealsItem: widget.trendDealsItem));
  }

  void seeSourceDetails(BuildContext context, TrendDealsItem trendDealsItem) {
    ProPreviewerModel previewerModel = ProPreviewerModel();
    previewerModel
      ..userName = trendDealsItem.user!.name
      ..itemImage = trendDealsItem.itemImg
      ..title = trendDealsItem.title
      ..sectionName = trendDealsItem.section!.name.toString()
      ..sectionArName = trendDealsItem.section!.arName.toString()
      ..brandName = trendDealsItem.brand!.brandName
      ..brandArName = trendDealsItem.brand!.arName
      ..categoryName = trendDealsItem.category!.name
      ..categoryArName = trendDealsItem.category!.arName
      ..citySwap = trendDealsItem.citySwap
      ..countrySwap = trendDealsItem.countrySwap
      ..year = trendDealsItem.year
      ..date = trendDealsItem.date
      ..description = trendDealsItem.description
      ..offerCount = trendDealsItem.offerCount;
    Utils.openNavNewPage(
        context, MySwapPreviewerScreen(previewerModel: previewerModel));
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
      ..citySwap = myProductItem.citySwap
      ..countrySwap = myProductItem.countrySwap
      ..year = myProductItem.year
      ..date = myProductItem.date
      ..description = myProductItem.description
      ..offerCount = myProductItem.offerCount;
    Utils.openNavNewPage(
        context, MySwapPreviewerScreen(previewerModel: previewerModel));
  }
}
