import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class FloatingAddProductWidget extends StatelessWidget {
  final TextEditingController searchController;
  const FloatingAddProductWidget({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AddProBloc.get.add(AddEditStateEvent(adjustProduct: AdjustProduct.ADD));
        Utils.openNewPage(const AddProInfoScreen());
        MyProFuncBloc.get.add(EmptyProductSearchEvent(value: ''));
        searchController.clear();
      },
      child: SizedBox(
        width: 120,
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60.5,
              height: 60.5,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorName.amber,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 6.0,
                      color: Color.fromRGBO(0, 0, 0, 0.16))
                ],
              ),
              child: const Center(
                child: SizedBox(
                    width: 60,
                    height: 60,
                    child: FittedBox(
                        child: Icon(
                      Icons.add_rounded,
                      color: ColorName.white,
                    ))),
              ),
            ),
            // Text(
            //   context.locale.add_product,
            //   style: context.easyTheme.textTheme.bodyLarge!.copyWith(
            //       fontSize: 18.0.sp, color: ColorName.black.withOpacity(0.36)),
            // ),
          ],
        ),
      ),
    );
  }
}
