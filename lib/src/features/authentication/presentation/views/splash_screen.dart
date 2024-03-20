import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../src.export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorName.transparent,
      ),
    );
    return Container(
      decoration: BoxDecoration(
        color: ColorName.white,
        image: DecorationImage(
          image: AssetImage(Assets.png.splashScreenBackground.path),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 53.0.w,end: 105.w),
            child: const DaakeshLogoWidget(),
          ),
        ),
      ),
    );
  }
  void checkLogin() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) => checkUserLogin());
  }
  void checkUserLogin() {
    if (ValueConstants.userId.isEmpty) {
      openNewPage(const WelcomeScreen(),popPreviousPages: true);
      return;
    }
    getUserData();
    openNewPage(const MainScreen(),popPreviousPages: true);
  }
  void getUserData(){
    UserDataBloc.get.add(GetUserDataEvent());
  }
}


