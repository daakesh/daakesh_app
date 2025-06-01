import 'package:equatable/equatable.dart';

enum AuthStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension AuthStateStatusX on AuthStateStatus {
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
  final bool rememberMeValue;

  ///
  final String emailController;
  final String passwordController;
  final double latitude;
  final double longitude;
  final String deviceToken;

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
    this.rememberMeValue = false,
    this.emailController = '',
    this.passwordController = '',
    this.latitude = 0,
    this.longitude = 0,
    this.deviceToken = '',
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
    bool? rememberMeValue,
    String? emailController,
    String? passwordController,
    double? latitude,
    double? longitude,
    String? deviceToken,
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
      rememberMeValue: rememberMeValue ?? this.rememberMeValue,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      deviceToken: deviceToken ?? this.deviceToken,
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
        verificationId,
        rememberMeValue,
        emailController,
        passwordController,
        latitude,
        longitude,
        deviceToken,
      ];
}
