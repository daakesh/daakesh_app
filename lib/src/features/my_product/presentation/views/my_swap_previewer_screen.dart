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
