import 'package:flutter/material.dart';

import '../../../src.export.dart';

class RefreshIndicatorWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onRefresh;
  const RefreshIndicatorWidget({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      strokeWidth: 4,
      color: ColorName.amber,
      onRefresh: () async => onRefresh(),
      child: child,
    );
  }
}
