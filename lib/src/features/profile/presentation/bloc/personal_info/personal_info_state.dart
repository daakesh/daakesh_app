import 'package:equatable/equatable.dart';

enum PersonalInfoStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension PersonalInfoStateStatusX on PersonalInfoStateStatus {
  bool get isInitial => this == PersonalInfoStateStatus.INITIAL;
  bool get isSuccess => this == PersonalInfoStateStatus.SUCCESS;
  bool get isError => this == PersonalInfoStateStatus.ERROR;
  bool get isLoading => this == PersonalInfoStateStatus.LOADING;
}

class PersonalInfoState extends Equatable {
  final PersonalInfoStateStatus profileStateStatus;
  final bool isUpdateActive;
  final String image;
  final String personalPhoneFlagEmoji;
  final String personalPhoneCode;

  const PersonalInfoState({
    this.profileStateStatus = PersonalInfoStateStatus.INITIAL,
    this.isUpdateActive = false,
    this.image = '',
    this.personalPhoneFlagEmoji = '🇯🇴',
    this.personalPhoneCode = '962',
  });

  PersonalInfoState copyWith({
    PersonalInfoStateStatus? profileStateStatus,
    bool? isUpdateActive,
    String? image,
    String? personalPhoneFlagEmoji,
    String? personalPhoneCode,
  }) {
    return PersonalInfoState(
      profileStateStatus: profileStateStatus ?? this.profileStateStatus,
      isUpdateActive: isUpdateActive ?? this.isUpdateActive,
      image: image ?? this.image,
      personalPhoneFlagEmoji:
          personalPhoneFlagEmoji ?? this.personalPhoneFlagEmoji,
      personalPhoneCode: personalPhoneCode ?? this.personalPhoneCode,
    );
  }

  @override
  List<Object?> get props => [
        profileStateStatus,
        isUpdateActive,
        image,
        personalPhoneFlagEmoji,
        personalPhoneCode,
      ];
}
