import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../src.export.dart';

class ForSaleScreen extends StatefulWidget {
  const ForSaleScreen({super.key});
  @override
  State<ForSaleScreen> createState() => _ForSaleScreenState();
}

class _ForSaleScreenState extends State<ForSaleScreen> {
  final productQuantityController = TextEditingController();
  final productPriceController = TextEditingController();
  final productDiscountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setEditData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 26, end: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 70),
                    InkWell(
                      focusColor: ColorName.transparent,
                      highlightColor: ColorName.transparent,
                      splashColor: ColorName.transparent,
                      onTap: () => Navigator.pop(context),
                      child: Utils.flipWidget(Assets.svg.arrowBackIcon.svg()),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Text(
                      context.locale.add_product,
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 36),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      context.locale.for_sale_info,
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    Text(
                      context.locale.add_product_instruction,
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.locale.product_quantity,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0,
                            color: ColorName.black.withOpacity(0.5))),
                    TextFormFieldWidget(
                      controller: productQuantityController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        RegExpValidator.clearZero,
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(context.locale.product_price,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0,
                            color: ColorName.black.withOpacity(0.5))),
                    TextFormFieldWidget(
                      controller: productPriceController,
                      isSuffixPrefixOn: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        RegExpValidator.clearZero,
                      ],
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    BlocBuilder<MyProFuncBloc, MyProFuncState>(
                      builder: (context, state) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(context.locale.product_discount,
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 18.0,
                                              color: ColorName.black
                                                  .withOpacity(0.5))),
                                  TextFormFieldWidget(
                                    controller: productDiscountController,
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    enabled: state.discountSwitchButton,
                                    inputFormatters: [
                                      //LengthLimitingTextInputFormatter(3),
                                      FilteringTextInputFormatter.digitsOnly,
                                      PercentInputFormatter(),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Align(
                                    alignment: AlignmentDirectional.topEnd,
                                    child: Transform.scale(
                                      scale: 0.8,
                                      child: Switch(
                                          value: state.discountSwitchButton,
                                          activeColor: ColorName.amber,
                                          hoverColor: ColorName.amber,
                                          activeTrackColor: ColorName.amber,
                                          focusColor: ColorName.amber,
                                          inactiveThumbColor: ColorName.white,
                                          inactiveTrackColor: ColorName.gray,
                                          thumbColor: MaterialStateProperty.all(
                                              ColorName.white),
                                          onChanged: (value) {
                                            MyProFuncBloc.get.add(
                                                OnOffDiscountEvent(
                                                    value: value));
                                            if (!value) {
                                              clearDiscountData();
                                              return;
                                            }
                                            getOldData();
                                          }),
                                    ))),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 77,
              ),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: DefaultButtonWidget(
                    text: context.locale.next_button,
                    onPressed: () => onNext()),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: OutlineButtonWidget(
                    text: context.locale.cancel_button,
                    onPressed: () => cancel()),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setEditData() {
    double? discount;
    if (getIt.get<EditProduct>().myProductItem != null) {
      var data = getIt.get<EditProduct>().myProductItem;
      if (data!.discount != null) {
        MyProFuncBloc.get.add(OnOffDiscountEvent(value: true));
        discount = double.parse(data.discount.toString()) * 100;
        productDiscountController.text = '${discount.toInt()}%';
      }
      productQuantityController.text = data.quantity.toString();
      productPriceController.text = data.price.toString();
    }
  }

  void getOldData() {
    if (getIt.get<EditProduct>().myProductItem != null) {
      var data = getIt.get<EditProduct>().myProductItem;
      double discount = double.parse(data!.discount.toString()) * 100;
      productDiscountController.text = '${discount.toInt()}%';
    }
  }

  void clearDiscountData() {
    productDiscountController.clear();
  }

  void selectDiscountDate(context, TextEditingController controller) async {
    await showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            minimumYear: DateTime.now().year,
            maximumYear: 2100,
            onDateTimeChanged: (DateTime newDateTime) {
              controller.text = DateFormat('yyyy-MM-dd').format(newDateTime);
            },
          ),
        );
      },
    );
  }

  void onNext() async {
    if (productQuantityController.text.isEmpty ||
        productPriceController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(
          message: context.locale.add_pro_data_snack_bar);
      return;
    }
    AddProBloc.get.add(AddSaleInfoEvent(
      productQuantity: productQuantityController.text,
      productPrice: productPriceController.text,
      productDiscount: productDiscountController.text,
    ));
    Utils.openNewPage(const ShipToScreen());
  }

  void cancel() {
    Utils.getBack();
  }
}
