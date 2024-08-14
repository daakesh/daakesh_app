import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class SearchProductHandler extends StatelessWidget {
  final MyProFuncState state;
  const SearchProductHandler({super.key, required this.state});
  @override
  Widget build(BuildContext context) {
    switch (state.myProFuncStateStatus) {
      case MyProFuncStateStatus.LOADING:
        return const SliverToBoxAdapter(
            child: CircularProgressIndicatorWidget());
      case MyProFuncStateStatus.NULL:
        return SliverToBoxAdapter(
            child: Center(
                child: Text(context.locale.no_information_available_title)));
      default:
        return SliverList(
          delegate: SliverChildBuilderDelegate((_, index) {
            MyProductItem myProductItem = state.searchResultList[index];
            return state.searchResultList.isEmpty
                ? const SizedBox()
                : myProductItem.type == ProductDisplayMethod.Sell.name
                    ? ShopProductItem(myProductItem: myProductItem)
                    : SwapProductItem(myProductItem: myProductItem);
          }, childCount: state.searchResultList.length),
        );
    }
  }
}
