import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilderWidget(
        child: Column(
          children: [
            const HeaderWidget(),
            const SizedBox(
              height: 25.0,
            ),
            const YourCartItemWidget(),
            const SizedBox(
              height: 14.0,
            ),
            const ShippingLocationWidget(),
            const SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27.0),
              child: Row(
                children: [
                  Text(
                    context.locale.check_out_total_title,
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
            const SizedBox(
              height: 12.0,
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.5),
              child: DefaultButtonWidget(
                  text: context.locale.check_out_pay_button,
                  onPressed: () => openCartPayScreen(context)),
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }

  void openCartPayScreen(context) async {
    Utils.openNavNewPage(context, const CartPayScreen());
  }
}
