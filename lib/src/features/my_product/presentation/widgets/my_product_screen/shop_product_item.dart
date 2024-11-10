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
        margin: const EdgeInsetsDirectional.only(
          start: 15,
          end: 15,
          bottom: 13,
        ),
        decoration: const BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
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
                        height: 30,
                        constraints: const BoxConstraints(
                          minWidth: 70,
                        ),
                        margin: const EdgeInsetsDirectional.symmetric(
                            horizontal: 6),
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 6),
                        decoration: const BoxDecoration(
                            color: ColorName.red,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: Center(
                          child: Text(
                            '${widget.myProductItem.discountPercentage} ${context.locale.off}',
                            style: context.easyTheme.textTheme.labelLarge!
                                .copyWith(fontSize: 15),
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
                          const EdgeInsetsDirectional.only(end: 20, top: 10),
                      child: Assets.svg.editIcon.svg(width: 20, height: 20),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => deleteItem(widget.myProductItem.id!),
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(end: 20.0, top: 10),
                      child: Assets.svg.deleteIcon.svg(
                        color: ColorName.red,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 12),
                Expanded(
                    child: CachedImage(
                  imageUrl: widget.myProductItem.itemImg != null
                      ? widget.myProductItem.itemImg!.first.toString()
                      : '',
                  fit: BoxFit.contain,
                  height: 80.0,
                )),
                const SizedBox(width: 18),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 80),
                        child: Text(
                          '${widget.myProductItem.title}\n',
                          style: context.easyTheme.textTheme.labelMedium!
                              .copyWith(
                                  fontSize: 16,
                                  color: ColorName.gray,
                                  overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
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
                            itemSize: 20,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.myProductItem.averageRating!
                                .toDouble()
                                .toString(),
                            style: context.easyTheme.textTheme.labelMedium!
                                .copyWith(fontSize: 15),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '(${widget.myProductItem.rateCount})',
                            style: context.easyTheme.textTheme.labelMedium!
                                .copyWith(fontSize: 13, color: ColorName.gray),
                          )
                        ],
                      ),
                      Text(
                        '${context.locale.jordan_dinar} ${widget.myProductItem.priceAfterDiscount!}',
                        style: context.easyTheme.textTheme.labelMedium!
                            .copyWith(fontSize: 21),
                      ),

                      ///widget.myProductItem.discountPercentage! != '0%'
                      ///    ? Row(
                      ///        children: [
                      ///          Text(
                      ///            '${context.locale.jordan_dinar} ${widget.myProductItem.priceAfterDiscount!}',
                      ///            style: context
                      ///                .easyTheme.textTheme.labelMedium!
                      ///                .copyWith(fontSize: 21),
                      ///          ),
                      ///          const SizedBox(
                      ///            width: 6.0,
                      ///          ),
                      ///          Text(
                      ///            '${context.locale.jordan_dinar} ${widget.myProductItem.price}',
                      ///            style: context
                      ///                .easyTheme.textTheme.labelMedium!
                      ///                .copyWith(
                      ///              fontSize: 15,
                      ///              color: ColorName.gray,
                      ///              decoration: TextDecoration.lineThrough,
                      ///            ),
                      ///          ),
                      ///        ],
                      ///      )
                      ///    : Text(
                      ///        '${context.locale.jordan_dinar} ${widget.myProductItem.price}',
                      ///        style: context.easyTheme.textTheme.labelMedium!
                      ///            .copyWith(fontSize: 21),
                      ///      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              color: ColorName.gray,
              endIndent: 17,
              indent: 17,
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
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
                                          fontSize: 15, color: ColorName.gray)),
                              TextSpan(
                                  text: Utils.formatDate(widget
                                      .myProductItem.createdAt
                                      .toString()),
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(
                                          fontSize: 15,
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
                                          fontSize: 15, color: ColorName.gray)),
                              TextSpan(
                                  text: Utils.isEnglish
                                      ? '${widget.myProductItem.category!.name}'
                                      : '${widget.myProductItem.category!.arName}',
                                  style: context.easyTheme.textTheme.bodyMedium!
                                      .copyWith(
                                          fontSize: 15,
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
                                        fontSize: 15, color: ColorName.gray)),
                            TextSpan(
                                text: ' ${widget.myProductItem.quantity}',
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 15, color: ColorName.black)),
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
                                        fontSize: 15, color: ColorName.gray)),
                            TextSpan(
                                text: ' ${widget.myProductItem.country}',
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 15, color: ColorName.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
