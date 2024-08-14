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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 3,
              ),
              const Center(child: GeneralDaakeshLogoWidget()),
              const Spacer(
                flex: 3,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 16.0.w, end: 26.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.locale.welcome_title,
                      style: context.easyTheme.textTheme.headlineLarge!
                          .copyWith(fontSize: 40.0.sp),
                    ),
                    SizedBox(
                      height: 20.86.h,
                    ),
                    Text(
                      context.locale.welcome_body_title,
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 18.0.sp),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Center(
                  child: DefaultButtonWidget(
                onPressed: () =>
                    Utils.openNewPage(const RegisterPersonalInfoScreen()),
                text: context.locale.create_account_title,
              )),
              const Spacer(
                flex: 1,
              ),
              //const ThirdPartyAuthenticationWidget(),
              SizedBox(
                height: 44.0.h,
              ),
              const AlreadyHaveAccountWidget(),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
