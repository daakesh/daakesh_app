import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../src.export.dart';

enum MyProductStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension MyProductStateStatusX on MyProductStateStatus{
  bool get isInitial => this == MyProductStateStatus.INITIAL;
  bool get isSuccess => this == MyProductStateStatus.SUCCESS;
  bool get isError => this == MyProductStateStatus.ERROR;
  bool get isLoading => this == MyProductStateStatus.LOADING;
}

class MyProductState extends Equatable {
  final MyProductStateStatus myProductStateStatus;
  final ProductTapBar productTapBar;
  final ProductDisplayMethod productDisplayMethod;
  final String swapFlagEmoji;
  final String shipFlagEmoji;
  final String selectedShipCountry;
  final List<String> selectedShipToCountries;
  final bool isAlreadyAddedCountry;
  final List<XFile> imagesList;




  const MyProductState({
    this.myProductStateStatus = MyProductStateStatus.INITIAL,
    this.productTapBar = ProductTapBar.SHOP,
    this.productDisplayMethod = ProductDisplayMethod.SALE,
    this.swapFlagEmoji = '🇯🇴',
    this.shipFlagEmoji = '🇯🇴',
    this.selectedShipCountry = 'Jordan',
    this.selectedShipToCountries = const [],
    this.isAlreadyAddedCountry = false,
    this.imagesList = const[],
  });

  MyProductState copyWith({
    MyProductStateStatus? myProductStateStatus,
    ProductTapBar? productTapBar,
    ProductDisplayMethod? productDisplayMethod,
    String? swapFlagEmoji,
    String? shipFlagEmoji,
    String? selectedShipCountry,
    List<String>? selectedShipToCountries,
    bool? isAlreadyAddedCountry,
    List<XFile>? imagesList,


  }) {
    return MyProductState(
      myProductStateStatus: myProductStateStatus ?? this.myProductStateStatus,
      productTapBar: productTapBar ?? this.productTapBar,
      productDisplayMethod: productDisplayMethod ?? this.productDisplayMethod,
      swapFlagEmoji: swapFlagEmoji ?? this.swapFlagEmoji,
      shipFlagEmoji: shipFlagEmoji ?? this.shipFlagEmoji,
      selectedShipCountry: selectedShipCountry ?? this.selectedShipCountry,
      selectedShipToCountries: selectedShipToCountries ?? this.selectedShipToCountries,
      isAlreadyAddedCountry: isAlreadyAddedCountry ?? this.isAlreadyAddedCountry,
      imagesList: imagesList ?? this.imagesList,


    );
  }

  @override
  List<Object?> get props => [
        myProductStateStatus,
        productTapBar,
        productDisplayMethod,
        swapFlagEmoji,
        shipFlagEmoji,
        selectedShipCountry,
        selectedShipToCountries,
        isAlreadyAddedCountry,
        imagesList,
      ];
}
