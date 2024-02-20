import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../src.export.dart';

class MyProductBloc extends Bloc<MyProductEvent, MyProductState> {
  MyProductBloc() : super(const MyProductState()) {
    on<SwapTabBarProductTypeEvent>(_swapTabBarProductType);
    on<ChooseProductDisplayMethodEvent>(_chooseProductDisplayMethod);
    on<ChangeCountrySwapFlagEvent>(_changeCountrySwapFlag);
    on<SelectShipToCountryEvent>(_selectShipToCountry);
    on<DeleteInsertCountriesEvent>(_deleteInsertCountries);
    on<CheckAlreadyAddedCountryEvent>(_checkAlreadyAddedCountry);
    on<ResetValuesEvent>(_resetValues);
    on<AddProductImageEvent>(_addProductImage);
  }
  static MyProductBloc get get => BlocProvider.of(navigatorKey.currentState!.context);
  ///Action to toggle between tow tabBar {Shop,Swap} at [MyProductsScreen]
  Future<FutureOr<void>> _swapTabBarProductType(SwapTabBarProductTypeEvent event, Emitter<MyProductState> emit) async {
    emit(state.copyWith(productTapBar: event.productTapBar));
  }
  ///Event to select product method {SWAP or Sale} at [SelectProMethodScreen].
  FutureOr<void> _chooseProductDisplayMethod(ChooseProductDisplayMethodEvent event, Emitter<MyProductState> emit) {
    emit(state.copyWith(productDisplayMethod: event.productDisplayMethod));
  }
  ///Event to select Swap country at [ForSwapScreen]
  FutureOr<void> _changeCountrySwapFlag(ChangeCountrySwapFlagEvent event, Emitter<MyProductState> emit) {
    emit(state.copyWith(swapFlagEmoji: event.flagEmoji));
  }
  ///Select ship to countries at [ShipToScreen]
  FutureOr<void> _selectShipToCountry(SelectShipToCountryEvent event, Emitter<MyProductState> emit) {
    emit(state.copyWith(shipFlagEmoji: event.shipToFlagEmoji));
  }
  ///Operation to embed selected ship countries into list [selectedShipToCountriesList]
  FutureOr<void> _deleteInsertCountries(DeleteInsertCountriesEvent event, Emitter<MyProductState> emit) {
    List<String> selectedShipCountry = <String>[];
     selectedShipCountry = event.selectedShipCountry.toList();
     emit(state.copyWith(selectedShipToCountries:selectedShipCountry));
  }
  ///Action to check if the country added already to ship to list at [ShipToScreen].
  FutureOr<void> _checkAlreadyAddedCountry(CheckAlreadyAddedCountryEvent event, Emitter<MyProductState> emit) {
     if(state.selectedShipToCountries.contains(event.value)){
       emit(state.copyWith(isAlreadyAddedCountry: true));
     }
     else{
     emit(state.copyWith(isAlreadyAddedCountry: false));
     }
  }
  ///Reset event for all values into [ShipToScreen].
  FutureOr<void> _resetValues(ResetValuesEvent event, Emitter<MyProductState> emit) {
    emit(state.copyWith(
        isAlreadyAddedCountry: false,
        selectedShipToCountries: [],
        shipFlagEmoji: '🇯🇴',

      ),
    );
  }
  ///Event to add images for new product at [AddProImagesScreen]
  FutureOr<void> _addProductImage(AddProductImageEvent event, Emitter<MyProductState> emit) {
    List<XFile> imagesList = [];
    imagesList =  event.imagesList.toList();
    emit(state.copyWith(imagesList: imagesList));

  }


}
