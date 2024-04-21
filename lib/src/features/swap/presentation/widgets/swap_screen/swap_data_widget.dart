import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapDataWidget extends StatelessWidget {
  final SwapState state;
  const SwapDataWidget({super.key, required this.state});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
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
              style: context.easyTheme.textTheme.headlineSmall,
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
                itemBuilder: (ctx, index) {
                  SwapSectionItemModel sectionItem =
                      state.swapSectionListData[index];
                  return GestureDetector(
                    onTap: () => exploreSection(context, state, sectionItem.id!,
                        index, sectionItem.name.toString()),
                    child: SwapPopularCategoriesWidget(
                      data: state.swapSectionListData[index],
                    ),
                  );
                },
                itemCount: state.swapSectionListData.length,
              ),
            ),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 16.0)),

        ///Trending Deals To Swap-section.
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              context.locale.swap_trending_deals_to_swap,
              style: context.easyTheme.textTheme.headlineMedium!.copyWith(
                fontSize: 18.0,
              ),
            ),
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
                    childCount: state.trendDealsListData.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0)),
            );
          },
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 40.0)),
      ],
    );
  }

  void exploreSection(context, SwapState state, int secID, int sectionIndex,
      String categoryTitle) {
    SwapSectionsBloc.get.add(SwapGetCategoryBySectionIDEvent(
        secID: secID,
        sectionIndex: sectionIndex,
        categoryTitle: categoryTitle));
    openSectionScreen(context, state);
  }

  void openSectionScreen(context, SwapState state) {
    Utils.openNavNewPage(context, SwapSectionScreen(swapState: state));
  }
}
