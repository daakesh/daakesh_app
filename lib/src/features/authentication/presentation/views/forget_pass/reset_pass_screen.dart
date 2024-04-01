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
                const Center(child: DaakeshLogoWidget()),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  'Reset password',
                  style: context.easyTheme.textTheme.headlineLarge,
                ),
                const SizedBox(height: 4.0),
                FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Make Sure You Will Remember It',
                      style: context.easyTheme.textTheme.headlineLarge!
                          .copyWith(fontSize: 25.0),
                    )),
                const Spacer(
                  flex: 1,
                ),
                const SizedBox(height: 22.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New password',
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
                      const SizedBox(height: 33.0),
                      Text(
                        'Confirm password',
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
                const Spacer(
                  flex: 1,
                ),
                DefaultButtonWidget(text: 'RESET', onPressed: resetPassword),
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

  void resetPassword() {
    if (newPassController.text != confirmPassController.text) {
      ShowToastSnackBar.showSnackBars(message: 'Password confirmation failed');
      return;
    }
    ForgetPassBloc.get
        .add(ResetPasswordEvent(password: confirmPassController.text));
  }
}
