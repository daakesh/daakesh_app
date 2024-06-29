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
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();

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
                padding: EdgeInsetsDirectional.only(start: 26.0.w, end: 22.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 70.0.h),
                    InkWell(
                      focusColor: ColorName.transparent,
                      highlightColor: ColorName.transparent,
                      splashColor: ColorName.transparent,
                      onTap: () => Navigator.pop(context),
                      child: Utils.flipWidget(Assets.svg.arrowBackIcon.svg()),
                    ),
                    SizedBox(
                      height: 11.0.h,
                    ),
                    Text(
                      context.locale.add_product,
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 36.0.sp),
                    ),
                    SizedBox(
                      height: 14.0.h,
                    ),
                    Text(
                      context.locale.for_sale_info,
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 25.0.sp),
                    ),
                    SizedBox(
                      height: 19.0.h,
                    ),
                    Text(
                      context.locale.add_product_instruction,
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 16.0.sp),
                    ),
                    SizedBox(
                      height: 25.0.h,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0.w),
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
                    ),
                    SizedBox(
                      height: 22.0.h,
                    ),
                    Text(context.locale.product_price,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0,
                            color: ColorName.black.withOpacity(0.5))),
                    TextFormFieldWidget(
                      controller: productPriceController,
                      isSuffixPrefixOn: true,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 21.0.h,
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
                                  SizedBox(
                                    height: 22.0.h,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.0.w,
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
                    SizedBox(
                      height: 22.0.h,
                    ),
                    BlocBuilder<MyProFuncBloc, MyProFuncState>(
                      builder: (context, state) {
                        return state.discountSwitchButton
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(context.locale.discount_date,
                                      style: context
                                          .easyTheme.textTheme.bodyMedium!
                                          .copyWith(
                                              color: ColorName.black
                                                  .withOpacity(0.5))),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: TextFormFieldWidget(
                                        controller: fromDateController,
                                        hintText: context.locale.from_discount,
                                        hintStyle: context
                                            .easyTheme.textTheme.labelMedium,
                                        readOnly: true,
                                        onTap: () => selectDiscountDate(
                                            context, fromDateController),
                                      )),
                                      Expanded(
                                          child: TextFormFieldWidget(
                                        controller: toDateController,
                                        hintText: context.locale.to_discount,
                                        hintStyle: context
                                            .easyTheme.textTheme.labelMedium,
                                        readOnly: true,
                                        onTap: () => selectDiscountDate(
                                            context, toDateController),
                                      )),
                                    ],
                                  ),
                                ],
                              )
                            : const SizedBox();
                      },
                    ),
                    SizedBox(
                      height: 21.0.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 77.0.h,
              ),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                child: DefaultButtonWidget(
                    text: context.locale.next_button,
                    onPressed: () => onNext()),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                child: OutlineButtonWidget(
                    text: context.locale.cancel_button,
                    onPressed: () => cancel()),
              ),
              SizedBox(
                height: 50.0.h,
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
        fromDateController.text = data.discountFrom.toString();
        toDateController.text = data.discountTo.toString();
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
      fromDateController.text = data.discountFrom.toString();
      toDateController.text = data.discountTo.toString();
    }
  }

  void clearDiscountData() {
    productDiscountController.clear();
    fromDateController.clear();
    toDateController.clear();
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
      fromDate: fromDateController.text,
      toDate: toDateController.text,
    ));
    Utils.openNewPage(const ShipToScreen());
  }

  void cancel() {
    Utils.getBack();
  }
}
