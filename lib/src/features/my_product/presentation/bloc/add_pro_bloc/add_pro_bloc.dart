import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class AddProBloc extends Bloc<AddProEvent, AddProState> {
  AddProBloc() : super(const AddProState()) {
    on<AddEditStateEvent>(_addEditState);
    on<AddProInfoEvent>(_addProInfo);
    on<AddProCategoriesEvent>(_addProCategories);
    on<AddProImagesEvent>(_addProImages);
    on<AddProDisplayMethodEvent>(_addProDisplayMethod);
    on<AddSaleInfoEvent>(_addSaleInfo);
    on<AddSwapInfoEvent>(_addSwapInfo);
    on<AddShipToCountryEvent>(_addShipToCountry);
    on<AddProductEvent>(_addProduct);
  }

  static AddProBloc get get => BlocProvider.of(Utils.currentContext);

  String latitudePicked = '';
  String longitudePicked = '';

  FutureOr<void> _addEditState(
      AddEditStateEvent event, Emitter<AddProState> emit) {
    emit(state.copyWith(adjustProduct: event.adjustProduct));
  }

  FutureOr<void> _addProInfo(AddProInfoEvent event, Emitter<AddProState> emit) {
    emit(state.copyWith(
      productName: event.productName,
      productDescription: event.productDescription,
    ));
  }

  FutureOr<void> _addProCategories(
      AddProCategoriesEvent event, Emitter<AddProState> emit) {
    emit(state.copyWith(
      productSecID: event.productSecID,
      productCatID: event.productCatID,
      productSubCatID: event.productSubCatID,
      productBrandID: event.productBrandID,
      productModelYear: event.productModelYear,
    ));
  }

  FutureOr<void> _addProImages(
      AddProImagesEvent event, Emitter<AddProState> emit) {
    emit(state.copyWith(
      proImages: event.proImages,
      oldImages: event.oldImages,
    ));
  }

  FutureOr<void> _addProDisplayMethod(
      AddProDisplayMethodEvent event, Emitter<AddProState> emit) {
    emit(state.copyWith(displayMethod: event.displayMethod));
  }

  FutureOr<void> _addSaleInfo(
      AddSaleInfoEvent event, Emitter<AddProState> emit) {
    String discount = '';
    if (event.productDiscount?.isNotEmpty ?? false) {
      final productDiscount =
          int.parse(event.productDiscount!.replaceAll('%', ''));
      discount = (productDiscount / 100).toString();
    }
    emit(state.copyWith(
      productQuantity: event.productQuantity,
      productPrice: event.productPrice,
      productDiscount: discount,
    ));
  }

  FutureOr<void> _addSwapInfo(
      AddSwapInfoEvent event, Emitter<AddProState> emit) {
    emit(state.copyWith(
      displayProduct: event.displayProduct,
      swapCountry: event.swapCountry,
      swapCity: event.swapCity,
    ));
  }

  FutureOr<void> _addShipToCountry(
      AddShipToCountryEvent event, Emitter<AddProState> emit) {
    emit(state.copyWith(shipToCountry: event.shipToCountry));
  }

  Future<void> _addProduct(
      AddProductEvent event, Emitter<AddProState> emit) async {
    String? proID;
    if (state.adjustProduct.isEdit) {
      proID = getIt.get<EditProduct>().myProductItem?.id.toString();
    }

    ProgressCircleDialog.show();
    try {
      AddProModel addProModel = AddProModel()
        ..userID = ValueConstants.userId
        ..proId = proID
        ..title = state.productName
        ..tradeFor = 'TV'
        ..condition = 'NEW'
        ..city = 'Amman'
        ..description = state.productDescription
        ..secID = state.productSecID
        ..catID = state.productCatID
        ..subID = state.productSubCatID
        ..brandID = state.productBrandID
        ..year = state.productModelYear
        ..tradeOrSell = state.displayMethod.name
        ..quantity = state.productQuantity
        ..price = state.productPrice
        ..discount = state.productDiscount
        ..country = state.shipToCountry
        ..display = state.displayProduct
        ..countrySwap = state.swapCountry
        ..citySwap = state.swapCity
        ..latitude = latitudePicked
        ..longitude = longitudePicked
        ..oldItemImageList = state.oldImages
        ..itemFileImg = state.proImages.toList();

      final result = state.adjustProduct.isEdit
          ? await getIt.get<MyProductUseCases>().updateProduct(addProModel)
          : await getIt.get<MyProductUseCases>().addProduct(addProModel);

      if (emit.isDone) return;

      await result.fold((l) async {
        emit(state.copyWith(addProStateStatus: AddProStateStatus.ERROR));
        ShowToastSnackBar.showCustomDialog(message: l.message.toString());
      }, (r) async {
        if (!r.status!) {
          ShowToastSnackBar.showCustomDialog(message: r.message.toString());
          return;
        }

        final id = r.data['data']['id'];
        final itemData = await getIt.get<MyProductUseCases>().getItemById(id);

        if (emit.isDone) return;

        itemData.fold((l) {
          emit(state.copyWith(addProStateStatus: AddProStateStatus.ERROR));
          ShowToastSnackBar.showCustomDialog(message: l.message.toString());
        }, (r) {
          if (!r.status!) {
            ShowToastSnackBar.showCustomDialog(message: r.message.toString());
            return;
          }

          final myProductItem = MyProductItem.fromJson(r.data['data']);

          MyProFuncBloc.get.add(ResetValuesEvent());
          Utils.openNewPage(
            ProAddSuccessScreen(
              displayMethod: state.displayMethod,
              myProductItem: myProductItem,
            ),
            popPreviousPages: true,
          );

          emit(state.copyWith(
            addProStateStatus: AddProStateStatus.SUCCESS,
            productSecID: 1000,
            productName: '',
            productDescription: '',
            productCatID: 1000,
            productSubCatID: 1000,
            productBrandID: 1000,
            productModelYear: '',
            proImages: [],
            displayMethod: ProductDisplayMethod.Sell,
            productQuantity: '',
            productPrice: '',
            productDiscount: '',
            displayProduct: '',
            swapCountry: 'Jordan',
            swapCity: 'Amman',
            shipToCountry: '',
            oldImages: [],
          ));
        });
      });
    } catch (e) {
      ShowToastSnackBar.showCustomDialog(message: 'Something went wrong.');
      emit(state.copyWith(addProStateStatus: AddProStateStatus.ERROR));
    } finally {
      // ✅ Always dismiss loading spinner
      ProgressCircleDialog.dismiss();
    }
  }
}
