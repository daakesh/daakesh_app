import 'package:equatable/equatable.dart';

enum ForgetPassStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension ForgetPassStateStatusX on ForgetPassStateStatus{
  bool get isInitial => this == ForgetPassStateStatus.INITIAL;
  bool get isSuccess => this == ForgetPassStateStatus.SUCCESS;
  bool get isError => this == ForgetPassStateStatus.ERROR;
  bool get isLoading => this == ForgetPassStateStatus.LOADING;
}

class ForgetPassState extends Equatable {
  final ForgetPassStateStatus forgetPassStateStatus;
  final String phone;
  final String flagEmoji;
  final String phoneCode;
  final String verificationId;

  const ForgetPassState({
    this.forgetPassStateStatus = ForgetPassStateStatus.INITIAL,
    this.phone = '',
    this.flagEmoji = '🇯🇴',
    this.phoneCode = '962',
    this.verificationId = '',
  });

  ForgetPassState copyWith({
    ForgetPassStateStatus? forgetPassStateStatus,
    String? phone,
    String? flagEmoji,
    String? phoneCode,
    String? verificationId,
  }) {
    return ForgetPassState(
      forgetPassStateStatus: forgetPassStateStatus ?? this.forgetPassStateStatus,
      phone: phone ?? this.phone,
      flagEmoji: flagEmoji ?? this.flagEmoji,
      phoneCode: phoneCode ?? this.phoneCode,
      verificationId: verificationId ?? this.verificationId,
    );
  }

  @override
  List<Object?> get props => [
    forgetPassStateStatus,
    phone,
    flagEmoji,
    phoneCode,
    verificationId,
  ];
}
