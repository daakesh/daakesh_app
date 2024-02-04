import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../src.export.dart';

class RegisterPhoneNumberScreen extends StatelessWidget {
   RegisterPhoneNumberScreen({super.key});

   final phoneNumberController = TextEditingController();


   @override
  Widget build(BuildContext context) {
    return AuthenticationBackgroundWidget(
      widget: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 110.0,),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 38.0),
                    child: DaakeshLogoWidget(),
                  ),
                  const SizedBox(height: 60.0,),
                  Text('Lets Go',style: easyTheme.textTheme.headlineLarge),
                  const SizedBox(height: 10.0,),
                  Text('Enter Phone Number',style: easyTheme.textTheme.headlineMedium),
                  const SizedBox(height: 43.0),
                  Text('Phone Number',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                  TextFormFieldWidget(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                      RegExpValidator.clearZero

                    ],
                  ),
                  const SizedBox(height: 200.0),
                  Center(child: DefaultButtonWidget(text: 'NEXT', onPressed: onNext)),
                  const SizedBox(height: 44.0),
                  const AlreadyHaveAccountWidget(),
                  const SizedBox(height: 55.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onNext() {
    openNewPage(const OTPScreen());
  }
}
