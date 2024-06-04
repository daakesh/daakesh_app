import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class SwapProductItem extends StatelessWidget {
  final MyProductItem myProductItem;
  const SwapProductItem({super.key, required this.myProductItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => previewProduct(context),
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
            GestureDetector(
              onTap: () => onEdit(myProductItem),
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: 20.0.w, top: 12.0.h),
                  child: Text(
                    context.locale.edit,
                    style: context.easyTheme.textTheme.bodyLarge!
                        .copyWith(fontSize: 14.0, color: ColorName.skyBlue),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 7.0.w),
                Expanded(
                    child: CachedImage(
                  imageUrl: myProductItem.itemImg != null
                      ? myProductItem.itemImg!.first
                      : '',
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
                          '${myProductItem.title!}\n',
                          style: context.easyTheme.textTheme.labelMedium!
                              .copyWith(
                                  fontSize: 15.0.sp,
                                  color: ColorName.gray,
                                  overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(height: 9.0.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: context.locale.ship,
                                style: context.easyTheme.textTheme.labelLarge!
                                    .copyWith(
                                        fontSize: 15.0.sp,
                                        color: ColorName.gray)),
                            TextSpan(
                                text: '${myProductItem.countrySwap}',
                                style: context.easyTheme.textTheme.labelLarge!
                                    .copyWith(
                                        fontSize: 13.0.sp,
                                        color: ColorName.black)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: context.locale.display,
                                style: context.easyTheme.textTheme.labelLarge!
                                    .copyWith(
                                        fontSize: 15.0.sp,
                                        color: ColorName.gray)),
                            TextSpan(
                                text: ' : ${myProductItem.display}',
                                style: context.easyTheme.textTheme.labelLarge!
                                    .copyWith(
                                        fontSize: 13.0.sp,
                                        color: ColorName.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.0.h),
            Center(
              child: DefaultButtonWidget(
                text: context.locale.delete_item,
                onPressed: () => deleteItem(context, myProductItem.id!),
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
        productDisplayMethod: ProductDisplayMethod.Swap));
  }

  void deleteItem(BuildContext context, int id) async {
    context.showRemoveDialog().then((value) {
      if (value) {
        MySwapProBloc.get.add(RemoveSwapItemEvent(id: id));
      }
    });
  }

  void previewProduct(BuildContext context) {
    ProPreviewerModel previewerModel = ProPreviewerModel();
    previewerModel
      ..userName = myProductItem.user!.name
      ..itemImage = myProductItem.itemImg
      ..title = myProductItem.title
      ..averageRating = myProductItem.averageRating
      ..rateCount = myProductItem.rateCount
      ..sectionName = myProductItem.section!.name.toString()
      ..sectionArName = myProductItem.section!.arName.toString()
      ..priceAfterDiscount = myProductItem.priceAfterDiscount
      ..brandName = myProductItem.brand!.brandName
      ..brandArName = myProductItem.brand!.arName
      ..categoryName = myProductItem.category!.name
      ..categoryArName = myProductItem.category!.arName
      ..citySwap = myProductItem.citySwap
      ..countrySwap = myProductItem.countrySwap
      ..year = myProductItem.year
      ..description = myProductItem.description
      ..itemId = myProductItem.id
      ..date = myProductItem.date
      ..categoryID = myProductItem.category!.id
      ..offerCount = myProductItem.offerCount;
    Utils.openNavNewPage(
        context, MySwapPreviewerScreen(previewerModel: previewerModel));
  }
}
