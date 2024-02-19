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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 110.0.h,),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 58.0.w,end: 97.0.w),
                  child: const DaakeshLogoWidget(),
                ),
                const SizedBox(height: 60.0,),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 26.0.w,end: 13.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Lets Go',style: easyTheme.textTheme.headlineLarge),
                      SizedBox(height: 10.0.h,),
                      Text('Set Your Location To Start Exploring Best Deal',style: easyTheme.textTheme.headlineMedium),
                    ],
                  ),
                ),
                SizedBox(height: 43.0.h),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 32.0.w,end:29.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Country',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0.sp,color: ColorName.darkGray)),
                      TextFormFieldWidget(
                        controller: countryController,
                        focusNode: countryFocusNode,
                        isSuffixPrefixOn: true,
                        suffixIcon: SizedBox(height:9.0.h ,width:16.0.w,child: Center(child: Assets.svg.arrowDropDownIcon.svg()),),
                        prefixIcon: BlocBuilder<AuthBloc, AuthState>(builder: (_, state) {
                          return SizedBox(
                              width: 30.0.w,
                              height: 30.0.h,
                              child: Center(
                                  child: Text(
                                state.flagEmoji,
                                style: TextStyle(
                                    color: ColorName.blueGray, fontSize: 24.0.sp),
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
                      SizedBox(height: 33.0.h),
                      Text('City',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0.sp,color: ColorName.darkGray)),
                      TextFormFieldWidget(
                        controller: cityController,
                        focusNode: cityFocusNode,
                        onFieldSubmitted: (value)=>fieldFocusChange(context,cityFocusNode,addressFocusNode),
                        inputFormatters: [
                          RegExpValidator.beginWhitespace,
                        ],
                      ),
                      SizedBox(height: 33.0.h),
                      Text('Address',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0.sp,color: ColorName.darkGray)),
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
                          child: SizedBox(width: 20.0.w,height: 20.0.h,child: Center(child: Assets.svg.locationPinIcon.svg())),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 64.0.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                  child: DefaultButtonWidget(text: 'NEXT', onPressed: ()=>onNext(context)),
                ),
                SizedBox(height: 44.0.h),
                const AlreadyHaveAccountWidget(),
                SizedBox(height: 55.0.h),







              ],
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
