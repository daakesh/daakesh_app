import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapSearchItemsScreen extends StatelessWidget {
  const SwapSearchItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        SwapSearchBloc.get.add(SwapSetSearchFilterDataEvent());
      },
      child: Scaffold(
        body: BlocBuilder<SwapSearchBloc, SwapSearchState>(
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
                            ? SwapSearchBloc.get.add(SwapSearchFilterEvent(
                                sortingType: SortingType.asc))
                            : SwapSearchBloc.get.add(SwapSearchFilterEvent(
                                sortingType: SortingType.desc)),
                        child: Assets.svg.sortIcon.svg(),
                      ),
                    ],
                  ),
                ),
              ),
              state.filterDataList.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => GestureDetector(
                          onTap: () => openMoreInfoScreen(
                              context, state.filterDataList[index]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 17.0, right: 17.0, top: 17),
                            child: SwapResultItemWidget(
                              trendDealsItem: state.filterDataList[index],
                            ),
                          ),
                        ),
                        childCount: state.filterDataList.length,
                      ),
                    )
                  : const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicatorWidget())),
              const SliverPadding(padding: EdgeInsets.only(top: 30.0)),
              SliverToBoxAdapter(child: seeMoreHandler(state, context)),
              const SliverPadding(padding: EdgeInsets.only(top: 60.0)),
            ],
          );
        }),
      ),
    );
  }

  void openMoreInfoScreen(BuildContext context, TrendDealsItem todayItem) {
    Utils.openNavNewPage(
        context, SwapMoreInfoScreen(trendDealsItem: todayItem));
  }

  void onSeeMore() {
    SwapSearchBloc.get.add(SwapSearchFilterEvent(isSeeMore: true));
  }

  Widget seeMoreHandler(SwapSearchState state, BuildContext context) {
    switch (!state.isMoreDataItems) {
      case true:
        switch (state.swapSearchStateStatus) {
          case SwapSearchStateStatus.LOADINGMORE:
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
        return state.swapSearchStateStatus.isNull
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
    Utils.openNavNewPage(context, SwapSearchFilterScreen());
  }
}
