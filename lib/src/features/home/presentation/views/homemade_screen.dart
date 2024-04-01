import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

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
              const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                HandmadeItem handmadeItem = state.handmadeListData[index];
                return HandmadeItemWidget(handmadeItem: handmadeItem);
              }, childCount: state.handmadeListData.length)),
              const SliverToBoxAdapter(child: SizedBox(height: 30.0)),
              SliverToBoxAdapter(child: seeMoreHandler(state)),
              const SliverToBoxAdapter(child: SizedBox(height: 50.0)),
            ],
          ),
        );
      },
    );
  }

  void onSeeMore() {
    HandmadeBloc.get.add(GetHandmadeDataEvent(isSeeMore: true));
  }

  Widget seeMoreHandler(HandmadeState state) {
    switch (!state.isMoreData) {
      case true:
        switch (state.handmadeStateStatus) {
          case HandmadeStateStatus.LOADINGMORE:
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
