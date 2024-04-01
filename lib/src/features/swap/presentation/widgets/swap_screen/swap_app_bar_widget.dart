import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../src.export.dart';

class SwapAppBarWidget extends StatefulWidget {
  final bool isActive;
  final bool isCart;

  const SwapAppBarWidget({
    super.key,
    this.isActive = false,
    this.isCart = false,
  });

  @override
  State<SwapAppBarWidget> createState() => _SwapAppBarWidgetState();
}

class _SwapAppBarWidgetState extends State<SwapAppBarWidget> {
  final controller = TextEditingController();
  Timer? _debounceTimer;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) {
        SwapSearchBloc.get.add(SwapEmptySearchEvent());
      },
      canPop: true,
      child: BlocBuilder<SwapBloc, SwapState>(builder: (_, state) {
        return SliverAppBar(
          backgroundColor: ColorName.blueGray,
          expandedHeight: 160.0,
          leading: const SizedBox(),
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: SwapSearchBarWidget(
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
                            color: state.swapScreenState.isSearch
                                ? ColorName.amber
                                : ColorName.charcoalGray),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                            child: TextFormFieldWidget(
                              controller: controller,
                              isSuffixPrefixOn: true,
                              onChanged: onChange,
                              readOnly: !widget.isActive,
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
                              onTap: !widget.isActive
                                  ? () => openSearchScreen()
                                  : () {},
                              style: context.easyTheme.textTheme.labelMedium!
                                  .copyWith(
                                      fontFamily: FontFamily.apercuRegular),
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
      }),
    );
  }

  void onChange(String value) {
    SwapSearchBloc.get.add(SwapEmptySearchEvent());
    _debounceTimer?.cancel();
    if (value.isEmpty) {
      SwapSearchBloc.get.add(SwapEmptySearchEvent());
      return;
    }
    _debounceTimer = Timer(const Duration(milliseconds: 900), () {
      SwapSearchBloc.get.add(SwapSearchOnItemsEvent(searchValue: value));
    });
  }

  void clearText() {
    FocusScope.of(context).unfocus();
    controller.clear();
    SwapSearchBloc.get.add(SwapEmptySearchEvent());
  }

  void openSearchScreen() {
    FocusScope.of(context).unfocus();
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: const SwapSearchScreen(),
      withNavBar: true,
    );
  }

  void openCartScreen() {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: const SwapCartScreen(),
      withNavBar: true,
    );
  }
}
