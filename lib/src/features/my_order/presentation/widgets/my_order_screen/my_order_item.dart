import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class MyOrderItem extends StatelessWidget {
  final MyOrderData myOrderData;
  const MyOrderItem({super.key, required this.myOrderData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.only(
          start: 15.0, end: 15.0, bottom: 11.0),
      decoration: BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.all(Radius.circular(11)),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 3.0,
                color: Color.fromRGBO(0, 0, 0, 0.16))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 9.0),
          Row(
            children: [
              const SizedBox(
                width: 14.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Order ID :',
                                style: context
                                    .easyTheme.textTheme.headlineMedium!
                                    .copyWith(
                                  fontSize:
                                      ResponsiveText.getResponsiveFontSize(
                                          fontSize: 18.0),
                                  color: ColorName.black,
                                ),
                              ),
                              TextSpan(
                                text: '#${myOrderData.orderId!}',
                                style: context
                                    .easyTheme.textTheme.headlineMedium!
                                    .copyWith(
                                  fontSize:
                                      ResponsiveText.getResponsiveFontSize(
                                          fontSize: 18.0),
                                  color: ColorName.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 9.0,
                        ),
                        Text(
                          'On The Way',
                          style: context.easyTheme.textTheme.headlineMedium!
                              .copyWith(
                            fontSize: ResponsiveText.getResponsiveFontSize(
                                fontSize: 12.0),
                            color: ColorName.ceruleanBlue,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Poced In: ${Utils.formatDate(myOrderData.items!.first.createdAt.toString())}',
                      style: context.easyTheme.textTheme.labelLarge!.copyWith(
                        fontSize: ResponsiveText.getResponsiveFontSize(
                            fontSize: 14.0),
                        color: ColorName.gray,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    '\$${myOrderData.totalPrice.toInt()}',
                    style: context.easyTheme.textTheme.labelLarge!.copyWith(
                        fontSize: ResponsiveText.getResponsiveFontSize(
                            fontSize: 21.0),
                        color: ColorName.black),
                  ),
                  Text(
                    'Total Price',
                    style: context.easyTheme.textTheme.labelLarge!.copyWith(
                      fontSize:
                          ResponsiveText.getResponsiveFontSize(fontSize: 14.0),
                      color: ColorName.gray,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 13.0,
              ),
            ],
          ),
          const SizedBox(height: 11.0),
          Column(
            children: List.generate(myOrderData.items!.length, (index) {
              MyOrderItems myOrderItems = myOrderData.items![index];
              return Container(
                width: double.infinity,
                height: 42.0,
                margin: const EdgeInsetsDirectional.only(bottom: 4.0),
                color: index % 2 == 0
                    ? ColorName.lightGrayishBlue
                    : ColorName.white,
                child: Row(
                  children: [
                    const SizedBox(width: 14.0),
                    Expanded(
                      child: CachedImage(imageUrl: myOrderItems.itemImg!.first),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      flex: 3,
                      child: Text(
                        myOrderItems.title!,
                        overflow: TextOverflow.ellipsis,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: ResponsiveText.getResponsiveFontSize(
                                fontSize: 14.0),
                            color: ColorName.gray),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Text(
                      '1 Item',
                      overflow: TextOverflow.ellipsis,
                      style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                          fontSize: ResponsiveText.getResponsiveFontSize(
                              fontSize: 14.0),
                          color: ColorName.gray),
                    ),
                    const SizedBox(width: 16.0),
                  ],
                ),
              );
            }),
          ),
          const Divider(
            color: ColorName.gray,
            endIndent: 16.5,
            indent: 16.5,
          ),
          const SizedBox(height: 9.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Shipping to : ',
                  style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                    fontSize:
                        ResponsiveText.getResponsiveFontSize(fontSize: 14.0),
                  )),
              TextSpan(
                  text: 'Jordan , Amman , Tla Ali ,29.',
                  style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                      fontSize:
                          ResponsiveText.getResponsiveFontSize(fontSize: 14.0),
                      color: ColorName.gray)),
            ])),
          ),
          const SizedBox(height: 13.0),
        ],
      ),
    );
  }
}
