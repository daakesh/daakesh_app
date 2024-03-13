import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../src.export.dart';


enum MyProFuncStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension MyProductStateStatusX on MyProFuncStateStatus{
  bool get isInitial => this == MyProFuncStateStatus.INITIAL;
  bool get isSuccess => this == MyProFuncStateStatus.SUCCESS;
  bool get isError => this == MyProFuncStateStatus.ERROR;
  bool get isLoading => this == MyProFuncStateStatus.LOADING;
}

class MyProFuncState extends Equatable {
  final MyProFuncStateStatus myProFuncStateStatus;
  final ProductTapBar productTapBar;
  final ProductDisplayMethod productDisplayMethod;
  final String swapFlagEmoji;
  final String shipFlagEmoji;
  final String selectedShipCountry;
  final List<String> selectedShipToCountries;
  final bool isAlreadyAddedCountry;
  final List<XFile> imagesList;
  final List<MyProductItem> myProductItem;




  const MyProFuncState({
    this.myProFuncStateStatus = MyProFuncStateStatus.INITIAL,
    this.productTapBar = ProductTapBar.SHOP,
    this.productDisplayMethod = ProductDisplayMethod.Sell,
    this.swapFlagEmoji = '🇯🇴',
    this.shipFlagEmoji = '🇯🇴',
    this.selectedShipCountry = 'Jordan',
    this.selectedShipToCountries = const [],
    this.isAlreadyAddedCountry = false,
    this.imagesList = const[],
    this.myProductItem = const[],
  });

  MyProFuncState copyWith({
    MyProFuncStateStatus? myProFuncStateStatus,
    ProductTapBar? productTapBar,
    ProductDisplayMethod? productDisplayMethod,
    String? swapFlagEmoji,
    String? shipFlagEmoji,
    String? selectedShipCountry,
    List<String>? selectedShipToCountries,
    bool? isAlreadyAddedCountry,
    List<XFile>? imagesList,
    List<MyProductItem>? myProductItem,


  }) {
    return MyProFuncState(
      myProFuncStateStatus: myProFuncStateStatus ?? this.myProFuncStateStatus,
      productTapBar: productTapBar ?? this.productTapBar,
      productDisplayMethod: productDisplayMethod ?? this.productDisplayMethod,
      swapFlagEmoji: swapFlagEmoji ?? this.swapFlagEmoji,
      shipFlagEmoji: shipFlagEmoji ?? this.shipFlagEmoji,
      selectedShipCountry: selectedShipCountry ?? this.selectedShipCountry,
      selectedShipToCountries: selectedShipToCountries ?? this.selectedShipToCountries,
      isAlreadyAddedCountry: isAlreadyAddedCountry ?? this.isAlreadyAddedCountry,
      imagesList: imagesList ?? this.imagesList,
      myProductItem: myProductItem ?? this.myProductItem,


    );
  }

  @override
  List<Object?> get props => [
        myProFuncStateStatus,
        productTapBar,
        productDisplayMethod,
        swapFlagEmoji,
        shipFlagEmoji,
        selectedShipCountry,
        selectedShipToCountries,
        isAlreadyAddedCountry,
        imagesList,
        myProductItem,
      ];
}
