import 'package:equatable/equatable.dart';

enum AuthStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

class AuthState extends Equatable {
  final AuthStateStatus authStateStatus;

  const AuthState({
    this.authStateStatus = AuthStateStatus.INITIAL,
  });

  AuthState copyWith({
    AuthStateStatus? authStateStatus,
  }) {
    return AuthState(
      authStateStatus: authStateStatus ?? this.authStateStatus,
    );
  }

  @override
  List<Object?> get props => [authStateStatus];
}
