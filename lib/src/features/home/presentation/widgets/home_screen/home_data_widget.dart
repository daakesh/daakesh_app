import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class HomeDataWidget extends StatefulWidget {
  final HomeState state;

  const HomeDataWidget({super.key, required this.state});

  @override
  State<HomeDataWidget> createState() => _HomeDataWidgetState();
}

class _HomeDataWidgetState extends State<HomeDataWidget> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollListener();
  }

  void scrollListener() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        loadMore();
      }
    });
  }

  void loadMore() {
    HomeBloc.get.add(GetSectionDataEvent(isSeeMore: true));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverPadding(padding: EdgeInsets.only(top: 14.0)),
        SliverToBoxAdapter(
          child: Center(
            child: Text(
              'Version: 3',
              style: context.easyTheme.textTheme.headlineLarge!.copyWith(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 14.0)),

        ///Carousel slider.
        const SliverToBoxAdapter(
          child: HomeCarouselSliderWidget(),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 24.0)),

        ///Popular-section.
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              context.locale.home_popular_sections_title,
              style: context.easyTheme.textTheme.headlineSmall,
            ),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 10.0)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 150.0,
              child: ListView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  if (index < widget.state.sectionListData.length) {
                    SectionItemModel sectionItem =
                        widget.state.sectionListData[index];
                    return GestureDetector(
                      onTap: () => exploreSection(context, sectionItem.id!,
                          index, sectionItem.name.toString()),
                      child: PopularCategoriesWidget(
                        data: widget.state.sectionListData[index],
                      ),
                    );
                  } else {
                    return !widget.state.isMoreData
                        ? const Padding(
                            padding: EdgeInsetsDirectional.only(
                              end: 20.0,
                            ),
                            child: CircularProgressIndicatorWidget(),
                          )
                        : const SizedBox();
                  }
                },
                itemCount: widget.state.sectionListData.length + 1,
              ),
            ),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 16.0)),

        ///What's_new-section.
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(context.locale.home_whats_new_section_title,
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 18.0)),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 17.0)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => onShopByBrands(context),
                    child: WhatsNewWidget(
                      title: context.locale.home_shop_by_brands_section_title,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                    child: GestureDetector(
                        onTap: () => openHandmade(context),
                        child: WhatsNewWidget(
                          title: context.locale.home_handmade_section_title,
                        ))),
              ],
            ),
          ),
        ),

        ///const SliverPadding(padding: EdgeInsets.only(top: 20.0)),
        ///Daakesh today deal-section.
        /// SliverToBoxAdapter(
        ///   child: Padding(
        ///     padding: const EdgeInsets.symmetric(horizontal: 20.0),
        ///     child: Text(
        ///       context.locale.home_daakesh_today_deals_title,
        ///       style: context.easyTheme.textTheme.headlineMedium!.copyWith(
        ///         fontSize: 18.0,
        ///       ),
        ///     ),
        ///   ),
        ///),
        ///const SliverPadding(padding: EdgeInsets.only(top: 14.0)),
        ///BlocBuilder<TodayDealsBloc, TodayDealsState>(
        ///  builder: (context, state) {
        ///    return SliverPadding(
        ///      padding: const EdgeInsets.symmetric(horizontal: 20.0),
        ///      sliver: SliverGrid(
        ///          delegate: SliverChildBuilderDelegate(
        ///            (_, index) {
        ///              TodayItem daakeshTodayDealItem =
        ///                  state.daakeshTodayDealsListData[index];
        ///              return TodayDealProduct(
        ///                  todayDealItem: daakeshTodayDealItem);
        ///            },
        ///            childCount: state.daakeshTodayDealsListData.length,
        ///          ),
        ///          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        ///              crossAxisCount: 2,
        ///              childAspectRatio: 0.65,
        ///              mainAxisSpacing: 8.0,
        ///              crossAxisSpacing: 8.0)),
        ///    );
        ///  },
        ///),
        const SliverPadding(padding: EdgeInsets.only(top: 24.0)),

        ///Today deal-section.
        SliverToBoxAdapter(
          child: BlocBuilder<TodayDealsBloc, TodayDealsState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      context.locale.home_today_deals_title,
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 18.0),
                    ),
                    const Spacer(),
                    state.todayDealsListData.length > 4
                        ? TextButtonWidget(
                            onPressed: () => openViewAllScreen(),
                            text: context.locale.home_today_deals_view_all,
                            isBold: true,
                          )
                        : const SizedBox()
                  ],
                ),
              );
            },
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 14.0)),
        BlocBuilder<TodayDealsBloc, TodayDealsState>(
          builder: (context, state) {
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (_, index) {
                      TodayItem todayDealItem = state.todayDealsListData[index];
                      return TodayDealProduct(
                        isDaakeshTodayDeal: true,
                        todayDealItem: todayDealItem,
                      );
                    },
                    childCount: state.todayDealsListData.length <= 4
                        ? state.todayDealsListData.length
                        : 4,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0)),
            );
          },
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 25.0)),
        SliverToBoxAdapter(
          child: BlocBuilder<OfferDealsBloc, OfferDealsState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      context.locale.home_offer_deals_title,
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 18.0),
                    ),
                    const Spacer(),
                    state.homeTodayDealsListData.length > 4
                        ? TextButtonWidget(
                            onPressed: () => openViewAllOfferDealsScreen(),
                            text: context.locale.home_today_deals_view_all,
                            isBold: true,
                          )
                        : const SizedBox()
                  ],
                ),
              );
            },
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 14.0)),

        BlocBuilder<OfferDealsBloc, OfferDealsState>(
          builder: (context, state) {
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (_, index) {
                      TodayItem todayDealItem =
                          state.homeTodayDealsListData[index];
                      return TodayDealProduct(
                        isDaakeshTodayDeal: true,
                        todayDealItem: todayDealItem,
                      );
                    },
                    childCount: state.homeTodayDealsListData.length <= 4
                        ? state.homeTodayDealsListData.length
                        : 4,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0)),
            );
          },
        ),
        // BlocBuilder<TodayDealsBloc, TodayDealsState>(builder: (context, state) {
        //   return SliverToBoxAdapter(
        //     child: !state.isMoreData
        //         ? !state.todayDealsStateStatus.isLoadingMore
        //             ? Center(
        //                 child: GestureDetector(
        //                   onTap: () => onSeeMore(),
        //                   child: Text(
        //                     context.locale.see_more,
        //                     style: context.easyTheme.textTheme.bodyLarge!
        //                         .copyWith(
        //                             fontSize: 16.0,
        //                             color: ColorName.skyBlue,
        //                             fontWeight: FontWeight.bold),
        //                   ),
        //                 ),
        //               )
        //             : const CircularProgressIndicatorWidget()
        //         : const SizedBox(),
        //   );
        // }),
        const SliverPadding(padding: EdgeInsets.only(top: 50.0)),
      ],
    );
  }

  void exploreSection(
      context, int secID, int sectionIndex, String categoryTitle) {
    SectionsBloc.get.add(GetCategoryBySectionIDEvent(
        secID: secID,
        sectionIndex: sectionIndex,
        categoryTitle: categoryTitle));
    Utils.openNavNewPage(context, SectionScreen(homeState: widget.state));
  }

  void onShopByBrands(context) {
    Utils.openNavNewPage(context, const ShopByBrandsScreen());
  }

  void openHandmade(context) {
    HandmadeBloc.get.add(GetHandmadeCitiesEvent());
    Utils.openNavNewPage(context, const HomemadeScreen());
  }

  Widget seeMoreHandler(TodayDealsState state) {
    switch (!state.isMoreData) {
      case true:
        switch (state.todayDealsStateStatus) {
          case TodayDealsStateStatus.LOADINGMORE:
            return const CircularProgressIndicatorWidget();
          default:
            return Center(
                child: TextButtonWidget(
              text: context.locale.see_more,
              onPressed: () => onSeeMore(),
              isBold: true,
            ));
        }
      default:
        return const SizedBox();
    }
  }

  void onSeeMore() {
    TodayDealsBloc.get.add(GetToadyDealsDataEvent(isSeeMore: true));
  }

  void openViewAllScreen() {
    TodayDealsBloc.get.add(GetViewAllItemsEvent());
    TodayDealsBloc.get.add(GetViewAllCitiesEvent());
    Utils.openNavNewPage(context, const ViewAllTodayDealsScreen());
  }

  void openViewAllOfferDealsScreen() {
    //TodayDealsBloc.get.add(GetViewAllItemsEvent());
    OfferDealsBloc.get.add(ViewAllOfferDealsItemsEvent());
    OfferDealsBloc.get.add(GetViewAllOfferDealsCitiesEvent());
    Utils.openNavNewPage(context, const ViewAllOfferDealsScreen());
  }
}
