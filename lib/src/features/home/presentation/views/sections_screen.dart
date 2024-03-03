import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class SectionScreen extends StatelessWidget {
  final HomeState homeState;
  const SectionScreen({super.key, required this.homeState});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionsBloc, SectionsState>(
  builder: (context, state) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 26.0)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Text(
              'Sections',
              style: easyTheme.textTheme.headlineMedium!.copyWith(
                fontSize: 18.0,
                color: ColorName.black
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
        SliverToBoxAdapter(
          child: Padding(
            padding:const EdgeInsetsDirectional.symmetric(horizontal: 17.0),
            child: SizedBox(
              height: 150.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  SectionItemModel sectionModel =homeState.sectionListData[index] ;
                  return GestureDetector(
                    onTap:()=> getSectionCategories(sectionModel.id!,index,sectionModel.name.toString()),
                    child: PopularCategoriesWidget(
                      data: sectionModel,
                      index: index,
                      secIndex: state.sectionIndex,
                    ),
                  );
                },
                itemCount:homeState.sectionListData.length,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 29.5)),
        SliverToBoxAdapter(
          child: Divider(color: ColorName.gray.withOpacity(0.36),endIndent: 46.0,indent: 46.0,),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 29.5)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 31.0),
            child: Text(
              '${state.categoryTitle} Category',
              style: easyTheme.textTheme.headlineMedium!.copyWith(
                  fontSize: 24.0,
                  color: ColorName.black.withOpacity(0.57),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 15.0)),
        state.categoriesListData.isNotEmpty
            ? SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, index) => GestureDetector(
                      onTap: ()=> openSubCategories(state.categoriesListData,index),
                      child: SectionCategoryItem(
                          categoryItem: state.categoriesListData[index]),
                    ),
                    childCount: state.categoriesListData.length,
            ))
            : const SliverToBoxAdapter(child: SizedBox()),
        const SliverToBoxAdapter(child: SizedBox(height: 30.0)),
            SliverToBoxAdapter(
                child: seeMoreHandler(state)),
            const SliverToBoxAdapter(child: SizedBox(height: 50.0)),

      ],
    );
  },
);
  }

  void getSectionCategories(int secID,int sectionIndex,String categoryTitle) {
    SectionsBloc.get.add(GetCategoryBySectionIDEvent(secID: secID, sectionIndex:sectionIndex , categoryTitle: categoryTitle));
  }

  void onSeeMore()=>SectionsBloc.get.add(GetCategoryBySectionIDEvent(isSeeMore: true));

  void openSubCategories(List<CategoryItem> categoriesListData,index) {
    PassDataBloc.get.add(PassSectionSubCategoriesEvent(categoriesListData:categoriesListData));
    PassDataBloc.get.add(PreviewSectionSubCategoriesEvent(index:index));
    HomeBloc.get.add(GetToTopScreenEvent());
    HomeBloc.get.add(SwapHomeScreenStateEvent(homeScreenState: HomeScreenState.SUBCATEGORYRESULT));
  }

  Widget seeMoreHandler(SectionsState state) {
    switch (!state.isMoreData) {
      case true:
        switch (state.sectionsStateStatus) {
          case SectionsStateStatus.LOADINGMORE:
            return const CircularProgressIndicatorWidget();
          default:
            return Center(
                child: TextButtonWidget(
                  text: 'See More',
                  onPressed: () => onSeeMore(),
                  isBold: true,
                ));
        }
      default:
        return const SizedBox();
    }
  }

}



