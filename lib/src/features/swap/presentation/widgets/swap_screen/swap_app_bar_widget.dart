import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<SwapBloc, SwapState>(builder: (_, state) {
      return SliverAppBar(
        backgroundColor: ColorName.blueGray,
        expandedHeight: 150.h,
        leading: const SizedBox(),
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          background: SwapSearchBarWidget(state: state),
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
                            onFieldSubmitted: (value) {
                              if (value.isEmpty) {
                                return;
                              }
                              SwapSearchBloc.get.add(
                                  SwapSearchFilterEvent(searchValue: value));
                              SwapFilterBloc.get.add(GetSwapCitiesEvent());
                              Utils.openNavNewPage(
                                  context, const SwapSearchItemsScreen());
                            },
                            onChanged: onChange,
                            readOnly: !widget.isActive,
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
                            onTap: !widget.isActive
                                ? () => openSearchScreen()
                                : () {},
                            style: context.easyTheme.textTheme.labelMedium!
                                .copyWith(fontFamily: FontFamily.apercuRegular),
                            isUnderlineOn: true,
                            hintText:
                                context.locale.swap_search_text_field_hint,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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

  void clearText() {
    FocusScope.of(context).unfocus();
    SwapSearchBloc.get.add(SwapEmptySearchEvent());
    controller.clear();
    Navigator.pop(context);
  }

  void openSearchScreen() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            const SwapSearchScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  void openCartScreen() {
    //Utils.openNavNewPage(context, const SwapCartScreen());
  }
}
