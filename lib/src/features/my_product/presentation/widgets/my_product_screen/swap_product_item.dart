import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class SwapProductItem extends StatelessWidget {
  const SwapProductItem({super.key});

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
                    offset: Offset(0,3),
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    blurRadius: 6.0
                ),
              ],


            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 20.0, top: 12.0),
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
                      width: 7.0,
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
                                  fontSize: 15.0,
                                  color: ColorName.gray,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(
                            height: 9.0,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Swap In :',
                                    style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 15.0,color: ColorName.gray)
                                ),
                                TextSpan(
                                    text: 'Amman, Jordan',
                                    style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 13.0,color: ColorName.black)
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Display:',
                                    style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 15.0,color: ColorName.gray)
                                ),
                                TextSpan(
                                    text: 'Public',
                                    style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 13.0,color: ColorName.black)
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18.0),
              ],
            ),
          );
        }, childCount: 20));
  }
}
