import '../../../../src.export.dart';

class CategoryModel {
  bool? status;
  String? error;
  CategoryData? data;

  CategoryModel({this.status, this.error, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? CategoryData.fromJson(json['data']) : null;
  }

}

class CategoryData {
  int? lastPage;
  List<CategoryItem>? categoryItemList;

  CategoryData({
    this.lastPage,
    this.categoryItemList,
  });

  CategoryData.fromJson(Map<String, dynamic> json) {
    lastPage = json['last_page'];
    if (json['data'] != null) {
      categoryItemList = <CategoryItem>[];
      categoryItemList = (json['data'] as List<dynamic>)
          .map((v) => CategoryItem.fromJson(v))
          .toList();
    }
  }
}


class CategoryItem {
  int? id;
  String? name;
  String? description;
  String? catImg;
  String? date;
  int? secID;
  String? arName;
  int? itemsCount;
  SectionItemModel? sectionItemModel;
  List<SubCategory>? subCategoryList;


  CategoryItem({
        this.id,
        this.name,
        this.description,
        this.catImg,
        this.date,
        this.secID,
        this.arName,
        this.itemsCount,
        this.sectionItemModel,
        this.subCategoryList,
      });

  CategoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    catImg = json['catImg'];
    date = json['date'];
    secID = json['secID'];
    arName = json['arName'];
    itemsCount = json['items_count'];
    sectionItemModel = json['section'] != null ? SectionItemModel.fromJson(json['section']) : null;
    if (json['sub_category'] != null) {
      subCategoryList = <SubCategory>[];
      subCategoryList = (json['sub_category'] as List<dynamic>).map((v) => SubCategory.fromJson(v)).toList();
    }


  }
}