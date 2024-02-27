import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

import '../../../../../src.export.dart';

class HomeDataWidget extends StatefulWidget {
  final ScrollController scrollController;
  final HomeState state;

  const HomeDataWidget({super.key, required this.scrollController, required this.state});

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
        ///
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
              height: 130.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return  PopularCategoriesWidget(data:widget.state.sectionListData[index]);
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
        const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Expanded(child: WhatsNewWidget(title: 'Shop By Brands',)),
                  SizedBox(width: 8.0,),
                  Expanded(child: WhatsNewWidget(title: 'Homemade',)),
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
        SliverPadding(
            padding:const EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((_, index) {
                  return  TodayDealProduct(scrollController:widget.scrollController,);
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
                  return TodayDealProduct(isDaakeshTodayDeal: true,scrollController:widget.scrollController ,);
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
