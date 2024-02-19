import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final sixthDigitController = TextEditingController();


  final FocusNode firstTextField= FocusNode();
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
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 110.0.h,),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 56.0.w,end: 97.0.w),
                  child: const DaakeshLogoWidget(),
                ),
                SizedBox(height: 60.0.h,),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 26.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Lets Go',style: easyTheme.textTheme.headlineLarge),
                      SizedBox(height: 8.0.h,),
                      Text('Verify Your Identity',style: easyTheme.textTheme.headlineMedium),
                      SizedBox(height: 19.0.h),
                      BlocBuilder<AuthBloc,AuthState>(
                        buildWhen: (previous,current)=>current.authStateStatus.isSuccess,
                        builder: (context, state) {
                          return Text(
                              'We Send You A Code To +${state.phoneCode+state.phone} Phone Number Please Enter The Code To Create Account',
                              style: easyTheme.textTheme.bodyMedium);
                        },),
                    ],
                  ),
                ),
                SizedBox(height: 39.0.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Phone Number',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0.sp,color: ColorName.darkGray)),
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
                                onChanged: (text)=>otpCursorHandler(text,fifthTextField,nextFocus: sixthTextField,previousFocus:fourthTextField),

                              )),
                        const SizedBox(width: 16.0,),
                        Expanded(
                            child: TextFormFieldWidget(
                              style: easyTheme.textTheme.labelMedium!.copyWith(fontFamily: FontFamily.apercuBold,fontSize: 27.0),
                              focusNode:sixthTextField,
                              controller: sixthDigitController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              onChanged: (text)=>otpCursorHandler(text,sixthTextField,previousFocus:fifthTextField,isLast: true),

                            )),
                      ],),
                      const SizedBox(height: 39.0),
                      TextButtonWidget(text: 'Send code again', onPressed: resendSMSCode),
                    ],
                  ),
                ),
                SizedBox(height: 100.h,),
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: 21.0.w),
                  child: DefaultButtonWidget(text: 'VALIDATE', onPressed: onValidate),
                ),
                SizedBox(height: 44.0.h),
                const AlreadyHaveAccountWidget(),
                SizedBox(height: 55.0.h),
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
   String smsCode = firstDigitController.text +
           secondDigitController.text +
           thirdDigitController.text +
           fourthDigitController.text +
           fifthDigitController.text +
           sixthDigitController.text;
   AuthBloc.get.add(ValidateSMSCodeEvent(smsCode:smsCode));
  }

  void resendSMSCode(){
    AuthBloc.get.add(ResendSMSCodeEvent());
  }

}
