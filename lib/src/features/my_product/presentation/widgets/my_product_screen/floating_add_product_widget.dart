import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class FloatingAddProductWidget extends StatelessWidget {
  const FloatingAddProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: ColorName.transparent,
      highlightColor: ColorName.transparent,
      splashColor: ColorName.transparent,
      onTap: ()=>openNewPage(AddProInfoScreen()),
      child: SizedBox(
        width: 120.0,
        height: 120.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70.0,
              height: 70.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorName.amber,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 6.0,
                      color: Color.fromRGBO(0, 0, 0, 0.16)
                  )
                ],
              ),
              child: const Center(
                child: SizedBox(
                    width: 70.0,
                    height: 70.0,
                    child: FittedBox(
                        child: Icon(
                      Icons.add_rounded,
                      color: ColorName.white,
                    ))),
              ),
            ),
            Text(
              'Add Product',
              style: easyTheme.textTheme.bodyLarge!.copyWith(
                  fontSize: 18.0, color: ColorName.black.withOpacity(0.36)),
            ),
          ],
        ),
      ),
    );
  }
}

