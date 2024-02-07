/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/american_express_icon.png
  AssetGenImage get americanExpressIcon =>
      const AssetGenImage('assets/png/american_express_icon.png');

  /// File path: assets/png/auth_screens_background.png
  AssetGenImage get authScreensBackground =>
      const AssetGenImage('assets/png/auth_screens_background.png');

  /// File path: assets/png/baby_icon.png
  AssetGenImage get babyIcon => const AssetGenImage('assets/png/baby_icon.png');

  /// File path: assets/png/check_icon.png
  AssetGenImage get checkIcon =>
      const AssetGenImage('assets/png/check_icon.png');

  /// File path: assets/png/glasses.png
  AssetGenImage get glasses => const AssetGenImage('assets/png/glasses.png');

  /// File path: assets/png/google_icon.png
  AssetGenImage get googleIcon =>
      const AssetGenImage('assets/png/google_icon.png');

  /// File path: assets/png/handmade_icon.png
  AssetGenImage get handmadeIcon =>
      const AssetGenImage('assets/png/handmade_icon.png');

  /// File path: assets/png/mastercard_icon.png
  AssetGenImage get mastercardIcon =>
      const AssetGenImage('assets/png/mastercard_icon.png');

  /// File path: assets/png/my_order_icon.png
  AssetGenImage get myOrderIcon =>
      const AssetGenImage('assets/png/my_order_icon.png');

  /// File path: assets/png/product_icon.png
  AssetGenImage get productIcon =>
      const AssetGenImage('assets/png/product_icon.png');

  /// File path: assets/png/splash_screen_background.png
  AssetGenImage get splashScreenBackground =>
      const AssetGenImage('assets/png/splash_screen_background.png');

  /// File path: assets/png/swap_icon.png
  AssetGenImage get swapIcon => const AssetGenImage('assets/png/swap_icon.png');

  /// File path: assets/png/visa_icon.png
  AssetGenImage get visaIcon => const AssetGenImage('assets/png/visa_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        americanExpressIcon,
        authScreensBackground,
        babyIcon,
        checkIcon,
        glasses,
        googleIcon,
        handmadeIcon,
        mastercardIcon,
        myOrderIcon,
        productIcon,
        splashScreenBackground,
        swapIcon,
        visaIcon
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/apple_icon.svg
  SvgGenImage get appleIcon => const SvgGenImage('assets/svg/apple_icon.svg');

  /// File path: assets/svg/arrow_drop_down_icon.svg
  SvgGenImage get arrowDropDownIcon =>
      const SvgGenImage('assets/svg/arrow_drop_down_icon.svg');

  /// File path: assets/svg/cart_add_icon.svg
  SvgGenImage get cartAddIcon =>
      const SvgGenImage('assets/svg/cart_add_icon.svg');

  /// File path: assets/svg/credit_card_icon.svg
  SvgGenImage get creditCardIcon =>
      const SvgGenImage('assets/svg/credit_card_icon.svg');

  /// File path: assets/svg/credit_card_logo_icon.svg
  SvgGenImage get creditCardLogoIcon =>
      const SvgGenImage('assets/svg/credit_card_logo_icon.svg');

  /// File path: assets/svg/daakesh_logo.svg
  SvgGenImage get daakeshLogo =>
      const SvgGenImage('assets/svg/daakesh_logo.svg');

  /// File path: assets/svg/facebook_icon.svg
  SvgGenImage get facebookIcon =>
      const SvgGenImage('assets/svg/facebook_icon.svg');

  /// File path: assets/svg/further_info_icon.svg
  SvgGenImage get furtherInfoIcon =>
      const SvgGenImage('assets/svg/further_info_icon.svg');

  /// File path: assets/svg/home_icon.svg
  SvgGenImage get homeIcon => const SvgGenImage('assets/svg/home_icon.svg');

  /// File path: assets/svg/light_daakesh_logo.svg
  SvgGenImage get lightDaakeshLogo =>
      const SvgGenImage('assets/svg/light_daakesh_logo.svg');

  /// File path: assets/svg/location_pin_icon.svg
  SvgGenImage get locationPinIcon =>
      const SvgGenImage('assets/svg/location_pin_icon.svg');

  /// File path: assets/svg/my_product_icon.svg
  SvgGenImage get myProductIcon =>
      const SvgGenImage('assets/svg/my_product_icon.svg');

  /// File path: assets/svg/profile_icon.svg
  SvgGenImage get profileIcon =>
      const SvgGenImage('assets/svg/profile_icon.svg');

  /// File path: assets/svg/search_icon.svg
  SvgGenImage get searchIcon => const SvgGenImage('assets/svg/search_icon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        appleIcon,
        arrowDropDownIcon,
        cartAddIcon,
        creditCardIcon,
        creditCardLogoIcon,
        daakeshLogo,
        facebookIcon,
        furtherInfoIcon,
        homeIcon,
        lightDaakeshLogo,
        locationPinIcon,
        myProductIcon,
        profileIcon,
        searchIcon
      ];
}

class Assets {
  Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
