import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class AddProImagesScreen extends StatelessWidget {
  const AddProImagesScreen({super.key});

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
                  'Add Image',
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
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250.0,
                      decoration: const BoxDecoration(
                        color: ColorName.whiteSmoke,
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 27.0,vertical: 18.2),
                        child: SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                              child: CustomPaint(
                                painter: CornerPainter(),
                              ),
                            )),
                      ),
                    
                    ),
                     Column(
                      children: [
                        Assets.svg.imagePickerIcon.svg(height: 27.0,width: 36.0),
                        const SizedBox(height: 16.0,),
                        Text('Add Image',style: easyTheme.textTheme.bodyLarge,),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Wrap(
                  children: List.generate(2, (index) => Container(
                        width: 85.0,
                        height:55.0,
                        margin: const EdgeInsetsDirectional.only(end: 12.0,bottom: 8.0),
                        decoration: const BoxDecoration(
                            color: ColorName.paleGray,
                            borderRadius: BorderRadius.all(Radius.circular(4.0))
                        ),
                        child: Center(child: Assets.svg.imagePickerIcon.svg(width: 36.0,height: 27.0)),
                      ),),
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
    openNewPage(const SelectProDisplayMethodScreen());
  }
  void cancel(){
    getBack();
    resetData();
  }
  void resetData(){}


}
