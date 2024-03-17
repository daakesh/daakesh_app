import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../src.export.dart';

class PriceRateSection extends StatelessWidget {
  final PassDataState state;
  const PriceRateSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const SizedBox(height: 30.0,),
      Text(
        state.todayItem.first.title.toString(),
        style: easyTheme.textTheme.bodyMedium!
            .copyWith(fontSize: 24.0, color: ColorName.gray),
      ),
      const SizedBox(height: 10.0,),
      Row(
        children: [
          RatingBar.builder(
            direction: Axis.horizontal,
            allowHalfRating: true,
            minRating: 1,
            maxRating: 5,
            ignoreGestures: true,
            initialRating: 4.5,
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
              '4.5',
              style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 23.0,color: ColorName.black,overflow:TextOverflow.ellipsis ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Flexible(
            child: Text(
              '(200)',
              style: easyTheme.textTheme.labelLarge!
                  .copyWith(fontSize: 21.0, color: ColorName.gray,overflow:TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
      const SizedBox(height: 14.0,),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('\$${state.todayItem.first.price}.',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 30.0,color: ColorName.black),),
          Text('99 ',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 25.0, color: ColorName.gray,),),
          const Spacer(flex: 1,),
          !state.isDaakeshTodayDeal
                ? Assets.svg.creditCardIcon.svg(
                    width: 30.0,
                    height: 22.0,)
                : const Icon(
                    Icons.phone,
                    color: ColorName.silverChalice,
                    size: 30.0,
                  ),
          ],
      ),
      const SizedBox(height: 17.0,),
    ],);
  }
}
