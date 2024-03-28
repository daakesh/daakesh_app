import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../src.export.dart';

class MyProFuncBloc extends Bloc<MyProFuncEvent, MyProFuncState> {
  MyProFuncBloc() : super(const MyProFuncState()) {
    on<SwapTabBarProductTypeEvent>(_swapTabBarProductType);
    on<ChooseProductDisplayMethodEvent>(_chooseProductDisplayMethod);
    on<ChangeCountrySwapFlagEvent>(_changeCountrySwapFlag);
    on<SelectShipToCountryEvent>(_selectShipToCountry);
    on<DeleteInsertCountriesEvent>(_deleteInsertCountries);
    on<CheckAlreadyAddedCountryEvent>(_checkAlreadyAddedCountry);
    on<ResetValuesEvent>(_resetValues);
    on<AddProductImageEvent>(_addProductImage);
    on<EditProductEvent>(_editProduct);
    on<SearchOnProductEvent>(_searchOnProduct);
    on<EmptyProductSearchEvent>(_emptyProductSearch);
    on<OnOffDiscountEvent>(_onOffDiscount);
  }
  static MyProFuncBloc get get => BlocProvider.of(navigatorKey.currentState!.context);
  ///Action to toggle between tow tabBar {Shop,Swap} at [MyProductsScreen]
  Future<FutureOr<void>> _swapTabBarProductType(SwapTabBarProductTypeEvent event, Emitter<MyProFuncState> emit) async {
    emit(state.copyWith(productTapBar: event.productTapBar));
  }
  ///Event to select product method {SWAP or Sale} at [SelectProMethodScreen].
  FutureOr<void> _chooseProductDisplayMethod(ChooseProductDisplayMethodEvent event, Emitter<MyProFuncState> emit) {
    emit(state.copyWith(productDisplayMethod: event.productDisplayMethod));
  }
  ///Event to select Swap country at [ForSwapScreen]
  FutureOr<void> _changeCountrySwapFlag(ChangeCountrySwapFlagEvent event, Emitter<MyProFuncState> emit) {
    emit(state.copyWith(swapFlagEmoji: event.flagEmoji));
  }
  ///Select ship to countries at [ShipToScreen]
  FutureOr<void> _selectShipToCountry(SelectShipToCountryEvent event, Emitter<MyProFuncState> emit) {
    emit(state.copyWith(shipFlagEmoji: event.shipToFlagEmoji));
  }
  ///Operation to embed selected ship countries into list [selectedShipToCountriesList]
  FutureOr<void> _deleteInsertCountries(DeleteInsertCountriesEvent event, Emitter<MyProFuncState> emit) {
    List<String> selectedShipCountry = <String>[];
     selectedShipCountry = event.selectedShipCountry.toList();
     emit(state.copyWith(selectedShipToCountries:selectedShipCountry));
  }
  ///Action to check if the country added already to ship to list at [ShipToScreen].
  FutureOr<void> _checkAlreadyAddedCountry(CheckAlreadyAddedCountryEvent event, Emitter<MyProFuncState> emit) {
     if(state.selectedShipToCountries.contains(event.value)){
       emit(state.copyWith(isAlreadyAddedCountry: true));
     }
     else{
     emit(state.copyWith(isAlreadyAddedCountry: false));
     }
  }
  ///Reset event for all values into [ShipToScreen].
  FutureOr<void> _resetValues(ResetValuesEvent event, Emitter<MyProFuncState> emit) {
    emit(state.copyWith(
        isAlreadyAddedCountry: false,
        selectedShipToCountries: [],
        shipFlagEmoji: '🇯🇴',
        discountSwitchButton:false,
        imagesList: [],
        productDisplayMethod:ProductDisplayMethod.Sell,
      ),
    );
  }
  ///Event to add images for new product at [AddProImagesScreen]
  FutureOr<void> _addProductImage(AddProductImageEvent event, Emitter<MyProFuncState> emit) {
    List<XFile> imagesList = [];
    imagesList =  event.imagesList.toList();
    emit(state.copyWith(imagesList: imagesList));

  }
  ///Event to add images for new product at Add product scenario.
  FutureOr<void> _editProduct(EditProductEvent event, Emitter<MyProFuncState> emit) {
    MyProFuncBloc.get.add(ChooseProductDisplayMethodEvent(productDisplayMethod:event.productDisplayMethod ));
    getIt.get<EditProduct>().setData(event.myProductItem);
    List<MyProductItem> myProductItem = [];
    myProductItem.add(event.myProductItem);
    emit(state.copyWith(myProFuncStateStatus:MyProFuncStateStatus.SUCCESS,myProductItem:myProductItem));
  }
  ///Event to search on products at [MyProductsScreen]
  FutureOr<void> _searchOnProduct(SearchOnProductEvent event, Emitter<MyProFuncState> emit) async{
    emit(state.copyWith(searchValue: event.searchValue,));
    if (event.isSeeMore) {
      emit(state.copyWith(
          currentSearchPage: state.currentSearchPage + 1,
          myProFuncStateStatus: MyProFuncStateStatus.LOADINGMORE));
    }
    else{
      emit(state.copyWith(myProFuncStateStatus: MyProFuncStateStatus.LOADING,currentSearchPage: 1));
    }
    final result = await getIt.get<MyProductUseCases>().searchOnProduct(
        event.searchValue.toString(), state.currentSearchPage);
    result.fold((l) {
      emit(state.copyWith(myProFuncStateStatus: MyProFuncStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {if (!r.status!) {
      ShowToastSnackBar.showSnackBars(message: r.message.toString());
      return;
    }
    MyProductModel myProductModel = MyProductModel.fromJson(r.data);
    int lastPage = myProductModel.data!.lastPage!;
    List<MyProductItem> newResultList = myProductModel.data!.myProductListData!.toList();
    List<MyProductItem> searchResultList = state.searchResultList.toList();
    if(newResultList.isEmpty){
      emit(state.copyWith(myProFuncStateStatus: MyProFuncStateStatus.NULL,
        searchResultList: searchResultList,
        isMoreData:lastPage == state.currentSearchPage,
      ));
      return;
    }
    searchResultList.addAll(newResultList);
    emit(state.copyWith(myProFuncStateStatus: MyProFuncStateStatus.SUCCESS,
      searchResultList: searchResultList,
      isMoreData:lastPage == state.currentSearchPage,
    ));
    });
  }
  ///Event to clear search products at [MyProductsScreen]
  FutureOr<void> _emptyProductSearch(EmptyProductSearchEvent event, Emitter<MyProFuncState> emit) {
    emit(state.copyWith(
        myProFuncStateStatus: MyProFuncStateStatus.SUCCESS,
        searchResultList: [],
        searchValue: event.value.isEmpty ? '':event.value,
        currentSearchPage: 1,
        isMoreData: true));
  }
  ///Event to turn on-off discount switch button at [ForSaleScreen]
  FutureOr<void> _onOffDiscount(OnOffDiscountEvent event, Emitter<MyProFuncState> emit) {
    emit(state.copyWith(discountSwitchButton:event.value));
  }




}
