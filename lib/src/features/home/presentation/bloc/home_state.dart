import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum HomeStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension HomeStateStatusX on HomeStateStatus{
  bool get isInitial => this == HomeStateStatus.INITIAL;
  bool get isSuccess => this == HomeStateStatus.SUCCESS;
  bool get isError => this == HomeStateStatus.ERROR;
  bool get isLoading => this == HomeStateStatus.LOADING;
}

class HomeState extends Equatable {
  final HomeStateStatus homeStateStatus;
  ///Search screen widget
  final bool isSearchOn;
  ///Filter screen State
  final int rateIndex;
  final int productIndex;
  ///Product screen details state
  final bool isProductDetailsOn;
  final bool isDaakeshTodayDeal;
  ///More Info Product Screen
  final int productSliderIndex;
  final int productSizeIndex;
  ///Search Screen
  final bool isShowSearchResult;
  ///Cart Screen
  final bool isShowCart;



  const HomeState({
    this.homeStateStatus = HomeStateStatus.INITIAL,
    ///Search screen widget
    this.isSearchOn = false,
    ///Filter screen State
    this.rateIndex = 1,
    this.productIndex = 0,
    ///Product screen details state
    this.isProductDetailsOn = false,
    this.isDaakeshTodayDeal = false,
    ///More Info Product Screen
    this.productSliderIndex = 0,
    this.productSizeIndex = 0,
    ///Search Screen
    this.isShowSearchResult = false,
    ///Cart screen
    this.isShowCart = false,


  });

  HomeState copyWith({
    HomeStateStatus? homeStateStatus,
    ///Search screen widget
    bool? isSearchOn,
    ///Filter screen State
    int? rateIndex,
    int? productIndex,
    ///Product screen details state
    bool? isProductDetailsOn,
    bool? isDaakeshTodayDeal,
    ///More Info Product Screen
    int? productSliderIndex,
    int? productSizeIndex,
    ///
    bool? isShowSearchResult,
    ///Cart screen
    bool? isShowCart,


  }) {
    return HomeState(
      homeStateStatus: homeStateStatus ?? this.homeStateStatus,
      ///Search screen widget states
      isSearchOn: isSearchOn ?? this.isSearchOn,
      ///Filter screen States
      rateIndex: rateIndex ?? this.rateIndex,
      productIndex: productIndex ?? this.productIndex,
      ///Product screen details states
      isProductDetailsOn: isProductDetailsOn ?? this.isProductDetailsOn,
      isDaakeshTodayDeal: isDaakeshTodayDeal ?? this.isDaakeshTodayDeal,
      ///More Info Product Screen
      productSliderIndex: productSliderIndex ?? this.productSliderIndex,
      productSizeIndex: productSizeIndex ?? this.productSizeIndex,
      ///
      isShowSearchResult: isShowSearchResult ?? this.isShowSearchResult,
      ///Cart Screen
      isShowCart: isShowCart ?? this.isShowCart,

    );
  }

  @override
  List<Object?> get props => [

    homeStateStatus,
    isSearchOn,
    ///Filter screen States
    rateIndex,
    productIndex,
    ///Product screen details states
    isProductDetailsOn,
    isDaakeshTodayDeal,
    ///More Info Product Screen
    productSliderIndex,
    productSizeIndex,
    ///
    isShowSearchResult,
    ///Cart
    isShowCart,

  ];
}
