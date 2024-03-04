import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';


class SwapAppBarWidget extends StatefulWidget {
  final TextEditingController searchController;

  const SwapAppBarWidget({super.key, required this.searchController});

  @override
  State<SwapAppBarWidget> createState() => _SwapAppBarWidgetState();
}

class _SwapAppBarWidgetState extends State<SwapAppBarWidget> {
  Timer? _debounceTimer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwapBloc, SwapState>(builder: (_, state) {
      return SliverAppBar(
        backgroundColor: ColorName.blueGray,
        expandedHeight: 160.0,
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
                            controller: widget.searchController,
                            isSuffixPrefixOn: true,
                            onChanged: onChange,
                            inputFormatters: [
                              RegExpValidator.beginWhitespace,
                            ],
                            suffixIcon: state.swapScreenState.isSearch
                                ? InkWell(
                                    onTap: clearText,
                                    child: const Icon(
                                      Icons.clear_outlined,
                                      color: ColorName.blueGray,
                                    ),
                                  )
                                : const SizedBox(),
                            onTap: () => SwapBloc.get.add(ToggleSwapScreenStateEvent(swapScreenState:SwapScreenState.SEARCH)),
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
                  SwapBloc.get.add(ToggleSwapScreenStateEvent(swapScreenState:SwapScreenState.CART));
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
  void clearText(){
    FocusScope.of(context).unfocus();
    widget.searchController.clear();
    SwapSearchBloc.get.add(SwapEmptySearchEvent());
    SwapBloc.get.add(ToggleSwapScreenStateEvent(swapScreenState:SwapScreenState.HOME));
  }
}
