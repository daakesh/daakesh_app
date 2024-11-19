import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class ShopByBrandsScreen extends StatelessWidget {
  const ShopByBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsBloc, BrandsState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              const HomeAppBarWidget(),
              const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
              SliverGrid.builder(
                itemCount: state.brandListData.length,
                itemBuilder: (context, index) {
                  BrandItem brandItem = state.brandListData[index];
                  return Padding(
                    padding: index % 2 == 0
                        ? const EdgeInsetsDirectional.only(start: 12.0)
                        : const EdgeInsetsDirectional.only(end: 12.0),
                    child: BrandItemWidget(brandItem: brandItem),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 30.0)),
              SliverToBoxAdapter(child: seeMoreHandler(state, context)),
              const SliverToBoxAdapter(child: SizedBox(height: 50.0)),
            ],
          ),
        );
      },
    );
  }

  void onSeeMore() {
    BrandsBloc.get.add(GetBrandsDataEvent(isSeeMore: true));
  }

  Widget seeMoreHandler(BrandsState state, BuildContext context) {
    switch (!state.isMoreData) {
      case true:
        switch (state.brandsStateStatus) {
          case BrandsStateStatus.LOADINGMORE:
            return const CircularProgressIndicatorWidget();
          default:
            return Center(
                child: TextButtonWidget(
              text: context.locale.shop_by_brands_title_see_more,
              onPressed: () => onSeeMore(),
              isBold: true,
            ));
        }
      default:
        return const SizedBox();
    }
  }
}
