import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class AddPaymentCardScreen extends StatelessWidget {
  const AddPaymentCardScreen({super.key});

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
                const Spacer(flex: 1),
                const GeneralDaakeshLogoWidget(),
                const Spacer(
                  flex: 1,
                ),
                Assets.svg.creditCardLogoIcon.svg(),
                SizedBox(
                  height: 35,
                ),
                Text(context.locale.add_payment_card_title,
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 28)),
                SizedBox(
                  height: 9,
                ),
                Text(context.locale.add_payment_card_instruction,
                    style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                      fontSize: 15,
                    )),
                const Spacer(
                  flex: 1,
                ),
                DefaultButtonWidget(
                    text: context.locale.add_payment_button_title,
                    onPressed: addPaymentCard),
                SizedBox(
                  height: 9,
                ),
                OutlineButtonWidget(
                    text: context.locale.later_button_title,
                    onPressed: onLater),
                SizedBox(
                  height: 72,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addPaymentCard() {
    Utils.openNewPage(RegisterCardInfoScreen());
  }

  void onLater() {
    Utils.openNewPage(const MainScreen(), popPreviousPages: true);
  }
}
