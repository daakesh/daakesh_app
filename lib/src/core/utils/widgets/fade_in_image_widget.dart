import 'package:flutter/widgets.dart';

import '../../../src.export.dart';

class FadeInImageWidget extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? height;
  final double? width;
  final bool isCircle;
  final double? radius;
  const FadeInImageWidget({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.isCircle = true,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius != null
          ? BorderRadius.circular(radius!)
          : isCircle
              ? BorderRadius.circular(100.0)
              : BorderRadius.circular(0.0),
      child: FadeInImage.assetNetwork(
        placeholder: '',
        image: imageUrl,
        fit: fit,
        fadeInCurve: Curves.easeInOut,
        height:height,
        width: width,
        placeholderErrorBuilder: (BuildContext context,Object error, StackTrace? stackTrace) {
          return const SizedBox();
        },
        imageErrorBuilder: (BuildContext context, Object error,StackTrace? stackTrace) {
          return Center(
            child: Assets.svg.emptyImageIcon.svg(height: 20.0, width: 20.0),
          ); // Show a local error image.
        },
      ),
    );
  }
}
