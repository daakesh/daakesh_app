import 'package:daakesh/src/src.export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Key to navigate without context');
ThemeData easyTheme() => Theme.of(navigatorKey.currentState!.context);


class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Currency Task',
      debugShowCheckedModeBanner: false,
      locale: const Locale.fromSubtags(languageCode: 'en'),
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      navigatorKey: navigatorKey,
      home:const Screen1(),
    );
  }
}



class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: MaterialButton(onPressed: (){},
        color: Colors.lightBlue,
        child:  Text(getLoc.log_in_button_title),
      ),
    ));
  }
}

