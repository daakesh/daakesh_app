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
                const DaakeshLogoWidget(),
                const Spacer(
                  flex: 1,
                ),
                Assets.svg.creditCardLogoIcon.svg(),
                SizedBox(
                  height: 35.0.h,
                ),
                Text('Add Your Payment Card',
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 28.0.sp)),
                SizedBox(
                  height: 9.0.h,
                ),
                Text('Shop With A Variety Of Products From Daakesh',
                    style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                      fontSize: 15.0.sp,
                    )),
                const Spacer(
                  flex: 1,
                ),
                DefaultButtonWidget(
                    text: 'ADD PAYMENT CARD', onPressed: addPaymentCard),
                SizedBox(
                  height: 9.0.h,
                ),
                OutlineButtonWidget(text: 'LATER', onPressed: onLater),
                SizedBox(
                  height: 72.0.h,
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
