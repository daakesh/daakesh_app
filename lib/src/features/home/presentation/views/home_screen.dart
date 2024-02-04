import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ///AppBar
          SliverAppBar(
            backgroundColor: ColorName.blueGray,
            expandedHeight: 160.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: const SearchBarWidget(),
              expandedTitleScale: 1.0,
              title:Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 40.0,
                      decoration: const BoxDecoration(
                        color: ColorName.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20.0,),
                          Assets.svg.searchIcon.svg(),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: TextFormFieldWidget(
                                controller: searchController,
                                style: easyTheme.textTheme.labelMedium!.copyWith(fontFamily: FontFamily.apercuRegular),
                                isUnderlineOn: true,
                                hintText: 'Search',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 14.0,),
                  Assets.svg.cartAddIcon.svg(width: 24.0,height: 24.0),
                ],
              ),
              titlePadding: const EdgeInsetsDirectional.only(end: 19.0,start: 19.0,bottom: 12.0,),

            ),
          ),
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
                    return const PopularCategoriesWidget();
                  },
                  itemCount: 20,
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
                  return const TodayDealProduct();
                },
                  childCount: 11,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    mainAxisSpacing: 9.0,
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
                  return const TodayDealProduct(isDaakeshTodayDeal: true,);
                },
                  childCount: 6,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    mainAxisSpacing: 13.0,
                    crossAxisSpacing: 12.0
                )),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 50.0)),
        ],
      ),
    );
  }
}