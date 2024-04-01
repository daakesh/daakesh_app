import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class SwapPaymentMethodScreen extends StatelessWidget {
  const SwapPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilderWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: Text(
                'Choose Payment Method',
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 22.0),
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            TypePaymentMethod(
                index: 1, title: 'Credit Card', activeIndex: 1, onTap: () {}),
            const SizedBox(
              height: 12.0,
            ),
            TypePaymentMethod(
                index: 2,
                title: 'Cash Upon Delivery',
                activeIndex: 1,
                onTap: () {},
                isCreditCard: false),
            const SizedBox(
              height: 27.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: Text(
                'Cards',
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 22.0),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TypePaymentMethod(
              index: 2,
              title: 'XXXX- 1236',
              activeIndex: 1,
              onTap: () {},
              isCreditCard: false,
              isCardItem: true,
              cardType: CardsTypes.VISA,
            ),
            const SizedBox(
              height: 36.0,
            ),
            InkWell(
              splashColor: ColorName.transparent,
              highlightColor: ColorName.transparent,
              focusColor: ColorName.transparent,
              onTap: () {
                Utils.openNewPage(RegisterCardInfoScreen(
                  isLoggedIn: true,
                ));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    color: ColorName.amber,
                    size: 30,
                  ),
                  Text(
                    'Add Payment Card',
                    style: context.easyTheme.textTheme.bodyLarge!.copyWith(
                        fontSize: 18.0,
                        color: ColorName.black.withOpacity(0.55)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: DefaultButtonWidget(text: 'PAY', onPressed: makePay),
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }

  void makePay() async {
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 2));
    ProgressCircleDialog.dismiss();
    Utils.openNewPage(const ConfirmOrderScreen());
  }
}
