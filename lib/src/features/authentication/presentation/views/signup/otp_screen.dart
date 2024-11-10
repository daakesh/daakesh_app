import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class OTPScreen extends StatefulWidget {
  final AuthManner authManner;
  const OTPScreen({super.key, required this.authManner});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final firstDigitController = TextEditingController();
  final secondDigitController = TextEditingController();
  final thirdDigitController = TextEditingController();
  final fourthDigitController = TextEditingController();
  final fifthDigitController = TextEditingController();
  final sixthDigitController = TextEditingController();

  final FocusNode firstTextField = FocusNode();
  final FocusNode secondTextField = FocusNode();
  final FocusNode thirdTextField = FocusNode();
  final FocusNode fourthTextField = FocusNode();
  final FocusNode fifthTextField = FocusNode();
  final FocusNode sixthTextField = FocusNode();

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 1),
                const Center(child: GeneralDaakeshLogoWidget()),
                SizedBox(height: 60),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context.locale.otp_title,
                          style: context.easyTheme.textTheme.headlineLarge!
                              .copyWith(fontSize: 40.0)),
                      SizedBox(
                        height: 8,
                      ),
                      Text(context.locale.otp_instruction,
                          style: context.easyTheme.textTheme.headlineMedium!
                              .copyWith(fontSize: 25.0)),
                      SizedBox(height: 19),
                      widget.authManner.isSignUpIn
                          ? BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                return Text(
                                    context.locale.otp_body_text(state.phone),
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(fontSize: 18.0));
                              },
                            )
                          : BlocBuilder<ForgetPassBloc, ForgetPassState>(
                              builder: (context, state) {
                                return Text(
                                    context.locale.otp_body_text(
                                        '+${state.phoneCode + state.phone}'),
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(fontSize: 18.0));
                              },
                            ),
                    ],
                  ),
                ),
                SizedBox(height: 39),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormFieldWidget(
                              style: context.easyTheme.textTheme.labelMedium!
                                  .copyWith(
                                      fontFamily: FontFamily.apercuBold,
                                      fontSize: 27.0),
                              controller: firstDigitController,
                              focusNode: firstTextField,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              onChanged: (text) => otpCursorHandler(
                                  text, firstTextField,
                                  nextFocus: secondTextField, isFirst: true),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: TextFormFieldWidget(
                            controller: secondDigitController,
                            style: context.easyTheme.textTheme.labelMedium!
                                .copyWith(
                                    fontFamily: FontFamily.apercuBold,
                                    fontSize: 27.0),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            focusNode: secondTextField,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            onChanged: (text) => otpCursorHandler(
                                text, secondTextField,
                                previousFocus: firstTextField,
                                nextFocus: thirdTextField),
                          )),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: TextFormFieldWidget(
                            controller: thirdDigitController,
                            style: context.easyTheme.textTheme.labelMedium!
                                .copyWith(
                                    fontFamily: FontFamily.apercuBold,
                                    fontSize: 27.0),
                            focusNode: thirdTextField,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            onChanged: (text) => otpCursorHandler(
                                text, thirdTextField,
                                previousFocus: secondTextField,
                                nextFocus: fourthTextField),
                          )),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: TextFormFieldWidget(
                            style: context.easyTheme.textTheme.labelMedium!
                                .copyWith(
                                    fontFamily: FontFamily.apercuBold,
                                    fontSize: 27.0),
                            focusNode: fourthTextField,
                            controller: fourthDigitController,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            onChanged: (text) => otpCursorHandler(
                                text, fourthTextField,
                                previousFocus: thirdTextField,
                                nextFocus: fifthTextField),
                          )),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: TextFormFieldWidget(
                            style: context.easyTheme.textTheme.labelMedium!
                                .copyWith(
                                    fontFamily: FontFamily.apercuBold,
                                    fontSize: 27.0),
                            focusNode: fifthTextField,
                            controller: fifthDigitController,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            onChanged: (text) => otpCursorHandler(
                                text, fifthTextField,
                                nextFocus: sixthTextField,
                                previousFocus: fourthTextField),
                          )),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: TextFormFieldWidget(
                            style: context.easyTheme.textTheme.labelMedium!
                                .copyWith(
                                    fontFamily: FontFamily.apercuBold,
                                    fontSize: 27.0),
                            focusNode: sixthTextField,
                            controller: sixthDigitController,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            onChanged: (text) => otpCursorHandler(
                                text, sixthTextField,
                                previousFocus: fifthTextField, isLast: true),
                          )),
                        ],
                      ),
                      SizedBox(height: 39),
                      TextButtonWidget(
                          text: context.locale.text_button_send_code_again,
                          onPressed: resendSMSCode),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21),
                  child: DefaultButtonWidget(
                      text: context.locale.validate_button_title,
                      onPressed: () => onValidate(context)),
                ),
                SizedBox(height: 44),
                const AlreadyHaveAccountWidget(),
                SizedBox(height: 55),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void otpCursorHandler(
    String text,
    FocusNode currentFocus, {
    FocusNode? nextFocus,
    FocusNode? previousFocus,
    bool isFirst = false,
    bool isLast = false,
  }) {
    if (text.length == 1) {
      if (isLast) {
        currentFocus.unfocus();
        onValidate(context);
        return;
      }

      Utils.fieldFocusChange(context, currentFocus, nextFocus!);
    }
    if (text.isEmpty) {
      if (isFirst) {
        currentFocus.unfocus();
        return;
      }
      Utils.fieldFocusChange(context, currentFocus, previousFocus!);
    }
  }

  void onValidate(BuildContext context) {
    if (firstDigitController.text.isEmpty ||
        secondDigitController.text.isEmpty ||
        thirdDigitController.text.isEmpty ||
        fourthDigitController.text.isEmpty ||
        fifthDigitController.text.isEmpty ||
        sixthDigitController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(
          message: context.locale.insert_full_code_snack_bar);
      return;
    }

    String smsCode = firstDigitController.text +
        secondDigitController.text +
        thirdDigitController.text +
        fourthDigitController.text +
        fifthDigitController.text +
        sixthDigitController.text;

    checkManner(smsCode);
  }

  void resendSMSCode() {
    if (widget.authManner.isSignUpIn) {
      AuthBloc.get.add(ResendSMSCodeEvent(context: context));
    }
    if (widget.authManner.isForgetPassword) {
      ForgetPassBloc.get.add(ResendCodeEvent(context: context));
    }
  }

  void checkManner(String smsCode) {
    if (widget.authManner.isSignUpIn) {
      AuthBloc.get
          .add(ValidateSMSCodeEvent(smsCode: smsCode, context: context));
    }
    if (widget.authManner.isForgetPassword) {
      ForgetPassBloc.get
          .add(VerifySMSCodeEvent(smsCode: smsCode, context: context));
    }
  }
}
