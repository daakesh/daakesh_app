import 'package:daakesh/src/widgets/is_empty_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class SwapSectionScreen extends StatefulWidget {
  final SwapState swapState;
  const SwapSectionScreen({
    super.key,
    required this.swapState,
  });

  @override
  State<SwapSectionScreen> createState() => _SwapSectionScreenState();
}

class _SwapSectionScreenState extends State<SwapSectionScreen> {
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
    return BlocBuilder<SwapSectionsBloc, SwapSectionsState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              const SwapAppBarWidget(),
              const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
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
              BlocBuilder<SwapBloc, SwapState>(
                builder: (context, state) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 20.0),
                      child: SizedBox(
                        height: 150.0,
                        child: state.swapSectionListData.isEmpty
                            ? const IsEmptyDataWidget(name: 'Swap')
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                controller: controller,
                                itemBuilder: (ctx, index) {
                                  if (index <
                                      state.swapSectionListData.length) {
                                    SwapSectionItemModel swapSectionItemModel =
                                        state.swapSectionListData[index];
                                    return InkWell(
                                      highlightColor: ColorName.transparent,
                                      splashColor: ColorName.transparent,
                                      onTap: () {
                                        getSectionCategories(
                                            swapSectionItemModel.id!,
                                            index,
                                            swapSectionItemModel.name!,
                                            swapSectionItemModel.arName!);
                                      },
                                      child: SwapPopularCategoriesWidget(
                                        data: state.swapSectionListData[index],
                                        index: index,
                                      ),
                                    );
                                  } else {
                                    return !state.isMoreData
                                        ? const Padding(
                                            padding: EdgeInsetsDirectional.only(
                                              end: 20.0,
                                            ),
                                            child:
                                                CircularProgressIndicatorWidget(),
                                          )
                                        : const SizedBox();
                                  }
                                },
                                itemCount: state.swapSectionListData.length + 1,
                              ),
                      ),
                    ),
                  );
                },
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 6.0)),
              SliverToBoxAdapter(
                child: Divider(
                  color: ColorName.gray.withOpacity(0.36),
                  endIndent: 46.0,
                  indent: 46.0,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Text(
                    '${Utils.isEnglish ? state.categoryTitle : state.arCategoryTitle} ${context.locale.swap_category_title}',
                    style: context.easyTheme.textTheme.headlineMedium!.copyWith(
                      fontSize: 20,
                      color: ColorName.black.withOpacity(0.57),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 4.0)),
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

  void getSectionCategories(int secID, int sectionIndex, String categoryTitle,
      String arCategoryTitle) {
    SwapSectionsBloc.get.add(SwapGetCategoryBySectionIDEvent(
      secID: secID,
      sectionIndex: sectionIndex,
      categoryTitle: categoryTitle,
      arCategoryTitle: arCategoryTitle,
    ));
  }

  void onSeeMore() => SwapSectionsBloc.get
      .add(SwapGetCategoryBySectionIDEvent(isSeeMore: true));

  void openSubCategories(context, List<SwapCategoryItem> swapCategoriesListData,
      int catID, int index) {
    SwapFilterBloc.get.add(SwapClearFilterDataEvent());
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
