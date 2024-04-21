import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class MoreInfoProductScreen extends StatelessWidget {
  final TodayItem todayDealItem;
  final bool isDaakeshTodayDeal;
  MoreInfoProductScreen(
      {super.key,
      required this.todayDealItem,
      required this.isDaakeshTodayDeal});

  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => context.disMissKeyboard,
        child: CustomScrollView(
          slivers: [
            const HomeAppBarWidget(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 17.5, end: 26.0, top: 12.0),
                child: ProductCarousalSlider(
                  todayDealItem: todayDealItem,
                  isDaakeshTodayDeal: isDaakeshTodayDeal,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.only(start: 17.5, end: 26.0),
                child: PriceRateSection(
                  isDaakeshTodayDeal: isDaakeshTodayDeal,
                  todayDealItem: todayDealItem,
                ),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: const EdgeInsetsDirectional.only(
            //         start: 17.5, end: 26.0),
            //     child: SizeSection(state: state),
            //   ),
            // ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.only(start: 17.5, end: 26.0),
                child: DetailsSection(todayDealItem: todayDealItem),
              ),
            ),
            SliverToBoxAdapter(
              child: !isDaakeshTodayDeal
                  ? Center(
                      child: DefaultButtonWidget(
                          text: context.locale.more_info_product_add_to_cart,
                          onPressed: () => addToCart(
                              todayDealItem.id.toString(),
                              todayDealItem.country.toString(),
                              todayDealItem.city.toString())),
                    )
                  : Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 17.5, end: 26.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 1,
                              child: DefaultButtonWidget(
                                  text: context.locale.more_info_product_call,
                                  onPressed: () {})),
                          const SizedBox(
                            width: 8.0,
                          ),
                          DefaultButtonWidget(
                              text: context.locale.more_info_product_whatsapp,
                              onPressed: () {},
                              style: context
                                  .easyTheme.elevatedButtonTheme.style!
                                  .copyWith(
                                minimumSize: MaterialStateProperty.all(
                                    Size(40.0.w, 56.0.h)),
                                backgroundColor:
                                    MaterialStateProperty.all(ColorName.amber),
                              )),
                        ],
                      ),
                    ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.only(start: 17.5, end: 26.0),
                child: AddCommentRateSection(),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 17.5, end: 26.0),
                child: Divider(
                  color: Color.fromARGB(255, 22, 15, 15),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.only(start: 17.5, end: 26.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.locale.more_info_product_comments,
                          style: context.easyTheme.textTheme.bodyLarge!
                              .copyWith(fontSize: 18.0),
                        ),
                        Text(
                          '(200)',
                          style: context.easyTheme.textTheme.bodyLarge!
                              .copyWith(fontSize: 18.0, color: ColorName.gray),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 23.0,
                    ),
                  ],
                ),
              ),
            ),
            const CommentsSection(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  void addToCart(String itemID, String country, String address) {
    CartBloc.get.add(
        AddToCartEvent(itemID: itemID, country: country, address: address));
  }
}
