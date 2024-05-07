import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class SearchProductBarWidget extends StatefulWidget {
  final TextEditingController searchController;
  const SearchProductBarWidget({super.key, required this.searchController});

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
          EdgeInsetsDirectional.only(start: 16.0.w, end: 13.0.w, bottom: 0.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 50.0.h,
              margin: EdgeInsetsDirectional.only(end: 8.0.w),
              decoration: BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20.0.w,
                  ),
                  Assets.svg.searchIcon.svg(
                      color: ColorName.charcoalGray,
                      width: 20.0.w,
                      height: 20.0.h),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: TextFormFieldWidget(
                        controller: widget.searchController,
                        isUnderlineOn: true,
                        onChanged: onChange,
                        hintText: 'Search In Your Product',
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
