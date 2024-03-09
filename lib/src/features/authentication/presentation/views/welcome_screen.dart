import 'package:daakesh/src/features/authentication/presentation/views/login_manner_screen.dart';
import 'package:flutter/material.dart';
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
        body: LayoutBuilderWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 3,),
              const Center(child: DaakeshLogoWidget()),
              const Spacer(flex: 3,),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 16.0,end:26.0 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: easyTheme.textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 20.86,),
                    Text(
                      'Praesent hendrerit finibus orci eu facilisis. Mauris porttitor sit amet',
                      style: easyTheme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 1,),
              Center(child: DefaultButtonWidget(onPressed: () =>openNewPage(RegisterPersonalInfoScreen()), text: 'CREATE ACCOUNT',)),
              const Spacer(flex: 1,),
              const ThirdPartyAuthenticationWidget(),
              const SizedBox(height: 44.0,),
              AlreadyHaveAccountWidget(onPressed:onLogin),
              const Spacer(flex: 1,),
            ],
          ),
        ),
      ),
    );
  }
  void onLogin()=> openNewPage(const LoginMannerScreen());
}

