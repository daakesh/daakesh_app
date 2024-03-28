import 'package:flutter/material.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 6,),
              const SizedBox(height: 20.0,),
              const Padding(
                padding: EdgeInsetsDirectional.only(start: 58.0,end: 100),
                child: DaakeshLogoWidget(),
              ),
              const SizedBox(height: 40.0,),
              Padding(
                padding:const EdgeInsetsDirectional.only(start: 26.0,end: 66.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lets Go',style: easyTheme.textTheme.headlineLarge),
                    const SizedBox(height: 10.0,),
                    FittedBox(child: Text('Enter your Personal your Info',style: easyTheme.textTheme.headlineMedium)),
                  ],
                ),
              ),
              const SizedBox(height: 40.0,),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                    TextFormFieldWidget(
                      controller: nameController,
                      focusNode: nameFocusNode,
                      onFieldSubmitted: (value)=>fieldFocusChange(context,nameFocusNode,emailFocusNode),
                      inputFormatters: [
                        RegExpValidator.beginWhitespace,
                      ],
                    ),
                    const SizedBox(height: 33.0),
                    Text('Email',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                    TextFormFieldWidget(
                      controller: emailController,
                      focusNode: emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value)=>fieldFocusChange(context,emailFocusNode,passwordFocusNode),
                      inputFormatters: [
                        RegExpValidator.clearWhitespace,
                      ],
                    ),
                    const SizedBox(height: 33.0),
                    Text('Password',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                    TextFormFieldWidget(
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      obscureText: true,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 60.0),

                  ],
                ),
              ),
              DefaultButtonWidget(text: 'NEXT', onPressed: ()=>onNext(context),padding: const EdgeInsetsDirectional.symmetric(horizontal: 21.1),),
              const SizedBox(height: 40.0),
              const AlreadyHaveAccountWidget(),

              const Spacer(flex: 3,),
              const SizedBox(height: 20.0),


            ],
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
