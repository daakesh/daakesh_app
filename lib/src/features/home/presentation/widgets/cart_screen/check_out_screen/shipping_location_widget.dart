import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../../src.export.dart';

class ShippingLocationWidget extends StatelessWidget {
  final bool isWithEdit;
  const ShippingLocationWidget({super.key, this.isWithEdit = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 11.0),
      decoration: const BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 6.0,
              color: Color.fromRGBO(0, 0, 0, 0.16),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8.2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: ColorName.amber,
                ),
                Text(
                  'Shipping',
                  style: context.easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 22.0),
                ),
                const Spacer(
                  flex: 1,
                ),
                isWithEdit
                    ? GestureDetector(
                        onTap: () => editShipping(context),
                        child: Text(
                          'Edit',
                          style: context.easyTheme.textTheme.headlineMedium!
                              .copyWith(
                                  fontSize: 14.0, color: ColorName.skyBlue),
                        ))
                    : const SizedBox(),
                const SizedBox(
                  width: 10.0,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 3.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 6.0,
                ),
                Row(
                  children: [
                    Text(
                      'Country',
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 15.0, color: ColorName.dimGray),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      'Jordan',
                      style: context.easyTheme.textTheme.labelLarge!
                          .copyWith(fontSize: 15.0, color: ColorName.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Row(
                  children: [
                    Text(
                      'Address',
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 15.0, color: ColorName.dimGray),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      'XXXX,XXXXX,XXXXXX',
                      style: context.easyTheme.textTheme.labelLarge!
                          .copyWith(fontSize: 15.0, color: ColorName.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 9.0,
                ),
                Row(
                  children: [
                    Text(
                      'Phone Number',
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 15.0, color: ColorName.dimGray),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      'XXXXXX',
                      style: context.easyTheme.textTheme.labelLarge!
                          .copyWith(fontSize: 15.0, color: ColorName.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 9.0,
                ),
                const Divider(
                  color: ColorName.gray,
                ),
                Row(
                  children: [
                    Text(
                      'Delivery Fee',
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 19.0, color: ColorName.dimGray),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      '\$15.6',
                      style: context.easyTheme.textTheme.labelLarge!
                          .copyWith(fontSize: 18.0, color: ColorName.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void editShipping(context) {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: AdjustShippingScreen(),
      withNavBar: true, // OPTIONAL VALUE. True by default.
    );
  }
}
