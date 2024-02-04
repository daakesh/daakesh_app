import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class CreateAccountWidget extends StatelessWidget {
  const CreateAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Don\'t have an Account? ', style: easyTheme.textTheme.bodyMedium,),
        TextButtonWidget(text: 'Create one', onPressed: ()=>openNewPage(RegisterPersonalInfoScreen())),
      ],
    );
  }
}