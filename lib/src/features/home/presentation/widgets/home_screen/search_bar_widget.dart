import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
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
            const Center(
              child: DaakeshLogoWidget(
                isLight: true,
                height: 44.0,
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(builder: (_, state) {
              return state.isProductDetailsOn
                  ? IconButton(
                      onPressed: () => HomeBloc.get.add(
                          ShowMoreProductDetails(
                              isProductDetailsOn: false)),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: ColorName.white,
                      ))
                  : const SizedBox();
            }),

          ],
        ),
      ),
    );
  }
}
