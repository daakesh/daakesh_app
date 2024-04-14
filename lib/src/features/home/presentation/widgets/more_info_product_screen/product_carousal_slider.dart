import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class ProductCarousalSlider extends StatelessWidget {
  final PassDataState state;
  ProductCarousalSlider({super.key, required this.state});

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
                style: context.easyTheme.textTheme.bodyMedium!
                    .copyWith(fontSize: 20.0, color: ColorName.gray),
              ),
              const SizedBox(
                width: 6.0,
              ),
              !state.isDaakeshTodayDeal
                  ? DaakeshLogoWidget(
                      width: 140.0.w,
                    )
                  : Text(
                      '${state.todayItem.first.user!.name}',
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 20.0),
                    ),
              const Spacer(
                flex: 1,
              ),
              GestureDetector(
                onTap: () => PassDataBloc.get.add(ZoomInOutEvent()),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Assets.svg.zoomInIcon.svg(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        InteractiveViewer(
          child: CarouselSlider(
            carouselController: controller,
            options: CarouselOptions(
                viewportFraction: 1,
                height: 250.0,
                onPageChanged: (index, reason) {
                  PassDataBloc.get.add(
                      SelectProductPropertiesEvent(productSliderIndex: index));
                }),
            items: state.todayItem.first.itemImg != null
                ? state.todayItem.first.itemImg!.map((i) {
                    return Builder(builder: (context) {
                      return Transform.scale(
                        scale: state.scale,
                        child: CachedImage(
                          imageUrl: i.toString(),
                        ),
                      );
                    });
                  }).toList()
                : [const SizedBox()],
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: state.todayItem.first.itemImg != null
              ? state.todayItem.first.itemImg!.asMap().entries.map((entry) {
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
                }).toList()
              : [
                  Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: ColorName.lightOrange),
                  )
                ],
        ),
      ],
    );
  }
}
