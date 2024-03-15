import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapProductItem extends StatelessWidget {
  final MyProductItem myProductItem;
  const SwapProductItem({super.key, required this.myProductItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:EdgeInsetsDirectional.only(
        start: 15.0.w,
        end: 15.0.w,
        bottom: 13.0.h,
      ),
      decoration:  BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0.r)),
        boxShadow: const[
          BoxShadow(
              offset: Offset(0,3),
              color: Color.fromRGBO(0, 0, 0, 0.16),
              blurRadius: 6.0
          ),
        ],


      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: ()=>onEdit(myProductItem),
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Padding(
                padding:EdgeInsetsDirectional.only(end: 20.0.w, top: 12.0.h),
                child: Text(
                  'Edit',
                  style: easyTheme.textTheme.bodyLarge!
                      .copyWith(fontSize: 14.0, color: ColorName.skyBlue),
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 7.0.w),
              Expanded(child: CachedImage(imageUrl: myProductItem.itemImg.toString())),
              SizedBox(width: 18.0.w),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 80.0.w),
                      child: Text(
                        '${myProductItem.title}\n',
                        style: easyTheme.textTheme.labelMedium!.copyWith(
                            fontSize: 15.0.sp,
                            color: ColorName.gray,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(height: 9.0.h),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Swap In :',
                              style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 15.0.sp,color: ColorName.gray)
                          ),
                          TextSpan(
                              text: '${myProductItem.countrySwap}',
                              style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 13.0.sp,color: ColorName.black)
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Display:',
                              style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 15.0.sp,color: ColorName.gray)
                          ),
                          TextSpan(
                              text: '${myProductItem.display}',
                              style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 13.0.sp,color: ColorName.black)
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 18.0.h),
        ],
      ),
    );
  }
  void onEdit(MyProductItem myProductItem){
    AddProBloc.get.add(AddEditStateEvent(adjustProduct: AdjustProduct.EDIT));
    openNewPage(const AddProInfoScreen());
    MyProFuncBloc.get.add(EditProductEvent(
        myProductItem: myProductItem,
        productDisplayMethod: ProductDisplayMethod.Swap
    ));
  }
}
