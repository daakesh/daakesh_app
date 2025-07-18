import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();
  final FocusNode newPassFocusNode = FocusNode();
  final FocusNode confirmPassFocusNode = FocusNode();
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
                  flex: 2,
                ),
                const Center(child: GeneralDaakeshLogoWidget()),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  context.locale.reset_pass_title,
                  style: context.easyTheme.textTheme.headlineLarge!
                      .copyWith(fontSize: 40),
                ),
                const SizedBox(height: 4.0),
                FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      context.locale.reset_pass_instruction,
                      style: context.easyTheme.textTheme.headlineLarge!
                          .copyWith(fontSize: 25),
                    )),
                const Spacer(
                  flex: 1,
                ),
                const SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.locale.new_pass_text_field,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0, color: ColorName.darkGray),
                      ),
                      TextFormFieldWidget(
                        controller: newPassController,
                        focusNode: newPassFocusNode,
                        obscureText: true,
                        maxLines: 1,
                        onFieldSubmitted: (value) => Utils.fieldFocusChange(
                            context, newPassFocusNode, confirmPassFocusNode),
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: [
                          RegExpValidator.clearWhitespace,
                        ],
                      ),
                      const SizedBox(height: 33),
                      Text(
                        context.locale.confirm_pass_text_field,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0, color: ColorName.darkGray),
                      ),
                      TextFormFieldWidget(
                        controller: confirmPassController,
                        focusNode: confirmPassFocusNode,
                        obscureText: true,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Spacer(
                  flex: 1,
                ),
                Center(
                    child: DefaultButtonWidget(
                        text: context.locale.reset_button_title,
                        onPressed: () => resetPassword(context))),
                const SizedBox(
                  height: 20,
                ),
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

  void resetPassword(BuildContext context) {
    if (newPassController.text != confirmPassController.text) {
      ShowToastSnackBar.showCustomDialog(
          message: context.locale.password_confirmation_failed);
      return;
    }
    ForgetPassBloc.get.add(ResetPasswordEvent(
        password: confirmPassController.text,
        context: context,
        email: '',
        phoneNumber: ''));
  }
}
