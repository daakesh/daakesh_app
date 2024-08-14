import 'package:carousel_slider/carousel_slider.dart';
import 'package:daakesh/src/core/utils/widgets/zoom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';
import 'package:collection/collection.dart';

class ProductSlider extends StatefulWidget {
  final ProPreviewerModel previewerModel;

  const ProductSlider({
    super.key,
    required this.previewerModel,
  });

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  int currentIndex = 0;

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
                context.locale.more_info_product_by_title,
                style: context.easyTheme.textTheme.bodyMedium!
                    .copyWith(fontSize: 20.0, color: ColorName.gray),
              ),
              const SizedBox(
                width: 6.0,
              ),
              Text(
                widget.previewerModel.userName!,
                style: context.easyTheme.textTheme.bodyMedium!
                    .copyWith(fontSize: 20.0),
              ),
              const Spacer(
                flex: 1,
              ),
              BlocBuilder<PassDataBloc, PassDataState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () => PassDataBloc.get.add(ProductZoomInOutEvent()),
                    child: Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: state.productScale != 3
                            ? Assets.svg.zoomInIcon.svg()
                            : Assets.svg.zoomOutIcon.svg()),
                  );
                },
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
          items: widget.previewerModel.itemImage != null
              ? widget.previewerModel.itemImage!.mapIndexed((index, i) {
                  return Builder(builder: (context) {
                    return BlocBuilder<PassDataBloc, PassDataState>(
                      builder: (context, state) {
                        return Transform.scale(
                          scale: state.productScale,
                          child: GestureDetector(
                            onTap: () => openImage(
                                widget.previewerModel.itemImage!, index),
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
          children: widget.previewerModel.itemImage != null
              ? widget.previewerModel.itemImage!.asMap().entries.map((entry) {
                  return BlocBuilder<PassDataBloc, PassDataState>(
                    builder: (context, state) {
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
                    },
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

  void openImage(List<String> imageUrl, int index) {
    Utils.openNewPage(ZoomImageWidget(imageUrlList: imageUrl, index: index));
  }
}
