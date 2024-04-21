import '../../../../../src.export.dart';

abstract class UserDataEvent {}

class GetUserDataEvent extends UserDataEvent {}

class LogoutUserEvent extends UserDataEvent {}

class SetUserDataEvent extends UserDataEvent {
  final UserModel userData;
  SetUserDataEvent({required this.userData});
}
