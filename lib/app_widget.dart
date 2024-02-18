import 'package:daakesh/src/src.export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Key to navigate without context');
ThemeData get easyTheme => Theme.of(navigatorKey.currentState!.context);

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return listOfBloc(
      child: ScreenUtilInit(
          designSize: const Size(430, 945),
          builder: (_,child) {
            return MaterialApp(
              title: 'Currency Task',
              debugShowCheckedModeBanner: false,
              locale: const Locale('en'),
              theme: AppTheme.lightMode,
              localizationsDelegates: context.localizationsDelegates,
              supportedLocales: context.supportedLocales,
              navigatorKey: navigatorKey,
              home: const SplashScreen(),
            );
          }
      ),
    );
  }
}
