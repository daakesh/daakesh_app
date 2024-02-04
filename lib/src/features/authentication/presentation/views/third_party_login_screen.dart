import 'package:flutter/material.dart';

import '../../../../src.export.dart';

class ThirdPartyLoginScreen extends StatelessWidget {
  const ThirdPartyLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  AuthenticationBackgroundWidget(
      widget: Scaffold(
        backgroundColor: ColorName.transparent,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 16.0,end: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 186.0),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 30.0),
                    child: DaakeshLogoWidget(),
                  ),
                  const SizedBox(height: 190.0),
                  Text('LOGIN',style: easyTheme.textTheme.headlineLarge,),
                  const SizedBox(height: 20.0),
                  Text('Praesent hendrerit finibus orci eu facilisis. Mauris porttitor sit amet',style: easyTheme.textTheme.bodyMedium,),
                  const SizedBox(height: 70.0),
                  DefaultButtonWidget(text: 'EMAIL', onPressed: (){}),
                  const SizedBox(height: 25.0),
                  Center(child: Text('OR',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0),)),
                  const SizedBox(height: 25.0),
                  const ThirdPartyAuthenticationWidget(),
                  const SizedBox(height: 25.0),
                  const CreateAccountWidget(),
                  const SizedBox(height: 55.0),






                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
