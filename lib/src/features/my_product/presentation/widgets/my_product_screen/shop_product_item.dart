import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:json_theme/json_theme.dart';
import '../../../../../src.export.dart';

class ShopProductItem extends StatelessWidget {
  const ShopProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((_, index) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsetsDirectional.only(
              start: 15.0,
              end: 15.0,
              bottom: 13.0,
            ),
            decoration: const BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 3),
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    blurRadius: 6.0),
              ],
            ),
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              fit: StackFit.loose,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Padding(
                        padding:
                        const EdgeInsetsDirectional.only(end: 20.0, top: 12.0),
                        child: Text(
                          'Edit',
                          style: easyTheme.textTheme.bodyLarge!
                              .copyWith(fontSize: 14.0, color: ColorName.skyBlue),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 12.0,
                        ),
                        Assets.png.glasses.image(height: 90.0, width: 90.0),
                        const SizedBox(
                          width: 18.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(end: 80.0),
                                child: Text(
                                  'AquaOasis™ Cool Mist Humidefier (2.2L Water',
                                  style: easyTheme.textTheme.labelMedium!.copyWith(
                                      fontSize: 14.0,
                                      color: ColorName.gray,
                                      overflow: TextOverflow.ellipsis),
                                  maxLines: 2,
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    minRating: 1,
                                    maxRating: 5,
                                    ignoreGestures: true,
                                    initialRating: 5.0,
                                    itemSize: 20.0,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    '5.9',
                                    style: easyTheme.textTheme.labelMedium!
                                        .copyWith(fontSize: 15.0),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    '(200)',
                                    style: easyTheme.textTheme.labelMedium!.copyWith(
                                        fontSize: 13.0, color: ColorName.gray),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 38.0,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '\$44',
                                          style: easyTheme.textTheme.labelMedium!
                                              .copyWith(fontSize: 21.0),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 2.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                '99',
                                                style: easyTheme
                                                    .textTheme.labelMedium!
                                                    .copyWith(
                                                    fontSize: 12.0,
                                                    color: ColorName.gray),
                                              ),
                                              const SizedBox(
                                                width: 8.0,
                                              ),
                                              Text(
                                                '\$79.99',
                                                style: easyTheme
                                                    .textTheme.labelMedium!
                                                    .copyWith(
                                                  fontSize: 13.0,
                                                  color: ColorName.gray,
                                                  decoration:
                                                  TextDecoration.lineThrough,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: ColorName.gray,
                      endIndent: 17.0,
                      indent: 17.0,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Entry Date : ',
                                          style: easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                              fontSize: 15.0,
                                              color: ColorName.gray)),
                                      TextSpan(
                                          text: '12/12/2012',
                                          style: easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                              fontSize: 15.0,
                                              color: ColorName.black)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 11.0,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Categories : ',
                                          style: easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                              fontSize: 15.0,
                                              color: ColorName.gray)),
                                      TextSpan(
                                          text: 'MEN',
                                          style: easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                              fontSize: 15.0,
                                              color: ColorName.black)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Quantity : ',
                                          style: easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                              fontSize: 15.0,
                                              color: ColorName.gray)),
                                      TextSpan(
                                          text: '200',
                                          style: easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                              fontSize: 15.0,
                                              color: ColorName.black)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 11.0,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Ship To : ',
                                          style: easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                              fontSize: 15.0,
                                              color: ColorName.gray)),
                                      TextSpan(
                                          text: 'ALL',
                                          style: easyTheme.textTheme.bodyMedium!
                                              .copyWith(
                                              fontSize: 15.0,
                                              color: ColorName.black)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14.0),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      constraints:
                      const BoxConstraints(minWidth: 70.0, maxHeight: 25.0),
                      margin: const EdgeInsetsDirectional.symmetric(horizontal: 6.0),
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 6.0),
                      decoration: const BoxDecoration(
                          color: ColorName.red,
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                      child: Center(
                        child: Text(
                          '23% OFF',
                          style: easyTheme.textTheme.labelLarge!
                              .copyWith(fontSize: 14.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }, childCount: 20));
  }
}
