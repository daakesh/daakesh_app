import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class HomemadeScreen extends StatelessWidget {
  const HomemadeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HandmadeBloc, HandmadeState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
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
              const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                TodayItem handmadeItem = state.handmadeListData[index];
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: GestureDetector(
                      onTap: () => openMoreInfoScreen(context, handmadeItem),
                      child: ResultItemWidget(todayItem: handmadeItem)),
                );
              }, childCount: state.handmadeListData.length)),
              const SliverToBoxAdapter(child: SizedBox(height: 30.0)),
              SliverToBoxAdapter(child: seeMoreHandler(state, context)),
              const SliverToBoxAdapter(child: SizedBox(height: 50.0)),
            ],
          ),
        );
      },
    );
  }

  void openMoreInfoScreen(BuildContext context, TodayItem todayItem) {
    CommentBloc.get.add(GetCommentByItemEvent(itemId: todayItem.id));
    Utils.openNavNewPage(
        context,
        MoreInfoProductScreen(
            todayDealItem: todayItem, isDaakeshTodayDeal: true));
  }

  void onSeeMore() =>
      HandmadeBloc.get.add(GetHandmadeDataEvent(isSeeMore: true));

  Widget seeMoreHandler(HandmadeState state, BuildContext context) {
    switch (!state.isMoreData) {
      case true:
        switch (state.handmadeStateStatus) {
          case HandmadeStateStatus.LOADINGMORE:
            return const CircularProgressIndicatorWidget();
          default:
            return Center(
                child: TextButtonWidget(
              text: context.locale.homemade_title_see_more,
              onPressed: () => onSeeMore(),
              isBold: true,
            ));
        }
      default:
        return state.handmadeStateStatus.isLoading
            ? const CircularProgressIndicatorWidget()
            : state.handmadeStateStatus.isNull
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
    Utils.openNavNewPage(context, HandmadeFilterScreen());
  }
}
