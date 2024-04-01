import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class EditSellerInfoScreen extends StatefulWidget {
  final SellerInfoData sellerInfoData;
  const EditSellerInfoScreen({super.key, required this.sellerInfoData});

  @override
  State<EditSellerInfoScreen> createState() => _EditSellerInfoScreenState();
}

class _EditSellerInfoScreenState extends State<EditSellerInfoScreen> {
  final nameSellerController = TextEditingController();
  final phoneController = TextEditingController();
  final whatsAppController = TextEditingController();
  final FocusNode nameSellerFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode whatsAppFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    nameSellerController.text = widget.sellerInfoData.userName.toString();
    phoneController.text = widget.sellerInfoData.usedPhone.toString();
    whatsAppController.text = widget.sellerInfoData.usedPhone.toString();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
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
                  style: context.easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 36.0),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Text(
                  'Change your info',
                  style: context.easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 25.0),
                ),
                const SizedBox(
                  height: 19.0,
                ),
                Text(
                  'This information is required to allow your customers to communicate with you. Your account information is used if it is not changed',
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 16.0),
                ),
                const SizedBox(
                  height: 21.0,
                ),
                Text('Name As Seller/Store',
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 18.0, color: ColorName.darkGray)),
                TextFormFieldWidget(
                  controller: nameSellerController,
                  focusNode: nameSellerFocusNode,
                  isSuffixPrefixOn: true,
                  onFieldSubmitted: (value) => Utils.fieldFocusChange(
                      context, nameSellerFocusNode, phoneFocusNode),
                ),
                const SizedBox(height: 33.0),
                Text('Phone Number',
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 18.0, color: ColorName.darkGray)),
                TextFormFieldWidget(
                  controller: phoneController,
                  focusNode: phoneFocusNode,
                  keyboardType: TextInputType.phone,
                  onFieldSubmitted: (value) => Utils.fieldFocusChange(
                      context, phoneFocusNode, whatsAppFocusNode),
                  inputFormatters: [
                    RegExpValidator.clearWhitespace,
                  ],
                ),
                const SizedBox(height: 33.0),
                Text('WhatsApp Number',
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 18.0, color: ColorName.darkGray)),
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
                const Spacer(
                  flex: 1,
                ),
                Center(
                  child: DefaultButtonWidget(
                      text: 'CHANGE', onPressed: () => onMakeEdit()),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Center(
                  child: OutlineButtonWidget(
                      text: 'RESET AND CANCEL', onPressed: () => cancel()),
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

  void onMakeEdit() async {
    SellerInfoBloc.get.add(EditSellerInfoEvent(
      userName: nameSellerController.text,
      phoneNumber: phoneController.text,
      whatsappNumber: whatsAppController.text,
    ));
  }

  void cancel() {
    Navigator.pop(context);
  }
}
