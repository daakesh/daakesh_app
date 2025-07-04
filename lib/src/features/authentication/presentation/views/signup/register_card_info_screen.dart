import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../src.export.dart';

class RegisterCardInfoScreen extends StatelessWidget {
  final bool isLoggedIn;

  RegisterCardInfoScreen({
    super.key,
    this.isLoggedIn = false,
  });

  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvController = TextEditingController();
  final nicknameController = TextEditingController();

  final FocusNode cardNumberFocus = FocusNode();
  final FocusNode expiryDateFocus = FocusNode();
  final FocusNode cvvFocus = FocusNode();
  final FocusNode nicknameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isLoggedIn
                      ? SizedBox(
                          height: 58,
                        )
                      : SizedBox(
                          height: 110,
                        ),
                  isLoggedIn
                      ? const SizedBox()
                      : const Center(child: GeneralDaakeshLogoWidget()),
                  const SizedBox(
                    height: 38.0,
                  ),
                  Text(context.locale.add_card_title,
                      style: context.easyTheme.textTheme.headlineLarge!
                          .copyWith(fontSize: 36)),
                  const SizedBox(
                    height: 9.0,
                  ),
                  Text(context.locale.add_card_instruction,
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 25)),
                  const SizedBox(
                    height: 19.0,
                  ),
                  Row(
                    children: [
                      Assets.png.visaIcon.image(height: 42, width: 42),
                      SizedBox(
                        width: 10,
                      ),
                      Assets.png.mastercardIcon.image(height: 42, width: 42),
                      SizedBox(
                        width: 10,
                      ),
                      Assets.png.americanExpressIcon
                          .image(height: 42, width: 42),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(context.locale.card_number_text_field,
                            style: context.easyTheme.textTheme.bodyMedium!
                                .copyWith(
                                    fontSize: 18, color: ColorName.darkGray)),
                        TextFormFieldWidget(
                          controller: cardNumberController,
                          focusNode: cardNumberFocus,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            CardNumberInputFormatter(),
                          ],
                          onFieldSubmitted: (value) => Utils.fieldFocusChange(
                              context, cardNumberFocus, expiryDateFocus),
                        ),
                        SizedBox(height: 33),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(context.locale.expiry_date_text_field,
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 18,
                                              color: ColorName.darkGray)),
                                  TextFormFieldWidget(
                                    controller: expiryDateController,
                                    isSuffixPrefixOn: true,
                                    focusNode: expiryDateFocus,
                                    onFieldSubmitted: (value) =>
                                        Utils.fieldFocusChange(
                                            context, expiryDateFocus, cvvFocus),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(4),
                                      CardMonthInputFormatter(),
                                    ],
                                    hintText: context
                                        .locale.expiry_date_text_field_hint,
                                    suffixIcon: InkWell(
                                        onTap: () {},
                                        focusColor: ColorName.transparent,
                                        highlightColor: ColorName.transparent,
                                        splashColor: ColorName.transparent,
                                        child: SizedBox(
                                            width: 22,
                                            height: 22,
                                            child: Center(
                                                child: Assets
                                                    .svg.furtherInfoIcon
                                                    .svg(
                                                        height: 22,
                                                        width: 22)))),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 34),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(context.locale.cvv_text_field,
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 18,
                                              color: ColorName.darkGray)),
                                  TextFormFieldWidget(
                                    controller: cvvController,
                                    focusNode: cvvFocus,
                                    keyboardType: TextInputType.number,
                                    onFieldSubmitted: (value) =>
                                        Utils.fieldFocusChange(
                                            context, cvvFocus, nicknameFocus),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(3),
                                    ],
                                    isSuffixPrefixOn: true,
                                    suffixIcon: InkWell(
                                        onTap: () {},
                                        focusColor: ColorName.transparent,
                                        highlightColor: ColorName.transparent,
                                        splashColor: ColorName.transparent,
                                        child: SizedBox(
                                            width: 22,
                                            height: 22,
                                            child: Center(
                                                child: Assets
                                                    .svg.furtherInfoIcon
                                                    .svg(
                                                        height: 22,
                                                        width: 22)))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 33),
                        Text(context.locale.nickname_text_field,
                            style: context.easyTheme.textTheme.bodyMedium!
                                .copyWith(
                                    fontSize: 18, color: ColorName.darkGray)),
                        TextFormFieldWidget(
                          controller: nicknameController,
                          focusNode: nicknameFocus,
                          textCapitalization: TextCapitalization.characters,
                          inputFormatters: [RegExpValidator.insertEnglish],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isLoggedIn
                      ? Column(
                          children: [
                            Center(
                                child: DefaultButtonWidget(
                                    text: context.locale.add_card_button_title,
                                    onPressed: () =>
                                        onAddCard(context, isLoggedIn))),
                            SizedBox(
                              height: 12,
                            ),
                            Center(
                                child: OutlineButtonWidget(
                                    text: context
                                        .locale.cancel_add_card_button_title,
                                    onPressed: onCancel))
                          ],
                        )
                      : Center(
                          child: DefaultButtonWidget(
                              text: context.locale.add_card_button_title,
                              onPressed: () => onAddCard(context, isLoggedIn))),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onAddCard(context, bool isLoggedIn) async {
    if (isLoggedIn) {
      Utils.getBack();
      return;
    }
    Utils.openNewPage(const CardAddedSuccessfullyScreen());
  }

  void onCancel() {
    Utils.getBack();
  }
}
