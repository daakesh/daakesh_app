import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class SearchProductBarWidget extends StatefulWidget {
  final TextEditingController searchController;
  final MyProFuncState state;
  const SearchProductBarWidget(
      {super.key, required this.searchController, required this.state});

  @override
  State<SearchProductBarWidget> createState() => _SearchProductBarWidgetState();
}

class _SearchProductBarWidgetState extends State<SearchProductBarWidget> {
  Timer? _debounceTimer;

  @override
  void dispose() {
    widget.searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.only(start: 16, end: 13, bottom: 0.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsetsDirectional.only(end: 8),
              decoration: const BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Assets.svg.searchIcon.svg(
                      color: ColorName.charcoalGray, width: 20, height: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormFieldWidget(
                        controller: widget.searchController,
                        isUnderlineOn: true,
                        onChanged: onChange,
                        hintText:
                            widget.state.productTapBar == ProductTapBar.SELL
                                ? context.locale.search_in_your_sell_product
                                : context.locale.search_in_your_swap_product,
                        style: context.easyTheme.textTheme.labelMedium!
                            .copyWith(fontFamily: FontFamily.apercuRegular),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onChange(String value) {
    MyProFuncBloc.get.add(EmptyProductSearchEvent(value: value));
    _debounceTimer?.cancel();
    if (value.isEmpty) {
      MyProFuncBloc.get.add(EmptyProductSearchEvent(value: value));
      return;
    }
    _debounceTimer = Timer(const Duration(milliseconds: 900), () {
      MyProFuncBloc.get.add(SearchOnProductEvent(searchValue: value));
    });
  }
}
