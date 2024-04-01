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
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    setRememberMeValue();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 5,
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(start: 30.0),
                  child: DaakeshLogoWidget(),
                ),
                const Spacer(
                  flex: 4,
                ),
                Text(
                  'Welcome back!',
                  style: context.easyTheme.textTheme.headlineLarge,
                ),
                const SizedBox(height: 22.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0, color: ColorName.darkGray),
                      ),
                      TextFormFieldWidget(
                        controller: emailController,
                        focusNode: emailFocusNode,
                        onFieldSubmitted: (value) => Utils.fieldFocusChange(
                            context, emailFocusNode, passwordFocusNode),
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: [
                          RegExpValidator.clearWhitespace,
                        ],
                      ),
                      const SizedBox(height: 33.0),
                      Text(
                        'Password',
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0, color: ColorName.darkGray),
                      ),
                      TextFormFieldWidget(
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        obscureText: true,
                        maxLines: 1,
                      ),
                      Row(
                        children: [
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              return Checkbox(
                                onChanged: (bool? value) {
                                  AuthBloc.get.add(ToggleRememberMeValueEvent(
                                      rememberMeValue: value!));
                                },
                                value: state.rememberMeValue,
                                overlayColor:
                                    MaterialStateProperty.all(ColorName.white),
                                hoverColor: ColorName.white,
                                side:
                                    const BorderSide(color: ColorName.darkGray),
                              );
                            },
                          ),
                          Text(
                            'Remember Me',
                            style: context.easyTheme.textTheme.bodyMedium!
                                .copyWith(fontSize: 18.0),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                DefaultButtonWidget(text: 'LOGIN', onPressed: onLogin),
                const SizedBox(height: 25.0),
                Center(
                    child: TextButtonWidget(
                        text: 'Forget password ?', onPressed: forgetPassword)),
                const SizedBox(height: 25.0),
                const CreateAccountWidget(),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onLogin() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(message: 'Fill data firstly');
      return;
    }

    AuthBloc.get.add(OnLoginEvent(
      phoneNumber: emailController.text.trim(),
      password: passwordController.text,
    ));
  }

  void setRememberMeValue() async {
    String email =
        await GetItUtils.secPrefs.read(SharedPrefKeys.rememberMeEmail) ?? '';
    String password =
        await GetItUtils.secPrefs.read(SharedPrefKeys.rememberMePassword) ?? '';
    emailController.text = email.toString();
    passwordController.text = password.toString();
    AuthBloc.get.add(InitialValueEvent());
  }

  void forgetPassword() {
    Utils.openNewPage(InsertCellPhoneScreen());
  }
}
