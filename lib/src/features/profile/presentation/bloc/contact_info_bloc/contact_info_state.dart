import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum ContactInfoStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension ContactInfoStateStatusX on ContactInfoStateStatus{
  bool get isInitial => this == ContactInfoStateStatus.INITIAL;
  bool get isSuccess => this == ContactInfoStateStatus.SUCCESS;
  bool get isError => this == ContactInfoStateStatus.ERROR;
  bool get isLoading => this == ContactInfoStateStatus.LOADING;
}

class ContactInfoState extends Equatable {
  final ContactInfoStateStatus contactInfoStateStatus;
  final bool isUpdatePersonalActive;
  final String personalPhoneFlagEmoji;
  final String personalPhoneCode;
  final String commercialPhoneFlagEmoji;
  final String commercialPhoneCode;
  final String whatsAppPhoneFlagEmoji;
  final String whatsAppPhoneCode;

  const ContactInfoState({
    this.contactInfoStateStatus = ContactInfoStateStatus.INITIAL,
    this.isUpdatePersonalActive = false,
    this.personalPhoneFlagEmoji = '🇯🇴',
    this.personalPhoneCode = '962',
    this.commercialPhoneFlagEmoji = '🇯🇴',
    this.commercialPhoneCode = '962',
    this.whatsAppPhoneFlagEmoji = '🇯🇴',
    this.whatsAppPhoneCode = '962',
  });

  ContactInfoState copyWith({
    ContactInfoStateStatus? contactInfoStateStatus,
    bool? isUpdatePersonalActive,
    String? personalPhoneFlagEmoji,
    String? personalPhoneCode,
    String? commercialPhoneFlagEmoji,
    String? commercialPhoneCode,
    String? whatsAppPhoneFlagEmoji,
    String? whatsAppPhoneCode,

  }) {
    return ContactInfoState(
      contactInfoStateStatus: contactInfoStateStatus ?? this.contactInfoStateStatus,
      isUpdatePersonalActive:isUpdatePersonalActive ?? this.isUpdatePersonalActive,
      personalPhoneFlagEmoji:personalPhoneFlagEmoji ?? this.personalPhoneFlagEmoji,
      personalPhoneCode:personalPhoneCode ?? this.personalPhoneCode,
      commercialPhoneFlagEmoji:commercialPhoneFlagEmoji ?? this.commercialPhoneFlagEmoji,
      commercialPhoneCode:commercialPhoneCode ?? this.commercialPhoneCode,
      whatsAppPhoneFlagEmoji:whatsAppPhoneFlagEmoji ?? this.whatsAppPhoneFlagEmoji,
      whatsAppPhoneCode:whatsAppPhoneCode ?? this.whatsAppPhoneCode,
    );
  }

  @override
  List<Object?> get props => [
    contactInfoStateStatus,
    isUpdatePersonalActive,
    personalPhoneFlagEmoji,
    personalPhoneCode,
    commercialPhoneFlagEmoji,
    commercialPhoneCode,
    whatsAppPhoneFlagEmoji,
    whatsAppPhoneCode,
  ];
}
