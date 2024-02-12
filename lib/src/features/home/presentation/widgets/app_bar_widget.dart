import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../src.export.dart';

class AppBarWidget extends StatelessWidget {
  final TextEditingController searchController;

  const AppBarWidget({super.key, required this.searchController});

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
                      const SizedBox(
                        width: 20.0,
                      ),
                      Assets.svg.searchIcon.svg(
                          color: state.isSearchOn
                              ? ColorName.amber
                              : ColorName.charcoalGray),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormFieldWidget(
                            controller: searchController,
                            isSuffixPrefixOn: true,
                            suffixIcon: state.isSearchOn || state.isShowSearchResult
                                ? InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      searchController.clear();
                                      HomeBloc.get.add(SearchOnOffEvent(isSearchOn: false));
                                    },
                                    child: const Icon(
                                      Icons.clear_outlined,
                                      color: ColorName.blueGray,
                                    ),
                                  )
                                : const SizedBox(),
                            onTap: () => HomeBloc.get
                                .add(SearchOnOffEvent(isSearchOn: true)),
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
              const SizedBox(
                width: 14.0,
              ),
              InkWell(
                  onTap: () => HomeBloc.get.add(ShowCartEvent(isShowCart: true)),
                  child: Assets.svg.cartAddIcon.svg(width: 24.0, height: 24.0)),
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
}
