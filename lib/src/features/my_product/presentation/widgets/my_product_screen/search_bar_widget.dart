import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class SearchProductBarWidget extends StatelessWidget {
  const SearchProductBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(start: 16.0.w,end: 13.0.w,bottom: 0.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 50.0.h,
              margin: EdgeInsetsDirectional.only(end: 8.0.w),
              decoration: BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20.0.w,
                  ),
                  Assets.svg.searchIcon.svg(color:  ColorName.charcoalGray,width:20.0.w ,height: 20.0.h),
                  Expanded(
                    child:Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: TextFormFieldWidget(
                        controller: TextEditingController(),
                        onTap: () {},
                        style: easyTheme.textTheme.labelMedium!.copyWith(fontFamily: FontFamily.apercuRegular),
                        isUnderlineOn: true,
                        hintText: 'Search In Your Product',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(onTap: () {},
              child: Assets.png.filterIcon.image(
                width: 38.0.w,
                height: 38.0.h,
              ),
          ),
        ],
      ),
    );
  }
}
