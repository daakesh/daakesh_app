import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class MyProductsScreen extends StatelessWidget {
  const MyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorName.blueGray,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorName.whiteSmoke,
          floatingActionButton: const FloatingAddProductWidget(),
          body: BlocBuilder<MyProductBloc, MyProductState>(builder: (_, state) {
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: HeaderWidget(withArrowBack: false),),
                SliverPadding(padding: EdgeInsetsDirectional.only(top: 16.0.h)),
                const SliverToBoxAdapter(child: SellerInfoCard()),
                SliverPadding(padding: EdgeInsetsDirectional.only(top: 8.0.h)),
                SliverAppBar(
                  backgroundColor: ColorName.whiteSmoke,
                  pinned: true,
                  bottom: PreferredSize(preferredSize:Size.fromHeight(90.h) , child: const SizedBox(),),
                  surfaceTintColor: ColorName.whiteSmoke,
                  flexibleSpace: FlexibleSpaceBar(
                    title: SizedBox(
                      height: 130.0.h,
                      child: Column(
                        children: [
                          ProductTypeTabBar(state:state),
                          SizedBox(height: 17.0.h,),
                          const SearchProductBarWidget(),
                        ],
                      ),
                    ),
                    titlePadding: EdgeInsetsDirectional.symmetric(vertical: 5.0.h),
                  ),
                ),
                SliverPadding(padding: EdgeInsetsDirectional.only(top: 30.0.h)),
                SliverToBoxAdapter(child:Padding(
                  padding: EdgeInsetsDirectional.only(start: 28.0.w,bottom: 13.0.h),
                    child: Text(
                      'My Product',
                      style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 20.0.sp, color: ColorName.black),
                    ),
                  ),),
                state.productTapBar == ProductTapBar.SHOP
                    ? const ShopProductItem()
                    : const SwapProductItem(),
                SliverPadding(padding: EdgeInsetsDirectional.only(top: 150.0.h)),
              ],
            );
          }),
        ),
      ),
    );
  }
}


