import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class MyProductsScreen extends StatelessWidget {
  const MyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.whiteSmoke,
      floatingActionButton: const FloatingAddProductWidget(),
      body: BlocBuilder<MyProductBloc, MyProductState>(builder: (_, state) {
        return LayoutBuilderWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderWidget(withArrowBack: false),
              const SizedBox(height: 16.0,),
              const SellerInfoCard(),
              const SizedBox(height: 18.0,),
              ProductTypeTabBar(state:state),
              const SearchProductBarWidget(),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 28.0,bottom: 13.0),
                child: Text('My Product',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 20.0,color: ColorName.black),),
              ),
              state.productTapBar == ProductTapBar.SHOP
                  ? const ShopProductItem()
                  : const SwapProductItem(),
            ],
          ),
        );
      }),
    );
  }



}

