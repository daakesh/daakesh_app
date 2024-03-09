import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class ExchangeOfferScreen extends StatelessWidget {
  const ExchangeOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: Column(
            children: [
              const Spacer(flex: 3,),
              const DaakeshLogoWidget(),
              const Spacer(flex: 1,),
              Assets.svg.exchangeLogo.svg(),
              const SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: FittedBox(
                  child: Text('Your Exchange Offer Has Been Sent',textAlign: TextAlign.center,
                  style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 21.0),
                  ),
                ),
              ),
              const SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('If Your Offer Is Approved, This Will Be Shown To\nYou On The My Orders Page',textAlign: TextAlign.center,
                  style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 15.0),

                ),
              ),
              const Spacer(flex: 2,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: DefaultButtonWidget(text: 'CREATE OTHER SWAP OFFER', onPressed: ()=>createOtherSwapOffer(context)),
              ),
              const SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: OutlineButtonWidget(text: 'BACK TO STORE', onPressed: ()=>backToStore(context))),
              const Spacer(flex: 1,),
            ],
          ),
        ),
      ),
    );
  }

  void createOtherSwapOffer(context){
    SwapBloc.get.add(ToggleSwapScreenStateEvent(swapScreenState:SwapScreenState.SENDOFFER));
    Navigator.pop(context);

  }
  void backToStore(context){
    SwapBloc.get.add(ToggleSwapScreenStateEvent(swapScreenState:SwapScreenState.HOME));
    Navigator.pop(context);
  }

}
