
import '../../../../../src.export.dart';

abstract class SwapPassDataEvent {}

class SwapPassSectionSubCategoriesEvent extends SwapPassDataEvent{
  final List<SwapCategoryItem> swapCategoriesListData;
  SwapPassSectionSubCategoriesEvent({required this.swapCategoriesListData});
}

class SwapPreviewSectionSubCategoriesEvent extends SwapPassDataEvent{
  final int index;
  SwapPreviewSectionSubCategoriesEvent({required this.index});
}
