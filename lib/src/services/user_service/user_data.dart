import 'package:injectable/injectable.dart';
import '../../src.export.dart';

abstract class UserData {
  UserModel userData = UserModel();
  void setUserDataAndCheckIsActive(UserModel userModel);
  void setUserData(UserModel userData);
  void get activateUser;
  void get saveUserToken;
  void logOut();
}

@Singleton(as: UserData)
class UserDataImpl implements UserData {
  @override
  UserModel userData = UserModel();

  @override
  void setUserDataAndCheckIsActive(UserModel userData) {
    this.userData = userData;
    if (userData.active == 0) {
      activateUser;
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
  void get activateUser => FirebaseAuthentication.verifyPhoneNumber(
      userData.phoneNumber.toString(), AuthManner.SIGNUPIN);

  @override
  void get saveUserToken async => await Future.wait<void>([
        GetItUtils.prefs
            .setString(SharedPrefKeys.token, userData.token.toString()),
        GetItUtils.prefs
            .setString(SharedPrefKeys.userID, userData.id.toString())
      ]);
  @override
  void logOut() async {
    UserDataBloc.get.add(LogoutUserEvent());
    ValueConstants.token = '';
    ValueConstants.userId = '';
    await GetItUtils.prefs.removeData(SharedPrefKeys.token);
    GetItUtils.prefs.removeData(SharedPrefKeys.userID).then((value) =>
        Utils.openNewPage(const SplashScreen(), popPreviousPages: true));
  }
}
