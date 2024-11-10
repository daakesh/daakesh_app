import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class ProAddSuccessScreen extends StatelessWidget {
  final ProductDisplayMethod displayMethod;
  final MyProductItem myProductItem;
  const ProAddSuccessScreen({
    super.key,
    required this.displayMethod,
    required this.myProductItem,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        getIt.get<EditProduct>().clearData();

        addNewProduct();
      },
      child: DefaultBackgroundWidget(
        child: Scaffold(
          backgroundColor: ColorName.transparent,
          body: LayoutBuilderWidget(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 110,
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 58, end: 97),
                    child: DaakeshLogoWidget(),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.png.checkIcon.path))),
                  ),
                  const SizedBox(
                    height: 19.0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 21),
                    child: Text(
                      getIt.get<EditProduct>().myProductItem == null
                          ? context.locale.your_product_added_successfully
                          : context.locale.your_product_edited_successfully,
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 26.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 9.0,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child: DefaultButtonWidget(
                        text: context.locale.add_new_product,
                        onPressed: addNewProduct),
                  ),
                  const SizedBox(
                    height: 9.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child: OutlineButtonWidget(
                        text: context.locale.see_my_product,
                        onPressed: () => seeMyProduct(context)),
                  ),
                  const SizedBox(
                    height: 72.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addNewProduct() async {
    getIt.get<EditProduct>().clearData();

    Utils.openNewPage(const MainScreen(), popPreviousPages: true);
    HomeBloc.controller.jumpToTab(1);
    HomeBloc.get.add(SelectTabItemEvent(index: 1));
  }

  void seeMyProduct(BuildContext context) async {
    getIt.get<EditProduct>().clearData();

    ProPreviewerModel previewerModel = ProPreviewerModel();
    previewerModel
      ..userName = myProductItem.user!.name
      ..itemImage = myProductItem.itemImg
      ..sectionName = myProductItem.section!.name
      ..sectionArName = myProductItem.section!.arName
      ..title = myProductItem.title
      ..averageRating = myProductItem.averageRating
      ..rateCount = myProductItem.rateCount
      ..priceAfterDiscount = myProductItem.priceAfterDiscount
      ..brandName = myProductItem.brand!.brandName
      ..brandArName = myProductItem.brand!.arName
      ..categoryName = myProductItem.category!.name
      ..categoryArName = myProductItem.category!.arName
      ..year = myProductItem.year
      ..description = myProductItem.description
      ..citySwap = myProductItem.citySwap
      ..countrySwap = myProductItem.countrySwap
      ..itemId = myProductItem.id
      ..categoryID = myProductItem.category!.id
      ..price = myProductItem.price
      ..discountPercentage = myProductItem.discountPercentage
      ..citySwap = myProductItem.citySwap
      ..countrySwap = myProductItem.countrySwap
      ..date = myProductItem.date
      ..offerCount = 0;

    if (displayMethod.isSell) {
      HomeBloc.controller.jumpToTab(1);
      HomeBloc.get.add(SelectTabItemEvent(index: 1));
      Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (BuildContext context) {
            return const MainScreen();
          },
        ),
        (_) => false,
      );
      Utils.openNavNewPage(
          context, MyProPreviewerScreen(previewerModel: previewerModel));
    }
    if (displayMethod.isSwap) {
      HomeBloc.controller.jumpToTab(1);
      HomeBloc.get.add(SelectTabItemEvent(index: 1));
      Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (BuildContext context) {
            return const MainScreen();
          },
        ),
        (_) => false,
      );
      Utils.openNavNewPage(
          context, MySwapPreviewerScreen(previewerModel: previewerModel));
    }
  }
}
