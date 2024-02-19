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
    Future.delayed(
      const Duration(seconds: 2),
    ).then((value) => checkUserLogin());

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
  void checkUserLogin() {
    if (ValueConstants.token.isEmpty) {
      openNewPage(const WelcomeScreen(),popPreviousPages: true);
      return;
    }
    openNewPage(const MainScreen(),popPreviousPages: true);
  }
}