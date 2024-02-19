import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../src.export.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key,});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 31.0, end: 23.0),
      child: BlocBuilder<SearchBloc, SearchState>(builder: (_, state) {
        return CustomScrollView(
          slivers: [
            const SliverPadding(padding: EdgeInsetsDirectional.only(top: 21.0)),
            SliverToBoxAdapter(child: SizedBox(
              height: 45.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Align(
                      alignment: AlignmentDirectional.bottomStart, child: Text(
                    'Search', style: easyTheme.textTheme.headlineMedium,))),
                  InkWell(
                      splashColor: ColorName.transparent,
                      highlightColor: ColorName.transparent,
                      onTap: openFilterScreen,
                      child: Assets.png.filterIcon.image(
                          width: 38.0, height: 38.0)),
                ],
              ),
            ),),
            const SliverPadding(padding: EdgeInsetsDirectional.only(top: 21.0)),
            state.searchStateStatus.isLoading
                ? const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(color: ColorName.blueGray,)))
                : state.searchStateStatus.isNull
                ? const SliverToBoxAdapter(child: Center(child: Text('No information available...')))
                : SliverList(
              delegate: SliverChildBuilderDelegate((_, index) {
                   SearchResultModel searchModelData = state.searchResultList[index];
                   return state.searchResultList.isEmpty
                    ? const SizedBox()
                    : Padding(
                     padding: const EdgeInsets.only(bottom: 20.0),
                     child: InkWell(
                       splashColor: ColorName.transparent,
                       highlightColor: ColorName.transparent,
                       focusColor: ColorName.transparent,
                       onTap: () {
                         FocusScope.of(context).unfocus();
                         HomeBloc.get.add(SwapHomeScreenStateEvent(
                             homeScreenState: HomeScreenState.SEARCHRESULT));
                       },
                       child: SizedBox(
                         width: double.infinity,
                         child: Row(
                           children: [
                             Assets.svg.searchIcon.svg(),
                             const SizedBox(width: 12.0,),
                             Expanded(
                               child: Text(
                                 searchModelData.description!
                                     .replaceAll('\n', ' ')
                                     .toString(),
                                 style: easyTheme.textTheme.bodyMedium!.copyWith(
                                     fontSize: 18.0,
                                     color: ColorName.mediumGray,
                                     overflow: TextOverflow.ellipsis),
                               ),
                             ),
                             const Icon(Icons.arrow_upward, color: ColorName.gray,)
                           ],
                         ),
                       ),
                     ),
                   );
              }, childCount: state.searchResultList.length),
            ),
            const SliverPadding(padding: EdgeInsetsDirectional.only(top: 55.0)),
            SliverToBoxAdapter(
              child: !state.isMoreData
                  ? !state.searchStateStatus.isLoadingMore
                  ? Center(
                child: InkWell(
                  onTap: () => seeMore(state.searchValue),
                  child: Text(
                    'See More',
                    style: easyTheme.textTheme.bodyLarge!.copyWith(
                      fontSize: 16.0,
                      color: ColorName.skyBlue,
                    ),
                  ),
                ),
              ):
                   const Center(child: CircularProgressIndicator(color: ColorName.blueGray,),)
                  : const SizedBox(),
            ),
            const SliverPadding(padding: EdgeInsetsDirectional.only(top: 55.0)),

          ],
        );
      }),
    );
  }

  void openFilterScreen() {
    FocusScope.of(context).unfocus();
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: const FilterScreen(),
      withNavBar: true,
    );
  }

  void seeMore(String searchValue) {
    SearchBloc.get.add(SearchOnItemsEvent(searchValue: searchValue, isSeeMore: true));
  }

  Widget _stateHandler(SearchState state, SearchResultModel searchModelData) {
    switch (state.searchStateStatus) {
      case SearchStateStatus.LOADING:return const CircularProgressIndicator();
      default: return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: InkWell(
            splashColor: ColorName.transparent,
            highlightColor: ColorName.transparent,
            focusColor: ColorName.transparent,
            onTap: () {
              FocusScope.of(context).unfocus();
              HomeBloc.get.add(SwapHomeScreenStateEvent(
                  homeScreenState: HomeScreenState.SEARCHRESULT));
            },
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Assets.svg.searchIcon.svg(),
                  const SizedBox(width: 12.0,),
                  Expanded(
                    child: Text(
                      searchModelData.description!
                          .replaceAll('\n', ' ')
                          .toString(),
                      style: easyTheme.textTheme.bodyMedium!.copyWith(
                          fontSize: 18.0,
                          color: ColorName.mediumGray,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  const Icon(Icons.arrow_upward, color: ColorName.gray,)
                ],
              ),
            ),
          ),
        );
    }
  }
}