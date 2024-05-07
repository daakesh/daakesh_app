import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class ContactInfoWidget extends StatelessWidget {
  final String phoneNumber;
  const ContactInfoWidget({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 17.5, end: 26.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: DefaultButtonWidget(
                  text: context.locale.more_info_product_call,
                  onPressed: () => lunchCall(context))),
          const SizedBox(
            width: 8.0,
          ),
          DefaultButtonWidget(
              text: context.locale.more_info_product_whatsapp,
              onPressed: () => lunchWhatsApp(context),
              style: context.easyTheme.elevatedButtonTheme.style!.copyWith(
                minimumSize: MaterialStateProperty.all(Size(40.0.w, 56.0.h)),
                backgroundColor: MaterialStateProperty.all(ColorName.amber),
              )),
        ],
      ),
    );
  }

  void lunchCall(BuildContext context) {
    if (ValueConstants.userId.isEmpty) {
      context.showLoginDialog;
      return;
    }
    Utils.lunchCall(phoneNumber.toString());
  }

  void lunchWhatsApp(BuildContext context) {
    if (ValueConstants.userId.isEmpty) {
      context.showLoginDialog;
      return;
    }
    Utils.lunchWhatsApp(phoneNumber.toString());
  }
}
