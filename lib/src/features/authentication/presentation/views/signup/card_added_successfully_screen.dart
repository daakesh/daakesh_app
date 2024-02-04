import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class CardAddedSuccessfullyScreen extends StatelessWidget {
  const CardAddedSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthenticationBackgroundWidget(
      widget: Scaffold(
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
                 // const SizedBox(height: 185.0,),
                  const Spacer(flex: 1,),
                  Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: const BoxDecoration(
                      color: ColorName.amber,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check,color: ColorName.white,size: 150.0),
                  ),
                  const SizedBox(height: 19.0,),
                  Text('The payment card has been added successfully',
                      style: easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 26.0),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 9.0,),
                  const Spacer(flex: 1,),
                  DefaultButtonWidget(text: 'START SHOPPING', onPressed: onStartShopping),
                  const SizedBox(height: 72.0,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void onStartShopping(){}
}
