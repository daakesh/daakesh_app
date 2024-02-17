import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class AddProInfoScreen extends StatelessWidget {
   AddProInfoScreen({super.key});

  final nameProductController = TextEditingController();
  final productDescriptionController = TextEditingController();

  final FocusNode nameSellerFocusNode= FocusNode();
  final FocusNode phoneFocusNode = FocusNode();

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
                Text(
                  'Add Product',
                  style: easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 36.0),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Text(
                  'Add Product Info',
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
                      Text('Product Name',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                      TextFormFieldWidget(
                        controller: nameProductController,
                        focusNode: nameSellerFocusNode,
                        onFieldSubmitted: (value)=>fieldFocusChange(context,nameSellerFocusNode,phoneFocusNode),
                      ),
                      const SizedBox(height: 22.0),
                      Text('Write Product Description',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0,color: ColorName.darkGray)),
                      const SizedBox(
                        height: 17.0,
                      ),

                    ],
                  ),
                ),
                Container(
                  height: 200.0,
                  width: double.infinity,
                  padding: const EdgeInsetsDirectional.only(start: 10.0,end:10,top: 7.0),
                  decoration: BoxDecoration(
                    color: ColorName.white,
                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                    border: Border.all(color: ColorName.gray),
                  ),
                  child: TextFormFieldWidget(
                    controller: productDescriptionController,
                    hintText: 'Description',
                    isUnderlineOn: true,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                  ),
                ),
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
    openNewPage(AddProCategoriesScreen());
  }
  void cancel(){
    getBack();
    resetData();
  }
  void resetData(){}


}
