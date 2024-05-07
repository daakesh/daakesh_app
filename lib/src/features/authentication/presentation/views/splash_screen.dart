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
      child: const Scaffold(
        backgroundColor: ColorName.transparent,
        body: Center(child: DaakeshLogoWidget()),
      ),
    );
  }

  void checkLogin() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      checkUserLogin();
    });
  }

  void checkUserLogin() {
    ProfileBloc.get.add(SetValueLangEvent());
    if (ValueConstants.userId.isEmpty) {
      Utils.openNewPage(const MainScreen(), popPreviousPages: true);
      return;
    }
    getUserData();
    Utils.openNewPage(const MainScreen(), popPreviousPages: true);
  }

  void getUserData() {
    if (ValueConstants.userId.isEmpty) {
      return;
    }
    UserDataBloc.get.add(GetUserDataEvent());
  }
}
