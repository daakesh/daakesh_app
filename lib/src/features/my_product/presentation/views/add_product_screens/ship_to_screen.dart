import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class ShipToScreen extends StatefulWidget {
  const ShipToScreen({super.key});

  @override
  State<ShipToScreen> createState() => _ShipToScreenState();
}

class _ShipToScreenState extends State<ShipToScreen> {
  final countryController = TextEditingController();
  List<String> countriesList = [];

  @override
  void initState() {
    super.initState();
    setEditData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 26.0.w, end: 22.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 108.0.h,
                    ),
                    InkWell(
                      focusColor: ColorName.transparent,
                      highlightColor: ColorName.transparent,
                      splashColor: ColorName.transparent,
                      onTap: cancel,
                      child: Assets.svg.arrowBackIcon.svg(),
                    ),
                    SizedBox(
                      height: 11.0.h,
                    ),
                    Text(
                      'Add Product',
                      style: easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 36.0.sp),
                    ),
                    SizedBox(
                      height: 14.0.h,
                    ),
                    Text(
                      'Ship To',
                      style: easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 25.0.sp),
                    ),
                    SizedBox(
                      height: 19.0.h,
                    ),
                    Text(
                      'This information is required to allow your customers to communicate with you. Your account information is used if it is not changed',
                      style: easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 16.0.sp),
                    ),
                    SizedBox(
                      height: 33.0.h,
                    ),
                  ],
                ),
              ),
              BlocBuilder<MyProFuncBloc, MyProFuncState>(builder: (_, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Country',
                              style: easyTheme.textTheme.bodyMedium!.copyWith(
                                  color: ColorName.black.withOpacity(0.5))),
                          TextFormFieldWidget(
                            controller: countryController,
                            isSuffixPrefixOn: true,
                            suffixIcon: InkWell(
                              focusColor: ColorName.transparent,
                              splashColor: ColorName.transparent,
                              highlightColor: ColorName.transparent,
                              onTap: state.isAlreadyAddedCountry
                                  ? () {}
                                  : ()=>addCountries(countryController.text),
                              child: Transform.scale(
                                scale: 0.8.sp,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: state.isAlreadyAddedCountry
                                        ? ColorName.gray
                                        : ColorName.amber,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.add_rounded,
                                      color: ColorName.white, size: 40.0.sp),
                                ),
                              ),
                            ),
                            prefixIcon: SizedBox(
                                width: 30.0.w,
                                height: 30.0.h,
                                child: Center(
                                    child: Text(state.shipFlagEmoji,
                                        style: TextStyle(
                                            color: ColorName.blueGray,
                                            fontSize: 24.0.sp)))),
                            readOnly: true,
                            onTap: () => showCountryDialog(),
                            inputFormatters: [
                              RegExpValidator.beginWhitespace,
                            ],
                          ),
                          SizedBox(
                            height: 26.0.h,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.0.w),
                      child: Wrap(
                        children: List.generate(
                            state.selectedShipToCountries.length,
                            (index) => InkWell(
                                  focusColor: ColorName.transparent,
                                  splashColor: ColorName.transparent,
                                  highlightColor: ColorName.transparent,
                                  onTap: () => deleteAddedCountries(index),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        constraints: BoxConstraints(minHeight: 38.0.h,minWidth: 120.0.w,maxWidth: 140.0.w),
                                        margin: EdgeInsetsDirectional.only(end: 10.0.w, bottom: 10.0.h),
                                        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0.w),
                                        decoration: BoxDecoration(
                                          color: ColorName.paleGray,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0.r),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                    state.selectedShipToCountries[index],
                                                    overflow: TextOverflow.ellipsis,
                                                    style: easyTheme.textTheme.bodyLarge!
                                                        .copyWith(fontSize: 18.0.sp,overflow: TextOverflow.ellipsis)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(height: 77.0.h),
              const Spacer(flex: 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                child: DefaultButtonWidget(
                    text: 'NEXT', onPressed: () => onNext()),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                child: OutlineButtonWidget(
                    text: 'CANCEL', onPressed: () => cancel()),
              ),
              SizedBox(
                height: 50.0.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setEditData(){
    if(getIt.get<EditProduct>().myProductItem != null){
      var data = getIt.get<EditProduct>().myProductItem;
      countryController.text =data!.country.toString();
      addCountries(data.country.toString());
    }
    else{
      resetFlagData();
      countryController.text = 'Jordan';
    }

  }
  void showCountryDialog() {
    return showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        countryController.text = country.name;
        MyProFuncBloc.get.add(CheckAlreadyAddedCountryEvent(value: country.name));
        MyProFuncBloc.get.add(SelectShipToCountryEvent(shipToFlagEmoji: country.flagEmoji.toString()));
        },
    );
  }
  void addCountries(String country) {
    AddProBloc.get.add(AddShipToCountryEvent(shipToCountry: country));
    countriesList.add(country);
    MyProFuncBloc.get.add(DeleteInsertCountriesEvent(selectedShipCountry: countriesList));
    MyProFuncBloc.get.add(CheckAlreadyAddedCountryEvent(value: country));
  }
  void deleteAddedCountries(int index) {
    countriesList.removeAt(index);
    MyProFuncBloc.get.add(DeleteInsertCountriesEvent(selectedShipCountry: countriesList));
    MyProFuncBloc.get.add(CheckAlreadyAddedCountryEvent(value: countryController.text));
  }
  void onNext() async {
    if(countriesList.isEmpty){
      ShowToastSnackBar.showSnackBars(message: 'Add at least one country...');
      return;
    }
    AddProBloc.get.add(AddProductEvent());
  }
  void cancel() {
    getBack();
    resetFlagData();
  }
  void resetFlagData() {
    countriesList = [];
    countryController.text = 'Jordan';
    MyProFuncBloc.get.add(ResetValuesEvent());
  }

}
