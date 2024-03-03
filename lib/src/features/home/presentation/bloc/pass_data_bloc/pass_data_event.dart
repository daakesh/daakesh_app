
import '../../../../../src.export.dart';

abstract class PassDataEvent {}

class PassSectionSubCategoriesEvent extends PassDataEvent{
  final List<CategoryItem> categoriesListData;
  PassSectionSubCategoriesEvent({required this.categoriesListData});
}

class PreviewSectionSubCategoriesEvent extends PassDataEvent{
  final int index;
  PreviewSectionSubCategoriesEvent({required this.index});
}
