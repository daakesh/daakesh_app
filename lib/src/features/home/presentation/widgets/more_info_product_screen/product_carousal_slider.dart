import 'package:carousel_slider/carousel_slider.dart';
import 'package:daakesh/src/core/utils/widgets/zoom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../src.export.dart';

class ProductCarousalSlider extends StatefulWidget {
  final TodayItem todayDealItem;
  final bool isDaakeshTodayDeal;
  const ProductCarousalSlider({
    super.key,
    required this.todayDealItem,
    required this.isDaakeshTodayDeal,
  });

  @override
  State<ProductCarousalSlider> createState() => _ProductCarousalSliderState();
}

class _ProductCarousalSliderState extends State<ProductCarousalSlider> {
  final controller = CarouselController();
  int currentIndex = 0;

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
                context.locale.more_info_product_by_title,
                style: context.easyTheme.textTheme.bodyMedium!
                    .copyWith(fontSize: 20.0, color: ColorName.gray),
              ),
              const SizedBox(
                width: 6.0,
              ),
              !widget.isDaakeshTodayDeal
                  ? DaakeshLogoWidget(
                      width: 140.0.w,
                    )
                  : Text(
                      '${widget.todayDealItem.user!.name}',
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
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
              viewportFraction: 1,
              height: 250.0,
              onPageChanged: (index, reason) {
                currentIndex = index;
                setState(() {});
              }),
          items: widget.todayDealItem.itemImg != null
              ? widget.todayDealItem.itemImg!.map((i) {
                  return Builder(builder: (context) {
                    return BlocBuilder<PassDataBloc, PassDataState>(
                      builder: (context, state) {
                        return Transform.scale(
                          scale: state.scale,
                          child: GestureDetector(
                            onTap: () =>
                                openImage(widget.todayDealItem.itemImg!),
                            child: CachedImage(
                              imageUrl: i.toString(),
                            ),
                          ),
                        );
                      },
                    );
                  });
                }).toList()
              : [const SizedBox()],
        ),
        const SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.todayDealItem.itemImg != null
              ? widget.todayDealItem.itemImg!.asMap().entries.map((entry) {
                  return Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == entry.key
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

  void openImage(List<String> imageUrl) {
    Utils.openNewPage(ZoomImageWidget(imageUrlList: imageUrl));
  }
}
