import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../src.export.dart';

class TodayDealProduct extends StatelessWidget {
  final ScrollController scrollController;
  final bool isDaakeshTodayDeal;
  const TodayDealProduct({super.key,this.isDaakeshTodayDeal = false, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        scrollController.animateTo(0.0, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
        HomeBloc.get.add(SwapHomeScreenStateEvent(homeScreenState:HomeScreenState.PRODUCTDETAILS));
        HomeBloc.get.add(DetermentTodayDealEvent(isDaakeshTodayDeal:isDaakeshTodayDeal));

      },
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: 250.0.h,
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
              borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
            ),
            child: Stack(
              children: [
                Padding(
                  padding:EdgeInsetsDirectional.only(top: 25.0.h),
                  child: Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Assets.png.glasses.image(height: 80.0.h, width: 80.0.w)),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 2.0.w),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 75.0.w),
                    height: 22.0.h,
                    margin:  EdgeInsetsDirectional.only(top: 1.0.h, start: 4.0.w),
                    padding:  EdgeInsets.only(top: 2.0.h),
                    decoration: BoxDecoration(
                      color: ColorName.red,
                      borderRadius: BorderRadius.all(Radius.circular(4.0.r)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0.h),
                      child: Text(
                        '23% OFF',
                        textAlign: TextAlign.center,
                        style: easyTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 14.0.sp, color: ColorName.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 140.0.h,
            padding:EdgeInsetsDirectional.only(start: 16.0.w),
            decoration:  BoxDecoration(
              color: ColorName.white,
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
                Text(
                  'AquaOasis™ Cool Mist Humidefier (2.2L Water',
                  maxLines: 2,
                  style: easyTheme.textTheme.bodyMedium!.copyWith(
                      fontSize: 14.0.sp,
                      color: ColorName.gray,
                      overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 4.5.h,
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15.0.r,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    SizedBox(
                      width: 2.0.w,
                    ),
                    Flexible(
                      child: Text(
                        '5.9',
                        style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 14.0.sp,overflow:TextOverflow.ellipsis ),
                      ),
                    ),
                    SizedBox(
                      width: 4.0.w,
                    ),
                    Flexible(
                      child: Text(
                        '(200)',
                        style: easyTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 13.0.sp, color: ColorName.gray,overflow:TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                 Row(
                  children: [
                    Text('\$44',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 20.0.sp),),
                    Text('99 ',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 14.0.sp, color: ColorName.gray,),),
                    Flexible(
                      child: Text(
                        '\$79.99',
                        style: easyTheme.textTheme.headlineMedium!.copyWith(
                            fontSize: 14.0.sp,
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
                        Text('By ',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 13.0.sp, color: ColorName.gray)),
                        DaakeshLogoWidget(width: 63.0.w,),
                        SizedBox(width: 8.0.w),
                      ],
                    ),
                  ],
                ):Row(
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
                            Flexible(child: Text('NF Store',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 13.0.sp,overflow: TextOverflow.ellipsis))),
                             SizedBox(width: 8.0.w,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.0.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

