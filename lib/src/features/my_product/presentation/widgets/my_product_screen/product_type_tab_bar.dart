import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class ProductTypeTabBar extends StatelessWidget {
  final MyProductState state;
  const ProductTypeTabBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 13.0),
      decoration: const BoxDecoration(
          color: ColorName.paleGray,
          borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      child: Row(children: [
        Expanded(
          child: InkWell(
            focusColor: ColorName.transparent,
            highlightColor: ColorName.transparent,
            splashColor: ColorName.transparent,
            onTap: ()=>swapTabBar(ProductTapBar.SHOP),
            child: Container(
              width: double.infinity,
              height: 50.0,
              decoration:  BoxDecoration(
                    color: state.productTapBar == ProductTapBar.SHOP
                        ? ColorName.amber
                        : ColorName.paleGray,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0))
              ),
              child: Center(
                  child: Text(
                    'Shop',
                    style: easyTheme.textTheme.headlineMedium!.copyWith(
                      fontSize: 18.0,
                      color: state.productTapBar == ProductTapBar.SHOP
                          ? ColorName.white
                          : ColorName.blueGray),
                )),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            focusColor: ColorName.transparent,
            highlightColor: ColorName.transparent,
            splashColor: ColorName.transparent,
            onTap: ()=>swapTabBar(ProductTapBar.SWAP),
            child: Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                    color: state.productTapBar == ProductTapBar.SWAP
                        ? ColorName.amber
                        : ColorName.paleGray,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0))
              ),
              child: Center(
                  child: Text(
                    'Swap',
                    style: easyTheme.textTheme.headlineMedium!.copyWith(
                      fontSize: 18.0,
                      color: state.productTapBar == ProductTapBar.SWAP
                          ? ColorName.white
                          : ColorName.blueGray),
                )),

            ),
          ),
        ),
      ],),
    );
  }

  void swapTabBar(ProductTapBar productTapBar){
    MyProductBloc.get.add(SwapTabBarProductTypeEvent(productTapBar: productTapBar));
  }


}
