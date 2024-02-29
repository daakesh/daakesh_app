import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum HomeStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension HomeStateStatusX on HomeStateStatus{
  bool get isInitial => this == HomeStateStatus.INITIAL;
  bool get isSuccess => this == HomeStateStatus.SUCCESS;
  bool get isError => this == HomeStateStatus.ERROR;
  bool get isLoading => this == HomeStateStatus.LOADING;
}

class HomeState extends Equatable {
  final HomeStateStatus homeStateStatus;
  final HomeScreenState homeScreenState;
  ///Filter screen State
  final int rateIndex;
  final int productTypeIndex;
  ///Product screen details state
  final bool isDaakeshTodayDeal;
  ///More Info Product Screen
  final int productSliderIndex;
  final int productSizeIndex;
  ///API Data
  final List<SectionItemModel> sectionListData;
  final List<AdvItem> advListData;





  const HomeState({
    this.homeStateStatus = HomeStateStatus.INITIAL,
    this.homeScreenState = HomeScreenState.HOME,
    ///Filter screen State
    this.rateIndex = 1,
    this.productTypeIndex = 0,
    ///Product screen details state
    this.isDaakeshTodayDeal = false,
    ///More Info Product Screen
    this.productSliderIndex = 0,
    this.productSizeIndex = 0,
    ///API Data.
    this.sectionListData = const[],
    this.advListData = const[],



  });

  HomeState copyWith({
    HomeStateStatus? homeStateStatus,
    HomeScreenState? homeScreenState,
    int? rateIndex,
    int? productTypeIndex,
    ///Product screen details state
    bool? isDaakeshTodayDeal,
    ///More Info Product Screen
    int? productSliderIndex,
    int? productSizeIndex,
    ///API Data
    List<SectionItemModel>? sectionListData,
    List<AdvItem>? advListData,


  }) {
    return HomeState(
      homeStateStatus: homeStateStatus ?? this.homeStateStatus,
      homeScreenState: homeScreenState ?? this.homeScreenState,
      ///Filter screen States
      rateIndex: rateIndex ?? this.rateIndex,
      productTypeIndex: productTypeIndex ?? this.productTypeIndex,
      ///Product screen details states
      isDaakeshTodayDeal: isDaakeshTodayDeal ?? this.isDaakeshTodayDeal,
      ///More Info Product Screen
      productSliderIndex: productSliderIndex ?? this.productSliderIndex,
      productSizeIndex: productSizeIndex ?? this.productSizeIndex,
      ///API Data
      sectionListData: sectionListData ?? this.sectionListData,
      advListData: advListData ?? this.advListData,


    );
  }

  @override
  List<Object?> get props => [
    homeStateStatus,
    homeScreenState,
    ///Filter screen States
    rateIndex,
    productTypeIndex,
    ///Product screen details states
    isDaakeshTodayDeal,
    ///More Info Product Screen
    productSliderIndex,
    productSizeIndex,
    ///API Data
    sectionListData,
    advListData,
  ];
}
