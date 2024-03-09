import '../../../../src.export.dart';

class SwapDataModel {
  bool? status;
  String? error;
  SwapData? data;

  SwapDataModel({this.status, this.error, this.data});

  SwapDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? SwapData.fromJson(json['data']) : null;
  }
}

class SwapData {
  List<SectionItemModel>? sections;

  SwapData({
    this.sections,
  });

  SwapData.fromJson(Map<String, dynamic> json) {
    if (json['sections'] != null) {
      sections = <SectionItemModel>[];
      sections = (json['sections'] as List<dynamic>).map((v) => SectionItemModel.fromJson(v)).toList();
    }

  }


}

