import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class InsertCellPhoneScreen extends StatelessWidget {
  InsertCellPhoneScreen({super.key});
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPassBloc, ForgetPassState>(
      builder: (context, state) {
        return DefaultBackgroundWidget(
          child: Scaffold(
            backgroundColor: ColorName.transparent,
            body: LayoutBuilderWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.only(start: 31, bottom: 20),
                      child: Utils.flipWidget(Assets.svg.arrowBackIcon.svg()),
                    ),
                  ),
                  const Center(child: GeneralDaakeshLogoWidget()),
                  const Spacer(
                    flex: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(context.locale.forget_password_title,
                            style: context.easyTheme.textTheme.headlineLarge!
                                .copyWith(fontSize: 40)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(context.locale.forget_instruction_title,
                            style: context.easyTheme.textTheme.headlineMedium!
                                .copyWith(fontSize: 25)),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const SizedBox(height: 43.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(context.locale.forget_phone_number_text_field,
                            style: context.easyTheme.textTheme.bodyMedium!
                                .copyWith(
                                    fontSize: 18.0, color: ColorName.darkGray)),
                        TextFormFieldWidget(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.number,
                          isSuffixPrefixOn: true,
                          suffixIcon:
                              BlocBuilder<ForgetPassBloc, ForgetPassState>(
                                  builder: (_, state) {
                            return GestureDetector(
                              onTap: () => selectCountry(context),
                              child: SizedBox(
                                width: 65,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        state.flagEmoji,
                                        style: TextStyle(
                                            color: ColorName.blueGray,
                                            fontSize: 24),
                                      ),
                                    ),
                                    Expanded(
                                      child: Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: ColorName.blueGray,
                                        size: 35,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(16),
                            RegExpValidator.clearZero
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(context.locale.email,
                            style: context.easyTheme.textTheme.bodyMedium!
                                .copyWith(
                                    fontSize: 18.0, color: ColorName.darkGray)),
                        TextFormFieldWidget(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        Text(context.locale.password,
                            style: context.easyTheme.textTheme.bodyMedium!
                                .copyWith(
                                    fontSize: 18.0, color: ColorName.darkGray)),
                        TextFormFieldWidget(
                          controller: passwordController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 30)
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 6,
                  ),
                  Center(
                    child: DefaultButtonWidget(
                        text: context.locale.forget_next_button_title,
                        onPressed: () => onNext(context)),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void onNext(BuildContext context) async {
    if (phoneNumberController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(
          message: context.locale.forget_snack_bar_title);
      return;
    }
    ForgetPassBloc.get.add(
      ResetPasswordEvent(
        context: context,
        phoneNumber: phoneNumberController.text.trim(),
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }

  void selectCountry(context) {
    return showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        ForgetPassBloc.get.add(ChangeCountryFlagCodeEvent(
          phoneCode: country.phoneCode,
          phoneFlag: country.flagEmoji,
        ));
      },
    );
  }
}
