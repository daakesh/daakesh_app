import 'package:image_picker/image_picker.dart';

abstract class PersonalInfoEvent {}

class ActivateUpdatePersonalInfoEvent extends PersonalInfoEvent{
  final bool isUpdateActive;
  ActivateUpdatePersonalInfoEvent({required this.isUpdateActive});
}

class UpdatePersonalInfoEvent extends  PersonalInfoEvent{
  final String name;
  final String? password;
  final XFile? image;

  UpdatePersonalInfoEvent({
    required this.name,
    this.password,
    this.image,
  });
}

class SelectProfileImageEvent extends PersonalInfoEvent{
  final String path;
  SelectProfileImageEvent({required this.path});
}