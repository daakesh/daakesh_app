import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../src.export.dart';

class SwapResultItemWidget extends StatelessWidget {
  final SwapSubCategory swapSubCategory;
  const SwapResultItemWidget({super.key, required this.swapSubCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          Row(
            children: [
              Container(
                constraints: const BoxConstraints(minWidth: 70.0,maxHeight: 25.0),
                margin: const EdgeInsetsDirectional.only(start: 4.0) ,
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 6.0),
                decoration: const BoxDecoration(
                    color: ColorName.red,
                    borderRadius: BorderRadius.all(Radius.circular(4.0))
                ),
                child: Center(child: Text('Swap',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 14.0),),),
              ),
              const Spacer(flex: 1,),
              Text('By',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 14.0,color: ColorName.gray),),
              const SizedBox(width: 5.0,),
              Text('JAMSE ALFA',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 13.0,color: ColorName.black),),
              const SizedBox(width: 12.0,),

            ],
          ),
          const SizedBox(height: 2.0,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 12.0,),
              CachedImage(
                imageUrl: swapSubCategory.subImg.toString(),
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                height: 90.0,
                width: 90.0,
              ),
              const SizedBox(width: 18.0,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 80.0),
                      child: Text(
                        '${swapSubCategory.description}',
                        style: easyTheme.textTheme.labelMedium!.copyWith(
                            fontSize: 15.0,
                            color: ColorName.gray,
                            overflow: TextOverflow.ellipsis
                        ),
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(height: 2.0,),
                    Text('Amman, Jordan',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 13,color: ColorName.mediumSilver),),
                    const SizedBox(height: 8.0,),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: '(',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 16.0,color: ColorName.gray)),
                          TextSpan(text: '25',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 16.0,color: ColorName.red)),
                          TextSpan(text: ')',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 16.0,color: ColorName.gray)),
                          TextSpan(text: ' Offers Submitted',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 16.0,color: ColorName.black)),
                        ],
                      ),
                    ),
                    const Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(end: 16.0),
                          child: Icon(
                            Icons.phone,
                            color: ColorName.silverChalice,
                            size: 20.0,
                          ),
                        )),
                  ],
                ),
              ),
            ],),
          const SizedBox(height: 15.0,),
        ],
      ),
    );
  }
}
