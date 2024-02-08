import 'package:equatable/equatable.dart';

enum HomeStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension HomeStateStatusX on HomeStateStatus{
  bool get isInitial => this == HomeStateStatus.INITIAL;
  bool get isSuccess => this == HomeStateStatus.SUCCESS;
  bool get isError => this == HomeStateStatus.ERROR;
  bool get isLoading => this == HomeStateStatus.LOADING;
}

class HomeState extends Equatable {
  final HomeStateStatus homeStateStatus;
  final bool isSearchOn;

  const HomeState({
    this.homeStateStatus = HomeStateStatus.INITIAL,
    this.isSearchOn = false,

  });

  HomeState copyWith({
    HomeStateStatus? homeStateStatus,
    bool? isSearchOn,


  }) {
    return HomeState(
      homeStateStatus: homeStateStatus ?? this.homeStateStatus,
      isSearchOn: isSearchOn ?? this.isSearchOn,

    );
  }

  @override
  List<Object?> get props => [
    homeStateStatus,
    isSearchOn,

  ];
}
