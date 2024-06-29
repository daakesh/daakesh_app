import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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

  void priceHandler() {
    if (widget.myProductItem.discount == null) {
      return;
    }
    double unFormattedPrice = widget.myProductItem.discount!.toDouble();
    unFormattedPrice = unFormattedPrice * 100;
    int formattedPrice = unFormattedPrice.toInt();
    price = int.parse(formattedPrice.toString()).toString();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => previewProduct(widget.myProductItem),
      child: Container(
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
                            '${widget.myProductItem.discountPercentage} ${context.locale.off}',
                            style: context.easyTheme.textTheme.labelLarge!
                                .copyWith(fontSize: 15.0.sp),
                          ),
                        ),
                      )
                    : const SizedBox(height: 30.0),
                const Spacer(),
                GestureDetector(
                  onTap: () => onEdit(widget.myProductItem),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(end: 10.0, top: 10),
                      child: Text(
                        context.locale.edit,
                        style: context.easyTheme.textTheme.bodyLarge!
                            .copyWith(fontSize: 14.0, color: ColorName.skyBlue),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => deleteItem(widget.myProductItem.id!),
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(end: 20.0, top: 13),
                      child: Text(
                        context.locale.delete_item,
                        style: context.easyTheme.textTheme.bodyLarge!
                            .copyWith(fontSize: 10.0, color: ColorName.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 12.0.w),
                Expanded(
                    child: CachedImage(
                  imageUrl: widget.myProductItem.itemImg != null
                      ? widget.myProductItem.itemImg!.first.toString()
                      : '',
                  fit: BoxFit.contain,
                  height: 80.0,
                )),
                SizedBox(width: 18.0.w),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 80.0.w),
                        child: Text(
                          '${widget.myProductItem.title}\n',
                          style: context.easyTheme.textTheme.labelMedium!
                              .copyWith(
                                  fontSize: 16.0.sp,
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
                            initialRating:
                                widget.myProductItem.averageRating!.toDouble(),
                            itemSize: 20.0.h,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          SizedBox(width: 8.0.w),
                          Text(
                            widget.myProductItem.averageRating!
                                .toDouble()
                                .toString(),
                            style: context.easyTheme.textTheme.labelMedium!
                                .copyWith(fontSize: 15.0.sp),
                          ),
                          SizedBox(width: 8.0.w),
                          Text(
                            '(${widget.myProductItem.rateCount})',
                            style: context.easyTheme.textTheme.labelMedium!
                                .copyWith(
                                    fontSize: 13.0.sp, color: ColorName.gray),
                          )
                        ],
                      ),
                      widget.myProductItem.discountPercentage! != '0%'
                          ? Row(
                              children: [
                                Text(
                                  '\$${widget.myProductItem.priceAfterDiscount!.toInt()}',
                                  style: context
                                      .easyTheme.textTheme.labelMedium!
                                      .copyWith(fontSize: 21.0.sp),
                                ),
                                const SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  '\$${widget.myProductItem.price}',
                                  style: context
                                      .easyTheme.textTheme.labelMedium!
                                      .copyWith(
                                    fontSize: 15.0.sp,
                                    color: ColorName.gray,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              '\$${widget.myProductItem.price}',
                              style: context.easyTheme.textTheme.labelMedium!
                                  .copyWith(fontSize: 21.0.sp),
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
              height: 4.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0.w),
              child: Row(
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
                                  text: context.locale.entry_date,
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(
                                          fontSize: 15.0.sp,
                                          color: ColorName.gray)),
                              TextSpan(
                                  text: Utils.formatDate(widget
                                      .myProductItem.createdAt
                                      .toString()),
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(
                                          fontSize: 15.0.sp,
                                          color: ColorName.black)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 11.0),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: context.locale.categories,
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(
                                          fontSize: 15.0.sp,
                                          color: ColorName.gray)),
                              TextSpan(
                                  text: Utils.isEnglish
                                      ? '${widget.myProductItem.category!.name}'
                                      : '${widget.myProductItem.category!.arName}',
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(
                                          fontSize: 15.0.sp,
                                          color: ColorName.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: context.locale.quantity,
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 15.0.sp,
                                        color: ColorName.gray)),
                            TextSpan(
                                text: ' ${widget.myProductItem.quantity}',
                                style: context.easyTheme.textTheme.bodyMedium!
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
                                text: context.locale.ship,
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 15.0.sp,
                                        color: ColorName.gray)),
                            TextSpan(
                                text: ' ${widget.myProductItem.country}',
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 15.0.sp,
                                        color: ColorName.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0.h),
          ],
        ),
      ),
    );
  }

  void onEdit(MyProductItem myProductItem) {
    AddProBloc.get.add(AddEditStateEvent(adjustProduct: AdjustProduct.EDIT));
    Utils.openNewPage(const AddProInfoScreen());
    MyProFuncBloc.get.add(EditProductEvent(
        myProductItem: myProductItem,
        productDisplayMethod: ProductDisplayMethod.Sell));
  }

  void deleteItem(int id) async {
    await context.showRemoveDialog().then((value) {
      if (value != null && value == true) {
        MyProBloc.get.add(RemoveItemEvent(id: id));
      }
    });
  }

  void previewProduct(MyProductItem myProductItem) {
    ProPreviewerModel previewerModel = ProPreviewerModel();
    previewerModel
      ..userName = myProductItem.user!.name
      ..itemImage = myProductItem.itemImg
      ..title = myProductItem.title
      ..sectionName = myProductItem.section!.name.toString()
      ..sectionArName = myProductItem.section!.arName.toString()
      ..averageRating = myProductItem.averageRating
      ..rateCount = myProductItem.rateCount
      ..priceAfterDiscount = myProductItem.priceAfterDiscount
      ..brandName = myProductItem.brand!.brandName
      ..brandArName = myProductItem.brand!.arName
      ..categoryName = myProductItem.category!.name
      ..categoryArName = myProductItem.category!.arName
      ..year = myProductItem.year
      ..description = myProductItem.description
      ..itemId = myProductItem.id
      ..citySwap = myProductItem.citySwap
      ..countrySwap = myProductItem.countrySwap
      ..subID = myProductItem.subcategory!.id
      ..date = myProductItem.date
      ..categoryID = myProductItem.category!.id
      ..discountPercentage = myProductItem.discountPercentage!
      ..price = myProductItem.price!;
    Utils.openNavNewPage(
        context, MyProPreviewerScreen(previewerModel: previewerModel));
  }
}
