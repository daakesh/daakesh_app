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
              const Spacer(
                flex: 3,
              ),
              const DaakeshLogoWidget(),
              const Spacer(
                flex: 1,
              ),
              Assets.svg.exchangeLogo.svg(),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: FittedBox(
                  child: Text(
                    context.locale.exchange_offer_title,
                    textAlign: TextAlign.center,
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 21.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  context.locale.exchange_offer_instruction,
                  textAlign: TextAlign.center,
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 15.0),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: DefaultButtonWidget(
                    text: context.locale.exchange_offer_create_button_title,
                    onPressed: () => createOtherSwapOffer(context)),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: OutlineButtonWidget(
                      text: context.locale.exchange_offer_back_button_title,
                      onPressed: () => backToStore(context))),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createOtherSwapOffer(context) {
    Utils.openNewPage(const MainScreen());
  }

  void backToStore(context) {
    Utils.openNewPage(const MainScreen());
  }
}
