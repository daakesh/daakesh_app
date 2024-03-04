import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../src.export.dart';

class SwapCartItemWidget extends StatelessWidget {
  const SwapCartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 13.0,vertical: 16.0),
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: ColorName.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.16),
              offset: Offset(0, 3),
              blurRadius: 10.0,
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const SizedBox(width: 4.0,),
            Container(
              height: 25.0,
              constraints: const BoxConstraints(minWidth: 70.0),
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 6.0),
              decoration: const BoxDecoration(
                  color: ColorName.red,
                  borderRadius: BorderRadius.all(Radius.circular(4.0))
              ),
              child: Center(child: Text('23% OFF',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 14.0),),),
            ),
            const Spacer(flex: 1,),
            Text('By',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 14.0,color: ColorName.gray),),
            const SizedBox(width: 5.0,),
            DaakeshLogoWidget(width: 68.0.w,),
            const SizedBox(width: 12.0,),

          ],),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 12.0,),
              Assets.png.glasses.image(height: 90.0,width: 90.0),
              const SizedBox(width: 18.0,),
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
                            overflow: TextOverflow.ellipsis
                        ),
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(height: 8.0,),
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
                        const SizedBox(width: 8.0,),
                        Text('5.9',style: easyTheme.textTheme.labelMedium!.copyWith(fontSize: 15.0),),
                        const SizedBox(width: 8.0,),
                        Text('(200)',style: easyTheme.textTheme.labelMedium!.copyWith(fontSize: 13.0,color: ColorName.gray),)
                      ],
                    ),
                    const SizedBox(height: 12.0,),
                    InkWell(
                      focusColor: ColorName.transparent,
                      highlightColor: ColorName.transparent,
                      splashColor: ColorName.transparent,
                      onTap: (){},
                        child: Text(
                      'See Details',
                      style: easyTheme.textTheme.bodyLarge!
                          .copyWith(fontSize: 14, color: ColorName.skyBlue),
                    )),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18.0,),
          Row(
            children: [
              const SizedBox(width: 11.0,),
              Container(
                height: 28.0,
                width: 123.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: ColorName.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                        offset: Offset(0, 2),
                        blurRadius: 10.0,
                      )
                    ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 28.0,
                      width: 34.0,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(10.0),bottomLeft:Radius.circular(10.0)),
                          color: ColorName.lightSilver
                      ),
                      child: Center(child: Assets.svg.deleteIcon.svg()),
                    ),
                    Text('1',style: easyTheme.textTheme.labelMedium!.copyWith(fontSize: 21.0),),
                    Container(
                      height: 28.0,
                      width: 34.0,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topRight:Radius.circular(10.0),bottomRight:Radius.circular(10.0)),
                          color: ColorName.lightSilver
                      ),
                      child: Center(child: Assets.svg.plusIcon.svg()),

                    ),
                  ],
                ),
              ),
              const Spacer(flex: 1,),
               Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Price :',style: easyTheme.textTheme.labelMedium!.copyWith(fontSize: 21.0)),
                    TextSpan(text: '\$44',style: easyTheme.textTheme.labelMedium!.copyWith(fontSize: 21.0)),
                    TextSpan(text: '99',style: easyTheme.textTheme.labelMedium!.copyWith(fontSize: 14.0,color: ColorName.gray)),
                  ],
                ),
              ),
              const SizedBox(width: 11.0,),


            ],),

          const SizedBox(height: 16.0,),




        ],
      ),
    );
  }
}

