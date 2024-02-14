import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class CardAndAccountScreen extends StatelessWidget {
  const CardAndAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  AuthenticationBackgroundWidget(
      widget: Scaffold(
        backgroundColor:ColorName.transparent,
        body: LayoutBuilderWidget(
          child: BlocBuilder<ProfileBloc, ProfileState>(builder: (_, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 108.0,
                  ),
                  Text(
                    'Card And Accounts',
                    style: easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 36.0),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Text(
                    'Payment Method',
                    style: easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 25.0),
                  ),
                  const SizedBox(
                    height: 19.0,
                  ),
                  Text(
                    'This information is required to allow your customers to communicate with you. Your account information is used if it is not changed',
                    style: easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 16.0),
                  ),
                  state.isUpdateActive
                      ? Padding(
                        padding: const EdgeInsets.only(top: 29.0),
                        child: Text(
                                            'Select the card',
                                            style: easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 18.0),
                                          ),
                      )
                      : const SizedBox(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CardItem(title: 'XXXX- 1236', index: 1, activeIndex: 1, onTap: () {},cardType: CardsTypes.VISA),
                  const SizedBox(height: 14.0,),
                  CardItem(title: 'XXXX- 1236', index: 2, activeIndex: 1, onTap: () {},cardType: CardsTypes.MASTERCARD),
                  state.isUpdateActive
                      ? InkWell(
                          splashColor: ColorName.transparent,
                          highlightColor: ColorName.transparent,
                          focusColor: ColorName.transparent,
                          onTap: () {
                            openNewPage(RegisterCardInfoScreen(
                              isLoggedIn: true,
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 31.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: ColorName.amber,
                                  size: 30,
                                ),
                                Text(
                                  'Add Payment Card',
                                  style: easyTheme.textTheme.bodyLarge!
                                      .copyWith(
                                          fontSize: 18.0,
                                          color: ColorName.black
                                              .withOpacity(0.55)),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 44.0,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Center(
                    child: DefaultButtonWidget(
                        text: !state.isUpdateActive ? 'MAKE EDIT':'DELETE', onPressed: ()=>onMakeEdit(state.isUpdateActive)),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Center(
                    child:
                    OutlineButtonWidget(text: 'Cancel', onPressed: ()=>cancel(state.isUpdateActive)),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
  void onMakeEdit(bool isUpdateActive){
    ProfileBloc.get.add(ActivateUpdateEvent(isUpdatePersonalActive: true));
  }
  void cancel(bool isUpdateActive){
    ProfileBloc.get.add(ActivateUpdateEvent(isUpdatePersonalActive: false));
  }
}
