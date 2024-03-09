import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../src.export.dart';

class SendOfferScreen extends StatelessWidget {
  const SendOfferScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.whiteSmoke,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child:SizedBox(height: 8.0,),),
          SliverToBoxAdapter(child:Container(
            width: double.infinity,
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 21.0),
            decoration: const BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    offset: Offset(0,3),
                    blurRadius: 6.0,
                  )
                ]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 11.0,),
                Expanded(
                  child: Padding(
                    padding:  const EdgeInsets.only(top: 32.0),
                    child: Assets.png.glasses.image(),
                  ),
                ),
                const SizedBox(width: 18.0,),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 20.0),
                        child: Text('AquaOasis™ Cool Mist Humidefier (2.2L Water',
                          style: easyTheme.textTheme.bodyMedium!.copyWith(
                              fontSize: 20.0,
                              color: ColorName.gray,
                              overflow: TextOverflow.fade
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Assets.svg.locationPinIcon.svg(color: ColorName.amber,height: 22.0,width: 15.0),
                          const SizedBox(width: 6.0,),
                          Expanded(child: Text('Swap In Amman, Jordan',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize:16.0),overflow:TextOverflow.fade ,)),
                        ],),
                      const SizedBox(height: 15.0,),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 6.0),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: 'By ',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 20.0,color: ColorName.gray)),
                              TextSpan(text: 'NF Store',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 20.0)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 13.0),
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: TextButtonWidget(
                            text: 'See Details',
                            style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 14.0,color: ColorName.skyBlue),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],),
                ),
              ],),
          ),),
          const SliverToBoxAdapter(child:SizedBox(height: 8.0,),),
          SliverToBoxAdapter(child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              'Choose From Your Products What You Want To Exchange',
              textAlign: TextAlign.center,
              style: easyTheme.textTheme.headlineMedium!.copyWith(
                fontSize: 22.0,
              ),
            ),
          ),),
          const SliverToBoxAdapter(child:SizedBox(height: 15.0,),),
          SliverToBoxAdapter(
            child: CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 0.85,
                  initialPage: 0,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {}),
              items: [1,2,3,4,5].map((i) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsetsDirectional.only(end: 16.0,bottom: 8.0),
                  decoration: const BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                          offset: Offset(0, 3),
                          blurRadius: 6.0,
                        )
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 11.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child:
                          Assets.png.glasses.image(),
                        ),
                      ),
                      const SizedBox(
                        width: 18.0,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(end: 8.0),
                                child: Text(
                                  'AquaOasis™ Cool Mist Humidefier (2.2L Water',
                                  maxLines: 3,
                                  style: easyTheme.textTheme.bodyMedium!.copyWith(
                                      fontSize: 20.0,
                                      color: ColorName.gray,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 66.0),
                              decoration: BoxDecoration(
                                color: ColorName.red,
                                borderRadius:
                                BorderRadius.all(Radius.circular(4.0.r)),
                              ),
                              child: Center(
                                child: Text(
                                  'SWAP',
                                  textAlign: TextAlign.center,
                                  style: easyTheme.textTheme.headlineMedium!
                                      .copyWith(
                                      fontSize: 14.0, color: ColorName.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            TextButtonWidget(
                              text: 'See Details',
                              onPressed: () {},
                              style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 14.0,color: ColorName.skyBlue),

                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),

            ),
          ),
          const SliverToBoxAdapter(child:SizedBox(height: 15.0,),),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.svg.iosArrowBack.svg(),
                const SizedBox(width: 6.0,),
                Assets.svg.iosArrowForward.svg(),
              ],
            ),
          ),
          const SliverToBoxAdapter(child:SizedBox(height: 13.0,),),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('You can Make offer Better',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.black.withOpacity(0.5)),),
                  Container(
                    height: 103.0,
                    width: double.infinity,
                    padding: const EdgeInsetsDirectional.only(start: 10.0,end:10,top: 7.0),
                    decoration: const BoxDecoration(
                        color: ColorName.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))
                    ),
                    child: TextFormFieldWidget(
                      controller: TextEditingController(),
                      hintText: 'Comment',
                      isUnderlineOn: true,
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child:SizedBox(height: 40.0,),),
          SliverToBoxAdapter(
            child: Center(child: DefaultButtonWidget(text: 'SEND OFFER',onPressed: sendOffer)),
          ),
          const SliverToBoxAdapter(child:SizedBox(height: 50.0,),),
        ],
      ),
    );
  }
  void sendOffer() {
    SwapBloc.get.add(SwapGetToTopScreenEvent());
    SwapBloc.get.add(ToggleSwapScreenStateEvent(swapScreenState: SwapScreenState.OFFERDETAILS));
  }

}
