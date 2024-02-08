import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class AddPaymentCardScreen extends StatelessWidget {
  const AddPaymentCardScreen({super.key});

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
                  const Spacer(flex: 1,),
                  Assets.svg.creditCardLogoIcon.svg(height:167.0 ,width:216.0,),
                  const SizedBox(height: 35.0,),
                  Text('Add Your Payment Card',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 28.0)),
                  const SizedBox(height: 9.0,),
                  Text('Shop With A Variety Of Products From Daakesh',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 15,)),
                  const Spacer(flex: 1,),
                  DefaultButtonWidget(text: 'ADD PAYMENT CARD', onPressed: addPaymentCard),
                  const SizedBox(height: 9.0,),
                  OutlineButtonWidget(text: 'LATER', onPressed: onLater),
                  const SizedBox(height: 72.0,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void addPaymentCard(){
    openNewPage(RegisterCardInfoScreen());
  }
  void onLater(){
    openNewPage(const MainScreen(),popPreviousPages: true);

  }
}
