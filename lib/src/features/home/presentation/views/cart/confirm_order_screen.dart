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
                const Spacer(flex: 1),
                const Center(child: DaakeshLogoWidget()),
                const Spacer(flex: 1),
                Assets.svg.creditCardLogoIcon.svg(),
                const SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29.0),
                  child: Column(
                    children: [
                      Text(
                        context.locale.confirm_order_title,
                        style: context.easyTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        context.locale.confirm_order_instruction,
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
                          text: context.locale.confirm_order_button_title,
                          onPressed: backShopping)),
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
    Utils.openNewPage(const MainScreen(), popPreviousPages: true);
  }
}
