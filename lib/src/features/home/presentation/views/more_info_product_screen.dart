import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class MoreInfoProductScreen extends StatelessWidget {
  MoreInfoProductScreen({super.key});
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 17.5, end: 26.0, top: 12.0),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (_, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductCarousalSlider(state: state),
                PriceRateSection(state: state),
                SizeSection(state:state),
                DetailsSection(state: state,),
                !state.isDaakeshTodayDeal
                    ? Center(child: DefaultButtonWidget(text: 'ADD TO CART', onPressed: (){}))
                    : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                          Expanded(
                            flex: 1,
                              child: DefaultButtonWidget(
                                  text: 'CALL', onPressed: () {})),
                          const SizedBox(width: 8.0,),
                          DefaultButtonWidget(
                              text: 'WhatsApp',
                              onPressed: () {},
                              style: easyTheme.elevatedButtonTheme.style!
                                  .copyWith(
                                minimumSize: MaterialStateProperty.all(const Size(40.0, 56.0)),
                                backgroundColor: MaterialStateProperty.all(ColorName.amber),


                              )),
                        ],),
                AddCommentRateSection(state: state,),
                const Divider(color: ColorName.gray,),
                CommentsSection(state: state),
              ],
            );
          },
        ),
      ),
    );
  }
}