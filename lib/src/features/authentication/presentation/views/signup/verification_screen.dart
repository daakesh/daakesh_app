import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
    ).then((value) =>
        Utils.openNewPage(const MainScreen(), popPreviousPages: true));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 70, 21, 21),
        body: LayoutBuilderWidget(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                const Center(child: GeneralDaakeshLogoWidget()),
                const Spacer(
                  flex: 1,
                ),
                Container(
                  width: 150.0.w,
                  height: 150.0.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.png.checkIcon.path))),
                ),
                SizedBox(
                  height: 19.0.h,
                ),
                Text(context.locale.verification_title,
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 32.0.sp)),
                SizedBox(
                  height: 9.0.h,
                ),
                Text(context.locale.verification_instruction,
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 18.0.sp)),
                const Spacer(
                  flex: 1,
                ),
                SizedBox(
                  height: 100.0.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
