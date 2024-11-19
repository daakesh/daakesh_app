import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../src.export.dart';

class DaakeshLogoWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final bool isLight;

  const DaakeshLogoWidget({
    super.key,
    this.height,
    this.width,
    this.isLight = false,
  });

  @override
  Widget build(BuildContext context) {
    return !isLight
        ? Assets.svg.daakeshLogo.svg(width: width ?? 272)
        : Assets.svg.lightDaakeshLogo.svg(width: width ?? 272);
  }
}

class ArabicDaakeshLogoWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final bool isLight;

  const ArabicDaakeshLogoWidget({
    super.key,
    this.height,
    this.width,
    this.isLight = false,
  });

  @override
  Widget build(BuildContext context) {
    return !isLight
        ? Assets.svg.darkArabicLogo.svg(width: width ?? 272)
        : Assets.svg.lightArabicLogo.svg(width: width ?? 272);
  }
}

class GeneralDaakeshLogoWidget extends StatelessWidget {
  const GeneralDaakeshLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return !state.switchLangValue
            ? const DaakeshLogoWidget()
            : const Directionality(
                textDirection: TextDirection.ltr,
                child: ArabicDaakeshLogoWidget());
      },
    );
  }
}
