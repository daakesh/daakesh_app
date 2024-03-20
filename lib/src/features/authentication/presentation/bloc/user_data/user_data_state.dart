import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum UserDataStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension UserDataStateStatusX on UserDataStateStatus{
  bool get isInitial => this == UserDataStateStatus.INITIAL;
  bool get isSuccess => this == UserDataStateStatus.SUCCESS;
  bool get isError => this == UserDataStateStatus.ERROR;
  bool get isLoading => this == UserDataStateStatus.LOADING;
}

class UserDataState extends Equatable {
  final UserDataStateStatus userDataStateStatus;
  final List<UserModel> userModelData;


  const UserDataState({
    this.userDataStateStatus = UserDataStateStatus.INITIAL,
    this.userModelData= const[],
  });

  UserDataState copyWith({
    UserDataStateStatus? userDataStateStatus,
    List<UserModel>? userModelData,

  }) {
    return UserDataState(
      userDataStateStatus: userDataStateStatus ?? this.userDataStateStatus,
      userModelData: userModelData ?? this.userModelData,

    );
  }

  @override
  List<Object?> get props => [
    userDataStateStatus,
    userModelData,

  ];
}
