import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: LayoutBuilderWidget(
        child: Scaffold(
          backgroundColor: ColorName.transparent,
          body: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 130.0,
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(end: 30.0),
                  child: DaakeshLogoWidget(),
                ),
                const SizedBox(
                  height: 70.0,
                ),
                Assets.svg.creditCardLogoIcon.svg(),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29.0),
                  child: Column(
                    children: [
                      Text(
                        'Your Order Has Been Confirmed',
                        style: context.easyTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'This Will Be Shown To You On The My Orders Page',
                        style: context.easyTheme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                      child: DefaultButtonWidget(
                          text: 'BACK SHOPPING', onPressed: backShopping)),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void backShopping() async {
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 1));
    ProgressCircleDialog.dismiss();
    Utils.openNewPage(const MainScreen(), popPreviousPages: true);
  }
}
