import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';
import '../../../../../src.export.dart';


class RegisterPersonalInfoScreen extends StatelessWidget {
  RegisterPersonalInfoScreen({super.key});

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
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 186.0.h,),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 58.0.w,end: 100.w),
                  child: const DaakeshLogoWidget(),
                ),
                SizedBox(height: 65.0.h,),
                Padding(
                  padding:EdgeInsetsDirectional.only(start: 26.0.w,end: 66.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Lets Go',style: easyTheme.textTheme.headlineLarge),
                      SizedBox(height: 10.0.h,),
                      Text('Enter your Personal your Info',style: easyTheme.textTheme.headlineMedium),
                    ],
                  ),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       SizedBox(height: 43.0.h),
                      Text('Name',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0.sp,color: ColorName.darkGray)),
                      TextFormFieldWidget(
                        controller: nameController,
                        focusNode: nameFocusNode,
                        onFieldSubmitted: (value)=>fieldFocusChange(context,nameFocusNode,emailFocusNode),
                        inputFormatters: [
                          RegExpValidator.beginWhitespace,
                        ],
                      ),
                      SizedBox(height: 33.0.h),
                      Text('Email',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0.sp,color: ColorName.darkGray)),
                      TextFormFieldWidget(
                        controller: emailController,
                        focusNode: emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value)=>fieldFocusChange(context,emailFocusNode,passwordFocusNode),
                        inputFormatters: [
                          RegExpValidator.clearWhitespace,
                        ],
                      ),
                      SizedBox(height: 33.0.h),
                      Text('Password',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0.sp,color: ColorName.darkGray)),
                      TextFormFieldWidget(
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        obscureText: true,
                        maxLines: 1,
                      ),
                      SizedBox(height: 64.0.sp),

                    ],
                  ),
                ),
                DefaultButtonWidget(text: 'NEXT', onPressed: ()=>onNext(context),padding: EdgeInsetsDirectional.symmetric(horizontal: 21.1.w),),
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

  void onNext(context)async{
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(message: 'Fill personal data firstly');
      return;
    }

    ProgressCircleDialog.show();
    AuthBloc.get.add(EnterPersonalInfoEvent(
          name: nameController.text,
          email: emailController.text.trim(),
          password: passwordController.text,
        ));
    await Future.delayed(const Duration(seconds: 1));
    ProgressCircleDialog.dismiss();
    openNewPage(const RegisterLocationInfoScreen());
  }
}
