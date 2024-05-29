import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class SwapSectionScreen extends StatelessWidget {
  final SwapState swapState;
  const SwapSectionScreen({
    super.key,
    required this.swapState,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwapSectionsBloc, SwapSectionsState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              const SwapAppBarWidget(),
              const SliverToBoxAdapter(child: SizedBox(height: 26.0)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Text(
                    context.locale.swap_section_title,
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 18.0, color: ColorName.black),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 17.0),
                  child: SizedBox(
                    height: 150.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        SwapSectionItemModel sectionModel =
                            swapState.swapSectionListData[index];
                        return GestureDetector(
                          onTap: () => getSectionCategories(sectionModel.id!,
                              index, sectionModel.name.toString()),
                          child: SwapPopularCategoriesWidget(
                            data: sectionModel,
                            index: index,
                            secIndex: state.sectionIndex,
                          ),
                        );
                      },
                      itemCount: swapState.swapSectionListData.length,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 29.5)),
              SliverToBoxAdapter(
                child: Divider(
                  color: ColorName.gray.withOpacity(0.36),
                  endIndent: 46.0,
                  indent: 46.0,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 29.5)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 31.0),
                  child: Text(
                    '${state.categoryTitle} ${context.locale.swap_category_title}',
                    style: context.easyTheme.textTheme.headlineMedium!.copyWith(
                      fontSize: 24.0,
                      color: ColorName.black.withOpacity(0.57),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 15.0)),
              state.swapCategoriesListData.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                      (context, index) => GestureDetector(
                        onTap: () => openSubCategories(
                            context,
                            state.swapCategoriesListData,
                            state.swapCategoriesListData[index].id!,
                            index),
                        child: SwapSectionCategoryItem(
                            swapCategoryItem:
                                state.swapCategoriesListData[index]),
                      ),
                      childCount: state.swapCategoriesListData.length,
                    ))
                  : const SliverToBoxAdapter(child: SizedBox()),
              const SliverToBoxAdapter(child: SizedBox(height: 30.0)),
              SliverToBoxAdapter(child: seeMoreHandler(state, context)),
              const SliverToBoxAdapter(child: SizedBox(height: 50.0)),
            ],
          ),
        );
      },
    );
  }

  void getSectionCategories(int secID, int sectionIndex, String categoryTitle) {
    SwapSectionsBloc.get.add(SwapGetCategoryBySectionIDEvent(
        secID: secID,
        sectionIndex: sectionIndex,
        categoryTitle: categoryTitle));
  }

  void onSeeMore() => SwapSectionsBloc.get
      .add(SwapGetCategoryBySectionIDEvent(isSeeMore: true));

  void openSubCategories(context, List<SwapCategoryItem> swapCategoriesListData,
      int catID, int index) {
    SwapFilterBloc.get.add(SwapSelectCategoryItemEvent(index: -1));
    SwapFilterBloc.get.add(GetSwapCitiesEvent());
    SwapFilterBloc.get.add(GetSwapSubCategoriesEvent(catID: catID));
    SwapFilterBloc.get.add(SwapPreviewSectionSubCategoriesEvent(
        catID: catID, isFilterActive: false));
    Utils.openNavNewPage(context, SwapResultsScreen(catID: catID));
  }

  Widget seeMoreHandler(SwapSectionsState state, BuildContext context) {
    switch (!state.isMoreData) {
      case true:
        switch (state.swapSectionsStateStatus) {
          case SwapSectionsStateStatus.LOADINGMORE:
            return const CircularProgressIndicatorWidget();
          default:
            return Center(
                child: TextButtonWidget(
              text: context.locale.swap_see_more_text_button,
              onPressed: () => onSeeMore(),
              isBold: true,
            ));
        }
      default:
        return const SizedBox();
    }
  }
}
