import 'package:flutter/material.dart';
import '../../../src.export.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final BorderRadiusGeometry borderRadius;
  final Alignment alignment;
  final LoadingErrorWidgetBuilder? errorWidget;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
    this.alignment = Alignment.center,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        height: height,
        width: width,
        filterQuality: FilterQuality.high,
        fadeInCurve: Curves.easeInOut,
        alignment: alignment,
        errorListener: (value) => debugPrint(value.toString()),
        placeholder: (_, __) {
          return const SizedBox();
        },
        errorWidget: errorWidget ??
            (_, __, error) {
              return Center(
                child: Assets.svg.emptyImageIcon.svg(height: 20.0, width: 20.0),
              );
            },
      ),
    );
  }
}
