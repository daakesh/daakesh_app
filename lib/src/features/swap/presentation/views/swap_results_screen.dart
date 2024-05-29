import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class SwapResultsScreen extends StatelessWidget {
  final int catID;
  const SwapResultsScreen({super.key, required this.catID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SwapAppBarWidget(),
          const SliverPadding(padding: EdgeInsets.only(top: 14.0)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: BlocBuilder<SwapFilterBloc, SwapFilterState>(
                  builder: (context, state) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () => getSubCategoriesData(catID, -1),
                      child: Container(
                        height: 38.0,
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 14.0),
                        decoration: BoxDecoration(
                            color: -1 == state.categoryIndex
                                ? const Color(0xFFf2cd98)
                                : ColorName.paleGray,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0))),
                        child: Center(
                            child: Text(Utils.isEnglish ? "All" : "الكل")),
                      ),
                    ),
                    const SizedBox(
                      width: 11.0,
                    ),
                    BlocBuilder<SwapFilterBloc, SwapFilterState>(
                      builder: (context, state) {
                        return Expanded(
                          child: SizedBox(
                            height: 38.0,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.subCategoryList.length,
                              separatorBuilder: (_, i) {
                                return const SizedBox(
                                  width: 11.0,
                                );
                              },
                              itemBuilder: (_, index) {
                                SubCategory subCategory =
                                    state.subCategoryList[index];
                                return GestureDetector(
                                  onTap: () => getItemsBySubCategoriesID(
                                      state.subCategoryList[index].id!, index),
                                  child: Container(
                                    height: 38.0,
                                    padding:
                                        const EdgeInsetsDirectional.symmetric(
                                            horizontal: 14.0),
                                    decoration: BoxDecoration(
                                        color: state.categoryIndex == index
                                            ? const Color(0xFFf2cd98)
                                            : ColorName.paleGray,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: Center(
                                        child: Text(Utils.isEnglish
                                            ? '${subCategory.name}'
                                            : '${subCategory.arName}')),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 11.0,
                    ),
                    GestureDetector(
                        onTap: () => openSwapFilterScreen(context),
                        child: Assets.png.filterIcon
                            .image(width: 38.0, height: 38.0))
                  ],
                );
              }),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Divider(
                color: ColorName.gray.withOpacity(0.25),
                indent: 14.0,
                endIndent: 14.0,
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 7.0)),
          SliverToBoxAdapter(
            child: BlocBuilder<SwapFilterBloc, SwapFilterState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(context.locale.results_title,
                            style: context.easyTheme.textTheme.headlineMedium),
                      ),
                      GestureDetector(
                        onTap: () => state.sortingType == SortingType.desc
                            ? SwapFilterBloc.get.add(
                                SwapPreviewSectionSubCategoriesEvent(
                                    sortingType: SortingType.asc))
                            : SwapFilterBloc.get.add(
                                SwapPreviewSectionSubCategoriesEvent(
                                    sortingType: SortingType.desc)),
                        child: Assets.svg.sortIcon.svg(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 13.0)),
          BlocBuilder<SwapFilterBloc, SwapFilterState>(
            builder: (context, state) {
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                (_, index) {
                  TrendDealsItem trendDealsItem =
                      state.subCategoryListData[index];
                  return GestureDetector(
                    onTap: () =>
                        openSwapMoreInfoScreen(context, trendDealsItem),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 17),
                      child:
                          SwapResultItemWidget(trendDealsItem: trendDealsItem),
                    ),
                  );
                },
                childCount: state.subCategoryListData.length,
              ));
            },
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 30.0)),
          SliverToBoxAdapter(
              child: BlocBuilder<SwapFilterBloc, SwapFilterState>(
            builder: (context, state) {
              return seeMoreHandler(state, context);
            },
          )),
          const SliverPadding(padding: EdgeInsets.only(top: 60.0)),
        ],
      ),
    );
  }

  Widget seeMoreHandler(SwapFilterState state, BuildContext context) {
    switch (!state.isMoreData) {
      case true:
        switch (state.swapFilterStateStatus) {
          case SwapFilterStateStatus.LOADINGMORE:
            return const CircularProgressIndicatorWidget();
          default:
            return Center(
                child: TextButtonWidget(
              text: context.locale.swap_results_see_more_text_button,
              onPressed: () => onSeeMore(),
              isBold: true,
            ));
        }
      default:
        return state.swapFilterStateStatus.isNull
            ? Center(child: Text(context.locale.swap_results_no_data))
            : const SizedBox();
    }
  }

  void openSwapFilterScreen(context) {
    FocusScope.of(context).unfocus();
    Utils.openNavNewPage(context, SwapFilterScreen());
  }

  void openSwapMoreInfoScreen(context, TrendDealsItem trendDealsItem) {
    Utils.openNavNewPage(
        context,
        SwapMoreInfoScreen(
          trendDealsItem: trendDealsItem,
        ));
  }

  void onSeeMore() {
    SwapFilterBloc.get
        .add(SwapPreviewSectionSubCategoriesEvent(isSeeMore: true));
  }

  void getSubCategoriesData(int catID, int index) {
    SwapFilterBloc.get.add(SwapSelectCategoryItemEvent(index: index));
    SwapFilterBloc.get.add(
        SwapPreviewSectionSubCategoriesEvent(catID: catID, isAllItems: true));
  }

  void getItemsBySubCategoriesID(int subID, int index) {
    SwapFilterBloc.get.add(SwapSelectCategoryItemEvent(index: index));
    SwapFilterBloc.get.add(
        SwapPreviewSectionSubCategoriesEvent(catID: subID, isAllItems: false));
  }
}
