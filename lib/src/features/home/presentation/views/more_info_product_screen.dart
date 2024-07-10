import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class MoreInfoProductScreen extends StatelessWidget {
  final TodayItem todayDealItem;
  final bool isDaakeshTodayDeal;

  MoreInfoProductScreen(
      {super.key,
      required this.todayDealItem,
      required this.isDaakeshTodayDeal});

  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getAllData(todayDealItem.id!);
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        RateBloc.get.add(EmptyDataEvent());
        CommentBloc.get.add(EmptyCommentDataEvent());
        PassDataBloc.get.add(ResetScaleValueEvent(scale: 1.0));
      },
      child: RefreshIndicatorWidget(
        onRefresh: () {
          getAllData(todayDealItem.id!);
          getComment(todayDealItem.id!);
        },
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              const HomeAppBarWidget(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 17.5, end: 26.0, top: 12.0),
                  child: ProductCarousalSlider(
                    todayDealItem: todayDealItem,
                    isDaakeshTodayDeal: isDaakeshTodayDeal,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 17.5, end: 26.0),
                  child: PriceRateSection(
                    isDaakeshTodayDeal: isDaakeshTodayDeal,
                    todayDealItem: todayDealItem,
                  ),
                ),
              ),
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: const EdgeInsetsDirectional.only(
              //         start: 17.5, end: 26.0),
              //     child: SizeSection(state: state),
              //   ),
              // ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 17.5, end: 26.0),
                  child: DetailsSection(todayDealItem: todayDealItem),
                ),
              ),
              SliverToBoxAdapter(
                child: !isDaakeshTodayDeal
                    ? ValueConstants.userId.isNotEmpty
                        ? Center(
                            child: DefaultButtonWidget(
                                text: context
                                    .locale.more_info_product_add_to_cart,
                                onPressed: () => addToCart(
                                    todayDealItem.id.toString(),
                                    todayDealItem.country.toString(),
                                    todayDealItem.city.toString())),
                          )
                        : const SizedBox()
                    : ContactInfoWidget(
                        phoneNumber:
                            todayDealItem.user!.phoneNumber.toString()),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 17.5, end: 26.0),
                  child: AddCommentRateSection(
                    itemId: todayDealItem.id!,
                    catID: todayDealItem.category!.id!,
                    subID: todayDealItem.section!.id!,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 17.5, end: 26.0),
                  child: Divider(
                    color: Color.fromARGB(255, 22, 15, 15),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 17.5, end: 26.0),
                  child: Column(
                    children: [
                      BlocBuilder<CommentBloc, CommentState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context.locale.more_info_product_comments,
                                style: context.easyTheme.textTheme.bodyLarge!
                                    .copyWith(fontSize: 18.0),
                              ),
                              Text(
                                '(${state.commentCount})',
                                style: context.easyTheme.textTheme.bodyLarge!
                                    .copyWith(
                                        fontSize: 18.0, color: ColorName.gray),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 23.0,
                      ),
                    ],
                  ),
                ),
              ),
              const CommentsSection(),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20.0,
                ),
              ),
              BlocBuilder<CommentBloc, CommentState>(
                builder: (context, state) {
                  return SliverToBoxAdapter(
                    child: !state.isMoreData
                        ? !state.commentStateStatus.isLoadingMore
                            ? Center(
                                child: GestureDetector(
                                  onTap: () => CommentBloc.get.add(
                                      GetCommentByItemEvent(isSeeMore: true)),
                                  child: Text(
                                    context.locale.see_more_search,
                                    style: context
                                        .easyTheme.textTheme.bodyLarge!
                                        .copyWith(
                                      fontSize: 16.0,
                                      color: ColorName.skyBlue,
                                    ),
                                  ),
                                ),
                              )
                            : const CircularProgressIndicatorWidget()
                        : const SizedBox(),
                  );
                },
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 60.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addToCart(String itemID, String country, String address) {
    CartBloc.get.add(
        AddToCartEvent(itemID: itemID, country: country, address: address));
  }

  void getAllData(int itemID) {
    getOverAllRate(itemID);
    getCommentCount(itemID);
  }

  void getOverAllRate(int itemID) {
    RateBloc.get.add(GetOverAllRateItemsEvent(itemID: itemID));
  }

  void getCommentCount(int itemID) {
    CommentBloc.get.add(GetCommentCountEvent(itemId: itemID));
  }

  void getComment(int itemID) {
    CommentBloc.get.add(GetCommentByItemEvent(itemId: itemID));
  }
}
