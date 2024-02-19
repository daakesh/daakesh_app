import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class ForSaleScreen extends StatelessWidget {
  const ForSaleScreen({super.key});

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
                        controller: TextEditingController(),
                       ),
                    SizedBox(height: 22.0.h,),
                    Text(
                      'Product Price',
                      style: easyTheme.textTheme.bodyMedium!.copyWith(color: ColorName.black.withOpacity(0.5))),
                    TextFormFieldWidget(
                        controller: TextEditingController(),
                        readOnly: true,
                        isSuffixPrefixOn: true,
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: SizedBox(
                              width: 20.0,
                              height: 20.0,
                              child: Center(child: Assets.svg.arrowDropDownIcon.svg())),
                        )),
                    SizedBox(height: 21.0.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                              'Product Quantity',
                              style: easyTheme.textTheme.bodyMedium!.copyWith(color: ColorName.black.withOpacity(0.5))),
                          TextFormFieldWidget(controller: TextEditingController()),
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
                    TextFormFieldWidget(controller: TextEditingController()),
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
  void onNext()async{
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 2));
    ProgressCircleDialog.dismiss();
    openNewPage(const ShipToScreen());
  }
  void cancel(){
    getBack();
  }
}
