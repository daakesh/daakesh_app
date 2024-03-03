abstract class SectionsEvent {}


class GetCategoryBySectionIDEvent extends SectionsEvent{
  final int? secID;
  final int? sectionIndex;
  final String? categoryTitle;
  final bool isSeeMore;
  GetCategoryBySectionIDEvent({
    this.secID,
    this.sectionIndex,
    this.categoryTitle,
    this.isSeeMore = false
  });
}

class ResetVarEvent extends SectionsEvent{}


