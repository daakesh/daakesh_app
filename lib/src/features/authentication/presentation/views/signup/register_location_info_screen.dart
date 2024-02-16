import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class RegisterLocationInfoScreen extends StatefulWidget {
   const RegisterLocationInfoScreen({super.key});

  @override
  State<RegisterLocationInfoScreen> createState() => _RegisterLocationInfoScreenState();
}

class _RegisterLocationInfoScreenState extends State<RegisterLocationInfoScreen> {
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();

  final FocusNode countryFocusNode= FocusNode();
  final FocusNode cityFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    countryController.text = 'Jordan';
    resetFlag();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 110.0,),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 38.0),
                    child: DaakeshLogoWidget(),
                  ),
                  const SizedBox(height: 60.0,),
                  Text('Lets Go',style: easyTheme.textTheme.headlineLarge),
                  const SizedBox(height: 10.0,),
                  Text('Set Your Location To Start',style: easyTheme.textTheme.headlineMedium),
                  const SizedBox(height: 43.0),
                  Text('Country',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                  TextFormFieldWidget(
                    controller: countryController,
                    focusNode: countryFocusNode,
                    isSuffixPrefixOn: true,
                    suffixIcon: SizedBox(height:9.0 ,width:16.0,child: Center(child: Assets.svg.arrowDropDownIcon.svg()),),
                    prefixIcon: BlocBuilder<AuthBloc, AuthState>(builder: (_, state) {
                      return SizedBox(
                          width: 30.0,
                          height: 30.0,
                          child: Center(
                              child: Text(
                            state.flagEmoji,
                            style: const TextStyle(
                                color: ColorName.blueGray, fontSize: 24.0),
                          )));
                    }),
                    onFieldSubmitted: (value)=>fieldFocusChange(context,countryFocusNode,cityFocusNode),
                    readOnly: true,
                    onTap: (){
                      showCountryDialog(context);
                    },
                    inputFormatters: [
                      RegExpValidator.beginWhitespace,
                    ],
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
                  const SizedBox(height: 64.0),
                  DefaultButtonWidget(text: 'NEXT', onPressed: ()=>onNext(context)),
                  const SizedBox(height: 44.0),
                  const AlreadyHaveAccountWidget(),
                  const SizedBox(height: 55.0),







                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

   void onNext(context)async{
     if (countryController.text.isEmpty ||
         cityController.text.isEmpty ||
         addressController.text.isEmpty) {
       ShowToastSnackBar.showSnackBars(message: 'Fill location data firstly');
       return;
     }

     ProgressCircleDialog.show();
     AuthBloc.get.add(
         EnterLocationInfoEvent(
           country:countryController.text,
           city:cityController.text,
           address:addressController.text,
     ));
     await Future.delayed(const Duration(seconds: 1));
     ProgressCircleDialog.dismiss();
     openNewPage(RegisterPhoneNumberScreen());
   }

   void showCountryDialog(context) {
    return showCountryPicker(
      context:context,
      showPhoneCode: false,
      onSelect: (Country country) {
        countryController.text = country.name;
        AuthBloc.get.add(ChangeFlagEvent(flagEmoji: country.flagEmoji.toString(),),);
      },
    );
  }

  void resetFlag(){
    AuthBloc.get.add(ChangeFlagEvent(flagEmoji: '🇯🇴'));
  }

}
