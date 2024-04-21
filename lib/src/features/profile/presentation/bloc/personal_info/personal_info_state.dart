import 'package:equatable/equatable.dart';

enum PersonalInfoStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension PersonalInfoStateStatusX on PersonalInfoStateStatus{
  bool get isInitial => this == PersonalInfoStateStatus.INITIAL;
  bool get isSuccess => this == PersonalInfoStateStatus.SUCCESS;
  bool get isError => this == PersonalInfoStateStatus.ERROR;
  bool get isLoading => this == PersonalInfoStateStatus.LOADING;
}

class PersonalInfoState extends Equatable {
  final PersonalInfoStateStatus profileStateStatus;
  final bool isUpdateActive;
  final String image;



  const PersonalInfoState({
    this.profileStateStatus = PersonalInfoStateStatus.INITIAL,
    this.isUpdateActive = false,
    this.image = '',
  });

  PersonalInfoState copyWith({
    PersonalInfoStateStatus? profileStateStatus,
    bool? isUpdateActive,
    String? image,


  }) {
    return PersonalInfoState(
      profileStateStatus: profileStateStatus ?? this.profileStateStatus,
      isUpdateActive: isUpdateActive ?? this.isUpdateActive,
      image: image ?? this.image,


    );
  }

  @override
  List<Object?> get props => [
    profileStateStatus,
    isUpdateActive,
    image,
  ];
}
