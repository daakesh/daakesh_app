import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../src.export.dart';

class TodayDealProduct extends StatelessWidget {
  final bool isDaakeshTodayDeal;
  const TodayDealProduct({super.key,this.isDaakeshTodayDeal = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 250.0,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: ColorName.lavenderGray,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 6.0,
                color: Color.fromRGBO(0, 0, 0, 0.16),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 25.0),
                child: Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Assets.png.glasses.image(height: 80.0, width: 80.0)),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 2.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 75.0),
                  height: 22.0,
                  margin: const EdgeInsetsDirectional.only(top: 1.0, start: 4.0),
                  padding: const EdgeInsets.only(top: 2.0),
                  decoration: const BoxDecoration(
                    color: ColorName.red,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      '23% OFF',
                      textAlign: TextAlign.center,
                      style: easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 14.0, color: ColorName.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 135.0,
          padding: const EdgeInsetsDirectional.only(start: 16.0),
          decoration: const BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 2.0,
              ),
              SizedBox(
                height: 38.0,
                child: Text(
                  'AquaOasis™ Cool Mist Humidefier (2.2L Water',
                  maxLines: 2,
                  style: easyTheme.textTheme.bodyMedium!.copyWith(
                      fontSize: 14.0,
                      color: ColorName.gray,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              const SizedBox(
                height: 4.5,
              ),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: 5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15.0,

                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  const SizedBox(
                    width: 2.0,
                  ),
                  Flexible(
                    child: Text(
                      '5.9',
                      style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 14.0,overflow:TextOverflow.ellipsis ),
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Flexible(
                    child: Text(
                      '(200)',
                      style: easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 13.0, color: ColorName.gray,overflow:TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 2.0,
              ),
               Row(
                children: [
                  Text('\$44',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 20.0),),
                  Text('99 ',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 14.0, color: ColorName.gray,),),
                  Flexible(
                    child: Text(
                      '\$79.99',
                      style: easyTheme.textTheme.headlineMedium!.copyWith(
                          fontSize: 14.0,
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.lineThrough,
                          color: ColorName.gray),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              !isDaakeshTodayDeal ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.svg.creditCardIcon.svg(),
                  Row(
                    children: [
                      Text('By ',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 13.0, color: ColorName.gray)),
                      const DaakeshLogoWidget(height: 14.0),
                      const SizedBox(width: 8.0),
                    ],
                  ),
                ],
              ):Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.phone,color: ColorName.silverChalice,),
                  const SizedBox(width: 10.0,),
                  Expanded(
                    child: SizedBox(
                      width: 100.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('By ',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 13.0, color: ColorName.gray)),
                          Flexible(child: Text('NF Store',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 13.0,overflow: TextOverflow.ellipsis))),
                          const SizedBox(width: 8.0,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 2.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
