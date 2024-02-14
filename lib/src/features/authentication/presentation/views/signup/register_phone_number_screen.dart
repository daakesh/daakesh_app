import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class RegisterPhoneNumberScreen extends StatelessWidget {
   RegisterPhoneNumberScreen({super.key});
   final phoneNumberController = TextEditingController();


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
                    padding: EdgeInsetsDirectional.only(start: 38.0),
                    child: DaakeshLogoWidget(),
                  ),
                  const SizedBox(height: 60.0,),
                  Text('Lets Go',style: easyTheme.textTheme.headlineLarge),
                  const SizedBox(height: 10.0,),
                  Text('Enter Phone Number',style: easyTheme.textTheme.headlineMedium),
                  const SizedBox(height: 43.0),
                  Text('Phone Number',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                  TextFormFieldWidget(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.number,
                    isSuffixPrefixOn: true,
                    suffixIcon: BlocBuilder<AuthBloc, AuthState>(builder: (_, state) {
                      return InkWell(
                        onTap: ()=>selectCountry(context),
                        child: SizedBox(
                          width: 65.0,
                          child: Row(children: [
                            Text(
                              state.phoneFlag,
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
                  const SizedBox(height: 200.0),
                  Center(child: DefaultButtonWidget(text: 'NEXT', onPressed: ()=>onNext(context))),
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

  void onNext(context) async{
    if (phoneNumberController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(message: 'Fill location data firstly');
      return;
    }
    AuthBloc.get.add(EnterPhoneEvent(phoneNumber: phoneNumberController.text.trim()));

  }

  void selectCountry(context){
    return showCountryPicker(
      context:context,
      showPhoneCode: true,
      onSelect: (Country country) {
        AuthBloc.get.add(ChangeCodeCountryEvent(
          phoneCode: country.phoneCode,
          phoneFlag: country.flagEmoji,
        ));
      },
    );
  }

}
