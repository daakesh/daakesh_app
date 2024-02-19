import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class HomeDataWidget extends StatelessWidget {
  final ScrollController scrollController;
  final HomeState state;

  const HomeDataWidget({super.key, required this.scrollController, required this.state});

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
            padding:  const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 144.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return  PopularCategoriesWidget(data:state.sectionListData[index]);
                },
                itemCount: state.sectionListData.length,
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
            padding:  const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 202.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return const WhatsNewWidget();
                },
                itemCount: 20,
              ),
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
        SliverPadding(
          padding:const EdgeInsets.symmetric(horizontal: 20.0),
          sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((_, index) {
                return  TodayDealProduct(scrollController:scrollController,);
              },
                childCount: 12,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:0.75,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0
              )),
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
        SliverPadding(
          padding:const EdgeInsets.symmetric(horizontal: 20.0),
          sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((_, index) {
                return TodayDealProduct(isDaakeshTodayDeal: true,scrollController:scrollController ,);
              },
                childCount: 6,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 10.0
              )),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 50.0)),
      ],
    );
  }
}
