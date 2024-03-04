import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum SwapSectionsStateStatus { INITIAL, LOADING, SUCCESS, ERROR,NULL,LOADINGMORE }

extension SwapSectionsStateStatusX on SwapSectionsStateStatus{
  bool get isInitial => this == SwapSectionsStateStatus.INITIAL;
  bool get isSuccess => this == SwapSectionsStateStatus.SUCCESS;
  bool get isError => this == SwapSectionsStateStatus.ERROR;
  bool get isLoading => this == SwapSectionsStateStatus.LOADING;
  bool get isLoadingMore => this == SwapSectionsStateStatus.LOADINGMORE;
  bool get isNull => this == SwapSectionsStateStatus.NULL;
}

class SwapSectionsState extends Equatable {
  final SwapSectionsStateStatus swapSectionsStateStatus;
  final int sectionIndex;
  final String categoryTitle;
  final List<SwapCategoryItem> swapCategoriesListData;
  final int currentPage;
  final bool isMoreData;
  final int secID;


  const SwapSectionsState({
    this.swapSectionsStateStatus = SwapSectionsStateStatus.INITIAL,
    this.sectionIndex = -1,
    this.categoryTitle = '',
    this.swapCategoriesListData = const [],
    this.currentPage =1,
    this.isMoreData = true,
    this.secID = -1,

  });

  SwapSectionsState copyWith({
    SwapSectionsStateStatus? swapSectionsStateStatus,
    int? sectionIndex,
    String? categoryTitle,
    List<SwapCategoryItem>? swapCategoriesListData,
    int? currentPage,
    bool? isMoreData,
    int? secID,
  }) {
    return SwapSectionsState(
      swapSectionsStateStatus: swapSectionsStateStatus ?? this.swapSectionsStateStatus,
      sectionIndex: sectionIndex ?? this.sectionIndex,
      categoryTitle: categoryTitle ?? this.categoryTitle,
      swapCategoriesListData: swapCategoriesListData ?? this.swapCategoriesListData,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,
      secID: secID ?? this.secID,

    );
  }

  @override
  List<Object?> get props => [
    swapSectionsStateStatus,
    sectionIndex,
    categoryTitle,
    swapCategoriesListData,
    currentPage,
    isMoreData,
    secID,

  ];
}

