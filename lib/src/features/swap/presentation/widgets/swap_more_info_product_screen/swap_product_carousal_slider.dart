import 'package:carousel_slider/carousel_slider.dart';
import 'package:daakesh/src/core/utils/widgets/zoom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';
import 'package:collection/collection.dart';

class SwapProductCarousalSlider extends StatelessWidget {
  final TrendDealsItem trendDealsItem;
  SwapProductCarousalSlider({
    super.key,
    required this.trendDealsItem,
  });

  final controller = CarouselSliderController();

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
                context.locale.swap_more_info_by_title,
                style: context.easyTheme.textTheme.bodyMedium!
                    .copyWith(fontSize: 20.0, color: ColorName.gray),
              ),
              const SizedBox(
                width: 6.0,
              ),
              Text(
                trendDealsItem.user?.name ?? '-',
                style: context.easyTheme.textTheme.bodyMedium!
                    .copyWith(fontSize: 20.0),
              ),
              const Spacer(
                flex: 1,
              ),
              BlocBuilder<SwapPassDataBloc, SwapPassDataState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () => SwapPassDataBloc.get.add(SwapZoomInOutEvent()),
                    child: Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: state.scale != 3
                            ? Assets.svg.zoomInIcon.svg()
                            : Assets.svg.zoomOutIcon.svg()),
                  );
                },
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
                SwapPassDataBloc.get
                    .add(ChangeProductSliderIndex(sliderIndex: index));
              }),
          items: trendDealsItem.itemImg!.mapIndexed((index, i) {
            return BlocBuilder<SwapPassDataBloc, SwapPassDataState>(
              builder: (context, state) {
                return Builder(
                  builder: (BuildContext context) {
                    return Transform.scale(
                      scale: state.scale,
                      child: GestureDetector(
                        onTap: () =>
                            openZoomImage(trendDealsItem.itemImg!, index),
                        child: CachedImage(
                          imageUrl: i.toString(),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 30.0,
        ),
        BlocBuilder<SwapPassDataBloc, SwapPassDataState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: trendDealsItem.itemImg!.asMap().entries.map((entry) {
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
            );
          },
        ),
      ],
    );
  }

  void openZoomImage(List<String> imageUrl, int index) {
    Utils.openNewPage(ZoomImageWidget(
      imageUrlList: imageUrl,
      index: index,
    ));
  }
}
