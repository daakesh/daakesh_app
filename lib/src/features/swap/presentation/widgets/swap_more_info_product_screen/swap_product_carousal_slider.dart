import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class SwapProductCarousalSlider extends StatelessWidget {
  final SwapState state;
  SwapProductCarousalSlider({super.key, required this.state});

  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'By',
                style: easyTheme.textTheme.bodyMedium!
                    .copyWith(fontSize: 20.0, color: ColorName.gray),
              ),
              const SizedBox(
                width: 6.0,
              ),
               Text(
                'NF Store',
                style: easyTheme.textTheme.bodyMedium!
                    .copyWith(fontSize: 20.0),
              ),
              const Spacer(
                flex: 1,
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Assets.svg.zoomInIcon.svg(),
              ),
            ],
          ),
        ),
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
              height: 250.0,
              viewportFraction: 1,
              initialPage: 0,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                SwapBloc.get.add(SwapSelectProductPropertiesEvent(productSliderIndex: index));
              }),
          items: [1, 2, 3].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Assets.png.glasses.image();
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 30.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [1, 2, 3].asMap().entries.map((entry) {
            return Container(
              width: 12.0,
              height: 12.0,
              margin: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: state.productSliderIndex == entry.key
                    ? ColorName.lightOrange
                    : ColorName.silverGray,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
