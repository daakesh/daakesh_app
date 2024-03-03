import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum AdvStateStatus { INITIAL, LOADING, SUCCESS, ERROR ,LOADINGMORE,NULL}

extension AdvStateStatusX on AdvStateStatus{
  bool get isInitial => this == AdvStateStatus.INITIAL;
  bool get isSuccess => this == AdvStateStatus.SUCCESS;
  bool get isError => this == AdvStateStatus.ERROR;
  bool get isLoading => this == AdvStateStatus.LOADING;
  bool get isLoadingMore => this == AdvStateStatus.LOADINGMORE;
  bool get isNull => this == AdvStateStatus.NULL;
}

class AdvState extends Equatable {
  final AdvStateStatus advStateStatus;
  final List<AdvItem> advListData;


  const AdvState({
    this.advStateStatus = AdvStateStatus.INITIAL,
    this.advListData = const[],

  });

  AdvState copyWith({
    AdvStateStatus? advStateStatus,
    List<AdvItem>? advListData,

  }) {
    return AdvState(
      advStateStatus: advStateStatus ?? this.advStateStatus,
      advListData: advListData ?? this.advListData,


    );
  }

  @override
  List<Object?> get props => [
    advStateStatus,
    advListData,

  ];
}


