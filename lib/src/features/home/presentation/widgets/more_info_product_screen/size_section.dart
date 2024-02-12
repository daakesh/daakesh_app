import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class SizeSection extends StatelessWidget {
  final HomeState state;
  const SizeSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text('Size:',style: easyTheme.textTheme.labelMedium,),
      const SizedBox(height: 10.0,),
      SizedBox(
          height: 60.0,
          width: double.infinity,
          child: CustomScrollView(
            scrollDirection: Axis.horizontal,
            slivers: [
              SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                return InkWell(
                  splashColor: ColorName.transparent,
                  focusColor: ColorName.transparent,
                  highlightColor: ColorName.transparent,
                  onTap: ()=>HomeBloc.get.add(SelectProductSizeIndex(productSizeIndex: index)),
                  child: Container(
                    width: 121.0,
                    height: 54.0,
                    margin: const EdgeInsetsDirectional.only(end: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(color:state.productSizeIndex == index ? ColorName.amber:ColorName.gray,width: 2.0),

                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('20L',style: easyTheme.textTheme.bodyLarge!.copyWith(height: 0.7,color: ColorName.blueGray.withOpacity(0.5)),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('\$44.',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 18.0,color: ColorName.black),),
                            Text('99 ',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 14.0, color: ColorName.gray,),),
                          ],
                        ),


                      ],
                    ),
                  ),
                );
              },childCount: 5)),
            ],
          )),
      const SizedBox(height: 14.0,),
    ],);
  }
}
