import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class AddProCategoriesScreen extends StatelessWidget {
   AddProCategoriesScreen({super.key});
  final productCategoriesController = TextEditingController();
  final productBrandController = TextEditingController();
  final productSectionController = TextEditingController();
  final productModelYearController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor:ColorName.transparent,
        body: LayoutBuilderWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 108.0,
                ),
                InkWell(
                  focusColor: ColorName.transparent,
                  highlightColor: ColorName.transparent,
                  splashColor: ColorName.transparent,
                  onTap:()=>getBack(),
                  child: Assets.svg.arrowBackIcon.svg(),
                ),
                const SizedBox(
                  height: 11.0,
                ),
                Text(
                  'Add Product',
                  style: easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 36.0),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Text(
                  'Add Product Categories',
                  style: easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 25.0),
                ),
                const SizedBox(
                  height: 19.0,
                ),
                Text(
                  'This information is required to allow your customers to communicate with you. Your account information is used if it is not changed',
                  style: easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 16.0),
                ),
                const SizedBox(
                  height: 21.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Categories',
                        style: easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5)),
                      ),
                      TextFormFieldWidget(
                          controller: productCategoriesController,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          isSuffixPrefixOn: true,
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: Center(child: Assets.svg.arrowDropDownIcon.svg())),
                          )),
                      const SizedBox(height: 21.0,),
                      Text(
                        'Product Brand',
                        style: easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5)),
                      ),
                      TextFormFieldWidget(
                          controller: productBrandController,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          isSuffixPrefixOn: true,
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: Center(child: Assets.svg.arrowDropDownIcon.svg())),
                          )),
                      const SizedBox(height: 21.0,),
                      Text(
                        'Product Section',
                        style: easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5)),
                      ),
                      TextFormFieldWidget(
                          controller: productSectionController,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          isSuffixPrefixOn: true,
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: Center(child: Assets.svg.arrowDropDownIcon.svg())),
                          )),
                      const SizedBox(height: 21.0,),
                      Text(
                        'Product Model Year',
                        style: easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5)),
                      ),
                      TextFormFieldWidget(
                          controller: productModelYearController,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          isSuffixPrefixOn: true,
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: Center(child: Assets.svg.arrowDropDownIcon.svg())),
                          )),
                      const SizedBox(height: 70.0,),
                    ],
                  ),
                ),
                const Spacer(flex: 1,),
                Center(
                  child: DefaultButtonWidget(
                      text:'NEXT', onPressed: ()=>onNext()),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Center(
                  child:
                  OutlineButtonWidget(text:'CANCEL', onPressed: ()=>cancel()),
                ),
                const SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onNext()async{
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 2));
    ProgressCircleDialog.dismiss();
    openNewPage(const AddProImagesScreen());
  }
  void cancel(){
    getBack();
    resetData();
  }
  void resetData(){}


}
