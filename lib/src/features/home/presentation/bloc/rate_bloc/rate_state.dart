import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum RateStateStatus { INITIAL, LOADING, SUCCESS, ERROR ,LOADINGMORE,NULL}

extension RateStateStatusX on RateStateStatus{
  bool get isInitial => this == RateStateStatus.INITIAL;
  bool get isSuccess => this == RateStateStatus.SUCCESS;
  bool get isError => this == RateStateStatus.ERROR;
  bool get isLoading => this == RateStateStatus.LOADING;
  bool get isLoadingMore => this == RateStateStatus.LOADINGMORE;
  bool get isNull => this == RateStateStatus.NULL;
}

class RateState extends Equatable {
  final RateStateStatus rateStateStatus;


  const RateState({
    this.rateStateStatus = RateStateStatus.INITIAL,

  });

  RateState copyWith({
    RateStateStatus? rateStateStatus,

  }) {
    return RateState(
      rateStateStatus: rateStateStatus ?? this.rateStateStatus,


    );
  }

  @override
  List<Object?> get props => [
    rateStateStatus,
  ];
}


