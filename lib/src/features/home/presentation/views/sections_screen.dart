import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class SectionScreen extends StatefulWidget {
  final HomeState homeState;
  const SectionScreen({super.key, required this.homeState});

  @override
  State<SectionScreen> createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
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
    print('4564545465446545');
    HomeBloc.get.add(GetSectionDataEvent(isSeeMore: true));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionsBloc, SectionsState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              const HomeAppBarWidget(),
              const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Text(
                    context.locale.section_screen_title,
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 18.0, color: ColorName.black),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 20.0),
                      child: SizedBox(
                        height: 150.0,
                        child: ListView.builder(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            if (index < state.sectionListData.length) {
                              SectionItemModel sectionItem =
                                  state.sectionListData[index];
                              return InkWell(
                                highlightColor: ColorName.transparent,
                                splashColor: ColorName.transparent,
                                onTap: () {
                                  getSectionCategories(sectionItem.id!, index,
                                      sectionItem.name!, sectionItem.arName!);
                                },
                                child: PopularCategoriesWidget(
                                  data: state.sectionListData[index],
                                  index: index,
                                ),
                              );
                            } else {
                              return !state.isMoreData
                                  ? const Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        end: 20.0,
                                      ),
                                      child: CircularProgressIndicatorWidget(),
                                    )
                                  : const SizedBox();
                            }
                          },
                          itemCount: state.sectionListData.length + 1,
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
                    '${Utils.isEnglish ? state.categoryTitle : state.arCategoryTitle} ${context.locale.category_title}',
                    style: context.easyTheme.textTheme.headlineMedium!.copyWith(
                      fontSize: 20.0.sp,
                      color: ColorName.black.withOpacity(0.57),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 4.0)),
              state.categoriesListData.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                      (context, index) => GestureDetector(
                        onTap: () => openSubCategories(
                            context,
                            state.categoriesListData,
                            state.categoriesListData[index].id!,
                            index),
                        child: SectionCategoryItem(
                            categoryItem: state.categoriesListData[index]),
                      ),
                      childCount: state.categoriesListData.length,
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
    SectionsBloc.get.add(GetCategoryBySectionIDEvent(
      secID: secID,
      sectionIndex: sectionIndex,
      categoryTitle: categoryTitle,
      arCategoryTitle: arCategoryTitle,
    ));
  }

  void onSeeMore() =>
      SectionsBloc.get.add(GetCategoryBySectionIDEvent(isSeeMore: true));

  void openSubCategories(BuildContext context,
      List<CategoryItem> categoriesListData, int catID, int index) {
    FilterBloc.get.add(GetCitiesEvent());
    FilterBloc.get.add(ClearFilterDataEvent());
    FilterBloc.get.add(SelectCategoryItemEvent(index: -1));
    FilterBloc.get.add(GetSubCategoriesEvent(catID: catID));
    FilterBloc.get.add(PreviewSectionSubCategoriesEvent(catID: catID));
    Utils.openNavNewPage(context, ResultsScreen(catID: catID));
  }

  Widget seeMoreHandler(SectionsState state, BuildContext context) {
    switch (!state.isMoreData) {
      case true:
        switch (state.sectionsStateStatus) {
          case SectionsStateStatus.LOADINGMORE:
            return const CircularProgressIndicatorWidget();
          default:
            return Center(
                child: TextButtonWidget(
              text: context.locale.see_more_category_title,
              onPressed: () => onSeeMore(),
              isBold: true,
            ));
        }
      default:
        return const SizedBox();
    }
  }
}
