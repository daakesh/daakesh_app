import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../src.export.dart';

// ignore: must_be_immutable
class AddCommentRateSection extends StatelessWidget {
  final int itemId;
  final int catID;
  AddCommentRateSection({
    super.key,
    required this.itemId,
    required this.catID,
  });
  final commentController = TextEditingController();

  double rateValue = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30.0,
        ),
        Text(
          context.locale.more_info_product_rate,
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
                    initialRating: 5,
                    itemSize: 25.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      rateValue = rating;
                      context.disMissKeyboard;
                    },
                  ),
                  GestureDetector(
                      onTap: () => addRateComment(context),
                      child:
                          Assets.svg.sendIcon.svg(width: 27.0, height: 27.0)),
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
                  hintText: context.locale.more_info_product_comment,
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

  void addRateComment(BuildContext context) {
    if (ValueConstants.userId.isEmpty) {
      context.showLoginDialog;
      return;
    }

    addComment();
    addRate();
  }

  void addComment() {
    CommentBloc.get.add(AddCommentEvent(
      userId: ValueConstants.userId,
      itemId: itemId,
      commentDesc: commentController.text,
    ));
  }

  void addRate() {
    RateBloc.get.add(AddRateEvent(
      userId: ValueConstants.userId,
      itemId: itemId,
      catID: catID,
      rateValue: rateValue,
    ));
  }
}
