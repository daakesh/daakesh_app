import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../src.export.dart';

class SwapTrendDealProduct extends StatelessWidget {
  final TrendDealsItem trendDealsItem;

  const SwapTrendDealProduct({
    super.key,
    required this.trendDealsItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        SwapPassDataBloc.get.add(PassTrendingDealDataEvent(trendDealsItem: trendDealsItem));
        SwapBloc.get.add(SwapGetToTopScreenEvent());
        SwapBloc.get.add(ToggleSwapScreenStateEvent(swapScreenState:SwapScreenState.PRODUCTDETAILS));
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorName.lavenderGray,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6.0,
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                ),
              ],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0.r),topRight: Radius.circular(10.0.r)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 75.0.w),
                    height: 22.0.h,
                    margin:  const EdgeInsetsDirectional.only(top: 1.0, start: 4.0),
                    padding:  EdgeInsets.only(top: 2.0.h),
                    decoration: BoxDecoration(
                      color: ColorName.red,
                      borderRadius: BorderRadius.all(Radius.circular(4.0.r)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'SWAP',
                        textAlign: TextAlign.center,
                        style: easyTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 14.0.sp, color: ColorName.white),
                      ),
                    ),
                  ),
                ),
                CachedImage(
                  imageUrl: trendDealsItem.itemImg.toString(),
                  height: 85.0,
                  width: 85.0,
                ),
                const SizedBox(height: 12.0,),
              ],
            ),
          ),
          Container(
            padding:EdgeInsetsDirectional.only(start: 16.0.w,),
            decoration:  BoxDecoration(
              color: ColorName.white,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6.0,
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                ),
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0.r),
                bottomRight: Radius.circular(10.0.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.0.h,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 28.0),
                  child: Text(
                    '${trendDealsItem.title}\n',
                    maxLines: 2,
                    style: easyTheme.textTheme.bodyMedium!.copyWith(
                        fontSize: 14.0.sp,
                        color: ColorName.gray,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                Text(
                  'Amman, Jordan',
                  style: easyTheme.textTheme.bodyMedium!.copyWith(
                      fontSize: 14.0,
                      color: ColorName.mediumSilver,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                        child: Text(
                      '\$${trendDealsItem.price}',
                      style: easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 20.0,fontWeight: FontWeight.w600,),
                      overflow: TextOverflow.ellipsis,
                    )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        children: [
                          Text('99 ',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 12.0, color: ColorName.gray,),),
                          Text(
                            '\$79.99',
                            style: easyTheme.textTheme.headlineMedium!.copyWith(
                                fontSize: 14.0.sp,
                                decoration: TextDecoration.lineThrough,
                                color: ColorName.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 9.0,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 28.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: '(',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 15.0,color: ColorName.gray)),
                          TextSpan(text: '25',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 15.0,color: ColorName.red)),
                          TextSpan(text: ')',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 15.0,color: ColorName.gray)),
                          TextSpan(text: ' Offers Submitted',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 15.0,color: ColorName.black)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.phone,color: ColorName.silverChalice,size: 20.0.sp,),
                    SizedBox(width: 10.0.sp,),
                    Expanded(
                      child: SizedBox(
                        width: 100.0.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('By ',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 13.0.sp, color: ColorName.gray)),
                            Flexible(child: Text('JAMSE ALFA',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 13.0.sp,overflow: TextOverflow.ellipsis))),
                             SizedBox(width: 8.0.w,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0,)
              ],

            ),
          ),
        ],
      ),
    );
  }
}

