import 'package:equatable/equatable.dart';

enum ProfileStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension ProfileStateStatusX on ProfileStateStatus {
  bool get isInitial => this == ProfileStateStatus.INITIAL;
  bool get isSuccess => this == ProfileStateStatus.SUCCESS;
  bool get isError => this == ProfileStateStatus.ERROR;
  bool get isLoading => this == ProfileStateStatus.LOADING;
}

class ProfileState extends Equatable {
  final ProfileStateStatus profileStateStatus;
  final bool switchLangValue;
  final bool isUpdatePersonalActive;

  ///Location Screen
  final String locationFlagEmoji;

  const ProfileState({
    this.profileStateStatus = ProfileStateStatus.INITIAL,
    this.switchLangValue = false,
    this.isUpdatePersonalActive = false,
    this.locationFlagEmoji = '🇯🇴',
  });

  ProfileState copyWith({
    ProfileStateStatus? profileStateStatus,
    bool? switchLangValue,
    bool? isUpdatePersonalActive,
    String? locationFlagEmoji,
  }) {
    return ProfileState(
      profileStateStatus: profileStateStatus ?? this.profileStateStatus,
      switchLangValue: switchLangValue ?? this.switchLangValue,
      isUpdatePersonalActive:
          isUpdatePersonalActive ?? this.isUpdatePersonalActive,

      ///Select Country
      locationFlagEmoji: locationFlagEmoji ?? this.locationFlagEmoji,
    );
  }

  @override
  List<Object?> get props => [
        profileStateStatus,
        switchLangValue,
        isUpdatePersonalActive,

        /// Select Country

        locationFlagEmoji,
      ];
}
