import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daakesh/src/src.export.dart';


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
      child: MaterialApp(
        title: 'Currency Task',
        debugShowCheckedModeBanner: false,
        locale: const Locale.fromSubtags(languageCode: 'en'),
        theme: AppTheme.lightMode,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        navigatorKey: navigatorKey,
        home: const SplashScreen(),
      ),
    );
  }
}










