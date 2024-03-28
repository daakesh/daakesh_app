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

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverPadding(padding: EdgeInsets.only(top: 14.0)),
        ///Carousel slider.
         const SliverToBoxAdapter(child: HomeCarouselSliderWidget(),),
        const SliverPadding(padding: EdgeInsets.only(top: 24.0)),
        ///Popular-section.
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Popular Categories',
            style: easyTheme.textTheme.headlineSmall,
          ),
        ),),
        const SliverPadding(padding: EdgeInsets.only(top: 10.0)),
        SliverToBoxAdapter(
          child: Padding(
            padding:const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 150.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  SectionItemModel sectionItem = widget.state.sectionListData[index];
                  return GestureDetector(
                    onTap: () => exploreSection(
                      sectionItem.id!,
                      index,
                      sectionItem.name.toString()
                    ),
                    child: PopularCategoriesWidget(
                      data: widget.state.sectionListData[index],

                    ),
                  );
                },
                itemCount: widget.state.sectionListData.length,
              ),
            ),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 16.0)),
        ///What's_new-section.
        SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('What\'s New',
                style: easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 18.0)),
          ),),
        const SliverPadding(padding: EdgeInsets.only(top: 17.0)),
        SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                Expanded(
                  child: GestureDetector(
                    onTap: onShopByBrands,
                    child: const WhatsNewWidget(
                      title: 'Shop By Brands',
                    ),
                  ),
                ),
                  const SizedBox(width: 8.0,),
                  Expanded(child: GestureDetector(onTap: openHandmade,child: const WhatsNewWidget(title: 'Handmade',))),
                ],
              ),
            ),
          ),
        const SliverPadding(padding: EdgeInsets.only(top: 20.0)),
        ///Daakesh today deal-section.
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Daakesh Today\'s Deals',
              style: easyTheme.textTheme.headlineMedium!.copyWith(
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 14.0)),
        BlocBuilder<TodayDealsBloc, TodayDealsState>(
          builder: (context, state) {
            return SliverPadding(
              padding:const EdgeInsets.symmetric(horizontal: 20.0),
              sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((_, index) {
                    TodayItem todayDealItem = state.todayDealsListData[index];
                      return TodayDealProduct(todayDealItem: todayDealItem);
                    },
                    childCount: state.todayDealsListData.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0
                  )),
            );
          },
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 24.0)),
        ///Today deal-section.
        SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Today\'s Deals',
                style: easyTheme.textTheme.headlineMedium!.copyWith(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        const SliverPadding(padding: EdgeInsets.only(top: 14.0)),
        BlocBuilder<TodayDealsBloc, TodayDealsState>(
          builder: (context, state) {
            return SliverPadding(
              padding:const EdgeInsets.symmetric(horizontal: 20.0),
              sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((_, index) {
                    TodayItem todayDealItem = state.todayDealsListData[index];
                      return TodayDealProduct(
                        isDaakeshTodayDeal: true,
                        todayDealItem: todayDealItem,
                      );
                    },
                    childCount: state.todayDealsListData.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0
                  )),
            );
          },
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 50.0)),

      ],
    );
  }

  void exploreSection(int secID,int sectionIndex,String categoryTitle){
    SectionsBloc.get.add(GetCategoryBySectionIDEvent(
        secID: secID,
        sectionIndex: sectionIndex,
        categoryTitle: categoryTitle));
    HomeBloc.get.add(GetToTopScreenEvent());
    HomeBloc.get.add(SwapHomeScreenStateEvent(homeScreenState:HomeScreenState.SECTIONS));
  }

  void onShopByBrands() {
    HomeBloc.get.add(GetToTopScreenEvent());
    HomeBloc.get.add(SwapHomeScreenStateEvent(homeScreenState: HomeScreenState.SHOPBYBRANDS));
  }

  void openHandmade() {
    HomeBloc.get.add(GetToTopScreenEvent());
    HomeBloc.get.add(SwapHomeScreenStateEvent(homeScreenState: HomeScreenState.HOMEMADE));
  }
}
