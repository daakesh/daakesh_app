import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class CardAddedSuccessfullyScreen extends StatelessWidget {
  const CardAddedSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 1),
                  const GeneralDaakeshLogoWidget(),
                  const Spacer(flex: 1),
                  Assets.png.checkIcon.image(),
                  SizedBox(height: 19),
                  Text(
                    context.locale.add_payment_success_title,
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 26.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 9),
                  const Spacer(flex: 1),
                  Center(
                      child: DefaultButtonWidget(
                          text: context.locale.start_shopping_button_title,
                          onPressed: onStartShopping)),
                  SizedBox(height: 72),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onStartShopping() async {
    Utils.openNewPage(
      const MainScreen(),
      popPreviousPages: true,
    );
  }
}
