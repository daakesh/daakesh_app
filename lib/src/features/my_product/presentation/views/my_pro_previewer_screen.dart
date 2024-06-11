import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class MyProPreviewerScreen extends StatelessWidget {
  final ProPreviewerModel previewerModel;

  MyProPreviewerScreen({
    super.key,
    required this.previewerModel,
  });

  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getAllItemData();
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        MyProBloc.get.add(EmptyProDataEvent());
      },
      child: RefreshIndicatorWidget(
        onRefresh: () => getAllItemData(),
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                  child: HeaderWidget(withArrowBack: false)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 17.5, end: 26.0, top: 12.0),
                  child: ProductSlider(
                    previewerModel: previewerModel,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 17.5, end: 26.0),
                  child: PriceRateWidget(
                    previewerModel: previewerModel,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 17.5, end: 26.0),
                  child: InfoSection(previewerModel: previewerModel),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 17.5, end: 26.0),
                  child: AddCommentRateWidget(
                    itemId: previewerModel.itemId!,
                    catID: previewerModel.categoryID!,
                    subID: previewerModel.subID!,
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
                      BlocBuilder<MyProBloc, MyProState>(
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
              const CommentsSectionWidget(),
              const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
              BlocBuilder<MyProBloc, MyProState>(
                builder: (context, state) {
                  return SliverToBoxAdapter(
                    child: !state.isCommentsMoreData
                        ? !state.myProStateStatus.isLoadingMore
                            ? Center(
                                child: GestureDetector(
                                  onTap: () => MyProBloc.get.add(
                                      GetProCommentByItemEvent(
                                          isSeeMore: true)),
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
              const SliverToBoxAdapter(child: SizedBox(height: 60.0)),
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

  void getAllItemData() {
    getOverAllRate();
    getComment();
  }

  void getOverAllRate() {
    MyProBloc.get
        .add(GetProOverAllRateItemsEvent(itemID: previewerModel.itemId!));
  }

  void getComment() {
    MyProBloc.get.add(GetProCommentCountEvent(itemId: previewerModel.itemId!));
    MyProBloc.get.add(GetProCommentByItemEvent(itemId: previewerModel.itemId));
  }
}
