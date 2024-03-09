import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class ResetPassSuccessScreen extends StatefulWidget {
  const ResetPassSuccessScreen({super.key});

  @override
  State<ResetPassSuccessScreen> createState() => _ResetPassSuccessScreenState();
}

class _ResetPassSuccessScreenState extends State<ResetPassSuccessScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
    ).then((value) => openNewPage(const LoginScreen(),popPreviousPages: true));
  }
  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 1,),
                const Padding(
                  padding: EdgeInsetsDirectional.only(start: 56.0,end: 97.0),
                  child: DaakeshLogoWidget(),
                ),
                const Spacer(flex: 1,),
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration:BoxDecoration(
                      image: DecorationImage(image: AssetImage(Assets.png.checkIcon.path))
                  ),
                ),
                const SizedBox(height: 19.0,),
                Text('Reset Complete!',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 32.0)),
                Text('Now You Can Start And Find Best Deals',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 17.0)),
                const Spacer(flex: 2,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
