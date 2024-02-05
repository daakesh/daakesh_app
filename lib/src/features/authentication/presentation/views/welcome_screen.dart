import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.white,
        image: DecorationImage(
            image: AssetImage(Assets.png.authScreensBackground.path),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 16.0,end: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 140.43,),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start:45.0 ),
                    child: DaakeshLogoWidget(),
                  ),
                  const SizedBox(height: 170.0,),
                  Text(
                    'Welcome',
                    style: easyTheme.textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 20.86,),
                  Text(
                    'Praesent hendrerit finibus orci eu facilisis. Mauris porttitor sit amet',
                    style: easyTheme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 70.0,),
                  DefaultButtonWidget(onPressed: () =>openNewPage(RegisterPersonalInfoScreen()), text: 'CREATE ACCOUNT',),
                  const SizedBox(height: 67.0,),
                  const ThirdPartyAuthenticationWidget(),
                  const SizedBox(height: 44.0,),
                  const AlreadyHaveAccountWidget(),
                  const SizedBox(height: 55.0,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void onLogin()=> openNewPage(const LoginScreen());
}

