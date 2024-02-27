import 'package:cached_network_image/cached_network_image.dart';
import 'package:daakesh/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  const CachedImage({super.key, required this.imageUrl, this.height, this.width, this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      height:height ,
      width: width,
      filterQuality: FilterQuality.high,
      placeholder: (_, __) {
        return const Center(child: CircularProgressIndicator(color: ColorName.blueGray,),);
      },
      errorWidget: (_, __, error) {
        return const Icon(Icons.image_not_supported_outlined);
      },
    );
  }
}
