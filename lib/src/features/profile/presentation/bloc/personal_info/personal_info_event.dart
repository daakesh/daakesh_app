import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class PersonalInfoEvent {}

class ActivateUpdatePersonalInfoEvent extends PersonalInfoEvent {
  final bool isUpdateActive;
  ActivateUpdatePersonalInfoEvent({required this.isUpdateActive});
}

class UpdatePersonalInfoEvent extends PersonalInfoEvent {
  final BuildContext context;
  final String name;
  final String? password;
  final XFile? image;
  final String phoneNumber;

  UpdatePersonalInfoEvent({
    required this.context,
    required this.name,
    this.password,
    this.image,
    required this.phoneNumber,
  });
}

class SelectProfileImageEvent extends PersonalInfoEvent {
  final String path;
  SelectProfileImageEvent({required this.path});
}

class UpdatePersonalPhoneNumberEvent extends PersonalInfoEvent {
  final String flagEmoji;
  final String phoneCode;
  UpdatePersonalPhoneNumberEvent(
      {required this.flagEmoji, required this.phoneCode});
}
