abstract class SwapSectionsEvent {}

class SwapGetCategoryBySectionIDEvent extends SwapSectionsEvent {
  final int? secID;
  final int? sectionIndex;
  final String? categoryTitle;
  final String? arCategoryTitle;
  final bool isSeeMore;
  SwapGetCategoryBySectionIDEvent(
      {this.secID,
      this.sectionIndex,
      this.categoryTitle,
      this.arCategoryTitle,
      this.isSeeMore = false});
}

class SwapResetVarEvent extends SwapSectionsEvent {}

class SwapSelectItemEvent extends SwapSectionsEvent {
  final int index;
  SwapSelectItemEvent({required this.index});
}
