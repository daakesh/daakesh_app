import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  UserDataBloc() : super(const UserDataState()) {
    on<GetUserDataEvent>(_getUserData);
    on<LogoutUserEvent>(_logoutUser);

  }

  static UserDataBloc get get => BlocProvider.of(navigatorKey.currentState!.context);

  ///Get User Data Event,
  FutureOr<void> _getUserData(GetUserDataEvent event, Emitter<UserDataState> emit) async{
      emit(state.copyWith(userDataStateStatus:  UserDataStateStatus.LOADING));
      final result = await getIt.get<AuthUseCases>().getUserData();
      result.fold((l) {
        emit(state.copyWith(userDataStateStatus: UserDataStateStatus.ERROR));
        ShowToastSnackBar.showSnackBars(message: l.message.toString());
      }, (r) async{
        if(!r.status!){
          ShowToastSnackBar.showSnackBars(message: r.message.toString());
          return;
        }
        List<UserModel> userModelData =<UserModel>[];
        UserModel userModel =UserModel.fromJson(r.data['data'] as Map<String,dynamic>);
        user.setUserData(userModel);
        userModelData.add(userModel);
        emit(state.copyWith(userDataStateStatus: UserDataStateStatus.SUCCESS,userModelData: userModelData));
      });
    }

  FutureOr<void> _logoutUser(LogoutUserEvent event, Emitter<UserDataState> emit)async {
    emit(state.copyWith(userDataStateStatus:  UserDataStateStatus.LOADING));
    final result = await getIt.get<AuthUseCases>().logout();
    result.fold((l) {
      emit(state.copyWith(userDataStateStatus: UserDataStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(userDataStateStatus: UserDataStateStatus.SUCCESS));
    });
  }
}
