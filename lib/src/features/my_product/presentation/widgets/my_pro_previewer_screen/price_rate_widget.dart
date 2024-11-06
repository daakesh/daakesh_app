import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../src.export.dart';

class PriceRateWidget extends StatelessWidget {
  final ProPreviewerModel previewerModel;

  const PriceRateWidget({super.key, required this.previewerModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30.0,
        ),
        Text(
          previewerModel.title.toString(),
          style: context.easyTheme.textTheme.bodyMedium!
              .copyWith(fontSize: 24.0, color: ColorName.gray),
        ),
        const SizedBox(
          height: 10.0,
        ),
        BlocBuilder<MyProBloc, MyProState>(
          builder: (context, state) {
            return Row(
              children: [
                RatingBar.builder(
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  minRating: 1,
                  maxRating: 5,
                  ignoreGestures: true,
                  initialRating: state.rateAverage,
                  itemSize: 25.0,
                  tapOnlyMode: true,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Flexible(
                  child: Text(
                    '${state.rateAverage}',
                    style: context.easyTheme.textTheme.labelLarge!.copyWith(
                        fontSize: 23.0,
                        color: ColorName.black,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                BlocBuilder<MyProBloc, MyProState>(
                  builder: (context, state) {
                    return Flexible(
                      child: Text(
                        '(${state.rateCount})',
                        style: context.easyTheme.textTheme.labelLarge!.copyWith(
                            fontSize: 21.0,
                            color: ColorName.gray,
                            overflow: TextOverflow.ellipsis),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
        const SizedBox(
          height: 14.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            previewerModel.discountPercentage == '0%' ||
                    previewerModel.discountPercentage == null
                ? Text(
                    '${context.locale.jordan_dinar} ${previewerModel.priceAfterDiscount} ',
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 30.0, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  )
                : Row(
                    children: [
                      Text(
                        '${context.locale.jordan_dinar} ${previewerModel.priceAfterDiscount} ',
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 30.0, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${context.locale.jordan_dinar} ${previewerModel.price}',
                        style: context.easyTheme.textTheme.headlineMedium!
                            .copyWith(
                          fontSize: 20.0.sp,
                          decoration: TextDecoration.lineThrough,
                          color: ColorName.gray,
                        ),
                      ),
                    ],
                  ),
            const Spacer(
              flex: 1,
            ),
            const Icon(
              Icons.phone,
              color: ColorName.silverChalice,
              size: 30.0,
            ),
          ],
        ),
        const SizedBox(height: 17.0),
      ],
    );
  }
}
