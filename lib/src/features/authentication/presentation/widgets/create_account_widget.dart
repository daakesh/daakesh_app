import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class CreateAccountWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isBold;
  final Widget screen;
  const CreateAccountWidget({
    super.key,
    this.onPressed,
    this.isBold = true,
    this.screen = const RegisterPersonalInfoScreen(),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
                TextSpan(
                    text: context.locale.have_an_account_title,
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 17)),
                TextSpan(
                    text: context.locale.create_one_text_button_title,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Utils.openNewPage(screen),
                    style: isBold
                        ? context.easyTheme.textTheme.bodyMedium!.copyWith(
                            color: ColorName.skyBlue,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)
                        : context.easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.skyBlue, fontSize: 17))
              ])),
        ),
      ],
    );
  }
}
