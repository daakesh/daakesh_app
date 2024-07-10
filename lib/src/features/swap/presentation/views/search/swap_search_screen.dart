import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapSearchScreen extends StatelessWidget {
  const SwapSearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        FocusScope.of(context).unfocus();
        SwapSearchBloc.get.add(SwapEmptySearchEvent());
      },
      child: Scaffold(
        body: BlocBuilder<SwapSearchBloc, SwapSearchState>(builder: (_, state) {
          return CustomScrollView(
            slivers: [
              SwapAppBarWidget(isActive: true, searchState: state),
              const SliverPadding(
                  padding: EdgeInsetsDirectional.only(top: 21.0)),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 31.0, end: 23.0),
                  child: Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        context.locale.swap_search_title,
                        style: context.easyTheme.textTheme.headlineMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.57)),
                      )),
                ),
              ),
              const SliverPadding(
                  padding: EdgeInsetsDirectional.only(top: 21.0)),
              _SearchResultHandler(state: state),
              const SliverPadding(
                  padding: EdgeInsetsDirectional.only(top: 55.0)),
              SliverToBoxAdapter(
                child: !state.isMoreData
                    ? !state.swapSearchStateStatus.isLoadingMore
                        ? Center(
                            child: InkWell(
                              onTap: () => seeMore(state.searchValue),
                              child: Text(
                                context.locale.see_more_search,
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
    Utils.openNavNewPage(context, SwapFilterScreen());
  }

  void seeMore(String searchValue) {
    SwapSearchBloc.get.add(SwapSearchOnItemsEvent(
      searchValue: searchValue,
      isSeeMore: true,
    ));
  }
}

class _SearchResultHandler extends StatelessWidget {
  final SwapSearchState state;
  const _SearchResultHandler({required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state.swapSearchStateStatus) {
      case SwapSearchStateStatus.LOADING:
        return const SliverToBoxAdapter(
            child: CircularProgressIndicatorWidget());
      case SwapSearchStateStatus.NULL:
        return SliverToBoxAdapter(
            child: Center(
                child:
                    Text(context.locale.swap_search_no_information_available)));
      default:
        return SliverList(
          delegate: SliverChildBuilderDelegate((_, index) {
            TrendDealsItem swapSearchModelData =
                state.swapSearchResultList[index];
            return state.swapSearchResultList.isEmpty
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 31.0, end: 23.0, bottom: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        SwapSearchBloc.get.add(SwapSearchFilterEvent(
                            searchValue: swapSearchModelData.title.toString()));
                        SwapFilterBloc.get.add(GetSwapCitiesEvent());
                        Utils.openNavNewPage(
                            context, const SwapSearchItemsScreen());
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
                                swapSearchModelData.title.toString(),
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 18.0,
                                        color: ColorName.mediumGray,
                                        overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            Assets.svg.arrowUpRight.svg(),
                          ],
                        ),
                      ),
                    ),
                  );
          }, childCount: state.swapSearchResultList.length),
        );
    }
  }
}
