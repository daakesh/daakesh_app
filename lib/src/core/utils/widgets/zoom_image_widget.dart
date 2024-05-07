import 'package:daakesh/src/core/core.export.dart';
import 'package:flutter/material.dart';

class ZoomImageWidget extends StatelessWidget {
  final String imageUrl;
  const ZoomImageWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child: CachedImage(
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}
