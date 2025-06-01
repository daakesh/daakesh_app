import 'dart:io';

import 'package:daakesh/src/widgets/location/location_service_check.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  bool isAgree = false;
  double latitude = 0;
  double longitude = 0;
  String deviceToken = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        // Listen for token refresh
        FirebaseMessaging.instance.onTokenRefresh.listen((token) {
          print('🔁 Token refreshed: $token');
          if (mounted) {
            setState(() {
              deviceToken = token;
            });
          }
        });

        // iOS-specific: request permission and wait for APNs token
        if (Platform.isIOS) {
          await FirebaseMessaging.instance.requestPermission();

          String? apnsToken;
          for (int i = 0; i < 5; i++) {
            apnsToken = await FirebaseMessaging.instance.getAPNSToken();
            if (apnsToken != null) break;
            print('⏳ Waiting for APNs token...');
            await Future.delayed(const Duration(seconds: 2));
          }
          print('📱 Final APNs token: $apnsToken');
        }

        // Common for both iOS and Android
        final fcmToken = await FirebaseMessaging.instance.getToken();
        print('📲 FCM token: $fcmToken');

        if (mounted) {
          setState(() {
            deviceToken = fcmToken ?? '';
          });
        }
      } catch (e) {
        print('🔥 Error in FCM setup: $e');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LocationServiceWidget(
      returnPosition: (double lat, double long) {
        setState(() {
          latitude = lat;
          longitude = long;
        });
      },
      child: DefaultBackgroundWidget(
        child: Scaffold(
          backgroundColor: ColorName.transparent,
          body: LayoutBuilderWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 6,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(child: GeneralDaakeshLogoWidget()),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 26, end: 66),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context.locale.lets_go_title,
                          style: context.easyTheme.textTheme.headlineLarge!
                              .copyWith(fontSize: 40)),
                      const SizedBox(
                        height: 10.0,
                      ),
                      FittedBox(
                          child: Text(context.locale.enter_personal_info_title,
                              style: context.easyTheme.textTheme.headlineMedium!
                                  .copyWith(fontSize: 25))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context.locale.name_text_field,
                          style: context.easyTheme.textTheme.bodyMedium!
                              .copyWith(
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
                      const SizedBox(height: 33),
                      Text(context.locale.email_text_field,
                          style: context.easyTheme.textTheme.bodyMedium!
                              .copyWith(
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
                      const SizedBox(height: 33),
                      Text(context.locale.password_text_field,
                          style: context.easyTheme.textTheme.bodyMedium!
                              .copyWith(
                                  fontSize: 18.0, color: ColorName.darkGray)),
                      TextFormFieldWidget(
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        obscureText: true,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          isAgree = !isAgree;
                          setState(() {});
                        },
                        child: Column(
                          children: [
                            IgnorePointer(
                              child: Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                  value: isAgree,
                                  activeColor: Colors.amber,
                                  onChanged: (value) {
                                    isAgree = !isAgree;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text.rich(
                              textAlign: TextAlign.start,
                              TextSpan(
                                  style: context.easyTheme.textTheme.bodyLarge!
                                      .copyWith(
                                    fontSize: 14,
                                    color: ColorName.black.withOpacity(0.4),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: context.locale.term_and_condition,
                                      style: context
                                          .easyTheme.textTheme.bodyLarge!
                                          .copyWith(
                                        fontSize: 14,
                                        color: ColorName.black.withOpacity(0.4),
                                      ),
                                    ),
                                    TextSpan(
                                      style: context
                                          .easyTheme.textTheme.bodyLarge!
                                          .copyWith(
                                              fontSize: 14,
                                              color: ColorName.black,
                                              decoration:
                                                  TextDecoration.underline),
                                      text: context
                                          .locale.terms_and_condition_button,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => openTermsAndCondition(),
                                    ),
                                    TextSpan(
                                        text: context.locale.daakesh_title),
                                  ])),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                DefaultButtonWidget(
                  text: context.locale.next_button_title,
                  onPressed: () => onNext(context),
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                    ColorName.blueGray,
                  )),
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 21),
                ),
                const SizedBox(height: 40),
                const AlreadyHaveAccountWidget(),
                const Spacer(
                  flex: 3,
                ),
                const SizedBox(height: 20),
              ],
            ),
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
      ShowToastSnackBar.showSnackBars(message: context.locale.bad_format);
      return;
    }
    if (!RegExpValidator.passwordStrength(password: passwordController.text)) {
      ShowToastSnackBar.showSnackBars(
          message: context.locale.password_validation);
      return;
    }
    if (!isAgree) {
      ShowToastSnackBar.showSnackBars(
          message: context.locale.terms_and_condition);
      return;
    }

    AuthBloc.get.add(EnterPersonalInfoEvent(
      name: nameController.text,
      email: emailController.text.trim(),
      password: passwordController.text,
      deviceToken: deviceToken,
    ));
    Utils.openNewPage(RegisterLocationInfoScreen(
      latitude: latitude,
      longitude: longitude,
    ));
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
