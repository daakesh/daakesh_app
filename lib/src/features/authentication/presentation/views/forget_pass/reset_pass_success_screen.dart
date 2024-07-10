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
    ).then((value) =>
        Utils.openNewPage(const LoginScreen(), popPreviousPages: true));
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
                Text(context.locale.reset_pass_success_title,
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 32.0.sp)),
                Text(context.locale.reset_pass_success_instruction,
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 17.0.sp)),
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
