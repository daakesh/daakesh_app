import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class RegisterPersonalInfoScreen extends StatefulWidget {
  const RegisterPersonalInfoScreen({super.key});

  @override
  State<RegisterPersonalInfoScreen> createState() =>
      _RegisterPersonalInfoScreenState();
}

class _RegisterPersonalInfoScreenState
    extends State<RegisterPersonalInfoScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

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
                flex: 6,
              ),
              SizedBox(
                height: 20.0.h,
              ),
              const Center(child: DaakeshLogoWidget()),
              SizedBox(
                height: 40.0.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 26.0.w, end: 66.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.locale.lets_go_title,
                        style: context.easyTheme.textTheme.headlineLarge!
                            .copyWith(fontSize: 40.0.sp)),
                    const SizedBox(
                      height: 10.0,
                    ),
                    FittedBox(
                        child: Text(context.locale.enter_personal_info_title,
                            style: context.easyTheme.textTheme.headlineMedium!
                                .copyWith(fontSize: 25.0.sp))),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.locale.name_text_field,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0.sp, color: ColorName.darkGray)),
                    TextFormFieldWidget(
                      controller: nameController,
                      focusNode: nameFocusNode,
                      onFieldSubmitted: (value) => Utils.fieldFocusChange(
                          context, nameFocusNode, emailFocusNode),
                      inputFormatters: [
                        RegExpValidator.beginWhitespace,
                      ],
                    ),
                    SizedBox(height: 33.0.h),
                    Text(context.locale.email_text_field,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0.sp, color: ColorName.darkGray)),
                    TextFormFieldWidget(
                      controller: emailController,
                      focusNode: emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) => Utils.fieldFocusChange(
                          context, emailFocusNode, passwordFocusNode),
                      inputFormatters: [
                        RegExpValidator.clearWhitespace,
                      ],
                    ),
                    SizedBox(height: 33.0.h),
                    Text(context.locale.password_text_field,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0.sp, color: ColorName.darkGray)),
                    TextFormFieldWidget(
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      obscureText: true,
                      maxLines: 1,
                    ),
                    SizedBox(height: 60.0.h),
                  ],
                ),
              ),
              DefaultButtonWidget(
                text: context.locale.next_button_title,
                onPressed: () => onNext(context),
                padding: EdgeInsetsDirectional.symmetric(horizontal: 21.1.w),
              ),
              SizedBox(height: 40.0.h),
              const AlreadyHaveAccountWidget(),
              const Spacer(
                flex: 3,
              ),
              SizedBox(height: 20.0.h),
            ],
          ),
        ),
      ),
    );
  }

  void onNext(BuildContext context) async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(
          message: context.locale.fill_personal_data_snack_bars);
      return;
    }
    AuthBloc.get.add(EnterPersonalInfoEvent(
      name: nameController.text,
      email: emailController.text.trim(),
      password: passwordController.text,
    ));
    Utils.openNewPage(const RegisterLocationInfoScreen());
  }
}
