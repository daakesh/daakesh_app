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

  @override
  UserModel userData = UserModel();

  @override
  void setUserDataAndCheckIsActive(UserModel userData) {
    this.userData = userData;
    if(userData.active == 0){
      activateUser;
      return;
    }
    ValueConstants.userId =userData.id.toString();
    ValueConstants.token =userData.token.toString();
    saveUserToken;
    openNewPage(const MainScreen(),popPreviousPages: true);

  }

  @override
  void setUserData(UserModel userData)=> this.userData = userData;

  @override
  void get activateUser=> FirebaseAuthentication.verifyPhoneNumber(userData.phoneNumber.toString(),AuthManner.SIGNUPIN);

  @override
  void get saveUserToken async => await Future.wait<void>([
    prefs.setString('token', userData.token.toString()),
    prefs.setString('userId', userData.id.toString())],
  );

  @override
  void logOut() async {
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 2));
    ProgressCircleDialog.dismiss();
    ValueConstants.userId ='';
    prefs.removeData('userId').then((value) => openNewPage(SplashScreen(), popPreviousPages: true));
  }











}
