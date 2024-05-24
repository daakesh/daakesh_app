import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../../src.export.dart';

class SendSwapAcceptedItem extends StatelessWidget {
  final SendReceiveSwapReqItem sendSwapReqItem;
  const SendSwapAcceptedItem({super.key, required this.sendSwapReqItem});

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
          SizedBox(height: 9.0.h),
          Row(
            children: [
              SizedBox(
                width: 14.0.w,
              ),
              Text(
                context.locale.swapRequests,
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 18.0.sp, color: ColorName.black),
              ),
              SizedBox(
                width: 3.0.w,
              ),
              Text(
                '#${sendSwapReqItem.offerId ?? "12345"}',
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 18.0.sp, color: ColorName.black),
              ),
              SizedBox(
                width: 9.0.w,
              ),
              const Spacer(
                flex: 1,
              ),
              Text(
                context.locale.send_accept_title,
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 12.0.sp, color: ColorName.springGreen),
              ),
              SizedBox(
                width: 15.0.w,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0.w),
            child: Text(
              '${context.locale.request_in} ${Utils.formatDate(sendSwapReqItem.createdAt.toString())}',
              style: context.easyTheme.textTheme.labelLarge!.copyWith(
                fontSize: 14.0.sp,
                color: ColorName.gray,
              ),
            ),
          ),
          SizedBox(height: 8.0.h),
          Container(
            width: double.infinity,
            height: 42.0.h,
            color: ColorName.lightGrayishBlue,
            child: Row(
              children: [
                SizedBox(width: 14.0.w),
                Expanded(
                  child: CachedImage(
                      imageUrl: sendSwapReqItem.sourceItems!.itemImg != null
                          ? sendSwapReqItem.sourceItems!.itemImg!.first
                          : ''),
                ),
                SizedBox(width: 15.0.w),
                Expanded(
                  flex: 4,
                  child: Text(
                    '${sendSwapReqItem.sourceItems!.title}',
                    overflow: TextOverflow.ellipsis,
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14.0.sp, color: ColorName.gray),
                  ),
                ),
                SizedBox(width: 50.0.w),
                Text(
                  context.locale.send_product_title,
                  overflow: TextOverflow.ellipsis,
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 14.0.sp, color: ColorName.burgundy),
                ),
                SizedBox(width: 16.0.w),
              ],
            ),
          ),
          SizedBox(height: 4.0.h),
          Container(
            width: double.infinity,
            height: 42.0.h,
            color: ColorName.white,
            child: Row(
              children: [
                SizedBox(width: 14.0.w),
                Expanded(
                    child: CachedImage(
                        imageUrl: sendSwapReqItem.offerItems!.itemImg != null
                            ? sendSwapReqItem.offerItems!.itemImg!.first
                            : '')),
                SizedBox(width: 15.0.w),
                Expanded(
                  flex: 4,
                  child: Text(
                    '${sendSwapReqItem.offerItems!.title}',
                    overflow: TextOverflow.ellipsis,
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14.0.sp, color: ColorName.gray),
                  ),
                ),
                SizedBox(width: 50.0.w),
                Text(
                  context.locale.send_offer_title,
                  overflow: TextOverflow.ellipsis,
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 14.0.sp, color: ColorName.burgundy),
                ),
                SizedBox(width: 16.0.w),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 60.0.w),
            child: TextButtonWidget(
              text: context.locale.see_all_details,
              onPressed: () => seeAllDetails(context, sendSwapReqItem),
              isBold: true,
            ),
          ),
          Divider(
            color: ColorName.gray,
            endIndent: 16.5.w,
            indent: 16.5.w,
          ),
          Row(
            children: [
              SizedBox(width: 19.0.w),
              Expanded(
                child: DefaultButtonWidget(
                  text: context.locale.call_button,
                  onPressed: () => Utils.lunchCall(
                      sendSwapReqItem.sourceUser!.phoneNumber.toString()),
                  style: context.easyTheme.elevatedButtonTheme.style,
                ),
              ),
              SizedBox(
                width: 9.0.w,
              ),
              Expanded(
                child: DefaultButtonWidget(
                  text: context.locale.whatsApp_title,
                  onPressed: () => Utils.lunchWhatsApp(
                      sendSwapReqItem.sourceUser!.phoneNumber.toString()),
                  style: context.easyTheme.elevatedButtonTheme.style!.copyWith(
                    backgroundColor: MaterialStateProperty.all(ColorName.amber),
                  ),
                ),
              ),
              SizedBox(width: 19.0.w),
            ],
          ),
          SizedBox(height: 13.0.h),
        ],
      ),
    );
  }

  void seeAllDetails(context, sendSwapReqItem) {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: SwapRequestDetailsScreen(sendSwapReqItem: sendSwapReqItem),
      withNavBar: true,
    );
  }
}
