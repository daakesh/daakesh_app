import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class FloatingAddProductWidget extends StatelessWidget {
  const FloatingAddProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AddProBloc.get.add(AddEditStateEvent(adjustProduct:AdjustProduct.ADD ));
        openNewPage(const AddProInfoScreen());
      },
      child: SizedBox(
        width: 120.0.w,
        height: 120.0.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70.5.w,
              height: 70.5.h,
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
              child: Center(
                child: SizedBox(
                    width: 70.0.w,
                    height: 70.0.h,
                    child: const FittedBox(
                        child: Icon(
                      Icons.add_rounded,
                      color: ColorName.white,
                    ))),
              ),
            ),
            Text(
              'Add Product',
              style: easyTheme.textTheme.bodyLarge!.copyWith(
                  fontSize: 18.0.sp, color: ColorName.black.withOpacity(0.36)),
            ),
          ],
        ),
      ),
    );
  }
}

