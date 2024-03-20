import 'package:equatable/equatable.dart';
import '../../../../../src.export.dart';

enum PassDataStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension PassDataStateStatusX on PassDataStateStatus{
  bool get isInitial => this == PassDataStateStatus.INITIAL;
  bool get isSuccess => this == PassDataStateStatus.SUCCESS;
  bool get isError => this == PassDataStateStatus.ERROR;
  bool get isLoading => this == PassDataStateStatus.LOADING;
}

class PassDataState extends Equatable {
  final PassDataStateStatus passDataStateStatus;
  final List<TodayItem> todayItem;
  final List<CategoryItem> categoriesListData;
  final List<SubCategory> subCategoryListData;

  final int productSliderIndex;
  final int productSizeIndex;
  ///
  final bool isDaakeshTodayDeal;
  final double scale;

  const PassDataState({
    this.passDataStateStatus = PassDataStateStatus.INITIAL,
    this.todayItem = const[],
    this.categoriesListData = const[],
    this.subCategoryListData = const[],
    ///
    this.productSliderIndex = 0,
    this.productSizeIndex = 0,
    ///
    this.isDaakeshTodayDeal = false,
    this.scale = 1.0,

  });

  PassDataState copyWith({
    PassDataStateStatus? passDataStateStatus,
    List<TodayItem>? todayItem,
    List<CategoryItem>? categoriesListData,
    List<SubCategory>? subCategoryListData,
    ///
    int? productSliderIndex,
    int? productSizeIndex,
    bool? isDaakeshTodayDeal,
    double? scale,
  }) {
    return PassDataState(
      passDataStateStatus: passDataStateStatus ?? this.passDataStateStatus,
      todayItem: todayItem ?? this.todayItem,
      categoriesListData: categoriesListData ?? this.categoriesListData,
      subCategoryListData: subCategoryListData ?? this.subCategoryListData,
      productSliderIndex: productSliderIndex ?? this.productSliderIndex,
      productSizeIndex: productSizeIndex ?? this.productSizeIndex,
      ///
      isDaakeshTodayDeal: isDaakeshTodayDeal ?? this.isDaakeshTodayDeal,
      scale: scale ?? this.scale,

    );
  }

  @override
  List<Object?> get props => [
    passDataStateStatus,
    todayItem,
    categoriesListData,
    subCategoryListData,
    productSliderIndex,
    productSizeIndex,
    ///
    isDaakeshTodayDeal,
    scale,
  ];
}
