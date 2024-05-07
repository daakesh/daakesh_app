abstract class SwapSectionsEvent {}

class SwapGetCategoryBySectionIDEvent extends SwapSectionsEvent {
  final int? secID;
  final int? sectionIndex;
  final String? categoryTitle;
  final bool isSeeMore;
  SwapGetCategoryBySectionIDEvent(
      {this.secID,
      this.sectionIndex,
      this.categoryTitle,
      this.isSeeMore = false});
}

class SwapResetVarEvent extends SwapSectionsEvent {}

class SwapSelectItemEvent extends SwapSectionsEvent {
  final int index;
  SwapSelectItemEvent({required this.index});
}
