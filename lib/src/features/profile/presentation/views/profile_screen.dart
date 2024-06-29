import 'package:daakesh/gen/colors.gen.dart';
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
            const SizedBox(height: 21.0),
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
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: Text(
                context.locale.your_account,
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 20.0),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CategoryItemWidget(
              onTap: () => Utils.openNewPage(const PersonalInfoScreen()),
              title: context.locale.personal_info_title,
              icon: Assets.svg.personIcon.svg(width: 24.0, height: 24.0),
            ),
            //CategoryItemWidget(
            //  onTap: () => Utils.openNewPage(ContactInfoScreen()),
            //  title: context.locale.contact_info_title,
            //  icon: Assets.svg.profilePhoneIcon.svg(),
            //),
            // CategoryItemWidget(
            //   onTap: () => Utils.openNewPage(const CardAndAccountScreen()),
            //   title: 'Card and Accounts',
            //   icon: Assets.svg.profileCreditCardIcon.svg(),
            // ),
            CategoryItemWidget(
              onTap: () => Utils.openNewPage(const LocationScreen()),
              title: context.locale.location_profile_title,
              icon: Assets.svg.locationPinIcon.svg(width: 24.0, height: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: Text(
                context.locale.support,
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 20.0),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CategoryItemWidget(
              onTap: () => Utils.openNewPage(ComplaintScreen()),
              title: context.locale.complaint_title,
              icon: Assets.svg.commentIcon.svg(width: 24.0, height: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: Text(
                context.locale.setting,
                style: context.easyTheme.textTheme.headlineMedium!
                    .copyWith(fontSize: 20.0),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: Row(
                children: [
                  Assets.png.langIcon.image(width: 24.0, height: 24.0),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    context.locale.language,
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
                    return Switch(
                        value: state.switchLangValue,
                        activeColor: ColorName.blueGray,
                        inactiveThumbColor: ColorName.blueGray,
                        inactiveTrackColor: ColorName.gainsboro,
                        focusColor: ColorName.gainsboro,
                        hoverColor: ColorName.gainsboro,
                        activeTrackColor: ColorName.gainsboro,
                        trackOutlineColor: MaterialStateProperty.resolveWith(
                          (final Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return null;
                            }
                            return ColorName.transparent;
                          },
                        ),
                        thumbColor:
                            MaterialStateProperty.all(ColorName.blueGray),
                        thumbIcon: MaterialStateProperty.all(const Icon(
                          Icons.abc,
                          color: ColorName.blueGray,
                        )),
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
                      text: context.locale.log_out,
                      onPressed: () =>
                          UserDataBloc.get.add(LogoutUserEvent()))),
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
