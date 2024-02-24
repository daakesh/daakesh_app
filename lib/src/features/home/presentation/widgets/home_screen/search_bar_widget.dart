import 'package:flutter/material.dart';
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
            state.homeScreenState.isProductDetails || state.homeScreenState.isCart
                ? IconButton(
                onPressed: () => HomeBloc.get.add(SwapHomeScreenStateEvent(homeScreenState:HomeScreenState.HOME )),
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
}
