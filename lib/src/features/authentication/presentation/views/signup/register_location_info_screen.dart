import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class RegisterLocationInfoScreen extends StatelessWidget {
   RegisterLocationInfoScreen({super.key});

   final countryController = TextEditingController();
   final cityController = TextEditingController();
   final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthenticationBackgroundWidget(
      widget: Scaffold(
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
                    inputFormatters: [
                      RegExpValidator.beginWhitespace,
                    ],
                  ),
                  const SizedBox(height: 33.0),
                  Text('City',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                  TextFormFieldWidget(
                    controller: cityController,
                    inputFormatters: [
                      RegExpValidator.beginWhitespace,
                    ],
                  ),
                  const SizedBox(height: 33.0),
                  Text('Address',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                  TextFormFieldWidget(
                    controller: addressController,
                    isSuffixOn: true,
                    inputFormatters: [
                      RegExpValidator.beginWhitespace,
                    ],
                    suffixIcon: IconButton(
                      splashColor: ColorName.transparent,
                      focusColor: ColorName.transparent,
                      highlightColor: ColorName.transparent,
                      icon: const Icon(Icons.location_pin,size: 35.0),
                      onPressed: () =>openNewPage(const MapScreen()),
                    ),
                  ),
                  const SizedBox(height: 64.0),
                  DefaultButtonWidget(text: 'NEXT', onPressed: onNext),
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
   void onNext(){
     openNewPage( RegisterPhoneNumberScreen());
   }
}
