import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class SwapMoreInfoProductScreen extends StatefulWidget {
  const SwapMoreInfoProductScreen({super.key});

  @override
  State<SwapMoreInfoProductScreen> createState() => _SwapMoreInfoProductScreenState();
}

class _SwapMoreInfoProductScreenState extends State<SwapMoreInfoProductScreen> {
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.onDrag ,
      child: InkWell(
        focusColor: ColorName.transparent,
        highlightColor: ColorName.transparent,
        splashColor: ColorName.transparent,
        onTap: ()=>context.disMissKeyboard,
        child: BlocBuilder<SwapBloc, SwapState>(
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
                        'AquaOasis™ Cool Mist Humidefier (2.2L Water ',
                        style: easyTheme.textTheme.bodyMedium!
                            .copyWith(fontSize: 24.0, color: ColorName.gray),
                      ),
                      const SizedBox(height: 18.0),
                      Row(children: [
                        Assets.svg.locationPinIcon.svg(height: 21.0,width: 21.0,color: ColorName.amber),
                        const SizedBox(width: 6.5,),
                        Text('Swap In Amman, Jordan',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 16.0,),),
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
                          Text('25/5/2023',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 15.0,color: ColorName.grayishBlue),)
                        ],
                      ),
                      const SizedBox(height: 28.0),
                      SwapDetailsSection(state: state,),
                      Center(child: DefaultButtonWidget(text: 'CREATE SWAP OFFER', onPressed: (){})),
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
}