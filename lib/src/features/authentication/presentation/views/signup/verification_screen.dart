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
    ).then((value) => openNewPage(const AddPaymentCardScreen()));
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
                SizedBox(height: 110.0.h,),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 56.0.w,end: 97.0.w),
                  child: const DaakeshLogoWidget(),
                ),
                const Spacer(flex: 1,),
                Container(
                  width: 150.0.w,
                  height: 150.0.h,
                  decoration:BoxDecoration(
                    image: DecorationImage(image: AssetImage(Assets.png.checkIcon.path))
                  ),
                ),
                SizedBox(height: 19.0.h,),
                Text('Verification Complete!',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 32.0.sp)),
                SizedBox(height: 9.0.h,),
                Text('Now You Can Start And Find Best Deals',style: easyTheme.textTheme.bodyMedium),
                const Spacer(flex: 1,),
                SizedBox(height: 100.0.h,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
