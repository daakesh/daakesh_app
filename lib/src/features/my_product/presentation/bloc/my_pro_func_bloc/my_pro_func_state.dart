import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../src.export.dart';

enum MyProFuncStateStatus {
  INITIAL,
  LOADING,
  SUCCESS,
  ERROR,
  LOADINGMORE,
  NULL
}

extension MyProductStateStatusX on MyProFuncStateStatus {
  bool get isInitial => this == MyProFuncStateStatus.INITIAL;
  bool get isSuccess => this == MyProFuncStateStatus.SUCCESS;
  bool get isError => this == MyProFuncStateStatus.ERROR;
  bool get isLoading => this == MyProFuncStateStatus.LOADING;
  bool get isLoadingMore => this == MyProFuncStateStatus.LOADINGMORE;
  bool get isNull => this == MyProFuncStateStatus.NULL;
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
  final List<String> oldImage;
  final List<MyProductItem> myProductItem;

  ///Search
  final List<MyProductItem> searchResultList;
  final int currentSearchPage;
  final String searchValue;
  final bool isMoreData;

  ///
  final bool discountSwitchButton;

  const MyProFuncState({
    this.myProFuncStateStatus = MyProFuncStateStatus.INITIAL,
    this.productTapBar = ProductTapBar.SELL,
    this.productDisplayMethod = ProductDisplayMethod.Sell,
    this.swapFlagEmoji = '🇯🇴',
    this.shipFlagEmoji = '🇯🇴',
    this.selectedShipCountry = 'Jordan',
    this.selectedShipToCountries = const [],
    this.isAlreadyAddedCountry = false,
    this.imagesList = const [],
    this.myProductItem = const [],
    this.oldImage = const [],

    ///Search
    this.searchResultList = const [],
    this.currentSearchPage = 1,
    this.searchValue = '',
    this.isMoreData = true,
    this.discountSwitchButton = false,
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
    List<String>? oldImage,
    List<MyProductItem>? myProductItem,

    ///Search
    List<MyProductItem>? searchResultList,
    int? currentSearchPage,
    String? searchValue,
    bool? isMoreData,
    bool? discountSwitchButton,
  }) {
    return MyProFuncState(
      myProFuncStateStatus: myProFuncStateStatus ?? this.myProFuncStateStatus,
      productTapBar: productTapBar ?? this.productTapBar,
      productDisplayMethod: productDisplayMethod ?? this.productDisplayMethod,
      swapFlagEmoji: swapFlagEmoji ?? this.swapFlagEmoji,
      shipFlagEmoji: shipFlagEmoji ?? this.shipFlagEmoji,
      selectedShipCountry: selectedShipCountry ?? this.selectedShipCountry,
      oldImage: oldImage ?? this.oldImage,
      selectedShipToCountries:
          selectedShipToCountries ?? this.selectedShipToCountries,
      isAlreadyAddedCountry:
          isAlreadyAddedCountry ?? this.isAlreadyAddedCountry,
      imagesList: imagesList ?? this.imagesList,
      myProductItem: myProductItem ?? this.myProductItem,
      searchResultList: searchResultList ?? this.searchResultList,
      currentSearchPage: currentSearchPage ?? this.currentSearchPage,
      searchValue: searchValue ?? this.searchValue,
      isMoreData: isMoreData ?? this.isMoreData,
      discountSwitchButton: discountSwitchButton ?? this.discountSwitchButton,
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

        ///
        searchResultList,
        currentSearchPage,
        searchValue,
        isMoreData,
        oldImage,

        ///
        discountSwitchButton,
      ];
}
