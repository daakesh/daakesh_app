import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SearchBarWidget extends StatelessWidget {
  final HomeState state;

  const SearchBarWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorName.blueGray,
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Opacity(
              opacity: 0.3,
              child: Assets.svg.line.svg(
                  alignment: AlignmentDirectional.bottomEnd,
                  fit: BoxFit.fitHeight,
                  height: 160,
                  width: 160),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Utils.isEnglish ? 50.0 : 30.0),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      return Center(
                        child: state.switchLangValue
                            ? const ArabicDaakeshLogoWidget(
                                isLight: true,
                                width: 150,
                              )
                            : const DaakeshLogoWidget(
                                isLight: true,
                                width: 184,
                              ),
                      );
                    },
                  ),
                  state.homeScreenState.isProductDetails ||
                          state.homeScreenState.isCart ||
                          state.homeScreenState.isSections ||
                          state.homeScreenState.isShopByBrands ||
                          state.homeScreenState.isHomemade ||
                          state.homeScreenState.isSubCategoryResult
                      ? IconButton(
                          onPressed: () => onBack(state),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: ColorName.white,
                          ))
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onBack(HomeState state) {
    if (state.homeScreenState.isSubCategoryResult) {
      return;
    }
    if (state.homeScreenState.isSections) {
      SectionsBloc.get.add(ResetVarEvent());
    }
  }
}
