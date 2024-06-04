import 'package:daakesh/src/core/core.export.dart';
import 'package:flutter/material.dart';

class ZoomImageWidget extends StatefulWidget {
  final List<String> imageUrlList;
  const ZoomImageWidget({
    super.key,
    required this.imageUrlList,
  });

  @override
  State<ZoomImageWidget> createState() => _ZoomImageWidgetState();
}

class _ZoomImageWidgetState extends State<ZoomImageWidget> {
  final _transformationController = TransformationController();
  double scale = 1.0;

  @override
  void initState() {
    super.initState();
    _transformationController.addListener(onTransformationChanged);
  }

  void onTransformationChanged() {
    final Matrix4 matrix = _transformationController.value;
    final double scaleValue = matrix.getMaxScaleOnAxis();
    scale = scaleValue;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
          physics: scale == 1.0
              ? const ScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          itemCount: widget.imageUrlList.length,
          itemBuilder: (_, index) {
            return Center(
              child: InteractiveViewer(
                transformationController: _transformationController,
                child: CachedImage(
                  imageUrl: widget.imageUrlList[index],
                ),
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    _transformationController.removeListener(onTransformationChanged);
    _transformationController.dispose();
    super.dispose();
  }
}
