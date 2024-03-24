import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class AdjustShippingScreen extends StatelessWidget {
   AdjustShippingScreen({super.key});

  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final apartmentController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final FocusNode countryFocusNode= FocusNode();
  final FocusNode cityFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();
  final FocusNode apartmentFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 25.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 1,),
                  const SizedBox(height: 40.0),
                  Center(child: Text('Shipping Address',style: context.easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 31.0),)),
                  const SizedBox(height: 4.0),
                  GestureDetector(onTap: ()=>clear(context),child: Assets.svg.arrowBackIcon.svg()),
                  const SizedBox(height: 37.0),
                  Text('Country',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                  BlocBuilder<ShippingBloc, ShippingState>(
                    builder: (context, state) {
                      return TextFormFieldWidget(
                        controller: countryController,
                        focusNode: countryFocusNode,
                        isSuffixPrefixOn: true,
                        suffixIcon: SizedBox(
                          height: 9.0,
                          width: 16.0,
                          child:
                              Center(child: Assets.svg.arrowDropDownIcon.svg()),
                        ),
                        prefixIcon: SizedBox(
                            width: 30.0,
                            height: 30.0,
                            child: Center(
                                child: Text(
                              state.shippingFlag,
                              style: const TextStyle(
                                  color: ColorName.blueGray, fontSize: 24.0),
                            ))),
                        onFieldSubmitted: (value) => fieldFocusChange(
                            context, countryFocusNode, cityFocusNode),
                        readOnly: true,
                        onTap: () =>selectCountry(context,countryController),
                        inputFormatters: [
                          RegExpValidator.beginWhitespace,
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 33.0),
                  Text('City',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                  TextFormFieldWidget(
                    controller: cityController,
                    focusNode: cityFocusNode,
                    onFieldSubmitted: (value)=>fieldFocusChange(context,cityFocusNode,addressFocusNode),
                    inputFormatters: [
                      RegExpValidator.beginWhitespace,
                    ],
                  ),
                  const SizedBox(height: 33.0),
                  Text('Address',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                  TextFormFieldWidget(
                    controller: addressController,
                    focusNode: addressFocusNode,
                    isSuffixPrefixOn: true,
                    inputFormatters: [
                      RegExpValidator.beginWhitespace,
                    ],
                    suffixIcon: InkWell(
                      onTap: () =>openNewPage(const MapScreen()),
                      splashColor: ColorName.transparent,
                      focusColor: ColorName.transparent,
                      highlightColor: ColorName.transparent,
                      child: SizedBox(width: 20.0,height: 20.0,child: Center(child: Assets.svg.locationPinIcon.svg())),
                    ),
                  ),
                  const SizedBox(height: 33.0),
                  Text('Apartment/Building Number',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                  TextFormFieldWidget(
                    controller: apartmentController,
                    focusNode: apartmentFocusNode,
                    inputFormatters: [
                      RegExpValidator.beginWhitespace,
                    ],
                  ),
                  const SizedBox(height: 33.0),
                  Text('Phone Number',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                  TextFormFieldWidget(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.number,
                    isSuffixPrefixOn: true,
                    suffixIcon: BlocBuilder<ShippingBloc, ShippingState>(builder: (_, state) {
                      return InkWell(
                        onTap: ()=>selectPhoneNumberCountry(context),
                        child: SizedBox(
                          width: 65.0,
                          child: Row(children: [
                            Text(
                              state.phoneNumberFlag,
                              style: const TextStyle(
                                  color: ColorName.blueGray, fontSize: 24.0),
                            ),
                            const Icon(Icons.arrow_drop_down_outlined,color: ColorName.blueGray,size: 35.0,),

                          ],),
                        ),
                      );
                    }),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                      RegExpValidator.clearZero
                    ],
                  ),
                  const SizedBox(height: 33.0),
                  Center(
                    child: DefaultButtonWidget(
                        text: 'EDIT ADDRESS', onPressed: editAddress),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Center(
                    child:
                    OutlineButtonWidget(text: 'CLEAR', onPressed: ()=>clear(context)),
                  ),
                  const Spacer(flex: 1,),
                  const SizedBox(height: 35.0,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
   void editAddress(){}
   void clear(context){
    Navigator.pop(context);
   }
   void selectCountry(context,TextEditingController controller){
    showCountryDialog(
      context,
      (country) {
        controller.text = country.name.toString();
        ShippingBloc.get.add(SelectShippingCountryFlagEvent(flagEmoji: country.flagEmoji.toString()));

      },
    );
  }
   void selectPhoneNumberCountry(context){
     showCountryDialog(
       context,
       showPhoneCode: true,
       (country) {
        ShippingBloc.get.add(SelectShippingPhoneNumberEvent(
          flagEmoji: country.flagEmoji.toString(),
          phoneCode: country.phoneCode.toString(),
        ));
      },
     );
   }
   void showCountryDialog(context,ValueChanged<Country> onSelect, {bool showPhoneCode = false}) {
     showCountryPicker(
       countryListTheme: CountryListThemeData(
           bottomSheetHeight: getScreenHeight(context) * 0.6),
       context: context,
       showPhoneCode: showPhoneCode,
       onSelect: onSelect,
     );
  }
}

