import 'package:injectable/injectable.dart';
import '../../src.export.dart';

final user = getIt.get<UserData>();

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
  UserDataImpl(){
    ///lang = prefs.getData('lang') ?? 'en';
  }

  @override
  UserModel userData = UserModel();

  @override
  void setUserDataAndCheckIsActive(UserModel userData) {
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
  void setUserData(UserModel userData)=> this.userData = userData;

  @override
  void get activateUser=> FirebaseAuthentication.verifyPhoneNumber(userData.phoneNumber.toString());

  @override
  void get saveUserToken async => await prefs.setString('token', userData.token.toString());

  @override
  void logOut() async {
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 2));
    ProgressCircleDialog.dismiss();
    ValueConstants.token ='';
    prefs.removeData('token').then((value) => openNewPage(const SplashScreen(), popPreviousPages: true));
  }











}
