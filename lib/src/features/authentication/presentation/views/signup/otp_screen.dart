import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../src.export.dart';

class OTPScreen extends StatefulWidget {
   const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  final firstDigitController = TextEditingController();
  final secondDigitController =TextEditingController();
  final thirdDigitController = TextEditingController();
  final fourthDigitController = TextEditingController();
  final fifthDigitController = TextEditingController();


  final FocusNode firstTextField= FocusNode();
  final FocusNode secondTextField = FocusNode();
  final FocusNode thirdTextField = FocusNode();
  final FocusNode fourthTextField = FocusNode();
  final FocusNode fifthTextField = FocusNode();

  @override
  Widget build(BuildContext context) {
    return AuthenticationBackgroundWidget(
      widget: Scaffold(
        backgroundColor: ColorName.transparent,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 110.0,),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 38.0),
                    child: DaakeshLogoWidget(),
                  ),
                  const SizedBox(height: 60.0,),
                  Text('Lets Go',style: easyTheme.textTheme.headlineLarge),
                  const SizedBox(height: 8.0,),
                  Text('Verify Your Identity',style: easyTheme.textTheme.headlineMedium),
                  const SizedBox(height: 19.0),
                  Text('We Send You A Code To 079856422 Phone Number Please Enter The Code To Create Account',style: easyTheme.textTheme.bodyMedium),
                  const SizedBox(height: 39.0),
                  Text('Phone Number',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                  Row(children: [
                    Expanded(child: TextFormFieldWidget(
                      style: easyTheme.textTheme.labelMedium!.copyWith(fontFamily: FontFamily.apercuBold,fontSize: 27.0),
                      controller: firstDigitController,
                      focusNode:firstTextField,
                      inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (text)=>otpCursorHandler(text,firstTextField,nextFocus:secondTextField ,isFirst: true),


                    ),),
                    const SizedBox(width: 16.0,),
                    Expanded(child: TextFormFieldWidget(
                      controller: secondDigitController,
                      style: easyTheme.textTheme.labelMedium!.copyWith(fontFamily: FontFamily.apercuBold,fontSize: 27.0),
                      inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                      focusNode:secondTextField,

                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (text)=> otpCursorHandler(text,secondTextField,previousFocus:firstTextField,nextFocus:thirdTextField),

                    )),
                    const SizedBox(width: 16.0,),
                    Expanded(
                          child: TextFormFieldWidget(
                        controller: thirdDigitController,
                            style: easyTheme.textTheme.labelMedium!.copyWith(fontFamily: FontFamily.apercuBold,fontSize: 27.0),

                            focusNode:thirdTextField,

                            inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            onChanged: (text) =>otpCursorHandler(text,thirdTextField,previousFocus:secondTextField,nextFocus:fourthTextField ),

                          )),
                    const SizedBox(width: 16.0,),
                    Expanded(
                          child: TextFormFieldWidget(
                            style: easyTheme.textTheme.labelMedium!.copyWith(fontFamily: FontFamily.apercuBold,fontSize: 27.0),

                            focusNode:fourthTextField,

                            controller: fourthDigitController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            onChanged: (text)=>otpCursorHandler(text,fourthTextField,previousFocus: thirdTextField,nextFocus:fifthTextField ),

                          )),
                    const SizedBox(width: 16.0,),
                    Expanded(
                          child: TextFormFieldWidget(
                            style: easyTheme.textTheme.labelMedium!.copyWith(fontFamily: FontFamily.apercuBold,fontSize: 27.0),
                            focusNode:fifthTextField,
                            controller: fifthDigitController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            onChanged: (text)=>otpCursorHandler(text,fifthTextField,previousFocus:fourthTextField,isLast: true),

                          )),
                  ],),
                  const SizedBox(height: 39.0),
                  TextButtonWidget(text: 'Send code again', onPressed: (){}),
                  const SizedBox(height: 100,),
                  DefaultButtonWidget(text: 'VALIDATE', onPressed: onValidate),
                  const SizedBox(height: 44.0),
                  const AlreadyHaveAccountWidget(),
                  const SizedBox(height: 55.0),
                ],
              ),
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
        return;
      }

      fieldFocusChange(context, currentFocus, nextFocus!);
    }
    if (text.isEmpty) {
      if (isFirst) {
        currentFocus.unfocus();
        return;
      }
      fieldFocusChange(context, currentFocus, previousFocus!);
    }
  }



  void onValidate() {
    openNewPage(const VerificationScreen());
  }
}
