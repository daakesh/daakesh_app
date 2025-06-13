import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapSearchBarWidget extends StatelessWidget {
  final SwapState state;

  const SwapSearchBarWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
                  width: 160,
                  height: 160,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.symmetric(horizontal: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Utils.isEnglish ? 50.0 : 30.0),
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
      ),
    );
  }

  void onBack(SwapState state) {
    SwapSectionsBloc.get.add(SwapResetVarEvent());
  }
}
