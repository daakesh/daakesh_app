import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsetsDirectional.only(start: 31.0,end: 23.0),
      child: CustomScrollView(
        slivers: [
          const SliverPadding(padding: EdgeInsetsDirectional.only(top: 21.0)),
          SliverToBoxAdapter(child: SizedBox(
            height: 45.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Expanded(child: Align(alignment: AlignmentDirectional.bottomStart,child: Text('Search',style: easyTheme.textTheme.headlineMedium,))),
                  InkWell(
                    splashColor: ColorName.transparent,
                      highlightColor: ColorName.transparent,
                      onTap: openFilterScreen,
                      child: Assets.png.filterIcon
                          .image(width: 38.0, height: 38.0)),
                ],
            ),
          ),),
          const SliverPadding(padding: EdgeInsetsDirectional.only(top: 21.0)),
          SliverList(
            delegate: SliverChildBuilderDelegate((_, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  children: [
                    Assets.svg.searchIcon.svg(),
                    const SizedBox(width: 12.0,),
                    Text(
                      'Samsung S21 Phone 24G',
                      style: easyTheme.textTheme.bodyMedium!.copyWith(
                          fontSize: 18.0, color: ColorName.mediumGray),
                    ),
                    const Spacer(flex: 1,),
                    const Icon(Icons.arrow_upward,color: ColorName.gray,)
                  ],
                ),
              );
            }, childCount: 50),
          ),
          const SliverPadding(padding: EdgeInsetsDirectional.only(top: 55.0)),
          SliverToBoxAdapter(
            child: Center(
                child: Text(
              'See More',
              style: easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 16.0,color: ColorName.skyBlue),
            )),
          ),
          const SliverPadding(padding: EdgeInsetsDirectional.only(top: 55.0)),

        ],
      ),
    );
  }
  void openFilterScreen(){
    openNewPage(const FilterScreen());
  }
}
