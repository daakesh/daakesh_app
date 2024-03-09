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
  final List<CategoryItem> categoriesListData;
  final List<SubCategory> subCategoryListData;

  const PassDataState({
    this.passDataStateStatus = PassDataStateStatus.INITIAL,
    this.categoriesListData = const[],
    this.subCategoryListData = const[],

  });

  PassDataState copyWith({
    PassDataStateStatus? passDataStateStatus,
    List<CategoryItem>? categoriesListData,
    List<SubCategory>? subCategoryListData,
  }) {
    return PassDataState(
      passDataStateStatus: passDataStateStatus ?? this.passDataStateStatus,
      categoriesListData: categoriesListData ?? this.categoriesListData,
      subCategoryListData: subCategoryListData ?? this.subCategoryListData,

    );
  }

  @override
  List<Object?> get props => [
    passDataStateStatus,
    categoriesListData,
    subCategoryListData,

  ];
}
