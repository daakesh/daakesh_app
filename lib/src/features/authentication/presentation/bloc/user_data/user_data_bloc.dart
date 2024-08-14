import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  UserDataBloc() : super(const UserDataState()) {
    on<GetUserDataEvent>(_getUserData);
    on<LogoutUserEvent>(_logoutUser);
    on<SetUserDataEvent>(_setUserData);
  }

  static UserDataBloc get get => BlocProvider.of(Utils.currentContext);

  ///Get User Data Event,
  FutureOr<void> _getUserData(
      GetUserDataEvent event, Emitter<UserDataState> emit) async {
    emit(state.copyWith(userDataStateStatus: UserDataStateStatus.LOADING));
    final result = await getIt.get<AuthUseCases>().getUserData();
    result.fold((l) {
      emit(state.copyWith(userDataStateStatus: UserDataStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        if (r.data["data"] == null) {
          GetItUtils.user.logOut();
        }
        return;
      }

      List<UserModel> userModelData = <UserModel>[];
      UserModel userModel =
          UserModel.fromJson(r.data['data'] as Map<String, dynamic>);
      GetItUtils.user.setUserData(userModel);
      userModelData.add(userModel);
      emit(state.copyWith(
          userDataStateStatus: UserDataStateStatus.SUCCESS,
          userModelData: userModelData));
    });
  }

  FutureOr<void> _logoutUser(
      LogoutUserEvent event, Emitter<UserDataState> emit) async {
    emit(state.copyWith(userDataStateStatus: UserDataStateStatus.LOADING));
    ProgressCircleDialog.show();
    final result = await getIt.get<AuthUseCases>().logout();
    result.fold((l) {
      ProgressCircleDialog.dismiss();

      emit(state.copyWith(userDataStateStatus: UserDataStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      ProgressCircleDialog.dismiss();

      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      GetItUtils.user.logOut();
      clearAllData();
      await Future.delayed(const Duration(seconds: 1));
      HomeBloc.controller.jumpToTab(0);
      HomeBloc.get.add(SelectTabItemEvent(index: 0));
      emit(state.copyWith(userDataStateStatus: UserDataStateStatus.SUCCESS));
    });
  }

  void clearAllData() {
    MyProBloc.get.add(ClearDataEvent());
    MySwapProBloc.get.add(ClearSwapDataEvent());
    MyProFuncBloc.get.add(EmptyProductSearchEvent(value: '', isClear: true));
    MySwapOrderBloc.get.add(EmptyMyOrderDataEvent());
  }

  FutureOr<void> _setUserData(
      SetUserDataEvent event, Emitter<UserDataState> emit) {
    List<UserModel> userModelData = <UserModel>[];
    GetItUtils.user.setUserData(event.userData);
    userModelData.add(event.userData);
    emit(state.copyWith(
        userDataStateStatus: UserDataStateStatus.SUCCESS,
        userModelData: userModelData));
  }
}
