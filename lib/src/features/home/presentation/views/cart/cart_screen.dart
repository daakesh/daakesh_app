import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CustomScrollView(
            slivers: [
              const HomeAppBarWidget(isCart: true),
              const SliverPadding(
                  padding: EdgeInsetsDirectional.only(top: 15.0)),
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    context.locale.cart_title,
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 22.0),
                  ),
                ),
              ),
              const SliverPadding(
                  padding: EdgeInsetsDirectional.only(top: 11.0)),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, index) {
                        return state.cartItemsList.isNotEmpty
                            ? CartItemWidget(
                                cartItem: state.cartItemsList[index],
                                index: index,
                              )
                            : const SizedBox();
                      },
                      childCount: state.cartItemsList.length,
                    ),
                  );
                },
              ),
              const SliverPadding(
                  padding: EdgeInsetsDirectional.only(top: 200.0)),
            ],
          ),
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            return Container(
              height: 200.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorName.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 3),
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    blurRadius: 12.0,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 24.0,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: context.locale.cart_total_title,
                            style: context.easyTheme.textTheme.labelMedium!
                                .copyWith(fontSize: 28.0)),
                        TextSpan(
                            text: state.totalPrice,
                            style: context.easyTheme.textTheme.labelMedium!
                                .copyWith(fontSize: 28.0)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    '(${state.cartItemsList.length}) ${context.locale.cart_total_item_title}',
                    style: context.easyTheme.textTheme.labelMedium!
                        .copyWith(fontSize: 22.0, color: ColorName.dimGray),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21.5),
                    child: Center(
                        child: DefaultButtonWidget(
                            text: context.locale.checkout_button_title,
                            onPressed: () => openCheckOutScreen(context))),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  void openCheckOutScreen(context) async {
    Utils.openNavNewPage(context, const CheckOutScreen());
  }

  void openCartScreen(context) {
    FocusScope.of(context).unfocus();
    Utils.openNavNewPage(context, const SearchScreen());
  }
}
