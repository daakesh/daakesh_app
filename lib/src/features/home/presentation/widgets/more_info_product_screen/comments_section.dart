import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../src.export.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          CommentRateModelItem commentRateModelItem = state.commentList[index];
          return state.commentList.isNotEmpty
              ? Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(minHeight: 119.0),
                  margin: const EdgeInsetsDirectional.only(
                    bottom: 12.0,
                    start: 17.5,
                    end: 26.0,
                  ),
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 12.0),
                  decoration: const BoxDecoration(
                    color: ColorName.silverSand,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12.0,
                      ),
                      SizedBox(
                        height: 40.0,
                        child: Row(
                          children: [
                            CachedImage(
                              imageUrl: commentRateModelItem.user!.img != null
                                  ? commentRateModelItem.user!.img.toString()
                                  : '',
                              height: 40.0,
                              width: 40.0,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(100.0)),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    commentRateModelItem.user!.name.toString(),
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(fontSize: 16.0),
                                  ),
                                  Text(
                                    Utils.calculate(
                                        commentRateModelItem.date.toString()),
                                    style: context
                                        .easyTheme.textTheme.bodyMedium!
                                        .copyWith(
                                            fontSize: 11.0,
                                            color: ColorName.grayishBlue),
                                  ),
                                ],
                              ),
                            ),
                            RatingBar.builder(
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              minRating: 1,
                              maxRating: 5,
                              ignoreGestures: true,
                              initialRating:
                                  commentRateModelItem.item!.rate != null
                                      ? commentRateModelItem
                                          .item!.rate!.first.rateValue!
                                          .toDouble()
                                      : 0,
                              itemSize: 15.0,
                              tapOnlyMode: true,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              commentRateModelItem.item!.rate != null
                                  ? commentRateModelItem
                                      .item!.rate!.first.rateValue!
                                      .toDouble()
                                      .toString()
                                  : '0',
                              style: context.easyTheme.textTheme.labelMedium!
                                  .copyWith(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        commentRateModelItem.commentDesc ?? '',
                        style: context.easyTheme.textTheme.bodyMedium!
                            .copyWith(fontSize: 14.0),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                )
              : const SizedBox();
        }, childCount: state.commentList.length));
      },
    );
  }
}
