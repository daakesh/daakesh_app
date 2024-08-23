import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
              const Center(child: GeneralDaakeshLogoWidget()),
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
                            fontSize: 18.0, color: ColorName.darkGray)),
                    TextFormFieldWidget(
                      controller: nameController,
                      focusNode: nameFocusNode,
                      textCapitalization: TextCapitalization.words,
                      onFieldSubmitted: (value) => Utils.fieldFocusChange(
                          context, nameFocusNode, emailFocusNode),
                      inputFormatters: [
                        RegExpValidator.beginWhitespace,
                      ],
                    ),
                    SizedBox(height: 33.0.h),
                    Text(context.locale.email_text_field,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0, color: ColorName.darkGray)),
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
                            fontSize: 18.0, color: ColorName.darkGray)),
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
              SizedBox(height: 20.0.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                        style: context.easyTheme.textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                          color: ColorName.black.withOpacity(0.4),
                        ),
                        children: [
                          TextSpan(
                            text: context.locale.term_and_condition,
                          ),
                          TextSpan(
                            style: context.easyTheme.textTheme.bodyLarge!
                                .copyWith(
                                    fontSize: 14,
                                    color: ColorName.black,
                                    decoration: TextDecoration.underline),
                            text: context.locale.terms_and_condition_button,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => openTermsAndCondition(),
                          ),
                          TextSpan(text: context.locale.daakesh_title),
                        ])),
              ),
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

  void openTermsAndCondition() {
    Utils.openNewPage(const TermsAndConditionWebView());
  }

  void onNext(BuildContext context) async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(
          message: context.locale.fill_personal_data_snack_bars);
      return;
    }
    if (!RegExpValidator.isValidEmail(email: emailController.text)) {
      ShowToastSnackBar.showSnackBars(message: 'Bad email formate');
      return;
    }
    if (!RegExpValidator.passwordStrength(password: passwordController.text)) {
      ShowToastSnackBar.showSnackBars(
          message:
              'Password must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters');
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

class TermsAndConditionWebView extends StatelessWidget {
  const TermsAndConditionWebView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setNavigationDelegate(
                NavigationDelegate(
                  onProgress: (int progress) {},
                  onPageStarted: (String url) {},
                  onPageFinished: (String url) {},
                  onHttpError: (HttpResponseError error) {},
                  onWebResourceError: (WebResourceError error) {},
                  onNavigationRequest: (NavigationRequest request) {
                    return NavigationDecision.navigate;
                  },
                ),
              )
              ..loadRequest(
                  Uri.parse('https://daakesh.com/Tearms&Conditions2'))),
      ),
    );
  }
}
