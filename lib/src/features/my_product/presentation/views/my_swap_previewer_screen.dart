import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class MySwapPreviewerScreen extends StatelessWidget {
  final ProPreviewerModel previewerModel;

  MySwapPreviewerScreen({
    super.key,
    required this.previewerModel,
  });

  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HeaderWidget(withArrowBack: false)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 17.5, end: 26.0, top: 12.0),
              child: ProductSlider(
                previewerModel: previewerModel,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 17.5, end: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    previewerModel.title.toString(),
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 24.0, color: ColorName.gray),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Assets.svg.locationPinIcon.svg(
                          height: 21.0, width: 21.0, color: ColorName.amber),
                      const SizedBox(
                        width: 6.5,
                      ),
                      Text.rich(
                        TextSpan(
                          style:
                              context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 16.0,
                          ),
                          children: [
                            TextSpan(
                              text: context.locale.swap_more_info_swap_in_title,
                            ),
                            TextSpan(
                              text: '${previewerModel.citySwap}, ',
                            ),
                            TextSpan(
                              text: '${previewerModel.countrySwap}, ',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: '(',
                                  style: context.easyTheme.textTheme.labelLarge!
                                      .copyWith(
                                          fontSize: 23.0,
                                          color: ColorName.gray)),
                              TextSpan(
                                  text: '${previewerModel.offerCount}',
                                  style: context.easyTheme.textTheme.labelLarge!
                                      .copyWith(
                                          fontSize: 23.0,
                                          color: ColorName.red)),
                              TextSpan(
                                  text: ') ',
                                  style: context.easyTheme.textTheme.labelLarge!
                                      .copyWith(
                                          fontSize: 23.0,
                                          color: ColorName.gray)),
                              TextSpan(
                                  text: context.locale.offer_submitted_title,
                                  style: context.easyTheme.textTheme.labelLarge!
                                      .copyWith(
                                          fontSize: 23.0,
                                          color: ColorName.black)),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        Utils.formatDate(previewerModel.date.toString()),
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 15.0, color: ColorName.grayishBlue),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 17.5, end: 26.0),
              child: InfoSection(previewerModel: previewerModel),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 60.0,
            ),
          ),
        ],
      ),
    );
  }

  void addToCart(String itemID, String country, String address) {
    CartBloc.get.add(
        AddToCartEvent(itemID: itemID, country: country, address: address));
  }
}
