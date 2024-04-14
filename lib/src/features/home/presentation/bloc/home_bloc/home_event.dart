abstract class HomeEvent {}

class GetToTopScreenEvent extends HomeEvent {}

class ChangeIndexEvent extends HomeEvent {
  final int? index;
  ChangeIndexEvent({this.index});
}

class SelectProductSizeIndex extends HomeEvent {
  final int productSizeIndex;
  SelectProductSizeIndex({required this.productSizeIndex});
}

class GetSectionDataEvent extends HomeEvent {}
