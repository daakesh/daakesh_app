import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class CartPayScreen extends StatelessWidget {
  const CartPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilderWidget(
        child: Column(
          children: [
            const HeaderWidget(),
            const SizedBox(height: 25.0),
            const YourCartItemWidget(isWithEdit: false),
            const SizedBox(height: 14.0),
            const ShippingLocationWidget(isWithEdit: false),
            const SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27.0),
              child: Row(
                children: [
                  Text(
                    context.locale.total_title,
                    style: context.easyTheme.textTheme.labelLarge!
                        .copyWith(fontSize: 28.0, color: ColorName.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    '\$88.6',
                    style: context.easyTheme.textTheme.labelLarge!
                        .copyWith(fontSize: 28.0, color: ColorName.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.5),
              child: DefaultButtonWidget(
                  text: context.locale.payment_button_title,
                  onPressed: () => openPaymentMethodScreen(context)),
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }

  void openPaymentMethodScreen(context) async {
    Utils.openNavNewPage(context, const PaymentMethodScreen());
  }
}
