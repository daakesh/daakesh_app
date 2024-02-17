import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class SelectProDisplayMethodScreen extends StatelessWidget {
  const SelectProDisplayMethodScreen({super.key});

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
                  'Choose a product display method',
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
                  height: 29.0,
                ),
                 const MethodItem(title: 'For Sale'),
                 const MethodItem(title:'For Swap' ),
                 const MethodItem(title: 'For Sale & Swap'),
                const SizedBox(
                  height: 44.0,
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
    //openNewPage(SelectProDisplayMethodScreen());
  }
  void cancel(){
    getBack();
    resetData();
  }
  void resetData(){}


}

class MethodItem extends StatelessWidget {
  final String title;
  const MethodItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 51.0,
      margin: const EdgeInsetsDirectional.only(bottom: 12.0),
      decoration: const BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0,3),
            blurRadius: 3.0,
            color: Color.fromRGBO(0, 0, 0, 0.16),
          ),

        ],

      ),
      child: Row(
        children: [
        const SizedBox(width: 13.0,),
        Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          color: ColorName.amber,
          shape: BoxShape.circle,
          border: Border.all(color: ColorName.gray,),
        ),),
        const SizedBox(width: 11.0,),
        Text(title,style: easyTheme.textTheme.bodyMedium,),
      ],),
    );
  }
}

