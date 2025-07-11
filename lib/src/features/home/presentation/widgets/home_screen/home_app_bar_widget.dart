import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class HomeAppBarWidget extends StatefulWidget {
  final bool isActive;
  final bool isCart;
  final SearchState? state;

  const HomeAppBarWidget({
    super.key,
    this.isActive = false,
    this.isCart = false,
    this.state,
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
        expandedHeight: 150,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          background: SearchBarWidget(state: state),
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
                      const SizedBox(
                        width: 12,
                      ),
                      Assets.svg.searchIcon.svg(
                          color: state.homeScreenState.isSearch
                              ? ColorName.amber
                              : ColorName.charcoalGray),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormFieldWidget(
                            controller: searchController,
                            textInputAction: TextInputAction.search,
                            isSuffixPrefixOn: true,
                            readOnly: !widget.isActive,
                            onChanged: onChange,
                            onFieldSubmitted: (value) {
                              if (value.isEmpty ||
                                  widget.state?.searchStateStatus ==
                                      SearchStateStatus.NULL) {
                                return;
                              }
                              SearchBloc.get
                                  .add(SearchFilterEvent(searchValue: value));
                              FilterBloc.get.add(GetCitiesEvent());
                              print('///////////////////////////////////////');

                              Utils.openNavNewPage(
                                  context, const SearchItemsScreen());
                              print('///////////////////////////////////////');
                            },
                            inputFormatters: [
                              RegExpValidator.beginWhitespace,
                            ],
                            suffixIcon: widget.isActive
                                ? GestureDetector(
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
                            hintText: context.locale.search_hint_text_field,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //SizedBox(width: 14.0.w),
              // GestureDetector(
              //     onTap: () => !widget.isCart ? openCartScreen() : () {},
              //     child: Assets.svg.cartAddIcon
              //         .svg(width: 24.0.w, height: 24.0.h)),
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
    Utils.openNavNewPage(context, const CartScreen());
  }

  void clearText() {
    FocusScope.of(context).unfocus();
    searchController.clear();
    SearchBloc.get.add(EmptySearchEvent());
    Navigator.pop(context);
  }

  void openSearchScreen() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const SearchScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}
