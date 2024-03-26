import 'package:equatable/equatable.dart';

enum ComplaintStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension ComplaintStateStatusX on ComplaintStateStatus{
  bool get isInitial => this == ComplaintStateStatus.INITIAL;
  bool get isSuccess => this == ComplaintStateStatus.SUCCESS;
  bool get isError => this == ComplaintStateStatus.ERROR;
  bool get isLoading => this == ComplaintStateStatus.LOADING;
}

class ComplaintState extends Equatable {
  final ComplaintStateStatus complaintStateStatus;


  const ComplaintState({
    this.complaintStateStatus = ComplaintStateStatus.INITIAL,

  });

  ComplaintState copyWith({
     ComplaintStateStatus? complaintStateStatus,

  }) {
    return ComplaintState(
      complaintStateStatus: complaintStateStatus ?? this.complaintStateStatus,


    );
  }

  @override
  List<Object?> get props => [
    complaintStateStatus,

  ];
}
