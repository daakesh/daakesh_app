import 'package:daakesh/src/src.export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          builder: (_, child) {
            return BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return MaterialApp(
                  title: 'Daakesh',
                  debugShowCheckedModeBanner: false,
                  locale: Locale(state.switchLangValue ? 'ar' : 'en'),
                  theme: AppTheme.lightMode,
                  localizationsDelegates: context.localizationsDelegates,
                  supportedLocales: context.supportedLocales,
                  navigatorKey: Utils.navigatorKey,
                  home: const SplashScreen(),
                );
              },
            );
          }),
    );
  }
}
