import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class VerificationCompleteScreen extends StatefulWidget {
  const VerificationCompleteScreen({super.key});

  @override
  State<VerificationCompleteScreen> createState() =>
      _VerificationCompleteScreenState();
}

class _VerificationCompleteScreenState
    extends State<VerificationCompleteScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
    ).then((value) => Utils.openNewPage(const ResetPassScreen()));
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
                const Spacer(
                  flex: 1,
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(start: 56.0, end: 97.0),
                  child: DaakeshLogoWidget(),
                ),
                const Spacer(
                  flex: 1,
                ),
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.png.checkIcon.path))),
                ),
                const SizedBox(
                  height: 19.0,
                ),
                Text('Verification Complete!',
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 32.0)),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
