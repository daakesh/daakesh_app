class SearchModel {
  bool? status;
  String? error;
  SearchData? data;

  SearchModel({this.status, this.error, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? SearchData.fromJson(json['data']) : null;
  }
}

class SearchData {
  List<String>? data;
  int? lastPage;
  SearchData({this.data});

  SearchData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <String>[];
      data = (json['data'] as List<dynamic>)
          .map((v) => v['Title'] as String)
          .toList();
    }
    lastPage = json['last_page'];
  }
}

class SearchResultModel {
  String? title;
  SearchResultModel({
    this.title,
  });

  SearchResultModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
  }
}
