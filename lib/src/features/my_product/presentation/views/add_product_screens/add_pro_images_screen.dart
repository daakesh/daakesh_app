import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  List<String> oldImageList = [];

  @override
  void initState() {
    super.initState();
    setOldImage();
  }

  void setOldImage() {
    MyProFuncBloc.get.add(SetOldImageEvent());

    if (getIt.get<EditProduct>().myProductItem != null) {
      if (getIt.get<EditProduct>().myProductItem!.itemImg!.length != 1 ||
          getIt.get<EditProduct>().myProductItem!.itemImg!.first.isNotEmpty) {
        MyProFuncBloc.get.add(SetOldImageEvent());
        oldImageList =
            getIt.get<EditProduct>().myProductItem!.itemImg!.toList();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        resetData();
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
                  GestureDetector(
                    onTap: cancel,
                    child: Utils.flipWidget(Assets.svg.arrowBackIcon.svg()),
                  ),
                  const SizedBox(
                    height: 11.0,
                  ),
                  Text(
                    context.locale.add_product,
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 36),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Text(
                    context.locale.add_image,
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
                    height: 29.0,
                  ),
                  GestureDetector(
                    onTap: () => showImagePickerOption(context),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 250.0,
                          decoration: const BoxDecoration(
                            color: ColorName.whiteSmoke,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 27.0, vertical: 18.2),
                            child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4.0)),
                                  child: CustomPaint(
                                    painter: CornerPainter(),
                                  ),
                                )),
                          ),
                        ),
                        Column(
                          children: [
                            Assets.svg.imagePickerIcon
                                .svg(height: 27.0, width: 36.0),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              context.locale.add_image,
                              style: context.easyTheme.textTheme.bodyLarge,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  BlocBuilder<MyProFuncBloc, MyProFuncState>(
                      builder: (_, state) {
                    return Wrap(
                      children: [
                        ...List.generate(
                          state.oldImage.length != 1 ||
                                  state.oldImage.first.isNotEmpty
                              ? state.oldImage.length
                              : 0,
                          (index) => state.oldImage.isNotEmpty
                              ? Padding(
                                  padding:
                                      const EdgeInsetsDirectional.only(end: 4),
                                  child: SizedBox(
                                    height: 90,
                                    width: 90,
                                    child: Stack(
                                      alignment: AlignmentDirectional.topEnd,
                                      children: [
                                        Center(
                                          child: Container(
                                            width: 85.0,
                                            height: 60.0,
                                            margin: const EdgeInsetsDirectional
                                                .only(end: 12.0, bottom: 8.0),
                                            decoration: BoxDecoration(
                                              color: ColorName.paleGray,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(4.0)),
                                              border: Border.all(
                                                  color: ColorName.gray),
                                            ),
                                            child: Image.network(
                                                state.oldImage[index],
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          child: InkWell(
                                            onTap: () => deleteOldImage(index),
                                            child: Container(
                                              width: 25,
                                              height: 25,
                                              decoration: const BoxDecoration(
                                                  color: Colors.amber,
                                                  shape: BoxShape.circle),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ),
                        ...List.generate(
                          state.imagesList.length,
                          (index) => state.imagesList.isNotEmpty
                              ? Padding(
                                  padding:
                                      const EdgeInsetsDirectional.only(end: 4),
                                  child: SizedBox(
                                    width: 90,
                                    height: 90,
                                    child: Stack(
                                      alignment: AlignmentDirectional.topEnd,
                                      children: [
                                        Center(
                                          child: Container(
                                            width: 85.0,
                                            height: 60.0,
                                            margin: const EdgeInsetsDirectional
                                                .only(end: 12.0, bottom: 8.0),
                                            decoration: BoxDecoration(
                                              color: ColorName.paleGray,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(4.0)),
                                              border: Border.all(
                                                  color: ColorName.gray),
                                            ),
                                            child: Image.file(
                                                File(state
                                                    .imagesList[index].path),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          child: InkWell(
                                            onTap: () => deleteImage(index),
                                            child: Container(
                                              width: 25,
                                              height: 25,
                                              decoration: const BoxDecoration(
                                                  color: Colors.amber,
                                                  shape: BoxShape.circle),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        )
                      ],
                    );
                  }),
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

  void showImagePickerOption(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: ColorName.whiteSmoke,
        builder: (context) {
          return SizedBox(
            width: double.infinity,
            height: Utils.getScreenHeight(context) * 0.2,
            child: Row(
              children: [
                const Spacer(
                  flex: 1,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    XFile pickedFile = await ImagePickerHelper.openCamera();
                    imagesList.add(pickedFile);
                    onAddImage(imagesList);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: ColorName.gray,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: ColorName.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Camera',
                          style: context.easyTheme.textTheme.bodyLarge)
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    List<XFile> pickedFile =
                        await ImagePickerHelper.getMultiImage();
                    imagesList.addAll(pickedFile);
                    onAddImage(imagesList);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorName.gray,
                        ),
                        child: const Icon(
                          Icons.image,
                          size: 40,
                          color: ColorName.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Gallery',
                        style: context.easyTheme.textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          );
        });
  }

  void onAddImage(List<XFile> images) {
    MyProFuncBloc.get.add(AddProductImageEvent(imagesList: images));
  }

  void onNext() async {
    if (imagesList.isEmpty && oldImageList.isEmpty) {
      ShowToastSnackBar.showSnackBars(
          message: 'Please add at least single image');
      return;
    }
    AddProBloc.get.add(AddProImagesEvent(
      proImages: imagesList,
      oldImages: oldImageList,
    ));
    Utils.openNewPage(const SelectProMethodScreen());
  }

  void cancel() {
    Utils.getBack();
    resetData();
  }

  void resetData() {
    MyProFuncBloc.get.add(ResetValuesEvent());
    onAddImage([]);
  }

  void deleteImage(int index) {
    imagesList.removeAt(index);
    onAddImage(imagesList);
  }

  void deleteOldImage(int index) {
    oldImageList.removeAt(index);
    setState(() {});
    MyProFuncBloc.get.add(RemoveOldImageEvent(oldImageList));
  }
}
