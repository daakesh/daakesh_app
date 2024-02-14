import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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
            const SizedBox(height: 25.0,),
            const YourCartItemWidget(isWithEdit: false),
            const SizedBox(height: 14.0,),
            const ShippingLocationWidget(isWithEdit: false),
            const SizedBox(height: 25.0,),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 27.0),
              child: Row(
                children: [
                  Text(
                    'Total : ',
                    style: easyTheme.textTheme.labelLarge!
                        .copyWith(fontSize: 28.0, color: ColorName.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(flex: 1,),
                  Text('\$88.6',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 28.0,color: ColorName.black),),
                ],),
            ),
            const SizedBox(height: 12.0,),
            const Spacer(flex: 1,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.5),
              child: DefaultButtonWidget(text: 'PAYMENT', onPressed: ()=>openPaymentMethodScreen(context)),
            ),
            const SizedBox(height: 50.0,),
          ],
        ),
      ),
    );
  }
  void openPaymentMethodScreen(context)async{
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 1));
    ProgressCircleDialog.dismiss();
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: const PaymentMethodScreen(),
      withNavBar: true, // OPTIONAL VALUE. True by default.
    );
  }

}
