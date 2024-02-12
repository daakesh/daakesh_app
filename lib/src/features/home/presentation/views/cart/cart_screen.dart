import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            const SliverPadding(padding: EdgeInsetsDirectional.only(top: 15.0)),
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'Your Cart Details',
                  style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 22.0),
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsetsDirectional.only(top: 11.0)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  return const CartItemWidget();
                },
                childCount: 2,
              ),
            ),
            const SliverPadding(padding: EdgeInsetsDirectional.only(top: 200.0)),

          ],
        ),
        Container(
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
              const SizedBox(height: 24.0,),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Total :',style: easyTheme.textTheme.labelMedium!.copyWith(fontSize: 28.0)),
                    TextSpan(text: '\$88.6',style: easyTheme.textTheme.labelMedium!.copyWith(fontSize: 28.0)),
                  ],
                ),
              ),
              const SizedBox(height: 6.0,),
              Text('(2) Item',style: easyTheme.textTheme.labelMedium!.copyWith(fontSize: 22.0,color: ColorName.dimGray),),
              const SizedBox(height: 14.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.5),
                child: Center(child: DefaultButtonWidget(text: 'CHECKOUT', onPressed: (){})),
              ),

            ],
          ),
        )
      ],
    );
  }
}

