import 'package:daakesh/src/core/core.export.dart';
import 'package:daakesh/src/features/features.export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HandMadeItemScreen extends StatelessWidget {
  const HandMadeItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HandmadeBloc, HandmadeState>(builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const HomeAppBarWidget(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                  onTap: () => openMoreInfoScreen(
                      context, state.itemByHandmadeList[index]),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 17.0, right: 17.0, top: 17),
                    child: ResultItemWidget(
                      todayItem: state.itemByHandmadeList[index],
                    ),
                  ),
                ),
                childCount: state.itemByHandmadeList.length,
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
    HandmadeBloc.get.add(GetItemsByHomemadeEvent(isSeeMore: true));
  }

  Widget seeMoreHandler(HandmadeState state, BuildContext context) {
    switch (!state.isMoreDataItems) {
      case true:
        switch (state.handmadeStateStatus) {
          case HandmadeStateStatus.LOADINGMORE:
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
        return state.handmadeStateStatus.isNull
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
