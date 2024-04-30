import 'package:equatable/equatable.dart';
import '../../../../../src.export.dart';

enum SwapStateStatus { INITIAL, LOADING, SUCCESS, ERROR, LODAINGMORE, NULL }

extension SwapStateStatusX on SwapStateStatus {
  bool get isInitial => this == SwapStateStatus.INITIAL;
  bool get isSuccess => this == SwapStateStatus.SUCCESS;
  bool get isError => this == SwapStateStatus.ERROR;
  bool get isLoading => this == SwapStateStatus.LOADING;
  bool get isLoadingMore => this == SwapStateStatus.LODAINGMORE;
  bool get isNull => this == SwapStateStatus.NULL;
}

class SwapState extends Equatable {
  final SwapStateStatus swapStateStatus;
  final SwapScreenState swapScreenState;

  ///API Data
  final List<SwapSectionItemModel> swapSectionListData;
  final int sectionCurrentPage;
  final bool isMoreData;

  const SwapState({
    this.swapStateStatus = SwapStateStatus.INITIAL,
    this.swapScreenState = SwapScreenState.HOME,

    ///API Data.
    this.swapSectionListData = const [],
    this.sectionCurrentPage = 1,
    this.isMoreData = true,
  });

  SwapState copyWith({
    SwapStateStatus? swapStateStatus,
    SwapScreenState? swapScreenState,

    ///API Data
    List<SwapSectionItemModel>? swapSectionListData,
    int? sectionCurrentPage,
    bool? isMoreData,
  }) {
    return SwapState(
      swapStateStatus: swapStateStatus ?? this.swapStateStatus,
      swapScreenState: swapScreenState ?? this.swapScreenState,

      ///API Data
      swapSectionListData: swapSectionListData ?? this.swapSectionListData,
      sectionCurrentPage: sectionCurrentPage ?? this.sectionCurrentPage,
      isMoreData: isMoreData ?? this.isMoreData,
    );
  }

  @override
  List<Object?> get props => [
        swapStateStatus,
        swapScreenState,

        ///API Data
        swapSectionListData,
        sectionCurrentPage,
        isMoreData,
      ];
}
