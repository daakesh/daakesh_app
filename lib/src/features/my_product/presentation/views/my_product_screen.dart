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
        return  CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: HeaderWidget(withArrowBack: false),),
            const SliverPadding(padding: EdgeInsetsDirectional.only(top: 16.0)),
            const SliverToBoxAdapter(child: SellerInfoCard()),
            SliverAppBar(
              backgroundColor: ColorName.whiteSmoke,
              pinned: true,
              bottom: const PreferredSize(preferredSize:Size.fromHeight(50) , child: SizedBox(),),
              surfaceTintColor: ColorName.whiteSmoke,
              flexibleSpace: FlexibleSpaceBar(
                title: SizedBox(
                  height: 140.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ProductTypeTabBar(state:state),
                      const SizedBox(height: 17.0,),
                      const SearchProductBarWidget(),
                    ],
                  ),
                ),
                titlePadding: const EdgeInsetsDirectional.symmetric(vertical: 5.0),
              ),
            ),
            const SliverPadding(padding: EdgeInsetsDirectional.only(top: 30.0)),
            SliverToBoxAdapter(child:Padding(
              padding: const EdgeInsetsDirectional.only(start: 28.0,bottom: 13.0),
              child: Text('My Product',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 20.0,color: ColorName.black),),
            ),),
            state.productTapBar == ProductTapBar.SHOP
                ? const ShopProductItem()
                : const SwapProductItem(),
            SliverPadding(padding: EdgeInsetsDirectional.only(top: getScreenHeight(context) * 0.15)),
          ],
        );
      }),
    );
  }
}


