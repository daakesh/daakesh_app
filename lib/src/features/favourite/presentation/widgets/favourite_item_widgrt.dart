import 'package:daakesh/src/core/utils/utils.dart';
import 'package:daakesh/src/core/utils/widgets/cached_image.dart';
import 'package:daakesh/src/features/favourite/data/moldels/favourite_response.dart';
import 'package:daakesh/src/features/home/presentation/presentation.export.dart';
import 'package:daakesh/src/features/swap/data/models/trend_deals_model.dart';
import 'package:daakesh/src/features/home/data/models/today_deal_model.dart';
import 'package:daakesh/src/features/swap/presentation/views/swap_more_info_screen.dart';
import 'package:daakesh/src/features/home/presentation/views/more_info_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteItemWidget extends StatelessWidget {
  final FavouriteResponseModelData item;
  final Function() onPressedDelete;

  const FavouriteItemWidget({
    super.key,
    required this.item,
    required this.onPressedDelete,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayDealsBloc, TodayDealsState>(
        builder: (context, state) {
      return GestureDetector(
        onTap: () {
          // Navigate to item details page
          if (item.item?.Type?.toLowerCase() == 'swap') {
            final swapItem = TrendDealsItem(
              id: item.item?.id,
              description: item.item?.description,
              itemImg: item.item?.itemImg?.whereType<String>().toList(),
              date: item.item?.date,
              title: item.item?.Title,
              type: item.item?.Type,
              swapFor: item.item?.SwapFor,
              city: item.item?.City,
              year: item.item?.Year,
              condition: item.item?.Condition,
              price: item.item?.Price,
              discount: double.tryParse(item.item?.discount ?? '0'),
              discountFrom: item.item?.discountFrom,
              discountTo: item.item?.discountTo,
              country: item.item?.country,
              // section, user, category, brand, subcategory, isFavorite, latitude, longitude can be added if needed
            );
            // Set additional fields if needed
            // swapItem.countrySwap = item.item?.countrySwap;
            // swapItem.citySwap = item.item?.citySwap;
            // swapItem.offerCount = int.tryParse(item.item?.offersCount ?? '0');
            Utils.openNavNewPage(
                context, SwapMoreInfoScreen(trendDealsItem: swapItem));
          } else {
            // Convert FavouriteResponseModelDataItem to TodayItem
            final todayItem = TodayItem(
              id: item.item?.id,
              description: item.item?.description,
              itemImg: item.item?.itemImg?.whereType<String>().toList(),
              date: item.item?.date,
              title: item.item?.Title,
              type: item.item?.Type,
              swapFor: item.item?.SwapFor,
              city: item.item?.City,
              year: item.item?.Year,
              condition: item.item?.Condition,
              price: item.item?.Price,
              discount: double.tryParse(item.item?.discount ?? '0'),
              discountFrom: item.item?.discountFrom,
              discountTo: item.item?.discountTo,
              country: item.item?.country,
              priceAfterDiscount: item.item?.priceAfterDiscount,
              discountPercentage: item.item?.discountPercentage,
              // Add more fields as needed
            );
            Utils.openNavNewPage(
                context,
                MoreInfoProductScreen(
                    todayDealItem: todayItem, isDaakeshTodayDeal: false));
          }
        },
        child: Stack(
          children: [
            Dismissible(
              key: Key(item.id.toString()),
              // Must be unique
              direction: DismissDirection.endToStart, // Left to right
              confirmDismiss: (direction) async {
                await onPressedDelete();
                return null;
              },
              background: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.redAccent,
                child: const Row(
                  children: [
                    Icon(Icons.delete, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Delete",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              child: Card(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                margin: const EdgeInsets.only(bottom: 12),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 30,
                        child: getImage(),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 50,
                        child: getNameLocationOffer(),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "By ${item.user?.name}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  fontSize: 12),
                            ),
                            const Spacer(),
                            const Icon(Icons.favorite, color: Colors.red),
                            const SizedBox(height: 10),
                            const Icon(Icons.phone, color: Colors.grey),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(16)),
                    color: Colors.red,
                  ),
                  width: 60,
                  height: 18,
                  child: Center(
                    child: Text(
                      item.item?.Type.toString().toUpperCase() ?? '',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ))
          ],
        ),
      );
    });
  }

  Column getNameLocationOffer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.item?.Title ?? "",
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 14),
        ),
        const SizedBox(height: 5),
        Text(
          '${item.item?.City ?? ""},${item.item?.country ?? ""}',
          style: const TextStyle(
            color: Colors.black45,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          ' (${item.item?.offersCount ?? ""}) Offers Submitted',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Container getImage() {
    return Container(
      color: Colors.blue,
      height: 100,
      width: 100,
      child: CachedImage(imageUrl: item.item?.itemImg?[0] ?? ''),
    );
  }
}
