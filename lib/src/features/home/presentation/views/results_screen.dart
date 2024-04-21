import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class ResultsScreen extends StatelessWidget {
  final List<CategoryItem> categoriesListData;
  const ResultsScreen({super.key, required this.categoriesListData});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        FilterBloc.get.add(ClearFilterDataEvent());
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const HomeAppBarWidget(),
            const SliverPadding(padding: EdgeInsets.only(top: 14.0)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 38.0,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoriesListData.length,
                          separatorBuilder: (_, i) {
                            return const SizedBox(
                              width: 11.0,
                            );
                          },
                          itemBuilder: (_, index) {
                            CategoryItem categoryItem =
                                categoriesListData[index];
                            return GestureDetector(
                              onTap: () => getSubCategoriesData(
                                  categoryItem.id!.toInt()),
                              child: Container(
                                height: 38.0,
                                padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 14.0),
                                decoration: const BoxDecoration(
                                    color: ColorName.paleGray,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child:
                                    Center(child: Text('${categoryItem.name}')),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 11.0,
                    ),
                    // Assets.svg.sortIcon.svg(),
                    GestureDetector(
                        onTap: () => openFilterScreen(context),
                        child: Assets.png.filterIcon
                            .image(width: 38.0, height: 38.0))
                  ],
                ),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Text(context.locale.results_title,
                    style: context.easyTheme.textTheme.headlineMedium),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 13.0)),
            BlocBuilder<FilterBloc, FilterState>(
              builder: (context, state) {
                return SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    FilterResultModel subCategoryItem =
                        state.subCategoryListData[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 17),
                      child: ResultItemWidget(subCategory: subCategoryItem),
                    );
                  },
                  childCount: state.subCategoryListData.length,
                ));
              },
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 30.0)),
            SliverToBoxAdapter(child: BlocBuilder<FilterBloc, FilterState>(
              builder: (context, state) {
                return seeMoreHandler(state, context);
              },
            )),
            const SliverPadding(padding: EdgeInsets.only(top: 60.0)),
          ],
        ),
      ),
    );
  }

  void openFilterScreen(context) {
    FocusScope.of(context).unfocus();
    Utils.openNavNewPage(context, FilterScreen());
  }

  Widget seeMoreHandler(FilterState state, BuildContext context) {
    switch (!state.isMoreData) {
      case true:
        switch (state.filterStateStatus) {
          case FilterStateStatus.LOADINGMORE:
            return const CircularProgressIndicatorWidget();
          default:
            return Center(
                child: TextButtonWidget(
              text: context.locale.see_more_results_title,
              onPressed: () => onSeeMore(),
              isBold: true,
            ));
        }
      default:
        return state.filterStateStatus.isNull
            ? Center(child: Text(context.locale.results_no_data))
            : const SizedBox();
    }
  }

  void onSeeMore() {
    FilterBloc.get.add(PreviewSectionSubCategoriesEvent(isSeeMore: true));
  }

  void getSubCategoriesData(int catID) =>
      FilterBloc.get.add(PreviewSectionSubCategoriesEvent(catID: catID));
}
