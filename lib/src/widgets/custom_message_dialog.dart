import 'package:flutter/material.dart';

showMessageDialog({
  required BuildContext context,
  required Widget child,
  bool barrierDismissible = false,
  bool removeCloseButton = false,
  double horizontalPadding = 35,
  double verticalPadding = 25,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    // barrierColor: AppColors.barrierColorWithOpacity,
    builder: (BuildContext context) {
      return CustomMessageDialog(
        removeCloseButton: removeCloseButton,
        verticalPadding: verticalPadding,
        horizontalPadding: horizontalPadding,
        child: child,
      );
    },
  );
}

// ignore: must_be_immutable
class CustomMessageDialog extends StatelessWidget {
  bool removeCloseButton;
  Widget? child;

  double horizontalPadding;
  double verticalPadding;

  CustomMessageDialog({
    Key? key,
    this.child,
    this.removeCloseButton = false,
    this.horizontalPadding = 35,
    this.verticalPadding = 25,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      insetPadding: const EdgeInsets.symmetric(horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 30,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      child: Stack(
        children: [
          Wrap(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                alignment: Alignment.center,
                child: child,
              ),
            ],
          ),
          removeCloseButton
              ? const SizedBox()
              : Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
