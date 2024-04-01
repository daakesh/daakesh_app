import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class ProductTypeTabBar extends StatelessWidget {
  final MyProFuncState state;
  const ProductTypeTabBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0.h,
      margin: EdgeInsetsDirectional.symmetric(horizontal: 13.0.h),
      decoration: BoxDecoration(
          color: ColorName.paleGray,
          borderRadius: BorderRadius.all(Radius.circular(8.0.r))),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => swapTabBar(ProductTapBar.SHOP),
              child: Container(
                width: double.infinity,
                height: 50.0.h,
                decoration: BoxDecoration(
                    color: state.productTapBar == ProductTapBar.SHOP
                        ? ColorName.amber
                        : ColorName.paleGray,
                    borderRadius: BorderRadius.all(Radius.circular(8.0.r))),
                child: Center(
                    child: Text(
                  'Shop',
                  style: context.easyTheme.textTheme.headlineMedium!.copyWith(
                      fontSize: 18.0.sp,
                      color: state.productTapBar == ProductTapBar.SHOP
                          ? ColorName.white
                          : ColorName.blueGray),
                )),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => swapTabBar(ProductTapBar.SWAP),
              child: Container(
                width: double.infinity,
                height: 50.0.h,
                decoration: BoxDecoration(
                    color: state.productTapBar == ProductTapBar.SWAP
                        ? ColorName.amber
                        : ColorName.paleGray,
                    borderRadius: BorderRadius.all(Radius.circular(8.0.r))),
                child: Center(
                    child: Text(
                  'Swap',
                  style: context.easyTheme.textTheme.headlineMedium!.copyWith(
                    fontSize: 18.0.sp,
                    color: state.productTapBar == ProductTapBar.SWAP
                        ? ColorName.white
                        : ColorName.blueGray,
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void swapTabBar(ProductTapBar productTapBar) {
    MyProFuncBloc.get
        .add(SwapTabBarProductTypeEvent(productTapBar: productTapBar));
  }
}
