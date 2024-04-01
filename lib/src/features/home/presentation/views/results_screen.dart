import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PassDataBloc, PassDataState>(
      builder: (context, state) {
        return Scaffold(
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
                            itemCount: state.categoriesListData.length,
                            separatorBuilder: (_, i) {
                              return const SizedBox(
                                width: 11.0,
                              );
                            },
                            itemBuilder: (_, index) {
                              CategoryItem categoryItem =
                                  state.categoriesListData[index];
                              return GestureDetector(
                                onTap: () => getSubCategoriesData(index),
                                child: Container(
                                  height: 38.0,
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
                                          horizontal: 14.0),
                                  decoration: const BoxDecoration(
                                      color: ColorName.paleGray,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Center(
                                      child: Text('${categoryItem.name}')),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 11.0,
                      ),
                      Assets.svg.sortIcon.svg()
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
                  child: Text('Results',
                      style: context.easyTheme.textTheme.headlineMedium),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 13.0)),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (_, index) {
                  SubCategory subCategoryItem =
                      state.subCategoryListData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 17),
                    child: ResultItemWidget(subCategory: subCategoryItem),
                  );
                },
                childCount: state.subCategoryListData.length,
              )),
              const SliverPadding(padding: EdgeInsets.only(top: 30.0)),
            ],
          ),
        );
      },
    );
  }

  void getSubCategoriesData(int index) =>
      PassDataBloc.get.add(PreviewSectionSubCategoriesEvent(index: index));
}
