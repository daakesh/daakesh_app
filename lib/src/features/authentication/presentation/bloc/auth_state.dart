import 'package:equatable/equatable.dart';

enum AuthStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension AuthStateStatusX on AuthStateStatus{
  bool get isInitial => this == AuthStateStatus.INITIAL;
  bool get isSuccess => this == AuthStateStatus.SUCCESS;
  bool get isError => this == AuthStateStatus.ERROR;
  bool get isLoading => this == AuthStateStatus.LOADING;
}

class AuthState extends Equatable {
  final AuthStateStatus authStateStatus;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String country;
  final String city;
  final String address;
  final String flagEmoji;
  final String phoneCode;
  final String phoneFlag;
  ///
  final String verificationId;

  const AuthState({
    this.authStateStatus = AuthStateStatus.INITIAL,
    this.name = '',
    this.email = '',
    this.password = '',
    this.phone = '',
    this.country = '',
    this.city = '',
    this.address = '',
    this.flagEmoji = '🇯🇴',
    this.phoneCode = '962',
    this.phoneFlag = '🇯🇴',
    this.verificationId = '',
  });

  AuthState copyWith({
    AuthStateStatus? authStateStatus,
    String? name,
    String? email,
    String? password,
    String? phone,
    String? country,
    String? city,
    String? address,
    String? flagEmoji,
    String? phoneCode,
    String? phoneFlag,
    String? verificationId,

  }) {
    return AuthState(
      authStateStatus: authStateStatus ?? this.authStateStatus,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      country: country ?? this.country,
      city: city ?? this.city,
      address: address ?? this.address,
      flagEmoji: flagEmoji ?? this.flagEmoji,
      phoneCode: phoneCode ?? this.phoneCode,
      phoneFlag: phoneFlag ?? this.phoneFlag,
      verificationId: verificationId ?? this.verificationId,
    );
  }

  @override
  List<Object?> get props => [
        authStateStatus,
        name,
        email,
        password,
        phone,
        country,
        city,
        address,
        flagEmoji,
        phoneCode,
        phoneFlag,
        ///
        verificationId
      ];
}
