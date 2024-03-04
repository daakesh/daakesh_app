import 'package:flutter/material.dart';
import '../../../../../../src.export.dart';

class SwapShippingLocationWidget extends StatelessWidget {
  final bool isWithEdit;
  const SwapShippingLocationWidget({super.key,this.isWithEdit = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 11.0),
      decoration: const BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0),),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6.0,
            color: Color.fromRGBO(0, 0, 0, 0.16),
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.2,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                const Icon(Icons.location_on,color: ColorName.amber,),
                Text('Shipping',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 22.0),),
                const Spacer(flex: 1,),
                isWithEdit ? InkWell(
                    focusColor: ColorName.transparent,
                    highlightColor: ColorName.transparent,
                    splashColor: ColorName.transparent,
                    onTap: (){},
                    child: Text(
                      'Edit',
                      style: easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 14.0, color: ColorName.skyBlue),
                    )):const SizedBox(),
                const SizedBox(width: 10.0,)
              ],
            ),
          ),
          const SizedBox(height: 3.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6.0,),
                Row(
                  children: [
                    Text(
                      'Country',
                      style: easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 15.0, color: ColorName.dimGray),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(flex: 1,),
                    Text('Jordan',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 15.0,color: ColorName.black),),
                  ],),
                const SizedBox(height: 6.0,),
                Row(
                  children: [
                    Text(
                      'Address',
                      style: easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 15.0, color: ColorName.dimGray),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(flex: 1,),
                    Text(
                      'XXXX,XXXXX,XXXXXX',
                      style: easyTheme.textTheme.labelLarge!
                          .copyWith(fontSize: 15.0, color: ColorName.black),
                    ),
                  ],),
                const SizedBox(height: 9.0,),
                Row(
                  children: [
                    Text(
                      'Phone Number',
                      style: easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 15.0, color: ColorName.dimGray),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(flex: 1,),
                    Text('XXXXXX',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 15.0,color: ColorName.black),),
                  ],),
                const SizedBox(height: 9.0,),
                const Divider(color: ColorName.gray,),
                Row(
                  children: [
                    Text('Delivery Fee',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 19.0,color: ColorName.dimGray),),
                    const Spacer(flex: 1,),
                    Text('\$15.6',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 18.0,color: ColorName.black),),
                  ],),
                const SizedBox(height: 14.0,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
