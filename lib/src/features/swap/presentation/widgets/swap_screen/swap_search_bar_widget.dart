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
      decoration: BoxDecoration(
        color: ColorName.blueGray,
        image:DecorationImage(
          image: AssetImage(Assets.png.authScreensBackground.path),
          alignment: AlignmentDirectional.centerEnd,
        ),

      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 53.0,
            ),
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
                onPressed: () =>onBack(state),
                icon: const Icon(
                  Icons.arrow_back,
                  color: ColorName.white,
                ))
                : const SizedBox(),

          ],
        ),
      ),
    );
  }

  void onBack(SwapState state){
    if(state.swapScreenState.isOfferDetails){
      SwapBloc.get.add(ToggleSwapScreenStateEvent(swapScreenState: SwapScreenState.SENDOFFER));
      return;
    }
    if(state.swapScreenState.isSendOffer){
      SwapBloc.get.add(ToggleSwapScreenStateEvent(swapScreenState: SwapScreenState.PRODUCTDETAILS));
      return;
    }
    if(state.swapScreenState.isSubCategoryResult){
      SwapBloc.get.add(ToggleSwapScreenStateEvent(swapScreenState: SwapScreenState.SECTIONS));
      return;
    }
    if(state.swapScreenState.isSections){
      SwapSectionsBloc.get.add(SwapResetVarEvent());
    }
    SwapBloc.get.add(ToggleSwapScreenStateEvent(swapScreenState:SwapScreenState.HOME));
  }

}
