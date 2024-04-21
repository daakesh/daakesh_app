import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilderWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(withArrowBack: false),
            const SizedBox(
              height: 21.0,
            ),
            BlocBuilder<UserDataBloc, UserDataState>(
              builder: (context, state) {
                return Row(
                  children: [
                    const SizedBox(
                      width: 25.0,
                    ),
                    Hero(
                      tag: 'profileImage',
                      child: Container(
                        width: 53.0,
                        height: 53.0,
                        decoration: const BoxDecoration(
                            color: ColorName.gray, shape: BoxShape.circle),
                        child: CachedImage(
                          imageUrl: state.userModelData.isNotEmpty
                              ? state.userModelData.first.img.toString()
                              : '',
                          borderRadius: BorderRadius.circular(100.0),
                          errorWidget: (_, __, error) {
                            return Container(
                              width: 53.0,
                              height: 53.0,
                              decoration: const BoxDecoration(
                                  color: ColorName.gray,
                                  shape: BoxShape.circle),
                              child: const Center(child: Icon(Icons.person)),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.userModelData.isNotEmpty
                              ? state.userModelData.first.name.toString()
                              : '',
                          style: context.easyTheme.textTheme.bodyMedium!
                              .copyWith(fontSize: 22.0),
                        ),
                        Text(
                          state.userModelData.isNotEmpty
                              ? state.userModelData.first.email.toString()
                              : '',
                          style: context.easyTheme.textTheme.bodyMedium!
                              .copyWith(
                                  fontSize: 18.0, color: ColorName.grayishBlue),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 31.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: Text(
                'Your Account',
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 20.0),
              ),
            ),
            const SizedBox(
              height: 31.0,
            ),
            CategoryItemWidget(
              onTap: () => Utils.openNewPage(const PersonalInfoScreen()),
              title: 'Personal Info',
              icon: Assets.svg.personIcon.svg(),
            ),
            CategoryItemWidget(
              onTap: () => Utils.openNewPage(ContactInfoScreen()),
              title: 'Contact Info',
              icon: Assets.svg.profilePhoneIcon.svg(),
            ),
            CategoryItemWidget(
              onTap: () => Utils.openNewPage(const CardAndAccountScreen()),
              title: 'Card and Accounts',
              icon: Assets.svg.profileCreditCardIcon.svg(),
            ),
            CategoryItemWidget(
              onTap: () => Utils.openNewPage(const LocationScreen()),
              title: 'Location',
              icon: Assets.svg.locationPinIcon.svg(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: Text(
                'Support',
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 20.0),
              ),
            ),
            const SizedBox(
              height: 29.0,
            ),
            CategoryItemWidget(
              onTap: () => Utils.openNewPage(ComplaintScreen()),
              title: 'Complaint',
              icon: Assets.svg.commentIcon.svg(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: Text(
                'Setting',
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 20.0),
              ),
            ),
            const SizedBox(
              height: 29.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43.0),
              child: Row(
                children: [
                  Assets.png.langIcon.image(width: 30.0, height: 30.0),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    'Language',
                    style: context.easyTheme.textTheme.labelLarge!
                        .copyWith(fontSize: 16.0, color: ColorName.blueGray),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    'English',
                    style: context.easyTheme.textTheme.labelLarge!
                        .copyWith(fontSize: 12.0, color: ColorName.blueGray),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  BlocBuilder<ProfileBloc, ProfileState>(builder: (_, state) {
                    return Switch.adaptive(
                        value: state.switchLangValue,
                        onChanged: (value) {
                          ProfileBloc.get
                              .add(ChangeLangEvent(switchLangValue: value));
                        });
                  }),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'عربي',
                    style: context.easyTheme.textTheme.labelLarge!
                        .copyWith(fontSize: 12.0, color: ColorName.blueGray),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 71.0,
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Center(
                  child: DefaultButtonWidget(
                      text: 'LOG OUT',
                      onPressed: () => GetItUtils.user.logOut())),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
