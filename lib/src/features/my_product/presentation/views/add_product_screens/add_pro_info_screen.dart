import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class AddProInfoScreen extends StatefulWidget {
  const AddProInfoScreen({
    super.key,
  });

  @override
  State<AddProInfoScreen> createState() => _AddProInfoScreenState();
}

class _AddProInfoScreenState extends State<AddProInfoScreen> {
  final productNameController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final FocusNode nameSellerFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    setEditData();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        getIt.get<EditProduct>().clearData();
      },
      child: DefaultBackgroundWidget(
        child: Scaffold(
          backgroundColor: ColorName.transparent,
          body: LayoutBuilderWidget(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  InkWell(
                    focusColor: ColorName.transparent,
                    highlightColor: ColorName.transparent,
                    splashColor: ColorName.transparent,
                    onTap: () {
                      getIt.get<EditProduct>().clearData();
                      Navigator.pop(context);
                    },
                    child: Utils.flipWidget(Assets.svg.arrowBackIcon.svg()),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    context.locale.add_product,
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 36.0),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Text(
                    context.locale.add_product_info,
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 25.0),
                  ),
                  const SizedBox(
                    height: 19.0,
                  ),
                  Text(
                    context.locale.add_product_instruction,
                    style: context.easyTheme.textTheme.bodyMedium!
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
                        Text(context.locale.product_name,
                            style: context.easyTheme.textTheme.bodyMedium!
                                .copyWith(
                                    fontSize: 18.0, color: ColorName.darkGray)),
                        TextFormFieldWidget(
                          controller: productNameController,
                          focusNode: nameSellerFocusNode,
                          onFieldSubmitted: (value) => Utils.fieldFocusChange(
                              context, nameSellerFocusNode, phoneFocusNode),
                        ),
                        const SizedBox(height: 22.0),
                        Text(context.locale.product_description,
                            style: context.easyTheme.textTheme.bodyMedium!
                                .copyWith(
                                    fontSize: 18.0, color: ColorName.darkGray)),
                        const SizedBox(
                          height: 17.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    padding: const EdgeInsetsDirectional.only(
                        start: 10.0, end: 10, top: 7.0),
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(6.0)),
                      border: Border.all(color: ColorName.gray),
                    ),
                    child: TextFormFieldWidget(
                      controller: productDescriptionController,
                      hintText: context.locale.description_hint,
                      isUnderlineOn: true,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  const SizedBox(
                    height: 44.0,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Center(
                    child: DefaultButtonWidget(
                        text: context.locale.next_button,
                        onPressed: () => onNext()),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Center(
                    child: OutlineButtonWidget(
                        text: context.locale.cancel_button,
                        onPressed: () => cancel()),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onNext() async {
    if (productNameController.text.isEmpty ||
        productDescriptionController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(
          message: context.locale.add_pro_data_snack_bar);
      return;
    }
    AddProBloc.get.add(AddProInfoEvent(
      productName: productNameController.text,
      productDescription: productDescriptionController.text,
    ));
    Utils.openNewPage(const AddProCategoriesScreen());
  }

  void cancel() {
    Utils.getBack();
    resetData();
    getIt.get<EditProduct>().clearData();
  }

  void setEditData() {
    if (getIt.get<EditProduct>().myProductItem != null) {
      productNameController.text =
          getIt.get<EditProduct>().myProductItem!.title.toString();
      productDescriptionController.text =
          getIt.get<EditProduct>().myProductItem!.description.toString();
    }
  }

  void resetData() {}
}
