import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();

  final FocusNode countryFocusNode = FocusNode();
  final FocusNode cityFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    countryController.text = GetItUtils.user.userData.location.toString();
    cityController.text = GetItUtils.user.userData.location.toString();
    addressController.text = GetItUtils.user.userData.location.toString();
    resetFlag();
  }

  void resetFlag() {
    //AuthBloc.get.add(ChangeFlagEvent(flagEmoji: '🇯🇴'));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: BlocBuilder<ProfileBloc, ProfileState>(builder: (_, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 108.0,
                  ),
                  Text(
                    'Location',
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 36.0),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Text(
                    'Location info',
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 25.0),
                  ),
                  const SizedBox(
                    height: 19.0,
                  ),
                  Text(
                    'This information is required to allow your customers to communicate with you. Your account information is used if it is not changed',
                    style: context.easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 21.0,
                  ),
                  Text('Country',
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 18.0, color: ColorName.darkGray)),
                  TextFormFieldWidget(
                    controller: countryController,
                    focusNode: countryFocusNode,
                    isSuffixPrefixOn: true,
                    enabled: state.isUpdatePersonalActive,
                    suffixIcon: SizedBox(
                      height: 9.0,
                      width: 16.0,
                      child: Center(child: Assets.svg.arrowDropDownIcon.svg()),
                    ),
                    prefixIcon: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: Center(
                            child: Text(
                          state.locationFlagEmoji,
                          style: const TextStyle(
                              color: ColorName.blueGray, fontSize: 24.0),
                        ))),
                    onFieldSubmitted: (value) => Utils.fieldFocusChange(
                        context, countryFocusNode, cityFocusNode),
                    readOnly: true,
                    onTap: () {
                      showCountryDialog(context);
                    },
                    inputFormatters: [
                      RegExpValidator.beginWhitespace,
                    ],
                  ),
                  const SizedBox(height: 33.0),
                  Text('City',
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 18.0, color: ColorName.darkGray)),
                  TextFormFieldWidget(
                    controller: cityController,
                    focusNode: cityFocusNode,
                    enabled: state.isUpdatePersonalActive,
                    onFieldSubmitted: (value) => Utils.fieldFocusChange(
                        context, cityFocusNode, addressFocusNode),
                    inputFormatters: [
                      RegExpValidator.beginWhitespace,
                    ],
                  ),
                  const SizedBox(height: 33.0),
                  Text('Address',
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 18.0, color: ColorName.darkGray)),
                  TextFormFieldWidget(
                    controller: addressController,
                    focusNode: addressFocusNode,
                    enabled: state.isUpdatePersonalActive,
                    isSuffixPrefixOn: true,
                    inputFormatters: [
                      RegExpValidator.beginWhitespace,
                    ],
                    suffixIcon: InkWell(
                      onTap: () => Utils.openNewPage(const MapScreen()),
                      splashColor: ColorName.transparent,
                      focusColor: ColorName.transparent,
                      highlightColor: ColorName.transparent,
                      child: SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child:
                              Center(child: Assets.svg.locationPinIcon.svg())),
                    ),
                  ),
                  const SizedBox(
                    height: 44.0,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Center(
                    child: DefaultButtonWidget(
                        text: !state.isUpdatePersonalActive
                            ? 'MAKE EDIT'
                            : 'SAVE',
                        onPressed: () => !state.isUpdatePersonalActive
                            ? onMakeEdit(state.isUpdatePersonalActive)
                            : onSave()),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Center(
                    child: OutlineButtonWidget(
                        text: !state.isUpdatePersonalActive
                            ? 'Cancel'
                            : 'RESET AND CANCEL',
                        onPressed: () => cancel(state.isUpdatePersonalActive)),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  void onMakeEdit(bool isUpdateActive) {
    ProfileBloc.get.add(ActivateUpdateEvent(isUpdatePersonalActive: true));
  }

  void cancel(bool isUpdateActive) {
    Utils.getBack();
    ProfileBloc.get.add(ActivateUpdateEvent(isUpdatePersonalActive: false));
  }

  void showCountryDialog(context) {
    return showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        countryController.text = country.name;
        ProfileBloc.get.add(
          ChangeLocationFlagEvent(
            flagEmoji: country.flagEmoji.toString(),
          ),
        );
      },
    );
  }

  void onSave() {
    ProfileBloc.get.add(
      UpdateLocationEvent(
        country: countryController.text,
        city: cityController.text,
        address: addressController.text,
      ),
    );
  }
}
