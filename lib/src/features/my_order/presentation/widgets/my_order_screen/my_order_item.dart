import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class MyOrderItem extends StatelessWidget {
  final int index;
  const MyOrderItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.only(start: 15.0,end: 15.0,bottom: 11.0),
      decoration: BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.all(Radius.circular(11.0.r)),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0,3),
                blurRadius: 3.0,
                color: Color.fromRGBO(0, 0, 0, 0.16)
            )
          ]

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const SizedBox(height: 9.0),
        Row(children: [
          const SizedBox(width: 14.0,),
          Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: 'Order ID :',
                                style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 18.0), color: ColorName.black,),
                              ),
                              TextSpan(text: '#12354',
                                style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 18.0), color: ColorName.black,),
                              ),



                            ],
                          ),
                        ),
                        const SizedBox(width: 9.0,),
                        index % 2 == 0
                            ? Text(
                                'On The Way',
                                style: easyTheme.textTheme.headlineMedium!.copyWith(
                                  fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 12.0),
                                  color: ColorName.ceruleanBlue,
                                ),
                              )
                            : Text(
                                'Delivered',
                                style: easyTheme.textTheme.headlineMedium!.copyWith(
                                    fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 12.0),
                                    color: ColorName.springGreen),
                              ),
                      ],
                    ),
                    Text(
                      'Poced In: 12/12/2012',
                      style: easyTheme.textTheme.labelLarge!.copyWith(
                        fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 14.0),
                        color: ColorName.gray,
                      ),
                    ),

                  ],
                ),
              ),
          Column(
            children: [
              Text(
                    '\$88.6',
                    style: easyTheme.textTheme.labelLarge!.copyWith(
                        fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 21.0),
                        color: ColorName.black),
                  ),
              Text(
                'Total Price',
                style: easyTheme.textTheme.labelLarge!.copyWith(
                  fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 14.0),
                  color: ColorName.gray,
                ),
              ),

            ],
          ),
          const SizedBox(width: 13.0,),
        ],),
        const SizedBox(height: 11.0),
        Container(
          width: double.infinity,
          height: 42.0,
          color: ColorName.lightGrayishBlue,
          child: Row(children: [
            const SizedBox(width: 14.0),
            Assets.png.glasses.image(width: 32.0, height: 32.0),
            const SizedBox(width: 15.0),
            Expanded(
                  child: Text(
                    'AquaOasis™ Cool Mist Humidefier (2.2L Water',
                    overflow: TextOverflow.ellipsis,
                    style: easyTheme.textTheme.bodyMedium!
                        .copyWith(
                        fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 14.0),
                        color: ColorName.gray),
                  ),
                ),
            const SizedBox(width: 15.0),
            Text(
              '1 Item',
              overflow: TextOverflow.ellipsis,
              style: easyTheme.textTheme.bodyMedium!
                  .copyWith(
                  fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 14.0),
                  color: ColorName.gray),
            ),
            const SizedBox(width: 16.0),

              ],
            ),
          ),
        const SizedBox(height: 4.0),
        Container(
          width: double.infinity,
          height: 42.0,
          color: ColorName.white,
          child: Row(children: [
            const SizedBox(width: 14.0),
            Assets.png.glasses.image(width: 32.0,height: 32.0),
            const SizedBox(width: 15.0),
            Expanded(
              child: Text(
                'AquaOasis™ Cool Mist Humidefier (2.2L Water',
                overflow: TextOverflow.ellipsis,
                style: easyTheme.textTheme.bodyMedium!
                    .copyWith(
                    fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 14.0),
                    color: ColorName.gray),
              ),
            ),
            const SizedBox(width: 15.0),
            Text(
              '1 Item',
              overflow: TextOverflow.ellipsis,
              style: easyTheme.textTheme.bodyMedium!
                  .copyWith(
                  fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 14.0),
                  color: ColorName.gray),
            ),
            const SizedBox(width: 16.0),

          ],
          ),
        ),
        const Divider(color: ColorName.gray,endIndent: 16.5,indent: 16.5,),
        const SizedBox(height: 9.0),
        Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text.rich(TextSpan(children: [
            TextSpan(text: 'Shipping to : ',style: easyTheme.textTheme.bodyMedium!.copyWith(
              fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 14.0),
            )),
            TextSpan(text: 'Jordan , Amman , Tla Ali ,29.',style: easyTheme.textTheme.bodyMedium!.copyWith(
                fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 14.0),
                color: ColorName.gray)),
          ])),
        ),
        const SizedBox(height: 13.0),
        ],),
    );
  }



}


abstract class FontStyle{

  TextStyle regular = const TextStyle(
    fontFamily: FontFamily.segoeUISemiBold,
    fontSize: 22.0,
    color: ColorName.white,
  );


}