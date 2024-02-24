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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 185.0.h,),
                Padding(
                  padding: EdgeInsetsDirectional.only(start:58.0.w ,end: 100.0.w),
                  child: const DaakeshLogoWidget(),
                ),
                SizedBox(height: 196.0.h,),
                Padding(
                  padding:EdgeInsetsDirectional.only(start: 16.0.w,end: 27.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: easyTheme.textTheme.headlineLarge,
                      ),
                      SizedBox(height: 20.86.h,),
                      Text(
                        'Praesent hendrerit finibus orci eu facilisis. Mauris porttitor sit amet',
                        style: easyTheme.textTheme.bodyMedium,
                      ),
                      SizedBox(height: 70.0.h,),
                      DefaultButtonWidget(onPressed: () =>openNewPage(RegisterPersonalInfoScreen()), text: 'CREATE ACCOUNT',),
                      SizedBox(height: 67.0.h,),
                      const ThirdPartyAuthenticationWidget(),
                      SizedBox(height: 44.0.h,),
                      const AlreadyHaveAccountWidget(),
                      SizedBox(height: 50.0.h,),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  void onLogin()=> openNewPage(const LoginScreen());
}

