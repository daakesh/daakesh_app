import '../../src.export.dart';

///
///To capitalize first letter only.
extension StringExtension on String {
  String capitalize() {
    return
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
///
///
extension HomeScreenStateX on HomeScreenState{
  bool get isSearch => this == HomeScreenState.SEARCH;
  bool get isProductDetails => this == HomeScreenState.PRODUCTDETAILS;
  bool get isSearchResult => this == HomeScreenState.SEARCHRESULT;
  bool get isCart => this == HomeScreenState.CART;
  bool get isHome => this == HomeScreenState.HOME;
}


