import 'package:flutter/material.dart';
import '../../../../../../src.export.dart';

class ReceiveDoneDealItem extends StatelessWidget {
  final SendReceiveSwapReqItem receiveSwapReqItem;
  const ReceiveDoneDealItem({super.key, required this.receiveSwapReqItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.only(
          start: 15.0.w, end: 15.0.w, bottom: 11.0.h),
      decoration: BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.all(Radius.circular(11.0.r)),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 3.0,
                color: Color.fromRGBO(0, 0, 0, 0.16))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 19.0.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 12.0.w),
              Expanded(
                child: CachedImage(
                    imageUrl: receiveSwapReqItem.offerItems!.itemImg != null
                        ? receiveSwapReqItem.offerItems!.itemImg!.first
                        : ''),
              ),
              SizedBox(width: 18.0.w),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 80.0.w),
                      child: Text(
                        '${receiveSwapReqItem.offerItems!.title}\n',
                        style: context.easyTheme.textTheme.labelMedium!
                            .copyWith(
                                fontSize: 15.0.sp,
                                color: ColorName.gray,
                                overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    Text(
                      '${receiveSwapReqItem.offerItems!.citySwap}, ${receiveSwapReqItem.offerItems!.countrySwap}',
                      style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                        fontSize: 13.0.sp,
                        color: ColorName.mediumSilver,
                      ),
                    ),
                    SizedBox(
                      height: 12.0.h,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: context.locale.you_made_a_deal_title,
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      color: ColorName.springGreen,
                                      fontSize: 16.0.sp)),
                          TextSpan(
                              text: '${receiveSwapReqItem.offerUser!.name}',
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      color: ColorName.black,
                                      fontSize: 15.0.sp)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 18.0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 15.0.w),
                child: Text(context.locale.swap_product_title,
                    style: context.easyTheme.textTheme.labelLarge!
                        .copyWith(fontSize: 15.0.sp, color: ColorName.black)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(end: 15.0.w),
                child: TextButtonWidget(
                  text: context.locale.see_offer_details,
                  style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                    fontSize: 14.0.sp,
                    color: ColorName.skyBlue,
                    fontFamily: FontFamily.apercuBold,
                  ),
                  onPressed: () {},
                  isBold: true,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3.0.h,
          ),
          Container(
            width: double.infinity,
            height: 42.0.h,
            color: ColorName.lightGrayishBlue,
            child: Row(
              children: [
                SizedBox(width: 14.0.w),
                Expanded(
                  child: CachedImage(
                      imageUrl: receiveSwapReqItem.sourceItems!.itemImg != null
                          ? receiveSwapReqItem.sourceItems!.itemImg!.first
                          : ''),
                ),
                SizedBox(width: 15.0.w),
                Expanded(
                  flex: 4,
                  child: Text(
                    '${receiveSwapReqItem.sourceItems!.title}',
                    overflow: TextOverflow.ellipsis,
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14.0.sp, color: ColorName.gray),
                  ),
                ),
                SizedBox(width: 15.0.w),
                Text(
                  context.locale.product_title,
                  overflow: TextOverflow.ellipsis,
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 14.0.sp, color: ColorName.burgundy),
                ),
                SizedBox(width: 16.0.w),
              ],
            ),
          ),
          SizedBox(
            height: 17.0.h,
          ),
          Divider(
            color: ColorName.gray,
            indent: 15.0.w,
            endIndent: 15.0.w,
          ),
          Row(
            children: [
              SizedBox(
                width: 17.0.w,
              ),
              Expanded(
                  child: DefaultButtonWidget(
                      text: context.locale.call_button_title,
                      onPressed: () => Utils.lunchCall(receiveSwapReqItem
                          .offerUser!.phoneNumber
                          .toString()))),
              SizedBox(
                width: 9.0.w,
              ),
              Expanded(
                child: DefaultButtonWidget(
                  text: context.locale.whatsApp_button_title,
                  onPressed: () => Utils.lunchWhatsApp(
                      receiveSwapReqItem.offerUser!.phoneNumber.toString()),
                  style: context.easyTheme.elevatedButtonTheme.style!.copyWith(
                      backgroundColor:
                          MaterialStateProperty.all(ColorName.amber)),
                ),
              ),
              SizedBox(
                width: 17.0.w,
              ),
            ],
          ),
          SizedBox(
            height: 16.0.h,
          ),
        ],
      ),
    );
  }
}
