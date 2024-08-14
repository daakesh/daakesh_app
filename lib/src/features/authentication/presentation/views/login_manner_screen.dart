import 'package:flutter/material.dart';

import '../../../../src.export.dart';

class LoginMannerScreen extends StatelessWidget {
  const LoginMannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 5,
              ),
              const Center(child: GeneralDaakeshLogoWidget()),
              const Spacer(
                flex: 6,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 16.0.w, end: 26.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.locale.login_manner_title,
                      style: context.easyTheme.textTheme.headlineLarge!
                          .copyWith(fontSize: 40.0.sp),
                    ),
                    SizedBox(
                      height: 20.86.h,
                    ),
                    Text(
                      context.locale.login_manner_instruction,
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 18.0.sp),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              Center(
                  child: DefaultButtonWidget(
                onPressed: onLoginWithEmail,
                text: context.locale.login_manner_button_title,
              )),
              const Spacer(
                flex: 1,
              ),
              Center(
                child: Text(
                  context.locale.or_text_title,
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 18.0.sp),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              //const ThirdPartyAuthenticationWidget(),
              const Spacer(
                flex: 1,
              ),
              const CreateAccountWidget(),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onLoginWithEmail() => Utils.openNewPage(const LoginScreen());
}
