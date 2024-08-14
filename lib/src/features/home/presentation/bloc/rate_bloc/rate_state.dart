import 'package:equatable/equatable.dart';

// ignore: constant_identifier_names
enum RateStateStatus { INITIAL, LOADING, SUCCESS, ERROR, LOADINGMORE, NULL }

extension RateStateStatusX on RateStateStatus {
  bool get isInitial => this == RateStateStatus.INITIAL;
  bool get isSuccess => this == RateStateStatus.SUCCESS;
  bool get isError => this == RateStateStatus.ERROR;
  bool get isLoading => this == RateStateStatus.LOADING;
  bool get isLoadingMore => this == RateStateStatus.LOADINGMORE;
  bool get isNull => this == RateStateStatus.NULL;
}

class RateState extends Equatable {
  final RateStateStatus rateStateStatus;
  final double rateAverage;

  const RateState({
    this.rateStateStatus = RateStateStatus.INITIAL,
    this.rateAverage = 0.0,
  });

  RateState copyWith({
    RateStateStatus? rateStateStatus,
    double? rateAverage,
  }) {
    return RateState(
      rateStateStatus: rateStateStatus ?? this.rateStateStatus,
      rateAverage: rateAverage ?? this.rateAverage,
    );
  }

  @override
  List<Object?> get props => [
        rateStateStatus,
        rateAverage,
      ];
}
