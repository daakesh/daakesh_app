import 'package:flutter/material.dart';

import '../../../../features.export.dart';

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

class GetSectionDataEvent extends HomeEvent {
  final bool isSeeMore;
  GetSectionDataEvent({this.isSeeMore = false});
}

class GetHomeScreenData extends HomeEvent {}

class SelectTabItemEvent extends HomeEvent {
  final int index;
  SelectTabItemEvent({required this.index});
}

class ActivateSwapEvent extends HomeEvent {
  final BuildContext context;
  ActivateSwapEvent({required this.context});
}

class BackToStoreEvent extends HomeEvent {
  final StoreType storeType;
  BackToStoreEvent({required this.storeType});
}
