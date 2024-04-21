import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class StartSwapScreen extends StatelessWidget {
  final SendReceiveSwapReqItem sendReceiveSwapReqItem;

  const StartSwapScreen({super.key, required this.sendReceiveSwapReqItem});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorName.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorName.whiteSmoke,
          body: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: HeaderWidget(withArrowBack: true, isLight: true),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 15.0,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsetsDirectional.symmetric(horizontal: 21.0),
                  decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.all(Radius.circular(4.0.r)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(0, 0, 0, 0.16),
                          offset: const Offset(0, 3),
                          blurRadius: 6.0.r,
                        )
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 11.0.w,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: CachedImage(
                            imageUrl:
                                sendReceiveSwapReqItem.offerItems!.itemImg !=
                                        null
                                    ? sendReceiveSwapReqItem
                                        .offerItems!.itemImg!.first
                                    : '',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 18.0.w,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 45.0.w),
                              child: Text(
                                '${sendReceiveSwapReqItem.offerItems!.title}\n',
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 20.0.sp,
                                        color: ColorName.gray,
                                        overflow: TextOverflow.fade),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Assets.svg.locationPinIcon.svg(
                                    color: ColorName.amber,
                                    height: 22.0,
                                    width: 15.0.w),
                                SizedBox(
                                  width: 6.0.w,
                                ),
                                Expanded(
                                    child: Text(
                                  'Swap In ${sendReceiveSwapReqItem.offerItems!.citySwap}, ${sendReceiveSwapReqItem.offerItems!.countrySwap}',
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(fontSize: 16.0.sp),
                                  overflow: TextOverflow.fade,
                                )),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.only(start: 6.0.w),
                                child: Text('Your Product',
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(fontSize: 20.0.sp))),
                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 13.0.w),
                              child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: TextButtonWidget(
                                  text: 'See Details',
                                  onPressed: () {},
                                  isBold: true,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 13.0,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: Assets.png.swapIcon.image(),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 8.0,
                ),
              ),
              SliverToBoxAdapter(
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 15.0.sp),
                    children: [
                      const TextSpan(
                          text: 'Select The Product You Want To Trade\n'),
                      const TextSpan(text: '('),
                      TextSpan(
                          text: '25',
                          style: context.easyTheme.textTheme.headlineMedium!
                              .copyWith(
                                  color: ColorName.red, fontSize: 15.0.sp)),
                      const TextSpan(text: ') '),
                      const TextSpan(text: 'Offers Submitted'),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 13.0,
                ),
              ),
              SliverToBoxAdapter(
                child: CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 1,
                        initialPage: 0,
                        height: Utils.getScreenHeight(context) * 0.65,
                        scrollDirection: Axis.horizontal,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {}),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Padding(
                        padding: const EdgeInsetsDirectional.only(start: 21.0),
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(
                              end: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                              color: ColorName.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0.r)),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromRGBO(0, 0, 0, 0.16),
                                  offset: const Offset(0, 3),
                                  blurRadius: 6.0.r,
                                )
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 3.0, start: 12.0.w),
                                    constraints: BoxConstraints(
                                        minHeight: 22.0, minWidth: 66.0.w),
                                    decoration: BoxDecoration(
                                      color: ColorName.darkGreen,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.0.r)),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'New',
                                      style: context
                                          .easyTheme.textTheme.labelLarge!
                                          .copyWith(fontSize: 14.0.sp),
                                    )),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 11.0.w,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 32.0),
                                      child: Assets.png.glasses.image(),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18.0.w,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.only(
                                                  end: 30.0),
                                          child: Text(
                                            'AquaOasis™ Cool Mist Humidefier (2.2L Water\n\n\n',
                                            maxLines: 3,
                                            style: context
                                                .easyTheme.textTheme.bodyMedium!
                                                .copyWith(
                                                    fontSize: 20.0,
                                                    color: ColorName.gray,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Assets.svg.locationPinIcon.svg(
                                                color: ColorName.amber,
                                                height: 22.0,
                                                width: 15.0.w),
                                            SizedBox(
                                              width: 6.0.w,
                                            ),
                                            Expanded(
                                                child: Text(
                                              'Swap In Amman, Jordan',
                                              style: context.easyTheme.textTheme
                                                  .bodyMedium!
                                                  .copyWith(fontSize: 16.0.sp),
                                              overflow: TextOverflow.fade,
                                            )),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: 6.0.w),
                                            child: Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                      text: 'By ',
                                                      style: context.easyTheme
                                                          .textTheme.bodyMedium!
                                                          .copyWith(
                                                              fontSize: 20.0.sp,
                                                              color: ColorName
                                                                  .gray)),
                                                  TextSpan(
                                                      text: 'NF Store',
                                                      style: context.easyTheme
                                                          .textTheme.bodyMedium!
                                                          .copyWith(
                                                              fontSize:
                                                                  20.0.sp)),
                                                ],
                                              ),
                                            )),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              end: 13.0.w, top: 14.0),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional.centerEnd,
                                            child: TextButtonWidget(
                                              text: 'See Product Details',
                                              onPressed: () {},
                                              style: context.easyTheme.textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                fontSize: 14.0.sp,
                                                fontWeight: FontWeight.bold,
                                                color: ColorName.skyBlue,
                                              ),
                                              isBold: true,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: 22.0.w, end: 14.0.w),
                                child: Text(
                                  'Your Comment',
                                  style: context.easyTheme.textTheme.bodyLarge!
                                      .copyWith(
                                          fontSize: 20.0.sp,
                                          color:
                                              ColorName.black.withOpacity(0.5)),
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: 22.0.w, end: 12.0.w, bottom: 17.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\n\n\n\n\n\n\n',
                                  maxLines: 7,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.easyTheme.textTheme.bodyLarge!
                                      .copyWith(
                                    fontSize: 14.0.sp,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 13.0.w,
                                  ),
                                  Expanded(
                                    child: DefaultButtonWidget(
                                      text: 'ACCEPT THE OFFER',
                                      style: context
                                          .easyTheme.elevatedButtonTheme.style!
                                          .copyWith(
                                        textStyle: MaterialStateProperty.all(
                                            context
                                                .easyTheme.textTheme.bodyMedium!
                                                .copyWith(fontSize: 13.0.sp)),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.0.w,
                                  ),
                                  Expanded(
                                    child: DefaultButtonWidget(
                                      text: 'Reject',
                                      style: context
                                          .easyTheme.elevatedButtonTheme.style!
                                          .copyWith(
                                        textStyle: MaterialStateProperty.all(
                                            context
                                                .easyTheme.textTheme.bodyMedium!
                                                .copyWith(
                                          fontSize: 13.0.sp,
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                ColorName.red),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13.0.w,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList()),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.svg.iosArrowBack.svg(),
                    const SizedBox(
                      width: 6.0,
                    ),
                    Assets.svg.iosArrowForward.svg(),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 50.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
