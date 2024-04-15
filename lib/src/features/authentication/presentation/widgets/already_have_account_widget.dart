import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isBold;
  final Widget screen;
  const AlreadyHaveAccountWidget({
    super.key,
    this.onPressed,
    this.isBold = true,
    this.screen = const LoginScreen(),
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
                    text: context.locale.already_have_an_account,
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 17.0.sp)),
                TextSpan(
                    text: context.locale.login_text_button_title,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Utils.openNewPage(screen),
                    style: isBold
                        ? context.easyTheme.textTheme.bodyMedium!.copyWith(
                            color: ColorName.skyBlue,
                            fontSize: 17.0.sp,
                            fontWeight: FontWeight.bold)
                        : context.easyTheme.textTheme.bodyMedium!.copyWith(
                            color: ColorName.skyBlue, fontSize: 17.0.sp))
              ])),
        ),
      ],
    );
  }
}
