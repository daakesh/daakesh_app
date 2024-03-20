import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class SwapProductCarousalSlider extends StatelessWidget {
  final SwapPassDataState state;
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
                '${state.trendDealsListData.first.user!.name}',
                style: easyTheme.textTheme.bodyMedium!
                    .copyWith(fontSize: 20.0),
              ),
              const Spacer(
                flex: 1,
              ),
              GestureDetector(
                onTap: ()=>SwapPassDataBloc.get.add(SwapZoomInOutEvent()),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Assets.svg.zoomInIcon.svg(),
                ),
              ),

            ],
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
              height: 250.0,
              viewportFraction: 1,
              initialPage: 0,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                SwapPassDataBloc.get.add(ChangeProductSliderIndex(sliderIndex:index));
              }),
          items: state.trendDealsListData.first.itemImg!.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Transform.scale(
                    scale: state.scale,
                    child: CachedImage(imageUrl: i.toString()));
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 30.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: state.trendDealsListData.first.itemImg!.asMap().entries.map((entry) {
            return Container(
              width: 12.0,
              height: 12.0,
              margin: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: state.sliderIndex == entry.key
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
