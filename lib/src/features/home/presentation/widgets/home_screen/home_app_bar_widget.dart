import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';


class HomeAppBarWidget extends StatefulWidget {
  final TextEditingController searchController;

  const HomeAppBarWidget({super.key, required this.searchController});

  @override
  State<HomeAppBarWidget> createState() => _HomeAppBarWidgetState();
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  Timer? _debounceTimer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (_, state) {
      return SliverAppBar(
        backgroundColor: ColorName.blueGray,
        expandedHeight: 160.0,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          background: SearchBarWidget(
            state: state,
          ),
          expandedTitleScale: 1.0,
          title: Row(
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
                      SizedBox(
                        width: 12.0.w,
                      ),
                      Assets.svg.searchIcon.svg(
                          color: state.homeScreenState.isSearch
                              ? ColorName.amber
                              : ColorName.charcoalGray),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                          child: TextFormFieldWidget(
                            controller: widget.searchController,
                            isSuffixPrefixOn: true,
                            onChanged: onChange,
                            inputFormatters: [
                              RegExpValidator.beginWhitespace,
                            ],
                            suffixIcon: state.homeScreenState.isSearch
                                ? InkWell(
                                    onTap: clearText,
                                    child: const Icon(
                                      Icons.clear_outlined,
                                      color: ColorName.blueGray,
                                    ),
                                  )
                                : const SizedBox(),
                            onTap: () => HomeBloc.get.add(SwapHomeScreenStateEvent(homeScreenState:HomeScreenState.SEARCH )),
                            style: easyTheme.textTheme.labelMedium!
                                .copyWith(fontFamily: FontFamily.apercuRegular),
                            isUnderlineOn: true,
                            hintText: 'Search',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 14.0.w),
              GestureDetector(
                  onTap: () {
                  HomeBloc.get.add(SwapHomeScreenStateEvent(homeScreenState:HomeScreenState.CART));
                  FocusScope.of(context).unfocus();
                  },
                  child: Assets.svg.cartAddIcon.svg(width: 24.0.w, height: 24.0.h)),
            ],
          ),
          titlePadding: const EdgeInsetsDirectional.only(
            end: 19.0,
            start: 19.0,
            bottom: 12.0,
          ),
        ),
      );
    });
  }

  void onChange(String value) {
      SearchBloc.get.add(EmptySearchEvent());
    _debounceTimer?.cancel();
    if (value.isEmpty) {
      SearchBloc.get.add(EmptySearchEvent());
      return;
    }
    _debounceTimer = Timer(const Duration(milliseconds: 900), () {
      SearchBloc.get.add(SearchOnItemsEvent(searchValue: value));
    });
  }
  void clearText(){
    FocusScope.of(context).unfocus();
    widget.searchController.clear();
    SearchBloc.get.add(EmptySearchEvent());
    HomeBloc.get.add(SwapHomeScreenStateEvent(homeScreenState:HomeScreenState.HOME));
  }
}
