import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class MyProductsScreen extends StatefulWidget {
  const MyProductsScreen({super.key});

  @override
  State<MyProductsScreen> createState() => _MyProductsScreenState();
}

class _MyProductsScreenState extends State<MyProductsScreen> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getMyProductScreenData();
  }

  void getMyProductScreenData() {
    if (ValueConstants.userId.isNotEmpty) {
      MyProBloc.get.add(GetMyProductEvent());
      MyProBloc.get.add(ClearDataEvent());
      MySwapProBloc.get.add(GetMySwapProEvent());
      MySwapProBloc.get.add(ClearSwapDataEvent());
      SellerInfoBloc.get.add(GetSellerInfoEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicatorWidget(
      onRefresh: () => getMyProductScreenData(),
      child: Scaffold(
        backgroundColor: ColorName.whiteSmoke,
        floatingActionButton:
            FloatingAddProductWidget(searchController: searchController),
        body: BlocBuilder<MyProFuncBloc, MyProFuncState>(builder: (_, state) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: HeaderWidget(withArrowBack: false),
              ),
              SliverAppBar(
                backgroundColor: ColorName.whiteSmoke,
                pinned: true,
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(75),
                  child: SizedBox(),
                ),
                surfaceTintColor: ColorName.whiteSmoke,
                flexibleSpace: FlexibleSpaceBar(
                  title: Column(
                    children: [
                      const SizedBox(height: 10),
                      ProductTypeTabBar(
                          state: state, searchController: searchController),
                      const SizedBox(height: 17),
                      SearchProductBarWidget(
                          state: state, searchController: searchController),
                    ],
                  ),
                  titlePadding:
                      const EdgeInsetsDirectional.symmetric(vertical: 5),
                ),
              ),
              const SliverPadding(padding: EdgeInsetsDirectional.only(top: 2)),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 28, bottom: 13),
                  child: Text(
                    context.locale.my_product,
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 20, color: ColorName.black),
                  ),
                ),
              ),
              if (state.searchValue.isEmpty) ...[
                state.productTapBar == ProductTapBar.SELL
                    ? BlocBuilder<MyProBloc, MyProState>(
                        builder: (context, state) {
                          return SliverList(
                              delegate: SliverChildBuilderDelegate((_, index) {
                            MyProductItem myProductItem =
                                state.myProductListData[index];
                            return ShopProductItem(
                                myProductItem: myProductItem);
                          }, childCount: state.myProductListData.length));
                        },
                      )
                    : BlocBuilder<MySwapProBloc, MySwapProState>(
                        builder: (context, state) {
                          return SliverList(
                              delegate: SliverChildBuilderDelegate((_, index) {
                            MyProductItem myProductItem =
                                state.mySwapProductListData[index];
                            return SwapProductItem(
                                myProductItem: myProductItem);
                          }, childCount: state.mySwapProductListData.length));
                        },
                      ),
                state.productTapBar == ProductTapBar.SELL
                    ? SliverToBoxAdapter(
                        child: BlocBuilder<MyProBloc, MyProState>(
                        builder: (context, state) {
                          return seeMoreHandler(state);
                        },
                      ))
                    : SliverToBoxAdapter(
                        child: BlocBuilder<MySwapProBloc, MySwapProState>(
                        builder: (context, state) {
                          return seeMoreHandler(state);
                        },
                      )),
              ] else ...[
                SearchProductHandler(state: state),
                const SliverPadding(
                    padding: EdgeInsetsDirectional.only(top: 55.0)),
                SliverToBoxAdapter(
                  child: !state.isMoreData
                      ? !state.myProFuncStateStatus.isLoadingMore
                          ? Center(
                              child: GestureDetector(
                                onTap: () =>
                                    seeMoreSearchProduct(state.searchValue),
                                child: Text(
                                  context.locale.see_more,
                                  style: context.easyTheme.textTheme.bodyLarge!
                                      .copyWith(
                                    fontSize: 16.0,
                                    color: ColorName.skyBlue,
                                  ),
                                ),
                              ),
                            )
                          : const CircularProgressIndicatorWidget()
                      : const SizedBox(),
                ),
              ],
              const SliverPadding(
                  padding: EdgeInsetsDirectional.only(top: 150)),
            ],
          );
        }),
      ),
    );
  }

  Widget seeMoreHandler(state) {
    if (state is MyProState) {
      switch (!state.isMoreData) {
        case true:
          switch (state.myProStateStatus) {
            case MyProStateStatus.LOADINGMORE:
              return const CircularProgressIndicatorWidget();
            default:
              return Center(
                  child: TextButtonWidget(
                text: context.locale.see_more,
                onPressed: () => onSeeMore(state),
                isBold: true,
              ));
          }
        default:
          return const SizedBox();
      }
    }
    if (state is MySwapProState) {
      switch (!state.isMoreData) {
        case true:
          switch (state.mySwapProStateStatus) {
            case MySwapProStateStatus.LOADINGMORE:
              return const CircularProgressIndicatorWidget();
            default:
              return Center(
                  child: TextButtonWidget(
                text: context.locale.see_more,
                onPressed: () => onSeeMore(state),
                isBold: true,
              ));
          }
        default:
          return const SizedBox();
      }
    } else {
      return const SizedBox();
    }
  }

  void onSeeMore(state) {
    if (state is MyProState) {
      MyProBloc.get.add(GetMyProductEvent(isSeeMore: true));
    } else {
      MySwapProBloc.get.add(GetMySwapProEvent(isSeeMore: true));
    }
  }

  void seeMoreSearchProduct(String searchValue) {
    MyProFuncBloc.get
        .add(SearchOnProductEvent(searchValue: searchValue, isSeeMore: true));
  }
}
