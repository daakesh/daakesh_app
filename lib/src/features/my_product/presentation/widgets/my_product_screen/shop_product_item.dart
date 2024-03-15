import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:json_theme/json_theme.dart';
import '../../../../../src.export.dart';

class ShopProductItem extends StatefulWidget {
  final MyProductItem myProductItem;
  const ShopProductItem({super.key, required this.myProductItem});

  @override
  State<ShopProductItem> createState() => _ShopProductItemState();
}

class _ShopProductItemState extends State<ShopProductItem> {
   String price = '';

  @override
  void initState() {
    super.initState();
    priceHandler();
  }

  void priceHandler(){
    if(widget.myProductItem.discount == null){
      return;
    }
    double unFormattedPrice = widget.myProductItem.discount!.toDouble();
    unFormattedPrice = unFormattedPrice * 100;
    int formattedPrice =unFormattedPrice.toInt() ;
    price = int.parse(formattedPrice.toString()).toString();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.only(
        start: 15.0.w,
        end: 15.0.w,
        bottom: 13.0.h,
      ),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0.r)),
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 3),
              color: Color.fromRGBO(0, 0, 0, 0.16),
              blurRadius: 6.0),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              price.isNotEmpty
                  ? Container(
                height: 30.0.h,
                constraints: BoxConstraints(
                  minWidth: 70.0.w,
                ),
                margin:
                EdgeInsetsDirectional.symmetric(horizontal: 6.0.w),
                padding:
                EdgeInsetsDirectional.symmetric(horizontal: 6.0.w),
                decoration: BoxDecoration(
                    color: ColorName.red,
                    borderRadius:
                    BorderRadius.all(Radius.circular(4.0.r))),
                child: Center(
                  child: Text(
                    '$price% OFF',
                    style: easyTheme.textTheme.labelLarge!
                        .copyWith(fontSize: 15.0.sp),
                  ),
                ),
              )
                  : const SizedBox(height: 30.0,),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: ()=>onEdit(widget.myProductItem),
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 20.0,
                    ),
                    child: Text(
                      'Edit',
                      style: easyTheme.textTheme.bodyLarge!.copyWith(
                          fontSize: 12.0, color: ColorName.skyBlue),
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 12.0.w),
                  Expanded(
                      child: CachedImage(
                          imageUrl: widget.myProductItem.itemImg.toString())),
                  SizedBox(width: 18.0.w),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          EdgeInsetsDirectional.only(end: 80.0.w),
                          child: Text(
                            '${widget.myProductItem.title}\n',
                            style: easyTheme.textTheme.labelMedium!
                                .copyWith(
                                fontSize: 15.0.sp,
                                color: ColorName.gray,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(
                          height: 8.0.h,
                        ),
                        Row(
                          children: [
                            RatingBar.builder(
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              minRating: 1,
                              maxRating: 5,
                              ignoreGestures: true,
                              initialRating: 5.0,
                              itemSize: 14.6.h,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                            SizedBox(width: 8.0.w),
                            Text(
                              '5.9',
                              style: easyTheme.textTheme.labelMedium!
                                  .copyWith(fontSize: 15.0.sp),
                            ),
                            SizedBox(width: 8.0.w),
                            Text(
                              '(200)',
                              style: easyTheme.textTheme.labelMedium!
                                  .copyWith(
                                  fontSize: 13.0.sp,
                                  color: ColorName.gray),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 38.0.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '\$${widget.myProductItem.price}',
                                    style: easyTheme
                                        .textTheme.labelMedium!
                                        .copyWith(fontSize: 21.0.sp),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 2.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          '99',
                                          style: easyTheme
                                              .textTheme.labelMedium!
                                              .copyWith(
                                              fontSize: 15.0.sp,
                                              color: ColorName.gray),
                                        ),
                                        SizedBox(width: 8.0.w),
                                        Text(
                                          '\$${widget.myProductItem.discount}',
                                          style: easyTheme
                                              .textTheme.labelMedium!
                                              .copyWith(
                                            fontSize: 15.0.sp,
                                            color: ColorName.gray,
                                            decoration: TextDecoration
                                                .lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: ColorName.gray,
                endIndent: 17.0.w,
                indent: 17.0.w,
              ),
              SizedBox(
                height: 15.0.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Entry Date : ',
                                    style: easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                        fontSize: 15.0.sp,
                                        color: ColorName.gray)),
                                TextSpan(
                                    text: formatDate(widget.myProductItem
                                        .createdAt
                                        .toString()),
                                    style: easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                        fontSize: 15.0.sp,
                                        color: ColorName.black)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 11.0,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Categories : ',
                                    style: easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                        fontSize: 15.0.sp,
                                        color: ColorName.gray)),
                                TextSpan(
                                    text:
                                    '${widget.myProductItem.category!.name}',
                                    style: easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                        fontSize: 15.0.sp,
                                        color: ColorName.black)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Quantity : ',
                                    style: easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                        fontSize: 15.0.sp,
                                        color: ColorName.gray)),
                                TextSpan(
                                    text: '${widget.myProductItem.quantity}',
                                    style: easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                        fontSize: 15.0.sp,
                                        color: ColorName.black)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 11.0,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Ship To : ',
                                    style: easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                        fontSize: 15.0.sp,
                                        color: ColorName.gray)),
                                TextSpan(
                                    text: '${widget.myProductItem.country}',
                                    style: easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                        fontSize: 15.0.sp,
                                        color: ColorName.black)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.0.h),
            ],
          ),
        ],
      ),
    );
  }

  void onEdit(MyProductItem myProductItem){
    AddProBloc.get.add(AddEditStateEvent(adjustProduct: AdjustProduct.EDIT));
    openNewPage(const AddProInfoScreen());
    MyProFuncBloc.get.add(EditProductEvent(
      myProductItem: myProductItem,
      productDisplayMethod: ProductDisplayMethod.Sell
    ));
  }


}




