import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../../src.export.dart';

class ReceiveSwapWaitingItem extends StatelessWidget {
  final SendReceiveSwapReqItem sendReceiveSwapReqItem;
  const ReceiveSwapWaitingItem({
    super.key,
    required this.sendReceiveSwapReqItem,
  });

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
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Padding(
              padding: EdgeInsetsDirectional.only(end: 17.0.w, top: 7.0.h),
              child: Text(
                context.locale.receive_waiting,
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 12.0.sp, color: ColorName.red),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 12.0.w),
              Expanded(
                  child: CachedImage(
                      imageUrl: sendReceiveSwapReqItem.offerItems!.itemImg !=
                              null
                          ? sendReceiveSwapReqItem.offerItems!.itemImg!.first
                          : '')),
              SizedBox(width: 18.0.w),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 80.0.w),
                      child: Text(
                        '${sendReceiveSwapReqItem.offerItems!.title}\n',
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
                      '${sendReceiveSwapReqItem.offerItems!.citySwap}, ${sendReceiveSwapReqItem.offerItems!.countrySwap}',
                      style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                        fontSize: 13.0.sp,
                        color: ColorName.mediumSilver,
                      ),
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: '(',
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      color: ColorName.gray,
                                      fontSize: 16.0.sp)),
                          TextSpan(
                              text:
                                  '${sendReceiveSwapReqItem.offerItems!.offerCount}',
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      color: ColorName.red, fontSize: 16.0.sp)),
                          TextSpan(
                              text: ') ',
                              style: context.easyTheme.textTheme.labelLarge!
                                  .copyWith(
                                      color: ColorName.gray,
                                      fontSize: 16.0.sp)),
                          TextSpan(
                              text: context.locale.receive_offers_submitted,
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
            height: 23.0.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Center(
                child: DefaultButtonWidget(
                    text: context.locale.start_swap,
                    onPressed: () =>
                        onStartSwap(context, sendReceiveSwapReqItem))),
          ),
          SizedBox(
            height: 16.0.h,
          ),
        ],
      ),
    );
  }

  void onStartSwap(context, SendReceiveSwapReqItem sendReceiveSwapReqItem) {
    Utils.openNavNewPage(context,
        StartSwapScreen(sendReceiveSwapReqItem: sendReceiveSwapReqItem));
  }

  void deleteItem(BuildContext context, int id) {
    context.showRemoveDialog().then((value) {
      if (value != null && value == true) {
        MySwapOrderBloc.get.add(RemoveReceiveOfferItemEvent(id: id));
      }
    });
  }
}
