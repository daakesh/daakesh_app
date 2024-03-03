import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class ShopByBrandsScreen extends StatelessWidget {
  const ShopByBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsBloc, BrandsState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
              BrandItem brandItem = state.brandListData[index];
              return  BrandItemWidget(brandItem:brandItem);
            }, childCount: state.brandListData.length)),
            const SliverToBoxAdapter(child: SizedBox(height: 30.0)),
            SliverToBoxAdapter(child: seeMoreHandler(state)),
            const SliverToBoxAdapter(child: SizedBox(height: 50.0)),

          ],
        );
      },
    );
  }

  void onSeeMore() {
    BrandsBloc.get.add(GetBrandsDataEvent(isSeeMore: true));
  }


  Widget seeMoreHandler(BrandsState state) {
    switch (!state.isMoreData) {
      case true:
        switch (state.brandsStateStatus) {
          case BrandsStateStatus.LOADINGMORE:
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



