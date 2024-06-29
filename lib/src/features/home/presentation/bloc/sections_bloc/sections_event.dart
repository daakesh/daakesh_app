abstract class SectionsEvent {}

class GetCategoryBySectionIDEvent extends SectionsEvent {
  final int? secID;
  final int? sectionIndex;
  final String? categoryTitle;
  final String? arCategoryTitle;
  final bool isSeeMore;
  GetCategoryBySectionIDEvent(
      {this.secID,
      this.sectionIndex,
      this.categoryTitle,
      this.arCategoryTitle,
      this.isSeeMore = false});
}

class ResetVarEvent extends SectionsEvent {}

class SelectItemEvent extends SectionsEvent {
  final int index;
  SelectItemEvent({required this.index});
}
