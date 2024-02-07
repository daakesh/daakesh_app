import 'package:injectable/injectable.dart';
import '../../src.export.dart';

final user = getIt.get<UserData>();

abstract class UserData {
  UserModel userData = UserModel();
  void setUserData(UserModel userModel);
  void get activateUser;
  void get saveUserToken;
  void logOut();
}

@Singleton(as: UserData)
class UserDataImpl implements UserData {
  UserDataImpl();

  @override
  UserModel userData = UserModel();

  @override
  void setUserData(UserModel userData) {
    this.userData = userData;
    if(userData.active == 0){
      activateUser;
      return;
    }
    ProgressCircleDialog.dismiss();
    saveUserToken;
    openNewPage(const MainScreen(),popPreviousPages: true);

  }

  @override
  void get activateUser=> FirebaseAuthentication.verifyPhoneNumber(userData.phoneNumber.toString());

  @override
  void get saveUserToken async => await prefs.setString('token', userData.token.toString());

  @override
  void logOut() async {
    await prefs.removeData('token');
    openNewPage(const SplashScreen(),popPreviousPages: true);
  }
}
