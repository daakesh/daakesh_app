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
  ///
  final int productSliderIndex;

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
    ///
    this.productSliderIndex = 0,

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
    ///
    int? productSliderIndex,


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
      ///
      productSliderIndex: productSliderIndex ?? this.productSliderIndex,

    );
  }

  @override
  List<Object?> get props => [
    homeStateStatus,
    isSearchOn,
    rateIndex,
    productIndex,
    isProductDetailsOn,
    isDaakeshTodayDeal,
    productSliderIndex,

  ];
}
