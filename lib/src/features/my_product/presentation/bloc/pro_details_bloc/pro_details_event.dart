
abstract class ProDetailsEvent {}

class GetProSectionsEvent extends ProDetailsEvent {
  final bool isEdit;
  GetProSectionsEvent({this.isEdit = false});

}
class GetProCategoryEvent extends ProDetailsEvent {
  final String secID;
  final bool isEdit;
  GetProCategoryEvent({required this.secID,this.isEdit =false});
}
class CheckCategoryHasSubEvent extends ProDetailsEvent {
  final String catID;
  final bool isEdit;

  CheckCategoryHasSubEvent({required this.catID,this.isEdit =false});
}
class GetProSubCategoryEvent extends ProDetailsEvent {
  final String catID;
  final bool isEdit;

  GetProSubCategoryEvent({required this.catID,this.isEdit =false});
}
class GetBrandsBySectionEvent extends ProDetailsEvent {
  final String secID;
  final bool isEdit;
  GetBrandsBySectionEvent({required this.secID, this.isEdit = false});
}
class GetDropDownDataEvent extends ProDetailsEvent {}







