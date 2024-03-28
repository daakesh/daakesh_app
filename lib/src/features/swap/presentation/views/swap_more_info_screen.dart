import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class SwapMoreInfoScreen extends StatefulWidget {
  const SwapMoreInfoScreen({super.key});

  @override
  State<SwapMoreInfoScreen> createState() => _SwapMoreInfoScreenState();
}

class _SwapMoreInfoScreenState extends State<SwapMoreInfoScreen> {
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.onDrag ,
      child: GestureDetector(
        onTap: ()=>context.disMissKeyboard,
        child: BlocBuilder<SwapPassDataBloc, SwapPassDataState>(
          builder: (_, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 17.5, end: 26.0, top: 12.0),
                  child: SwapProductCarousalSlider(state: state),
                ),
                const Divider(color: ColorName.gray,thickness: 3.0),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 17.5, end: 24.0,bottom: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.trendDealsListData.first.title}',
                        style: easyTheme.textTheme.bodyMedium!
                            .copyWith(fontSize: 24.0, color: ColorName.gray),
                      ),
                      const SizedBox(height: 18.0),
                      Row(children: [
                        // ignore: deprecated_member_use_from_same_package
                        Assets.svg.locationPinIcon.svg(height: 21.0,width: 21.0,color: ColorName.amber),
                        const SizedBox(width: 6.5,),
                          Text.rich(
                            TextSpan(
                              style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 16.0,),
                              children: [
                                const TextSpan(text: 'Swap In ',),
                                TextSpan(text: '${state.trendDealsListData.first.citySwap}, ',),
                                TextSpan(text: '${state.trendDealsListData.first.countrySwap}, ',),
                              ],
                            ),
                          ),
                      ],),
                      const SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: '(',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 23.0,color: ColorName.gray)),
                                  TextSpan(text: '25',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 23.0,color: ColorName.red)),
                                  TextSpan(text: ')',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 23.0,color: ColorName.gray)),
                                  TextSpan(text: ' Offers Submitted',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 23.0,color: ColorName.black)),
                                ],
                              ),
                            ),
                          ),
                          Text('${state.trendDealsListData.first.date}',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 15.0,color: ColorName.grayishBlue),)
                        ],
                      ),
                      const SizedBox(height: 28.0),
                      SwapDetailsSection(state: state,),
                      Center(child: DefaultButtonWidget(text: 'CREATE SWAP OFFER', onPressed: onSendOffer)),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void onSendOffer() {
    SwapProBloc.get.add(GetSwapProductEvent());
    SwapBloc.get.add(SwapGetToTopScreenEvent());
    SwapBloc.get.add(ToggleSwapScreenStateEvent(swapScreenState: SwapScreenState.SENDOFFER));
  }
}