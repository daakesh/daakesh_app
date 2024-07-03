import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class SwapSearchBarWidget extends StatelessWidget {
  final SwapState state;

  const SwapSearchBarWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      width: double.infinity,
      decoration: const BoxDecoration(color: ColorName.blueGray),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Opacity(
              opacity: 0.3,
              child: Assets.svg.line.svg(
                alignment: AlignmentDirectional.bottomEnd,
                width: 160.w,
                height: 160.h,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 53.0),
                  Center(
                    child: DaakeshLogoWidget(
                      isLight: true,
                      width: 184.0.w,
                    ),
                  ),
                  state.swapScreenState.isProductDetails ||
                          state.swapScreenState.isCart ||
                          state.swapScreenState.isSections ||
                          state.swapScreenState.isSubCategoryResult ||
                          state.swapScreenState.isSendOffer ||
                          state.swapScreenState.isOfferDetails
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

  void onBack(SwapState state) {
    if (state.swapScreenState.isOfferDetails) {
      return;
    }
    if (state.swapScreenState.isSendOffer) {
      return;
    }
    if (state.swapScreenState.isSubCategoryResult) {
      return;
    }
    if (state.swapScreenState.isSections) {
      SwapSectionsBloc.get.add(SwapResetVarEvent());
    }
  }
}
