import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../src.export.dart';

class YourCartItemWidget extends StatelessWidget {
  final bool isWithEdit;
  const YourCartItemWidget({super.key, this.isWithEdit = true});

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
              offset: Offset(0, 1),
              blurRadius: 12.0,
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
                  Icons.shopping_cart_outlined,
                  color: ColorName.amber,
                ),
                Text(
                  'Your Cart',
                  style: context.easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 22.0),
                ),
                const Spacer(
                  flex: 1,
                ),
                isWithEdit
                    ? GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          'Edit',
                          style: context.easyTheme.textTheme.headlineMedium!
                              .copyWith(
                                  fontSize: 14.0, color: ColorName.skyBlue),
                        ))
                    : const SizedBox(),
                const SizedBox(
                  width: 4.0,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 3.0,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '(${state.cartItemsList.length}) Item',
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 19.0, color: ColorName.dimGray),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Column(
                      children: List.generate(
                        state.cartItemsList.length,
                        (index) => Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                '${state.cartItemsList[index].item!.title}sssssssssssssssssssssssssssss',
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 15.0,
                                        color: ColorName.dimGray),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                '${state.cartItemsList[index].item!.count}',
                                textAlign: TextAlign.center,
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 15.0,
                                        color: ColorName.dimGray),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                  '\$${state.cartItemsList[index].item!.count! * state.cartItemsList[index].item!.price}',
                                  textAlign: TextAlign.end,
                                  style: context.easyTheme.textTheme.labelLarge!
                                      .copyWith(
                                          fontSize: 17.0,
                                          color: ColorName.black)),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    const Divider(
                      color: ColorName.gray,
                    ),
                    Row(
                      children: [
                        Text(
                          'Cost',
                          style: context.easyTheme.textTheme.bodyMedium!
                              .copyWith(
                                  fontSize: 19.0, color: ColorName.dimGray),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Text(
                          '\$88.6',
                          style: context.easyTheme.textTheme.bodyMedium!
                              .copyWith(fontSize: 18.0, color: ColorName.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
