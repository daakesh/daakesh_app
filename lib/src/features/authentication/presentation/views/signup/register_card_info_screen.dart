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
                  isLoggedIn ?const SizedBox(height: 58.0,):const SizedBox(height: 110.0,),
                  isLoggedIn ?const SizedBox():const Padding(
                    padding: EdgeInsetsDirectional.only(start: 38.0,),
                    child: Align(alignment: AlignmentDirectional.centerStart,child: DaakeshLogoWidget()),
                  ),
                  const SizedBox(height: 38.0,),
                  Text('Add Payment Card',style: easyTheme.textTheme.headlineLarge!.copyWith(fontSize: 36)),
                  const SizedBox(height: 9.0,),
                  Text('Enter Card Information',style: easyTheme.textTheme.headlineMedium),
                  const SizedBox(height: 19.0,),
                  Row(children: [
                    Assets.png.visaIcon.image(height: 42.0,width: 42.0),
                    const SizedBox(width: 10.0,),
                    Assets.png.mastercardIcon.image(height: 42.0,width: 42.0),
                    const SizedBox(width: 10.0,),
                    Assets.png.americanExpressIcon.image(height: 42.0,width: 42.0),
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
                                    isSuffixPrefixOn: true,
                                    focusNode: expiryDateFocus,
                                    onFieldSubmitted: (value)=> fieldFocusChange(context, expiryDateFocus, cvvFocus),
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
                                        child:SizedBox(width: 22.0,height: 22.0,child: Center(child: Assets.svg.furtherInfoIcon.svg(height: 22.0,width: 22.0)))),
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
                                    isSuffixPrefixOn: true,
                                    suffixIcon: InkWell(
                                        onTap: () {},
                                        focusColor: ColorName.transparent,
                                        highlightColor: ColorName.transparent,
                                        splashColor: ColorName.transparent,
                                        child:SizedBox(width: 22.0,height: 22.0,child: Center(child: Assets.svg.furtherInfoIcon.svg(height: 22.0,width: 22.0)))),
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
                          inputFormatters: [
                            RegExpValidator.insertEnglish
                          ],
                        ),
                      ],),
                  ),
                  const Spacer(flex: 1,),
                  isLoggedIn ? Column(children: [
                    Center(child: DefaultButtonWidget(text: 'ADD CARD', onPressed:()=>onAddCard(context,isLoggedIn))),
                    const SizedBox(height: 12.0,),
                    Center(child: OutlineButtonWidget(text: 'CANCEL', onPressed:onCancel))
                  ],):Center(child: DefaultButtonWidget(text: 'ADD CARD', onPressed:()=>onAddCard(context,isLoggedIn))),
                  const SizedBox(height: 50.0,),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onAddCard(context,bool isLoggedIn)async {
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 1));
    ProgressCircleDialog.dismiss();
    if(isLoggedIn){
      getBack();
      return;
    }
    openNewPage(const CardAddedSuccessfullyScreen());
  }

  void onCancel(){
    getBack();

  }

}
