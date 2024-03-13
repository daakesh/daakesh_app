import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class AddProBloc extends Bloc<AddProEvent, AddProState> {
  AddProBloc() : super(const AddProState()) {
    on<AddProInfoEvent>(_addProInfo);
    on<AddProCategoriesEvent>(_addProCategories);
    on<AddProImagesEvent>(_addProImages);
    on<AddProDisplayMethodEvent>(_addProDisplayMethod);
    on<AddSaleInfoEvent>(_addSaleInfo);
    on<AddSwapInfoEvent>(_addSwapInfo);
    on<AddShipToCountryEvent>(_addShipToCountry);
    on<AddProductEvent>(_addProduct);

  }
  static AddProBloc get get => BlocProvider.of(navigatorKey.currentState!.context);
  FutureOr<void> _addProInfo(AddProInfoEvent event, Emitter<AddProState> emit) {
    emit(state.copyWith(
      productName:event.productName,
      productDescription:event.productDescription,
    ));
  }
  FutureOr<void> _addProCategories(AddProCategoriesEvent event, Emitter<AddProState> emit) {
    emit(state.copyWith(
      productSecID:event.productSecID,
      productCatID:event.productCatID,
      productSubCatID:event.productSubCatID,
      productBrandID:event.productBrandID,
      productModelYear:event.productModelYear,
    ));
  }
  FutureOr<void> _addProImages(AddProImagesEvent event, Emitter<AddProState> emit) {
    emit(state.copyWith(proImages: event.proImages));
  }
  FutureOr<void> _addProDisplayMethod(AddProDisplayMethodEvent event, Emitter<AddProState> emit) {
    emit(state.copyWith(displayMethod: event.displayMethod));
  }
  FutureOr<void> _addSaleInfo(AddSaleInfoEvent event, Emitter<AddProState> emit) {
    int productDiscount = int.parse(event.productDiscount.replaceAll('%', ''));
    String discount = (productDiscount/100).toString();
    emit(state.copyWith(
      productQuantity:event.productQuantity,
      productPrice:event.productPrice,
      productDiscount:discount,
      fromDate:event.fromDate,
      toDate:event.toDate,
    ));

  }
  FutureOr<void> _addSwapInfo(AddSwapInfoEvent event, Emitter<AddProState> emit) {
    emit(state.copyWith(
      displayProduct:event.displayProduct,
      swapCountry:event.swapCountry,
      swapCity:event.swapCity,
    ));
  }
  FutureOr<void> _addShipToCountry(AddShipToCountryEvent event, Emitter<AddProState> emit) {
    emit(state.copyWith(shipToCountry: event.shipToCountry));
  }

  FutureOr<void> _addProduct(AddProductEvent event, Emitter<AddProState> emit)async {
    ProgressCircleDialog.show();
    AddProModel addProModel =AddProModel();
    addProModel
    ..userID =ValueConstants.userId
    ..title = state.productName
    ..description = state.productDescription
    ..secID =state.productSecID
    ..catID = state.productCatID
    ..subID = state.productSubCatID
    ..brandID = state.productBrandID
    ..year = state.productModelYear
    ..tradeOrSell = state.displayMethod.name
    ..quantity = state.productQuantity
    ..price = state.productPrice
    ..discount = state.productDiscount
    ..discountFrom = state.fromDate
    ..discountTo = state.toDate
    ..country = state.shipToCountry
    ..display = state.displayProduct
    ..countrySwap =state.swapCountry
    ..citySwap = state.swapCity
    ..itemImg = state.proImages.toList();
    // final result = getIt.get<EditProduct>().myProductItem != null
    //     ? await getIt.get<MyProductUseCases>().addProduct(addProModel)
    //     : await getIt.get<MyProductUseCases>().addProduct(addProModel);
    final result =  await getIt.get<MyProductUseCases>().addProduct(addProModel);

    result.fold((l) {
      ProgressCircleDialog.dismiss();
      emit(state.copyWith(addProStateStatus:  AddProStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ProgressCircleDialog.dismiss();
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      ProgressCircleDialog.dismiss();
      openNewPage(const ProAddSuccessScreen());

      emit(state.copyWith(addProStateStatus: AddProStateStatus.SUCCESS));
    });
  }





}
