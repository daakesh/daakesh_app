import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../../src.export.dart';

class TrendingDealsToSwap extends StatefulWidget {
  const TrendingDealsToSwap({
    super.key,
  });

  @override
  State<TrendingDealsToSwap> createState() => _TrendingDealsToSwapState();
}

class _TrendingDealsToSwapState extends State<TrendingDealsToSwap> {
  final List<Widget> data = [
    const TrendingItemWidget(),
    const TrendingItemWidget(),
    const TrendingItemWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending Deals To Swap',
            style: context.easyTheme.textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 20.0,
          ),
          StaggeredGridView.countBuilder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            staggeredTileBuilder: (int index) =>
                index == data.length - 1 && data.length.isOdd
                    ? const StaggeredTile.count(2, 1)
                    : const StaggeredTile.count(1, 1),
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            itemCount: data.length,
            itemBuilder: (context, int index) {
              return data[index];
            },
          ),
        ],
      ),
    );
  }
}

class TrendingItemWidget extends StatelessWidget {
  const TrendingItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 194.0,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6.0,
            color: Color.fromRGBO(0, 0, 0, 0.16)),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 108.0,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: ColorName.lavenderGray,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
            ),
            child: Stack(
              children: [
                Center(child: Assets.png.glasses.image()),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 2.0),
                  child: Container(
                    width: 66.0,
                    height: 22.0,
                    decoration: const BoxDecoration(
                      color: ColorName.red,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: Center(
                        child: Text(
                      'SWAP',
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 14.0, color: ColorName.white),
                    )),
                  ),
                ),
              ],
            ),
          ),
          Container(
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
                    style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                        fontSize: 14.0,
                        color: ColorName.gray,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                const SizedBox(
                  height: 1.0,
                ),
                Text(
                  'Amman, Jordan',
                  overflow: TextOverflow.ellipsis,
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 14.0, color: ColorName.mediumSilver),
                ),
                const SizedBox(
                  height: 9.0,
                ),
                RichText(
                  text: TextSpan(
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 15.0),
                      children: [
                        const TextSpan(text: '('),
                        TextSpan(
                            text: '25',
                            style: context.easyTheme.textTheme.headlineMedium!
                                .copyWith(
                                    fontSize: 15.0, color: ColorName.red)),
                        const TextSpan(text: ')  '),
                        const TextSpan(text: 'Offers Submitted'),
                      ]),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.phone,
                      color: ColorName.silverChalice,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 6.5),
                        child: SizedBox(
                          width: 100.0,
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'By ',
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(
                                    fontSize: 13.0,
                                    color: ColorName.gray,
                                  )),
                              TextSpan(
                                  text: 'JAMSE ALFA',
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(
                                    fontSize: 14.0,
                                  )),
                            ]),
                          ),
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
      ),
    );
  }
}
