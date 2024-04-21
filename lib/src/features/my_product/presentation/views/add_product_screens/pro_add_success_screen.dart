import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class ProAddSuccessScreen extends StatelessWidget {
  const ProAddSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 110.0.h,
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.only(start: 58.0.w, end: 97.0.w),
                  child: const DaakeshLogoWidget(),
                ),
                const Spacer(
                  flex: 1,
                ),
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.png.checkIcon.path))),
                ),
                const SizedBox(
                  height: 19.0,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 21.0.w),
                  child: Text(
                    'Your product has been added successfully',
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 26.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 9.0,
                ),
                const Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                  child: DefaultButtonWidget(
                      text: 'ADD NEW PRODUCT', onPressed: addNewProduct),
                ),
                const SizedBox(
                  height: 9.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                  child: OutlineButtonWidget(
                      text: 'SEE MY PRODUCT', onPressed: seeMyProduct),
                ),
                const SizedBox(
                  height: 72.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addNewProduct() async {
    Utils.openNewPage(
      const MainScreen(),
      popPreviousPages: true,
    );
  }

  void seeMyProduct() async {
    Utils.openNewPage(
      const MainScreen(),
      popPreviousPages: true,
    );
  }
}
