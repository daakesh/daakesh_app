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
    return AuthenticationBackgroundWidget(
      widget: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
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
                  const SizedBox(height: 10.0,),
                  Text('Enter your Personal your Info',style: easyTheme.textTheme.headlineMedium),
                  const SizedBox(height: 43.0),
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
                  ),
                  const SizedBox(height: 64.0),
                  Center(child: DefaultButtonWidget(text: 'NEXT', onPressed: ()=>onNext(context))),
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
    openNewPage(RegisterLocationInfoScreen());
  }
}
