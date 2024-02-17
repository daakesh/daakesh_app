import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class EditSellerInfoScreen extends StatelessWidget {
   EditSellerInfoScreen({super.key});

  final nameSellerController = TextEditingController();
  final phoneController = TextEditingController();
  final whatsAppController = TextEditingController();

  final FocusNode nameSellerFocusNode= FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode whatsAppFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return  DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor:ColorName.transparent,
        body: LayoutBuilderWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 108.0,
                ),
                Text(
                  'Edit Your Info As Seller',
                  style: easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 36.0),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Text(
                  'Change your info',
                  style: easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 25.0),
                ),
                const SizedBox(
                  height: 19.0,
                ),
                Text(
                  'This information is required to allow your customers to communicate with you. Your account information is used if it is not changed',
                  style: easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 16.0),
                ),
                const SizedBox(
                  height: 21.0,
                ),
                Text('Name As Seller/Store',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                TextFormFieldWidget(
                  controller: nameSellerController,
                  focusNode: nameSellerFocusNode,
                  isSuffixPrefixOn: true,
                  onFieldSubmitted: (value)=>fieldFocusChange(context,nameSellerFocusNode,phoneFocusNode),
                ),
                const SizedBox(height: 33.0),
                Text('Phone Number',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                TextFormFieldWidget(
                  controller: phoneController,
                  focusNode: phoneFocusNode,
                  keyboardType: TextInputType.phone,
                  onFieldSubmitted: (value)=>fieldFocusChange(context,phoneFocusNode,whatsAppFocusNode),
                  inputFormatters: [
                    RegExpValidator.clearWhitespace,
                  ],
                ),
                const SizedBox(height: 33.0),
                Text('WhatsApp Number',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                TextFormFieldWidget(
                  controller: whatsAppController,
                  focusNode: whatsAppFocusNode,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    RegExpValidator.clearWhitespace,
                  ],
                ),
                const SizedBox(
                  height: 44.0,
                ),
                const Spacer(flex: 1,),
                Center(
                  child: DefaultButtonWidget(
                      text:'CHANGE', onPressed: ()=>onMakeEdit()),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Center(
                  child:
                  OutlineButtonWidget(text:'RESET AND CANCEL', onPressed: ()=>cancel()),
                ),
                const SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onMakeEdit()async{
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 2));
    ProgressCircleDialog.dismiss();
    getBack();
  }
  void cancel(){
    getBack();
    resetData();
  }
  void resetData(){}


}
