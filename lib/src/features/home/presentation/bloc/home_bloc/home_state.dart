import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum HomeStateStatus { INITIAL, LOADING, SUCCESS, ERROR, LOADINGMORE, NULL }

enum StoreType { SHOP, SWAP }

extension HomeStateStatusX on HomeStateStatus {
  bool get isInitial => this == HomeStateStatus.INITIAL;
  bool get isSuccess => this == HomeStateStatus.SUCCESS;
  bool get isError => this == HomeStateStatus.ERROR;
  bool get isLoading => this == HomeStateStatus.LOADING;
  bool get isLoadingMore => this == HomeStateStatus.LOADINGMORE;
  bool get isNull => this == HomeStateStatus.NULL;
}

class HomeState extends Equatable {
  final HomeStateStatus homeStateStatus;
  final HomeScreenState homeScreenState;

  ///API Data
  final List<SectionItemModel> sectionListData;
  final int sectionCurrentPage;
  final bool isMoreData;
  final int tabIndex;
  final bool isSwapActive;
  final StoreType storeType;

  const HomeState({
    this.homeStateStatus = HomeStateStatus.INITIAL,
    this.homeScreenState = HomeScreenState.HOME,

    ///API Data.
    this.sectionListData = const [],
    this.sectionCurrentPage = 1,
    this.isMoreData = true,
    this.tabIndex = 0,
    this.isSwapActive = true,
    this.storeType = StoreType.SHOP,
  });

  HomeState copyWith({
    HomeStateStatus? homeStateStatus,
    HomeScreenState? homeScreenState,

    ///Product screen details state
    bool? isDaakeshTodayDeal,
    int? sectionCurrentPage,
    bool? isMoreData,

    ///API Data
    List<SectionItemModel>? sectionListData,
    int? tabIndex,
    bool? isSwapActive,
    StoreType? storeType,
  }) {
    return HomeState(
      homeStateStatus: homeStateStatus ?? this.homeStateStatus,
      homeScreenState: homeScreenState ?? this.homeScreenState,

      ///API Data
      sectionListData: sectionListData ?? this.sectionListData,
      sectionCurrentPage: sectionCurrentPage ?? this.sectionCurrentPage,
      isMoreData: isMoreData ?? this.isMoreData,
      tabIndex: tabIndex ?? this.tabIndex,
      isSwapActive: isSwapActive ?? this.isSwapActive,
      storeType: storeType ?? this.storeType,
    );
  }

  @override
  List<Object?> get props => [
        homeStateStatus,
        homeScreenState,

        ///API Data
        sectionListData,
        sectionCurrentPage,
        isMoreData,

        ///
        tabIndex,
        isSwapActive,
        storeType,
      ];
}
