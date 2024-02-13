import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverPadding(padding: EdgeInsets.only(top: 14.0)),
        SliverToBoxAdapter(child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Row(
            children: [
              Container(
                height: 38.0,
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 14.0),
                decoration: const BoxDecoration(
                    color: ColorName.paleGray,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                child: const Center(child: Text('Mobiles')),
              ),
              const SizedBox(width: 11.0,),
              Container(
                height: 38.0,
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 14.0),
                decoration: const BoxDecoration(
                    color: ColorName.paleGray,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                child: const Center(child: Text('Electricals')),
              ),
              const SizedBox(width: 11.0,),
              Container(
                height: 38.0,
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 14.0),
                decoration: const BoxDecoration(
                    color: ColorName.paleGray,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                child: const Center(child: Text('Case')),
              ),
              const SizedBox(width: 26.0,),
              const Spacer(flex: 1,),
              Assets.svg.sortIcon.svg()



            ],
          ),
        ),),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Divider(
              color: ColorName.gray.withOpacity(0.25),
              indent: 14.0,
              endIndent: 14.0,
            ),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 7.0)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Text('Results', style: easyTheme.textTheme.headlineMedium),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 13.0)),
        SliverList(
            delegate: SliverChildBuilderDelegate((_, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 17),
              child: ResultItemWidget(),
            );
          },
          childCount: 20,
        )),
        const SliverPadding(padding: EdgeInsets.only(top: 30.0)),
      ],
    );
  }
}




