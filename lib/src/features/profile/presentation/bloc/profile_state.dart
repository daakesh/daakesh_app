import 'package:equatable/equatable.dart';

enum ProfileStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension ProfileStateStatusX on ProfileStateStatus{
  bool get isInitial => this == ProfileStateStatus.INITIAL;
  bool get isSuccess => this == ProfileStateStatus.SUCCESS;
  bool get isError => this == ProfileStateStatus.ERROR;
  bool get isLoading => this == ProfileStateStatus.LOADING;
}

class ProfileState extends Equatable {
  final ProfileStateStatus profileStateStatus;
  final bool switchLangValue;
  final bool isUpdateActive;
  ///Select Country
  final String personalPhoneFlagEmoji;
  final String personalPhoneCode;
  final String commercialPhoneFlagEmoji;
  final String commercialPhoneCode;
  final String whatsAppPhoneFlagEmoji;
  final String whatsAppPhoneCode;
  ///Location Screen
  final String locationFlagEmoji;



  const ProfileState({
    this.profileStateStatus = ProfileStateStatus.INITIAL,
    this.switchLangValue = true,
    this.isUpdateActive = false,
    this.personalPhoneFlagEmoji = '🇯🇴',
    this.personalPhoneCode = '962',
    this.commercialPhoneFlagEmoji = '🇯🇴',
    this.commercialPhoneCode = '962',
    this.whatsAppPhoneFlagEmoji = '🇯🇴',
    this.whatsAppPhoneCode = '962',
    this.locationFlagEmoji = '🇯🇴',
  });

  ProfileState copyWith({
    ProfileStateStatus? profileStateStatus,
    bool? switchLangValue,
    bool? isUpdatePersonalActive,
    ///Select Country
    String? personalPhoneFlagEmoji,
    String? personalPhoneCode,
    String? commercialPhoneFlagEmoji,
    String? commercialPhoneCode,
    String? whatsAppPhoneFlagEmoji,
    String? whatsAppPhoneCode,
    String? locationFlagEmoji,


  }) {
    return ProfileState(
      profileStateStatus: profileStateStatus ?? this.profileStateStatus,
      switchLangValue: switchLangValue ?? this.switchLangValue,
      isUpdateActive: isUpdatePersonalActive ?? this.isUpdateActive,
      ///Select Country
      personalPhoneFlagEmoji: personalPhoneFlagEmoji ?? this.personalPhoneFlagEmoji,
      personalPhoneCode: personalPhoneCode ?? this.personalPhoneCode,
      commercialPhoneFlagEmoji: commercialPhoneFlagEmoji ?? this.commercialPhoneFlagEmoji,
      commercialPhoneCode: commercialPhoneCode ?? this.commercialPhoneCode,
      whatsAppPhoneFlagEmoji: whatsAppPhoneFlagEmoji ?? this.whatsAppPhoneFlagEmoji,
      whatsAppPhoneCode: whatsAppPhoneCode ?? this.whatsAppPhoneCode,
      locationFlagEmoji: locationFlagEmoji ?? this.locationFlagEmoji,

    );
  }

  @override
  List<Object?> get props => [
        profileStateStatus,
        switchLangValue,
        isUpdateActive,
        /// Select Country
        personalPhoneFlagEmoji,
        personalPhoneCode,
        commercialPhoneFlagEmoji,
        commercialPhoneCode,
        whatsAppPhoneFlagEmoji,
        whatsAppPhoneCode,
        locationFlagEmoji,
      ];
}
