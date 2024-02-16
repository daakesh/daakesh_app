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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 110.0,),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 38.0),
                    child: Align(alignment: AlignmentDirectional.centerStart,child: DaakeshLogoWidget()),
                  ),
                  //const SizedBox(height: 185.0,),
                  const Spacer(flex: 1,),
                  Container(
                    width: 150.0,
                    height: 150.0,
                    decoration:BoxDecoration(
                      image: DecorationImage(image: AssetImage(Assets.png.checkIcon.path))
                    ),
                  ),
                  const SizedBox(height: 19.0,),
                  Text('Verification Complete!',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 32.0)),
                  const SizedBox(height: 9.0,),
                  Text('Now You Can Start And Find Best Deals',style: easyTheme.textTheme.bodyMedium),
                  const Spacer(flex: 1,),
                  const SizedBox(height: 100.0,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
