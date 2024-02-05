import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<OnLoginEvent>(_onLoginEvent);
  }

  Future<FutureOr<void>> _onLoginEvent(OnLoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authStateStatus: AuthStateStatus.LOADING));
    final result = await getIt.get<AuthUseCases>().onLogin(event.phoneNumber,event.password);

    result.fold((l) {
      emit(state.copyWith(authStateStatus: AuthStateStatus.ERROR));

    },(r) {
      emit(state.copyWith(authStateStatus: AuthStateStatus.SUCCESS));

    });
  }
}
