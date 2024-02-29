import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class HomeCarouselSliderWidget extends StatefulWidget {
  final List<AdvItem> data;
  const HomeCarouselSliderWidget({
    super.key,
    required this.data,
  });

  @override
  State<HomeCarouselSliderWidget> createState() => _HomeCarouselSliderWidgetState();
}

class _HomeCarouselSliderWidgetState extends State<HomeCarouselSliderWidget> {
  final controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
              height: 160.0,
              viewportFraction: 1,
              initialPage: 0,
              autoPlay: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: widget.data.map((i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Container(
                  width: getScreenWidth(context),
                  padding: const EdgeInsetsDirectional.only(start: 25.0),
                  decoration: const BoxDecoration(
                      color: ColorName.blueGray,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 38.0,),
                          Text('Today\'s Deals',style: easyTheme.textTheme.headlineMedium!.copyWith(color: ColorName.white),),
                          const SizedBox(height: 35.0,),
                          Container(
                            height: 36.0.h,
                            constraints: const BoxConstraints(minWidth: 108.0),
                            padding: const EdgeInsetsDirectional.symmetric(horizontal: 6.0),
                            decoration: const BoxDecoration(
                                color: ColorName.red,
                                borderRadius: BorderRadius.all(Radius.circular(4.0))
                            ),
                            child: Center(child: Text('23% OFF',style: easyTheme.textTheme.labelLarge,),),
                          ),

                        ],
                      ),
                      const Spacer(flex: 1,),
                      FadeInImageWidget(imageUrl: i.image.toString(),width: 150.0,height: 150.0,radius: 16.0,),
                      const SizedBox(width: 8.0,)
                    ],
                  )
              ),
            );
          }).toList(),

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.data.asMap().entries.map((entry) {
            return InkWell(
              onTap: () => controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == entry.key
                      ? ColorName.lightOrange
                      : ColorName.silverGray,
                ),
              ),
            );
          }).toList(),
        ),

      ],
    );
  }
}