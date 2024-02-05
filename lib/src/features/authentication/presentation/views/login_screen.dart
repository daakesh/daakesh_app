import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../src.export.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool? checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return  AuthenticationBackgroundWidget(
      widget: Scaffold(
        backgroundColor: ColorName.transparent,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 186.0),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 30.0),
                    child: DaakeshLogoWidget(),
                  ),
                  const SizedBox(height: 117.0),
                  Text('Welcome back!',style: easyTheme.textTheme.headlineLarge,),
                  const SizedBox(height: 22.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray),),
                        TextFormFieldWidget(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          inputFormatters: [
                            RegExpValidator.clearWhitespace,
                          ],
                        ),
                        const SizedBox(height: 33.0),
                        Text('Password',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray),),
                        TextFormFieldWidget(
                          controller: passwordController,
                          obscureText: true,
                        ),
                        Row(
                          children: [
                            Checkbox(
                                onChanged: (bool? value) {
                                  checkedValue = value;
                                },
                                value: checkedValue,
                              overlayColor: MaterialStateProperty.all(ColorName.white),
                              hoverColor: ColorName.white,
                              side: const BorderSide(color: ColorName.darkGray),
                            ),
                            Text('Remember Me',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 43.0),
                  DefaultButtonWidget(text: 'LOGIN', onPressed: onLogin),
                  const SizedBox(height: 25.0),
                  Center(child: TextButtonWidget(text: 'Forget password ?', onPressed: forgetPassword)),
                  const SizedBox(height: 25.0),
                  const CreateAccountWidget(),
                  const SizedBox(height: 25.0),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onLogin(){
    context.read<AuthBloc>().add(OnLoginEvent(
          phoneNumber: emailController.text.trim(),
          password: passwordController.text,
        ));
  }

  void forgetPassword(){}
}


