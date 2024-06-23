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
                  SizedBox(
                    height: 110.0.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(start: 58.0.w, end: 97.0.w),
                    child: const DaakeshLogoWidget(),
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
                        EdgeInsetsDirectional.symmetric(horizontal: 21.0.w),
                    child: Text(
                      context.locale.your_product_added_successfully,
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
                    padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                    child: DefaultButtonWidget(
                        text: context.locale.add_new_product,
                        onPressed: addNewProduct),
                  ),
                  const SizedBox(
                    height: 9.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.0.w),
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
    Utils.openNewPage(const MainScreen(), popPreviousPages: true);
    HomeBloc.controller.jumpToTab(1);
    HomeBloc.get.add(SelectTabItemEvent(index: 1));
  }

  void seeMyProduct(BuildContext context) async {
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
