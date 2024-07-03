import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapDataWidget extends StatefulWidget {
  final SwapState state;
  const SwapDataWidget({super.key, required this.state});

  @override
  State<SwapDataWidget> createState() => _SwapDataWidgetState();
}

class _SwapDataWidgetState extends State<SwapDataWidget> {
  final controller = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollListener();
  }

  void scrollListener() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        loadMore();
      }
    });
  }

  void loadMore() {
    SwapBloc.get.add(SwapGetSectionDataEvent(isSeeMore: true));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverPadding(padding: EdgeInsets.only(top: 14.0)),
        SliverToBoxAdapter(
          child: Center(
            child: Text(
              'Version: 6',
              style: context.easyTheme.textTheme.headlineLarge!.copyWith(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 14.0)),

        ///Swap Carousel slider.
        const SliverToBoxAdapter(child: SwapCarouselSliderWidget()),
        const SliverPadding(padding: EdgeInsets.only(top: 24.0)),

        ///Popular Swap-section.
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              context.locale.swap_popular_swap_sections,
              style: context.easyTheme.textTheme.headlineSmall!
                  .copyWith(fontSize: 18.0),
            ),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 10.0)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 150.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller,
                itemBuilder: (ctx, index) {
                  if (index < widget.state.swapSectionListData.length) {
                    SwapSectionItemModel swapSectionItemModel =
                        widget.state.swapSectionListData[index];
                    return GestureDetector(
                      onTap: () => exploreSection(
                          context,
                          widget.state,
                          swapSectionItemModel.id!,
                          index,
                          swapSectionItemModel.name.toString(),
                          swapSectionItemModel.arName.toString()),
                      child: SwapPopularCategoriesWidget(
                        data: widget.state.swapSectionListData[index],
                      ),
                    );
                  } else {
                    return !widget.state.isMoreData
                        ? const Padding(
                            padding: EdgeInsetsDirectional.only(
                              end: 20.0,
                            ),
                            child: CircularProgressIndicatorWidget(),
                          )
                        : const SizedBox();
                  }
                },
                itemCount: widget.state.swapSectionListData.length + 1,
              ),
            ),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 16.0)),

        ///Trending Deals To Swap-section.
        SliverToBoxAdapter(
          child: BlocBuilder<TrendDealsBloc, TrendDealsState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      context.locale.swap_trending_deals_to_swap,
                      style:
                          context.easyTheme.textTheme.headlineMedium!.copyWith(
                        fontSize: 18.0,
                      ),
                    ),
                    const Spacer(),
                    state.trendDealsListData.length > 4
                        ? TextButtonWidget(
                            text: context.locale.swap_trending_deal_view_all,
                            isBold: true,
                            onPressed: () => openViewAllScreen(),
                          )
                        : const SizedBox(),
                  ],
                ),
              );
            },
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 14.0)),
        BlocBuilder<TrendDealsBloc, TrendDealsState>(
          builder: (context, state) {
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (_, index) {
                      TrendDealsItem trendDealsItem =
                          state.trendDealsListData[index];
                      return SwapTrendDealProduct(
                          trendDealsItem: trendDealsItem);
                    },
                    childCount: state.trendDealsListData.length <= 4
                        ? state.trendDealsListData.length
                        : 4,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 8.0)),
            );
          },
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 25.0)),

        // BlocBuilder<TrendDealsBloc, TrendDealsState>(builder: (context, state) {
        //   return SliverToBoxAdapter(
        //     child: !state.isMoreData
        //         ? !state.swapTodayDealsStateStatus.isLoadingMore
        //             ? Center(
        //                 child: GestureDetector(
        //                   onTap: () => onSeeMore(),
        //                   child: Text(
        //                     context.locale.see_more,
        //                     style: context.easyTheme.textTheme.bodyLarge!
        //                         .copyWith(
        //                             fontSize: 16.0,
        //                             color: ColorName.skyBlue,
        //                             fontWeight: FontWeight.bold),
        //                   ),
        //                 ),
        //               )
        //             : const CircularProgressIndicatorWidget()
        //         : const SizedBox(),
        //   );
        // }),
        const SliverPadding(padding: EdgeInsets.only(top: 50.0)),
      ],
    );
  }

  void onSeeMore() {
    TrendDealsBloc.get.add(GetTrendDealsDataEvent(isSeeMore: true));
  }

  void exploreSection(
    context,
    SwapState state,
    int secID,
    int sectionIndex,
    String categoryTitle,
    String arCategoryTitle,
  ) {
    SwapSectionsBloc.get.add(SwapGetCategoryBySectionIDEvent(
      secID: secID,
      sectionIndex: sectionIndex,
      categoryTitle: categoryTitle,
      arCategoryTitle: arCategoryTitle,
    ));
    openSectionScreen(context, state);
  }

  void openSectionScreen(context, SwapState state) {
    Utils.openNavNewPage(
        context,
        SwapSectionScreen(
          swapState: state,
        ));
  }

  void openViewAllScreen() {
    TrendDealsBloc.get.add(GetItemsViewAllsEvent());
    TrendDealsBloc.get.add(GetViewAllsCitiesEvent());
    Utils.openNavNewPage(context, const ViewAllDealsScreen());
  }
}
