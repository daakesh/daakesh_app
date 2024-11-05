import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final personPhoneController = TextEditingController();
  String userImage = '';
  XFile? image;

  @override
  void initState() {
    super.initState();
    userImage = GetItUtils.user.userData.img ?? '';
    nameController.text = GetItUtils.user.userData.name ?? '';
    emailController.text = GetItUtils.user.userData.email ?? '';
    personPhoneController.text = GetItUtils.user.userData.phoneNumber ?? '';
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
                      SizedBox(height: 60.0.sp),
                      Text(
                        context.locale.personal_info,
                        style: context.easyTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 36.0),
                      ),
                      const SizedBox(
                        height: 20.0,
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
                        state.isUpdateActive ? context.locale.change_photo : '',
                        style: context.easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5)),
                      )),
                      const SizedBox(
                        height: 23.0,
                      ),
                      Text(
                        context.locale.name,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            color: ColorName.black.withOpacity(0.5)),
                      ),
                      TextFormFieldWidget(
                        controller: nameController,
                        enabled: state.isUpdateActive,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        context.locale.email,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            color: ColorName.black.withOpacity(0.5)),
                      ),
                      TextFormFieldWidget(
                        controller: emailController,
                        enabled: state.isUpdateActive,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      state.isUpdateActive
                          ? Text(
                              context.locale.password,
                              style: context.easyTheme.textTheme.bodyMedium!
                                  .copyWith(
                                      fontSize: 18,
                                      color: ColorName.black.withOpacity(0.5)),
                            )
                          : const SizedBox(),
                      state.isUpdateActive
                          ? TextFormFieldWidget(
                              controller: passwordController,
                              enabled: state.isUpdateActive,
                              obscureText: true,
                              maxLines: 1,
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        context.locale.phone_number,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            color: ColorName.black.withOpacity(0.5)),
                      ),
                      TextFormFieldWidget(
                        controller: personPhoneController,
                        keyboardType: TextInputType.phone,
                        hintText: '+962770099773',
                        hintStyle: context.easyTheme.textTheme.labelMedium!
                            .copyWith(
                                fontSize: 18.0.sp,
                                color: ColorName.gray.withOpacity(0.6)),
                        enabled: state.isUpdateActive,
                        // suffixIcon: GestureDetector(
                        //   onTap: () =>
                        //       selectCountry(context, (Country country) {
                        //     PersonalInfoBloc.get
                        //         .add(UpdatePersonalPhoneNumberEvent(
                        //       phoneCode: country.phoneCode,
                        //       flagEmoji: country.flagEmoji,
                        //     ));
                        //   }),
                        //   child: SizedBox(
                        //     width: 65.0,
                        //     child: Row(
                        //       children: [
                        //         Text(
                        //           state.personalPhoneFlagEmoji,
                        //           style: const TextStyle(
                        //               color: ColorName.blueGray,
                        //               fontSize: 24.0),
                        //         ),
                        //         const SizedBox(
                        //           width: 10.0,
                        //         ),
                        //         Assets.svg.arrowDropDownIcon.svg(),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(16),
                          RegExpValidator.clearZero
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Center(
                        child: DefaultButtonWidget(
                            text: !state.isUpdateActive
                                ? context.locale.make_edit
                                : context.locale.save_edit,
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
                                ? context.locale.cancel
                                : context.locale.reset_and_cancel_contact,
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

  void selectCountry(context, ValueChanged<Country> onSelect) {
    return showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: onSelect,
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
        context: context,
        name: nameController.text,
        image: image,
        phoneNumber: personPhoneController.text,
        password: passwordController.text));
  }

  void cancel() {
    Navigator.pop(context);
    PersonalInfoBloc.get
        .add(ActivateUpdatePersonalInfoEvent(isUpdateActive: false));
  }
}
