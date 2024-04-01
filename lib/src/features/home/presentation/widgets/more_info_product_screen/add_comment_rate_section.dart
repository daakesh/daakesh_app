import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../src.export.dart';

class AddCommentRateSection extends StatelessWidget {
  AddCommentRateSection({
    super.key,
  });
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30.0,
        ),
        Text(
          'Rate',
          style: context.easyTheme.textTheme.headlineMedium!
              .copyWith(fontSize: 22.0),
        ),
        const SizedBox(
          height: 14.0,
        ),
        Container(
          width: double.infinity,
          height: 185.0,
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 19.22),
          decoration: const BoxDecoration(
            color: ColorName.silverSand,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 22.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingBar.builder(
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    minRating: 1,
                    maxRating: 5,
                    initialRating: 4.5,
                    itemSize: 25.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      context.disMissKeyboard;
                    },
                  ),
                  Assets.svg.sendIcon.svg(width: 27.0, height: 27.0),
                ],
              ),
              const SizedBox(
                height: 18.0,
              ),
              Container(
                height: 103.0,
                width: double.infinity,
                padding: const EdgeInsetsDirectional.only(
                    start: 10.0, end: 10, top: 7.0),
                decoration: const BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.all(Radius.circular(6.0))),
                child: TextFormFieldWidget(
                  controller: commentController,
                  hintText: 'Comment',
                  isUnderlineOn: true,
                  maxLines: 5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
      ],
    );
  }
}
