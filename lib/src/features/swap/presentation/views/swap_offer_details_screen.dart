import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class SwapOfferDetailsScreen extends StatelessWidget {
  final TrendDealsItem trendDealsItem;
  const SwapOfferDetailsScreen({super.key, required this.trendDealsItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.whiteSmoke,
      body: BlocBuilder<SwapPassDataBloc, SwapPassDataState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              const SwapAppBarWidget(),
              const SliverToBoxAdapter(child: SizedBox(height: 8.0)),
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsetsDirectional.symmetric(horizontal: 21.0),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 11.0),
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(top: 32.0),
                            child: CachedImage(
                              imageUrl: trendDealsItem.itemImg != null
                                  ? trendDealsItem.itemImg!.first
                                  : '',
                            )),
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
                                '${trendDealsItem.title}',
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 20.0,
                                        color: ColorName.gray,
                                        overflow: TextOverflow.fade),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Assets.svg.locationPinIcon.svg(
                                    color: ColorName.amber,
                                    height: 20.sp,
                                    width: 20.sp),
                                const SizedBox(
                                  width: 6.0,
                                ),
                                Expanded(
                                    child: Text(
                                  '${context.locale.swap_offer_swap_in_title} ${trendDealsItem.citySwap}, ${trendDealsItem.countrySwap}',
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
                                  const EdgeInsetsDirectional.only(start: 6.0),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text:
                                            context.locale.swap_offer_by_title,
                                        style: context
                                            .easyTheme.textTheme.bodyMedium!
                                            .copyWith(
                                                fontSize: 20.0,
                                                color: ColorName.gray)),
                                    TextSpan(
                                        text: '${trendDealsItem.user!.name}',
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
                                  text: context
                                      .locale.swap_see_details_text_button,
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(
                                          color: ColorName.skyBlue,
                                          fontSize: 13.0.sp),
                                  onPressed: () =>
                                      seeDetails(context, trendDealsItem),
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
                  height: 8.0,
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Assets.png.swapIcon.image(width: 40.0, height: 40.0),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 15.0,
                ),
              ),
              SliverToBoxAdapter(
                child: state.itemSelected.isNotEmpty
                    ? Container(
                        margin: const EdgeInsetsDirectional.only(
                            start: 21.0, end: 21.0, bottom: 44.0),
                        padding: const EdgeInsetsDirectional.only(
                          start: 22.0,
                          bottom: 27.0,
                        ),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: ColorName.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.16),
                                offset: Offset(0, 3),
                                blurRadius: 6.0,
                              )
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 11.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 32.0),
                                    child: CachedImage(
                                        imageUrl: state
                                            .itemSelected.first.itemImg!.first),
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
                                      Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                end: 30.0),
                                        child: Text(
                                          '${state.itemSelected.first.title}',
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
                                            context.locale.swap_offer_tag_title,
                                            textAlign: TextAlign.center,
                                            style: context.easyTheme.textTheme
                                                .headlineMedium!
                                                .copyWith(
                                                    fontSize: 14.0,
                                                    color: ColorName.white),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 34.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.locale.swap_offer_your_comment_title,
                                  style: context.easyTheme.textTheme.bodyLarge!
                                      .copyWith(
                                          fontSize: 20.0.sp,
                                          color:
                                              ColorName.black.withOpacity(0.5)),
                                ),
                                const SizedBox(
                                  height: 13.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 14.0),
                                  child: Text(
                                    state.comment.toString(),
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                            fontSize: 14.0.sp,
                                            fontWeight: FontWeight.normal,
                                            color: ColorName.blueGray),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 15.0,
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                    child: DefaultButtonWidget(
                        text: context.locale.swap_offer_continue_button_title,
                        onPressed: () => onContinue(
                              context,
                              trendDealsItem.id.toString(),
                              state.itemSelected.first.id.toString(),
                              state.comment.toString(),
                              trendDealsItem.user!.id.toString(),
                              ValueConstants.userId,
                            ))),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 50.0,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void onContinue(
    BuildContext context,
    String sourceItem,
    String offerItem,
    String comment,
    String sourceUser,
    String offerUser,
  ) {
    SwapBloc.get.add(SendOfferEvent(
      context: context,
      sourceItem: sourceItem,
      offerItem: offerItem,
      comment: comment,
      sourceUser: sourceUser,
      offerUser: offerUser,
      trendDealsItem: trendDealsItem,
    ));
  }

  void seeDetails(BuildContext context, TrendDealsItem trendDealsItem) {
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
}
