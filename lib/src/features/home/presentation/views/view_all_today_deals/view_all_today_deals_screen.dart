import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class ViewAllTodayDealsScreen extends StatelessWidget {
  const ViewAllTodayDealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodayDealsBloc, TodayDealsState>(
          builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const HomeAppBarWidget(),
            const SliverToBoxAdapter(child: SizedBox(height: 8.0)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: GestureDetector(
                      onTap: () => openFilterScreen(context),
                      child: Assets.png.filterIcon
                          .image(width: 38.0, height: 38.0)),
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 7.0)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(context.locale.results_title,
                          style: context.easyTheme.textTheme.headlineMedium),
                    ),
                    GestureDetector(
                      onTap: () => state.sortingType == SortingType.desc
                          ? TodayDealsBloc.get.add(GetViewAllItemsEvent(
                              sortingType: SortingType.asc))
                          : TodayDealsBloc.get.add(GetViewAllItemsEvent(
                              sortingType: SortingType.desc)),
                      child: Assets.svg.sortIcon.svg(),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                  onTap: () => openMoreInfoScreen(
                      context, state.allTodayDealsListData[index]),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 17.0, right: 17.0, top: 17),
                    child: ResultItemWidget(
                      todayItem: state.allTodayDealsListData[index],
                    ),
                  ),
                ),
                childCount: state.allTodayDealsListData.length,
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 30.0)),
            SliverToBoxAdapter(child: seeMoreHandler(state, context)),
            const SliverPadding(padding: EdgeInsets.only(top: 60.0)),
          ],
        );
      }),
    );
  }

  void openMoreInfoScreen(BuildContext context, TodayItem todayItem) {
    CommentBloc.get.add(GetCommentByItemEvent(itemId: todayItem.id));
    Utils.openNavNewPage(
      context,
      MoreInfoProductScreen(
        todayDealItem: todayItem,
        isDaakeshTodayDeal: true,
      ),
    );
  }

  void onSeeMore() {
    TodayDealsBloc.get.add(GetViewAllItemsEvent(isSeeMore: true));
  }

  Widget seeMoreHandler(TodayDealsState state, BuildContext context) {
    switch (!state.isMoreDataItems) {
      case true:
        switch (state.todayDealsStateStatus) {
          case TodayDealsStateStatus.LOADINGMORE:
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
        return state.todayDealsStateStatus.isNull
            ? Center(
                child: Text(
                  context.locale.results_no_data,
                  style: context.easyTheme.textTheme.headlineMedium,
                ),
              )
            : const SizedBox();
    }
  }

  void openFilterScreen(BuildContext context) {
    Utils.openNavNewPage(context, ViewAllDealsFiltterScreen());
  }
}
