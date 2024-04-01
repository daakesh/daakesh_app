import 'package:flutter/material.dart';

import '../../../../src.export.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  const AlreadyHaveAccountWidget({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an Account? ',
          style: context.easyTheme.textTheme.bodyMedium,
        ),
        TextButtonWidget(
            text: 'Login',
            onPressed:
                onPressed ?? () => Utils.openNewPage(const LoginScreen()),
            isBold: true),
      ],
    );
  }
}
