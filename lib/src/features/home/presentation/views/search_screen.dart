import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../src.export.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        FocusScope.of(context).unfocus();
        SearchBloc.get.add(EmptySearchEvent());
      },
      child: Scaffold(
        body: BlocBuilder<SearchBloc, SearchState>(builder: (_, state) {
          return CustomScrollView(
            slivers: [
              const HomeAppBarWidget(isActive: true),
              const SliverPadding(
                  padding: EdgeInsetsDirectional.only(top: 21.0)),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 31.0, end: 23.0),
                  child: SizedBox(
                    height: 45.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Text(
                                  'Search',
                                  style: context
                                      .easyTheme.textTheme.headlineMedium!
                                      .copyWith(
                                          color: ColorName.black
                                              .withOpacity(0.57)),
                                ))),
                        GestureDetector(
                            onTap: () => openFilterScreen(context),
                            child: Assets.png.filterIcon
                                .image(width: 38.0, height: 38.0)),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverPadding(
                  padding: EdgeInsetsDirectional.only(top: 21.0)),
              _SearchResultHandler(state: state),
              const SliverPadding(
                  padding: EdgeInsetsDirectional.only(top: 55.0)),
              SliverToBoxAdapter(
                child: !state.isMoreData
                    ? !state.searchStateStatus.isLoadingMore
                        ? Center(
                            child: InkWell(
                              onTap: () => seeMore(state.searchValue),
                              child: Text(
                                'See More',
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
              const SliverPadding(
                  padding: EdgeInsetsDirectional.only(top: 55.0)),
            ],
          );
        }),
      ),
    );
  }

  void openFilterScreen(context) {
    FocusScope.of(context).unfocus();
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: const FilterScreen(),
      withNavBar: true,
    );
  }

  void seeMore(String searchValue) {
    SearchBloc.get
        .add(SearchOnItemsEvent(searchValue: searchValue, isSeeMore: true));
  }
}

class _SearchResultHandler extends StatelessWidget {
  final SearchState state;
  const _SearchResultHandler({required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state.searchStateStatus) {
      case SearchStateStatus.LOADING:
        return const SliverToBoxAdapter(
            child: CircularProgressIndicatorWidget());
      case SearchStateStatus.NULL:
        return const SliverToBoxAdapter(
            child: Center(child: Text('No information available...')));
      default:
        return SliverList(
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
                            homeScreenState:
                                HomeScreenState.SUBCATEGORYRESULT));
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Assets.svg.searchIcon.svg(),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Expanded(
                              child: Text(
                                searchModelData.description
                                    .toString()
                                    .replaceAll('\n', ' '),
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 18.0,
                                        color: ColorName.mediumGray,
                                        overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_upward,
                              color: ColorName.gray,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
          }, childCount: state.searchResultList.length),
        );
    }
  }
}
