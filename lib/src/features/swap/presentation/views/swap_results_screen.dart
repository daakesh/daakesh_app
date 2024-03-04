import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class SwapResultsScreen extends StatelessWidget {
  const SwapResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwapPassDataBloc, SwapPassDataState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
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
                          itemCount: state.swapCategoriesListData.length,
                          separatorBuilder: (_, i) {
                            return const SizedBox(
                              width: 11.0,
                            );
                          },
                          itemBuilder: (_, index) {
                            SwapCategoryItem swapCategoryItem =
                                state.swapCategoriesListData[index];
                            return GestureDetector(
                              onTap: () => getSubCategoriesData(index),
                              child: Container(
                                height: 38.0,
                                padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 14.0),
                                decoration: const BoxDecoration(
                                    color: ColorName.paleGray,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child:
                                    Center(child: Text('${swapCategoryItem.name}')),
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
                child:
                    Text('Results', style: easyTheme.textTheme.headlineMedium),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 13.0)),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (_, index) {
                SwapSubCategory subCategoryItem = state.swapSubCategoryListData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17),
                  child: SwapResultItemWidget(swapSubCategory: subCategoryItem),
                );
              },
              childCount: state.swapSubCategoryListData.length,
            )),
            const SliverPadding(padding: EdgeInsets.only(top: 30.0)),
          ],
        );
      },
    );
  }
  void getSubCategoriesData(int index) => SwapPassDataBloc.get.add(SwapPreviewSectionSubCategoriesEvent(index:index));
}
