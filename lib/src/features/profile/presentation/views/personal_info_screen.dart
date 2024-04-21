import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../src.export.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String userImage = '';
  XFile? image;

  @override
  void initState() {
    super.initState();
    userImage = GetItUtils.user.userData.img ?? '';
    nameController.text = GetItUtils.user.userData.name ?? '';
    emailController.text = GetItUtils.user.userData.email ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        PersonalInfoBloc.get
            .add(ActivateUpdatePersonalInfoEvent(isUpdateActive: false));
      },
      child: DefaultBackgroundWidget(
        child: Scaffold(
          backgroundColor: ColorName.transparent,
          body: LayoutBuilderWidget(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
                    builder: (_, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      const SizedBox(
                        height: 70.0,
                      ),
                      Text(
                        'Personal Info',
                        style: context.easyTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 36.0),
                      ),
                      const SizedBox(
                        height: 39.0,
                      ),
                      state.image.isEmpty
                          ? GestureDetector(
                              onTap: () =>
                                  state.isUpdateActive ? pickImage() : () {},
                              child: Center(
                                child: Container(
                                    width: 108.0,
                                    height: 108.0,
                                    decoration: const BoxDecoration(
                                      color: ColorName.gainsboro,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Hero(
                                      tag: 'profileImage',
                                      child: CachedImage(
                                        imageUrl: userImage,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(100.0)),
                                        errorWidget: (_, __, error) {
                                          return const Center(
                                            child: Icon(
                                              Icons.person_outline,
                                              size: 50.0,
                                              color: ColorName.white,
                                            ),
                                          );
                                        },
                                      ),
                                    )),
                              ),
                            )
                          : GestureDetector(
                              onTap: () =>
                                  state.isUpdateActive ? pickImage() : () {},
                              child: Center(
                                child: Container(
                                    width: 108.0,
                                    height: 108.0,
                                    decoration: const BoxDecoration(
                                      color: ColorName.gainsboro,
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(100.0)),
                                        child: Image.file(File(state.image),
                                            fit: BoxFit.cover))),
                              ),
                            ),
                      const SizedBox(
                        height: 14.0,
                      ),
                      Center(
                          child: Text(
                        'Change Photo',
                        style: context.easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5)),
                      )),
                      const SizedBox(
                        height: 23.0,
                      ),
                      Text(
                        'Name',
                        style: context.easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5)),
                      ),
                      TextFormFieldWidget(
                        controller: nameController,
                        enabled: state.isUpdateActive,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        'Email',
                        style: context.easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5)),
                      ),
                      TextFormFieldWidget(
                        controller: emailController,
                        enabled: state.isUpdateActive,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        'Password',
                        style: context.easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5)),
                      ),
                      TextFormFieldWidget(
                        controller: passwordController,
                        enabled: state.isUpdateActive,
                        obscureText: true,
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Center(
                        child: DefaultButtonWidget(
                            text: !state.isUpdateActive ? 'MAKE EDIT' : 'SAVE',
                            onPressed: () => !state.isUpdateActive
                                ? onMakeEdit()
                                : onSave()),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Center(
                        child: OutlineButtonWidget(
                            text: !state.isUpdateActive
                                ? 'Cancel'
                                : 'RESET AND CANCEL',
                            onPressed: () => cancel()),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void pickImage() async {
    image = await ImagePickerHelper.getGalleryImage();
    PersonalInfoBloc.get
        .add(SelectProfileImageEvent(path: image!.path.toString()));
  }

  void onMakeEdit() {
    PersonalInfoBloc.get
        .add(ActivateUpdatePersonalInfoEvent(isUpdateActive: true));
  }

  void onSave() {
    PersonalInfoBloc.get.add(UpdatePersonalInfoEvent(
        name: nameController.text,
        image: image,
        password: passwordController.text));
  }

  void cancel() {
    Navigator.pop(context);
    PersonalInfoBloc.get
        .add(ActivateUpdatePersonalInfoEvent(isUpdateActive: false));
  }
}
