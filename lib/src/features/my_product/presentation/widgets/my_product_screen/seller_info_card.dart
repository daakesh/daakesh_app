import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../src.export.dart';

class SellerInfoCard extends StatelessWidget {
  const SellerInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellerInfoBloc, SellerInfoState>(
      builder: (context, state) {
        return state.sellerInfoModel.isNotEmpty
            ? Container(
                width: double.infinity,
                margin: EdgeInsetsDirectional.symmetric(horizontal: 21.0.w),
                padding: EdgeInsetsDirectional.only(
                    start: 16.0.w, end: 13.0.w, bottom: 15.0.h, top: 11.0.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                    color: ColorName.white,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 3.0,
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                      ),
                    ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          context.locale.seller_info,
                          style: context.easyTheme.textTheme.headlineMedium!
                              .copyWith(fontSize: 19.0.sp),
                        )),
                        InkWell(
                          onTap: () =>
                              onEditSellerInfo(state.sellerInfoModel.first),
                          child: Text(
                            context.locale.edit_button,
                            style: context.easyTheme.textTheme.headlineMedium!
                                .copyWith(
                                    fontSize: 14.0.sp,
                                    color: ColorName.skyBlue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 9.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.locale.user_name,
                                style: context.easyTheme.textTheme.bodySmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.0.sp),
                              ),
                              SizedBox(
                                height: 2.0.h,
                              ),
                              Text(
                                '${state.sellerInfoModel.first.userName}',
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(fontSize: 14.0.sp),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.locale.used_phone,
                                style: context.easyTheme.textTheme.bodySmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.0.sp),
                              ),
                              SizedBox(
                                height: 2.0.h,
                              ),
                              Text(
                                '${state.sellerInfoModel.first.usedPhone}',
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(fontSize: 14.0.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    Row(
                      children: [
                        Text(
                          context.locale.your_store_rate,
                          style: context.easyTheme.textTheme.bodyMedium!
                              .copyWith(
                                  fontSize: 13.0.sp, color: ColorName.grayish),
                        ),
                        SizedBox(
                          width: 8.0.w,
                        ),
                        RatingBar.builder(
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          minRating: 1,
                          maxRating: 5,
                          ignoreGestures: true,
                          initialRating:
                              state.sellerInfoModel.first.storeRate!.toDouble(),
                          itemSize: 14.0.sp,
                          tapOnlyMode: true,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        SizedBox(
                          width: 9.0.sp,
                        ),
                        Expanded(
                            child: Text(
                          '${state.sellerInfoModel.first.storeRate!.toDouble()}',
                          style: context.easyTheme.textTheme.labelLarge!
                              .copyWith(
                                  fontSize: 13.0.sp, color: ColorName.black),
                        )),
                        Text(
                          state.sellerInfoModel.first.active == 1
                              ? context.locale.active
                              : context.locale.inActive,
                          style:
                              context.easyTheme.textTheme.labelMedium!.copyWith(
                            fontSize: 16.0.sp,
                            color: state.sellerInfoModel.first.active == 1
                                ? ColorName.darkGreen
                                : ColorName.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : const SizedBox();
      },
    );
  }

  void onEditSellerInfo(SellerInfoData sellerInfoData) {
    Utils.openNewPage(EditSellerInfoScreen(sellerInfoData: sellerInfoData));
  }
}
