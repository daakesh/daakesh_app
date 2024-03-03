import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum SectionsStateStatus { INITIAL, LOADING, SUCCESS, ERROR,NULL,LOADINGMORE }

extension SectionsStateStatusX on SectionsStateStatus{
  bool get isInitial => this == SectionsStateStatus.INITIAL;
  bool get isSuccess => this == SectionsStateStatus.SUCCESS;
  bool get isError => this == SectionsStateStatus.ERROR;
  bool get isLoading => this == SectionsStateStatus.LOADING;
  bool get isLoadingMore => this == SectionsStateStatus.LOADINGMORE;
  bool get isNull => this == SectionsStateStatus.NULL;
}

class SectionsState extends Equatable {
  final SectionsStateStatus sectionsStateStatus;
  final int sectionIndex;
  final String categoryTitle;
  final List<CategoryItem> categoriesListData;
  final int currentPage;
  final bool isMoreData;
  final int secID;


  const SectionsState({
    this.sectionsStateStatus = SectionsStateStatus.INITIAL,
    this.sectionIndex = -1,
    this.categoryTitle = '',
    this.categoriesListData = const [],
    this.currentPage =1,
    this.isMoreData = true,
    this.secID = -1,

  });

  SectionsState copyWith({
    SectionsStateStatus? sectionsStateStatus,
    int? sectionIndex,
    String? categoryTitle,
    List<CategoryItem>? categoriesListData,
    int? currentPage,
    bool? isMoreData,
    int? secID,
  }) {
    return SectionsState(
      sectionsStateStatus: sectionsStateStatus ?? this.sectionsStateStatus,
      sectionIndex: sectionIndex ?? this.sectionIndex,
      categoryTitle: categoryTitle ?? this.categoryTitle,
      categoriesListData: categoriesListData ?? this.categoriesListData,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,
      secID: secID ?? this.secID,

    );
  }

  @override
  List<Object?> get props => [
    sectionsStateStatus,
    sectionIndex,
    categoryTitle,
    categoriesListData,
    currentPage,
    isMoreData,
    secID,

  ];
}

