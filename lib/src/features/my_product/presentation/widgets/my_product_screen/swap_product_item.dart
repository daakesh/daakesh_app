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
              children: [
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () => onEdit(myProductItem),
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
                  onTap: () => deleteItem(context, myProductItem.id!),
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
                const SizedBox(width: 7),
                Expanded(
                    child: CachedImage(
                  imageUrl: myProductItem.itemImg != null
                      ? myProductItem.itemImg!.first
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
                          '${myProductItem.title!}\n',
                          style: context.easyTheme.textTheme.labelMedium!
                              .copyWith(
                                  fontSize: 15,
                                  color: ColorName.gray,
                                  overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(height: 9),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: context.locale.ship,
                                style: context.easyTheme.textTheme.labelLarge!
                                    .copyWith(
                                        fontSize: 14, color: ColorName.gray)),
                            TextSpan(
                                text: ' ${myProductItem.countrySwap}',
                                style: context.easyTheme.textTheme.labelLarge!
                                    .copyWith(
                                        fontSize: 14, color: ColorName.black)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: context.locale.display,
                                style: context.easyTheme.textTheme.labelLarge!
                                    .copyWith(
                                        fontSize: 14, color: ColorName.gray)),
                            TextSpan(
                                text:
                                    ' : ${Utils.displayHandler(context, myProductItem.display.toString())}',
                                style: context.easyTheme.textTheme.labelLarge!
                                    .copyWith(
                                        fontSize: 14, color: ColorName.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
        productDisplayMethod: ProductDisplayMethod.Swap));
  }

  void deleteItem(BuildContext context, int id) {
    context.showRemoveDialog().then((value) {
      if (value != null && value == true) {
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
