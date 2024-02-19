import 'package:flutter/material.dart';

import '../../../../src.export.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Don\'t have an Account? ', style: easyTheme.textTheme.bodyMedium,),
        TextButtonWidget(text: 'Login', onPressed: ()=>openNewPage(const LoginScreen()),isBold: true),
      ],
    );
  }
}