import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper{

  static final picker = ImagePicker();
  static Future<XFile> getGalleryImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return  pickedFile;
    } else {
      debugPrint('No Image selected.');
      return Future.error('No Image selected.');
    }
  }
  static Future<XFile> openCamera() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return pickedFile;
    } else {
      debugPrint('No Image selected.');
      return Future.error('No Image selected.');
    }
  }
  static Future<List<XFile>> getMultiImage() async {
    List<XFile> listImages = [];
     listImages = await picker.pickMultiImage();
    if (listImages.isNotEmpty) {
      return listImages;
    } else {
      debugPrint('No Image selected.');
      return Future.error('No Image selected.');
    }
  }

}