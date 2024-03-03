import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum HandmadeStateStatus { INITIAL, LOADING, SUCCESS, ERROR ,LOADINGMORE,NULL}

extension HandmadeStateStatusX on HandmadeStateStatus{
  bool get isInitial => this == HandmadeStateStatus.INITIAL;
  bool get isSuccess => this == HandmadeStateStatus.SUCCESS;
  bool get isError => this == HandmadeStateStatus.ERROR;
  bool get isLoading => this == HandmadeStateStatus.LOADING;
  bool get isLoadingMore => this == HandmadeStateStatus.LOADINGMORE;
  bool get isNull => this == HandmadeStateStatus.NULL;
}

class HandmadeState extends Equatable {
  final HandmadeStateStatus handmadeStateStatus;
  final List<HandmadeItem> handmadeListData;
  final int currentPage;
  final bool isMoreData;

  const HandmadeState({
    this.handmadeStateStatus = HandmadeStateStatus.INITIAL,
    this.handmadeListData = const[],
    this.currentPage = 1,
    this.isMoreData = true,
  });

  HandmadeState copyWith({
    HandmadeStateStatus? handmadeStateStatus,
    List<HandmadeItem>? handmadeListData,
    int? currentPage,
    bool? isMoreData,
  }) {
    return HandmadeState(
      handmadeStateStatus: handmadeStateStatus ?? this.handmadeStateStatus,
      handmadeListData: handmadeListData ?? this.handmadeListData,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,

    );
  }

  @override
  List<Object?> get props => [
    handmadeStateStatus,
    handmadeListData,
    currentPage,
    isMoreData,
  ];
}


