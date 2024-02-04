import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../src.export.dart';

class RegisterCardInfoScreen extends StatelessWidget {
   RegisterCardInfoScreen({super.key});


   final cardNumberController = TextEditingController();
   final expiryDateController = TextEditingController();
   final cvvController = TextEditingController();
   final nicknameController = TextEditingController();

   final FocusNode cardNumberFocus= FocusNode();
   final FocusNode expiryDateFocus = FocusNode();
   final FocusNode cvvFocus = FocusNode();
   final FocusNode nicknameFocus = FocusNode();

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
                    padding: EdgeInsetsDirectional.only(start: 38.0,),
                    child: Align(alignment: AlignmentDirectional.centerStart,child: DaakeshLogoWidget()),
                  ),
                  const SizedBox(height: 38.0,),
                  Text('Add Payment Card',style: easyTheme.textTheme.headlineLarge!.copyWith(fontSize: 36)),
                  const SizedBox(height: 9.0,),
                  Text('Enter Card Information',style: easyTheme.textTheme.headlineMedium),
                  const SizedBox(height: 19.0,),
                  Row(children: [
                    Assets.svg.appleIcon.svg(),
                    const SizedBox(width: 24.0,),
                    Assets.svg.facebookIcon.svg(),
                    const SizedBox(width: 24.0,),
                    Assets.svg.appleIcon.svg(),
                  ],),
                  const SizedBox(height: 30.0,),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Card Number', style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18,color: ColorName.darkGray)),
                        TextFormFieldWidget(
                          controller: cardNumberController,
                          focusNode: cardNumberFocus,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            CardNumberInputFormatter(),
                          ],
                          onFieldSubmitted: (value)=> fieldFocusChange(context, cardNumberFocus, expiryDateFocus),
                        ),
                        const SizedBox(height: 33.0),
                        Row(children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Expiry Date',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18,color: ColorName.darkGray)),
                                  TextFormFieldWidget(
                                    controller: expiryDateController,
                                    isSuffixOn: true,
                                    focusNode: expiryDateFocus,
                                    onFieldSubmitted: (value)=> fieldFocusChange(context, expiryDateFocus, cvvFocus),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(4),
                                      CardMonthInputFormatter(),
                                    ],
                                    hintText: 'MM/YY',
                                    suffixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.error_outline,
                                        size: 25.0,
                                        color: ColorName.darkGray,

                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 34.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('CVV',
                                      style: easyTheme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 18,
                                              color: ColorName.darkGray)),
                                  TextFormFieldWidget(
                                    controller: cvvController,
                                    focusNode:cvvFocus,
                                    keyboardType: TextInputType.number,
                                    onFieldSubmitted: (value)=> fieldFocusChange(context, cvvFocus, nicknameFocus),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(3),
                                    ],
                                    isSuffixOn: true,
                                    suffixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.error_outline,
                                        size: 25.0,
                                        color: ColorName.darkGray,

                                      ),

                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],),
                        const SizedBox(height: 33.0),
                        Text('Nickname (optional)', style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18,color: ColorName.darkGray)),
                        TextFormFieldWidget(
                          controller: nicknameController,
                          focusNode: nicknameFocus,
                          textCapitalization: TextCapitalization.characters,
                        ),
                      ],),
                  ),

                  const SizedBox(height: 71.0,),

                  Center(child: DefaultButtonWidget(text: 'ADD CARD', onPressed:onAddCard)),
                  const SizedBox(height: 82.0,),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onAddCard() {
    openNewPage(const CardAddedSuccessfullyScreen());
  }
}
