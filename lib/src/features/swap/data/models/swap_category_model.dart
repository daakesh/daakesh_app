import '../../../../src.export.dart';

class SwapCategoryModel {
  bool? status;
  String? error;
  SwapCategoryData? data;

  SwapCategoryModel({this.status, this.error, this.data});

  SwapCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? SwapCategoryData.fromJson(json['data']) : null;
  }

}

class SwapCategoryData {
  int? lastPage;
  List<SwapCategoryItem>? categoryItemList;

  SwapCategoryData({
    this.lastPage,
    this.categoryItemList,
  });

  SwapCategoryData.fromJson(Map<String, dynamic> json) {
    lastPage = json['last_page'];
    if (json['data'] != null) {
      categoryItemList = <SwapCategoryItem>[];
      categoryItemList = (json['data'] as List<dynamic>)
          .map((v) => SwapCategoryItem.fromJson(v))
          .toList();
    }
  }
}


class SwapCategoryItem {
  int? id;
  String? name;
  String? description;
  String? catImg;
  String? date;
  int? secID;
  String? arName;
  int? itemsCount;
  SwapSectionItemModel? swapSectionItemModel;
  List<SwapSubCategory>? swapSubCategoryList;


  SwapCategoryItem({
        this.id,
        this.name,
        this.description,
        this.catImg,
        this.date,
        this.secID,
        this.arName,
        this.itemsCount,
        this.swapSectionItemModel,
        this.swapSubCategoryList,
      });

  SwapCategoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    catImg = json['catImg'];
    date = json['date'];
    secID = json['secID'];
    arName = json['arName'];
    itemsCount = json['items_count'];
    swapSectionItemModel = json['section'] != null ? SwapSectionItemModel.fromJson(json['section']) : null;
    if (json['sub_category'] != null) {
      swapSubCategoryList = <SwapSubCategory>[];
      swapSubCategoryList = (json['sub_category'] as List<dynamic>).map((v) => SwapSubCategory.fromJson(v)).toList();
    }


  }
}