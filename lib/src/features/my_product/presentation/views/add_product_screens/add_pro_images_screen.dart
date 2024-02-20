import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../src.export.dart';

class AddProImagesScreen extends StatefulWidget {
  const AddProImagesScreen({super.key});

  @override
  State<AddProImagesScreen> createState() => _AddProImagesScreenState();
}

class _AddProImagesScreenState extends State<AddProImagesScreen> {
  List<XFile> imagesList = [];


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
                  onTap:cancel,
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
                InkWell(
                  focusColor: ColorName.transparent,
                  splashColor: ColorName.transparent,
                  highlightColor: ColorName.transparent,
                  onTap: ()=>showImagePickerOption(context),
                  child: Stack(
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
                ),
                const SizedBox(
                  height: 24.0,
                ),
                BlocBuilder<MyProductBloc,MyProductState>(builder: (_,state){
                  return Wrap(
                    children: List.generate(
                      state.imagesList.length,
                      (index) => state.imagesList.isNotEmpty
                          ? GestureDetector(
                        onTap: ()=>deleteImage(index),
                            child: Container(
                                width: 85.0,
                                height: 55.0,
                                margin: const EdgeInsetsDirectional.only(
                                    end: 12.0, bottom: 8.0),
                                decoration: BoxDecoration(
                                  color: ColorName.paleGray,
                                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                  border: Border.all(color: ColorName.gray),
                                  //image: DecorationImage(
                                  //  fit: BoxFit.fitWidth,
                                  //  image: Image.file(),
                                  //),
                                ),
                              child: Image.file(File(state.imagesList[index].path),fit: BoxFit.cover),
                              ),

                          )
                          : const SizedBox(),
                    ),
                  );
                }),
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

  void showImagePickerOption(context){
    showModalBottomSheet(
        context: context,
        backgroundColor: ColorName.whiteSmoke,
        builder: (context) {
          return SizedBox(
            width: double.infinity,
            height: getScreenHeight(context) * 0.2,
            child: Row(children: [
              const Spacer(flex: 1,),
              GestureDetector(
                onTap: ()async{
                   Navigator.pop(context);
                   XFile pickedFile =  await ImagePickerHelper.openCamera();
                   imagesList.add(pickedFile);
                   onAddImage(imagesList);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80.0.w,
                    height: 80.0.h,
                        decoration: const BoxDecoration(
                          color: ColorName.gray,
                          shape: BoxShape.circle,
                        ),
                        child:Icon(Icons.camera_alt,size: 40.0.sp,color: ColorName.white,),
                    ),
                    SizedBox(height: 10.0.h,),
                    Text('Camera',style: easyTheme.textTheme.bodyLarge)
                  ],
                ),
              ),
              const Spacer(flex: 1,),
              GestureDetector(
                onTap: ()async{
                  Navigator.pop(context);
                  List<XFile> pickedFile =  await ImagePickerHelper.getMultiImage();
                  imagesList.addAll(pickedFile);
                  onAddImage(imagesList);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80.0.w,
                      height: 80.0.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorName.gray,
                        ),
                      child:Icon(Icons.image,size: 40.0.sp,color: ColorName.white,),
                    ),

                    SizedBox(height: 10.0.h,),
                    Text('Gallery',style: easyTheme.textTheme.bodyLarge,)

                  ],
                ),
              ),
              const Spacer(flex: 1,),
            ],),
          );
        });
  }


  void onAddImage(List<XFile> images){
    MyProductBloc.get.add(AddProductImageEvent(imagesList:images));
  }
  void onNext()async{
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 1));
    ProgressCircleDialog.dismiss();
    openNewPage(const SelectProMethodScreen());
  }

  void cancel(){
    getBack();
    resetData();
  }

  void resetData(){
    onAddImage([]);
  }

  void deleteImage(int index) {
    imagesList.removeAt(index);
    onAddImage(imagesList);
  }
}
