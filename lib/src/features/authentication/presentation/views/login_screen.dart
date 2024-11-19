import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                const Directionality(
                  textDirection: TextDirection.ltr,
                  child: LanguageSwapWidget(
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                ),
                const Spacer(
                  flex: 5,
                ),
                const Center(child: GeneralDaakeshLogoWidget()),
                const Spacer(
                  flex: 4,
                ),
                Text(
                  context.locale.login_title,
                  style: context.easyTheme.textTheme.headlineLarge!
                      .copyWith(fontSize: 40.0),
                ),
                const SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.locale.login_email_text_field,
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
                      const SizedBox(height: 33),
                      Text(
                        context.locale.login_password_text_field,
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
                              return Transform.scale(
                                scale: 1.1,
                                child: Checkbox(
                                  onChanged: (bool? value) {
                                    AuthBloc.get.add(ToggleRememberMeValueEvent(
                                        rememberMeValue: value!));
                                  },
                                  value: state.rememberMeValue,
                                  overlayColor: MaterialStateProperty.all(
                                      ColorName.transparent),
                                  hoverColor: ColorName.white,
                                  side: const BorderSide(
                                      color: ColorName.darkGray),
                                  activeColor: ColorName.amber,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Expanded(
                            child: Text(
                              context.locale.remember_me_title,
                              style: context.easyTheme.textTheme.bodyMedium!
                                  .copyWith(
                                      fontSize: 18,
                                      overflow: TextOverflow.ellipsis),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Center(
                    child: DefaultButtonWidget(
                        text: context.locale.login_button_title,
                        onPressed: () => onLogin(context))),
                const SizedBox(height: 25),
                Center(
                    child: TextButtonWidget(
                        text: context.locale.forget_password_text_button,
                        onPressed: forgetPassword)),
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

  void onLogin(BuildContext context) {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(
          message: context.locale.login_snack_bar_title);
      return;
    }

    AuthBloc.get.add(OnLoginEvent(
        email: emailController.text.trim(),
        password: passwordController.text,
        context: context));
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
