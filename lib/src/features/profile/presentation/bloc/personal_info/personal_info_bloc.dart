import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfoBloc() : super(const PersonalInfoState()) {
    on<ActivateUpdatePersonalInfoEvent>(_activateUpdatePersonalInfo);
    on<SelectProfileImageEvent>(_selectProfileImage);
    on<UpdatePersonalInfoEvent>(_updatePersonalInfo);
  }
  static PersonalInfoBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _activateUpdatePersonalInfo(
      ActivateUpdatePersonalInfoEvent event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(isUpdateActive: event.isUpdateActive, image: ''));
  }

  FutureOr<void> _selectProfileImage(
      SelectProfileImageEvent event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(image: event.path));
  }

  FutureOr<void> _updatePersonalInfo(
      UpdatePersonalInfoEvent event, Emitter<PersonalInfoState> emit) async {
    ProgressCircleDialog.show();
    emit(state.copyWith(profileStateStatus: PersonalInfoStateStatus.LOADING));

    if (event.password!.isNotEmpty) {
      _updatePassword(event.password.toString());
    }
    final result = await getIt
        .get<ProfileUseCases>()
        .updateUserData(event.name, event.image);
    result.fold(
      (l) {
        ProgressCircleDialog.dismiss();

        emit(state.copyWith(profileStateStatus: PersonalInfoStateStatus.ERROR));
        ShowToastSnackBar.showSnackBars(message: l.message.toString());
      },
      (r) {
        ProgressCircleDialog.dismiss();
        if (!r.status!) {
          ShowToastSnackBar.showSnackBars(message: r.message.toString());
          return;
        }
        UserDataBloc.get.add(GetUserDataEvent());
        emit(state.copyWith(
            profileStateStatus: PersonalInfoStateStatus.SUCCESS));
      },
    );
  }

  void _updatePassword(String password) async {
    final result = await getIt.get<ProfileUseCases>().updateUserPassword(
        password, GetItUtils.user.userData.phoneNumber.toString());
    result.fold(
      (l) {
        ShowToastSnackBar.showSnackBars(message: l.message.toString());
      },
      (r) async {
        if (!r.status!) {
          ShowToastSnackBar.showSnackBars(message: r.message.toString());
          return;
        }
        await getIt.get<AuthUseCases>().activateUser(ValueConstants.userId);
      },
    );
  }
}
