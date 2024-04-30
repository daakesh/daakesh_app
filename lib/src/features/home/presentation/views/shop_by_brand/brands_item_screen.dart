import 'package:daakesh/src/core/core.export.dart';
import 'package:daakesh/src/features/features.export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsItemScreen extends StatelessWidget {
  const BrandsItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BrandsBloc, BrandsState>(builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const HomeAppBarWidget(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                  onTap: () =>
                      openMoreInfoScreen(context, state.itemByBrandList[index]),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 17.0, right: 17.0, top: 17),
                    child: ResultItemWidget(
                      todayItem: state.itemByBrandList[index],
                    ),
                  ),
                ),
                childCount: state.itemByBrandList.length,
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
    BrandsBloc.get.add(GetItemsByBrandsEvent(isSeeMore: true));
  }

  Widget seeMoreHandler(BrandsState state, BuildContext context) {
    switch (!state.isMoreDataItems) {
      case true:
        switch (state.brandsStateStatus) {
          case BrandsStateStatus.LOADINGMORE:
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
        return state.brandsStateStatus.isNull
            ? Center(
                child: Text(
                  context.locale.results_no_data,
                  style: context.easyTheme.textTheme.headlineMedium,
                ),
              )
            : const SizedBox();
    }
  }
}
