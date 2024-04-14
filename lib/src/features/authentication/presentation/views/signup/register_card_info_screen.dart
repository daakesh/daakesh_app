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
              padding: EdgeInsets.symmetric(horizontal: 22.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isLoggedIn
                      ? SizedBox(
                          height: 58.0.h,
                        )
                      : SizedBox(
                          height: 110.0.h,
                        ),
                  isLoggedIn
                      ? const SizedBox()
                      : const Center(child: DaakeshLogoWidget()),
                  const SizedBox(
                    height: 38.0,
                  ),
                  Text('Add Payment Card',
                      style: context.easyTheme.textTheme.headlineLarge!
                          .copyWith(fontSize: 36.sp)),
                  const SizedBox(
                    height: 9.0,
                  ),
                  Text('Enter Card Information',
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 25.sp)),
                  const SizedBox(
                    height: 19.0,
                  ),
                  Row(
                    children: [
                      Assets.png.visaIcon.image(height: 42.0.h, width: 42.0.w),
                      SizedBox(
                        width: 10.0.w,
                      ),
                      Assets.png.mastercardIcon
                          .image(height: 42.0.h, width: 42.0.w),
                      SizedBox(
                        width: 10.0.w,
                      ),
                      Assets.png.americanExpressIcon
                          .image(height: 42.0.h, width: 42.0.w),
                    ],
                  ),
                  SizedBox(
                    height: 30.0.h,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 10.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Card Number',
                            style: context.easyTheme.textTheme.bodyMedium!
                                .copyWith(
                                    fontSize: 18.sp,
                                    color: ColorName.darkGray)),
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
                        SizedBox(height: 33.0.h),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Expiry Date',
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 18.sp,
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
                                    hintText: 'MM/YY',
                                    suffixIcon: InkWell(
                                        onTap: () {},
                                        focusColor: ColorName.transparent,
                                        highlightColor: ColorName.transparent,
                                        splashColor: ColorName.transparent,
                                        child: SizedBox(
                                            width: 22.0.w,
                                            height: 22.0.h,
                                            child: Center(
                                                child: Assets
                                                    .svg.furtherInfoIcon
                                                    .svg(
                                                        height: 22.0.w,
                                                        width: 22.0.h)))),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 34.0.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('CVV',
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 18.sp,
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
                                            width: 22.0.w,
                                            height: 22.0.h,
                                            child: Center(
                                                child: Assets
                                                    .svg.furtherInfoIcon
                                                    .svg(
                                                        height: 22.0.h,
                                                        width: 22.0.w)))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 33.0.h),
                        Text('Nickname (optional)',
                            style: context.easyTheme.textTheme.bodyMedium!
                                .copyWith(
                                    fontSize: 18.sp,
                                    color: ColorName.darkGray)),
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
                    height: 20.0.h,
                  ),
                  isLoggedIn
                      ? Column(
                          children: [
                            Center(
                                child: DefaultButtonWidget(
                                    text: 'ADD CARD',
                                    onPressed: () =>
                                        onAddCard(context, isLoggedIn))),
                            SizedBox(
                              height: 12.0.h,
                            ),
                            Center(
                                child: OutlineButtonWidget(
                                    text: 'CANCEL', onPressed: onCancel))
                          ],
                        )
                      : Center(
                          child: DefaultButtonWidget(
                              text: 'ADD CARD',
                              onPressed: () => onAddCard(context, isLoggedIn))),
                  SizedBox(
                    height: 50.0.h,
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
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 1));
    ProgressCircleDialog.dismiss();
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
