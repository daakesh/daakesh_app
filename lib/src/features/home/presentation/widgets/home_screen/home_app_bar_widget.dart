import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../src.export.dart';

class HomeAppBarWidget extends StatefulWidget {
  final bool isActive;
  final bool isCart;
  const HomeAppBarWidget({
    super.key,
    this.isActive = false,
    this.isCart = false,
  });

  @override
  State<HomeAppBarWidget> createState() => _HomeAppBarWidgetState();
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  final searchController = TextEditingController();
  Timer? _debounceTimer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (_, state) {
      return SliverAppBar(
        backgroundColor: ColorName.blueGray,
        leading: const SizedBox(),
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
                            controller: searchController,
                            isSuffixPrefixOn: true,
                            readOnly: !widget.isActive,
                            onChanged: onChange,
                            inputFormatters: [
                              RegExpValidator.beginWhitespace,
                            ],
                            suffixIcon: widget.isActive
                                ? InkWell(
                                    onTap: clearText,
                                    child: const Icon(
                                      Icons.clear_outlined,
                                      color: ColorName.blueGray,
                                    ),
                                  )
                                : const SizedBox(),
                            onTap: () =>
                                !widget.isActive ? openSearchScreen() : () {},
                            style: context.easyTheme.textTheme.labelMedium!
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
                  onTap: () => !widget.isCart ? openCartScreen() : () {},
                  child: Assets.svg.cartAddIcon
                      .svg(width: 24.0.w, height: 24.0.h)),
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

  void openCartScreen() {
    FocusScope.of(context).unfocus();
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: const CartScreen(),
      withNavBar: true,
    );
  }

  void clearText() {
    FocusScope.of(context).unfocus();
    searchController.clear();
    SearchBloc.get.add(EmptySearchEvent());
  }

  void openSearchScreen() {
    FocusScope.of(context).unfocus();
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: const SearchScreen(),
      withNavBar: true,
    );
  }
}
