import '../../../../src.export.dart';

class HomeDataModel {
  bool? status;
  String? error;
  HomeData? data;

  HomeDataModel({this.status, this.error, this.data});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? HomeData.fromJson(json['data']) : null;
  }
}

class HomeData {
  List<SectionItemModel>? sections;

  HomeData({
    this.sections,
  });

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['sections'] != null) {
      sections = <SectionItemModel>[];
      sections = (json['sections'] as List<dynamic>).map((v) => SectionItemModel.fromJson(v)).toList();
    }

  }


}

