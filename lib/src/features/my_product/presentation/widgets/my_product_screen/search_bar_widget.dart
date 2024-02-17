import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class SearchProductBarWidget extends StatelessWidget {
  const SearchProductBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16.0,end: 13.0,bottom: 0.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 40.0,
              margin: const EdgeInsetsDirectional.only(end: 8.0),
              decoration: const BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20.0,
                  ),
                  Assets.svg.searchIcon.svg(
                      color:  ColorName.charcoalGray),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                width: 38.0,
                height: 38.0,
              ),
          ),
        ],
      ),
    );
  }
}
