import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../src.export.dart';

abstract class UserData {
  UserModel userData = UserModel();
  void setUserDataAndCheckIsActive(UserModel userModel, BuildContext context);
  void setUserData(UserModel userData);
  void activateUser(BuildContext context);
  void get saveUserToken;
  void logOut();
}

@Singleton(as: UserData)
class UserDataImpl implements UserData {
  @override
  UserModel userData = UserModel();

  @override
  void setUserDataAndCheckIsActive(UserModel userData, BuildContext context) {
    this.userData = userData;
    if (userData.active == 0) {
      activateUser(context);
      return;
    }
    ValueConstants.userId = userData.id.toString();
    ValueConstants.token = userData.token.toString();
    saveUserToken;
    UserDataBloc.get.add(SetUserDataEvent(userData: userData));
    Utils.openNewPage(const MainScreen(), popPreviousPages: true);
  }

  @override
  void setUserData(UserModel userData) => this.userData = userData;

  @override
  void activateUser(BuildContext context) {
    FirebaseAuthentication.verifyPhoneNumber(
        userData.phoneNumber.toString(), AuthManner.SIGNUPIN, context);
  }

  @override
  void get saveUserToken async => await Future.wait<void>([
        GetItUtils.prefs
            .setString(SharedPrefKeys.token, userData.token.toString()),
        GetItUtils.prefs
            .setString(SharedPrefKeys.userID, userData.id.toString())
      ]);
  @override
  void logOut() async {
    ValueConstants.token = '';
    ValueConstants.userId = '';
    await GetItUtils.prefs.removeData(SharedPrefKeys.token);
    GetItUtils.prefs.removeData(SharedPrefKeys.userID).then((value) =>
        Utils.openNewPage(const WelcomeScreen(), popPreviousPages: true));
  }
}
