import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        backgroundColor:ColorName.transparent,
        body: LayoutBuilderWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 26.0.w, end: 22.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 108.0.h,
                    ),
                    InkWell(
                      focusColor: ColorName.transparent,
                      highlightColor: ColorName.transparent,
                      splashColor: ColorName.transparent,
                      onTap:()=>getBack(),
                      child: Assets.svg.arrowBackIcon.svg(),
                    ),
                    SizedBox(
                      height: 11.0.h,
                    ),
                    Text(
                      'Add Product',
                      style: easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 36.0.sp),
                    ),
                    SizedBox(
                      height: 14.0.h,
                    ),
                    Text(
                      'For Sale Info',
                      style: easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 25.0.sp),
                    ),
                    SizedBox(
                      height: 19.0.h,
                    ),
                    Text(
                      'This information is required to allow your customers to communicate with you. Your account information is used if it is not changed',
                      style: easyTheme.textTheme.bodyMedium!
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
                    Text(
                        'Product Quantity',
                        style: easyTheme.textTheme.bodyMedium!.copyWith(color: ColorName.black.withOpacity(0.5))),
                    TextFormFieldWidget(
                        controller: productQuantityController,
                      keyboardType: TextInputType.number,
                       ),
                    SizedBox(height: 22.0.h,),
                    Text(
                      'Product Price',
                      style: easyTheme.textTheme.bodyMedium!.copyWith(color: ColorName.black.withOpacity(0.5))),
                    TextFormFieldWidget(
                        controller: productPriceController,
                        isSuffixPrefixOn: true,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 21.0.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                              'Product Discount',
                              style: easyTheme.textTheme.bodyMedium!.copyWith(color: ColorName.black.withOpacity(0.5))),
                          TextFormFieldWidget(
                                controller: productDiscountController,
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                            inputFormatters: [
                              //LengthLimitingTextInputFormatter(3),
                              FilteringTextInputFormatter.digitsOnly,
                              PercentInputFormatter(),
                            ],

                              ),
                          SizedBox(height: 22.0.h,),
                        ],),
                      ),
                      SizedBox(width: 10.0.w,),
                      Expanded(
                            child: Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Transform.scale(
                                  scale: 0.8,
                                  child: Switch(
                                      value: true,
                                      activeColor:ColorName.amber,
                                      hoverColor: ColorName.amber,
                                      activeTrackColor: ColorName.amber,
                                      focusColor: ColorName.amber,
                                      inactiveThumbColor: ColorName.white,
                                      inactiveTrackColor: ColorName.gray,
                                      thumbColor: MaterialStateProperty.all(ColorName.white),
                                      onChanged: (value) {}),
                                ))),
                      ],),
                    SizedBox(height: 22.0.h,),
                    Text(
                        'Discount Date',
                        style: easyTheme.textTheme.bodyMedium!.copyWith(color: ColorName.black.withOpacity(0.5))),
                    Row(
                      children: [
                        Expanded(
                            child: TextFormFieldWidget(
                          controller: fromDateController,
                              hintText:'From  --/--/-----',
                              hintStyle: easyTheme.textTheme.labelMedium,
                              readOnly: true,
                              onTap: ()=>selectDiscountDate(context,fromDateController),
                        )),
                        Expanded(
                            child: TextFormFieldWidget(
                          controller: toDateController,
                              hintText:'To  --/--/-----',
                              hintStyle: easyTheme.textTheme.labelMedium,
                              readOnly: true,
                              onTap: ()=>selectDiscountDate(context,toDateController),
                            )),
                      ],
                    ),
                    SizedBox(height: 21.0.h,),
                  ],
                ),
              ),
              SizedBox(
                height: 77.0.h,
              ),
              const Spacer(flex: 1,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 21.0.w),
                child: DefaultButtonWidget(
                    text:'NEXT', onPressed: ()=>onNext()),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 21.0.w),
                child: OutlineButtonWidget(text:'CANCEL', onPressed: ()=>cancel()),
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
  void setEditData(){
    if(getIt.get<EditProduct>().myProductItem != null){
      var data = getIt.get<EditProduct>().myProductItem;
      double price = double.parse(data!.discount.toString()) * 100 ;
      productQuantityController.text = data.quantity.toString();
      productPriceController.text = data.price.toString();
      productDiscountController.text ='${price.toInt()}%';
      fromDateController.text = data.discountFrom.toString();
      toDateController.text = data.discountTo.toString();
    }
  }
  void selectDiscountDate(context,TextEditingController controller)async{
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
  void onNext()async{
    if (productQuantityController.text.isEmpty ||
        productPriceController.text.isEmpty ||
        productDiscountController.text.isEmpty ||
        fromDateController.text.isEmpty ||
        toDateController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(message: 'Firstly, fill all data...');
      return;
    }
    AddProBloc.get.add(AddSaleInfoEvent(
      productQuantity: productQuantityController.text,
      productPrice:  productPriceController.text,
      productDiscount: productDiscountController.text,
      fromDate: fromDateController.text,
      toDate: toDateController.text,
    ));
    openNewPage(const ShipToScreen());
  }
  void cancel(){
    getBack();
  }
}
