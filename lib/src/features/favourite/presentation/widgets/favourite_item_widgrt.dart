import 'package:daakesh/src/core/utils/utils.dart';
import 'package:daakesh/src/core/utils/widgets/cached_image.dart';
import 'package:daakesh/src/features/favourite/data/moldels/favourite_response.dart';
import 'package:daakesh/src/features/home/presentation/presentation.export.dart';
import 'package:daakesh/src/features/home/data/models/today_deal_model.dart';
import 'package:daakesh/src/features/swap/data/models/trend_deals_model.dart';
import 'package:daakesh/src/features/home/presentation/views/more_info_product_screen.dart';
import 'package:daakesh/src/features/swap/presentation/views/swap_more_info_screen.dart';
import 'package:daakesh/src/features/home/presentation/bloc/comment_bloc/comment_bloc.dart';
import 'package:daakesh/src/features/home/presentation/bloc/comment_bloc/comment_event.dart';
import 'package:daakesh/src/features/authentication/data/models/user_model.dart';
import 'package:daakesh/src/features/home/data/models/section_model.dart';
import 'package:daakesh/src/features/home/data/models/category_model.dart';
import 'package:daakesh/src/features/home/data/models/brand_model.dart';
import 'package:daakesh/src/features/home/data/models/sub_category_model.dart';
import 'package:daakesh/src/features/swap/data/models/swap_sub_category_model.dart';
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
          _navigateToItemDetail(context);
        },
        child: Stack(
          children: [
            Dismissible(
              key: ValueKey(
                  '${item.id}_${item.item?.id}_${DateTime.now().millisecondsSinceEpoch}'),
              // Ensure unique key
              direction: DismissDirection.endToStart, // Left to right
              confirmDismiss: (direction) async {
                onPressedDelete();
                return false; // Never actually dismiss via swipe, let the bloc handle removal
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
                            // const SizedBox(height: 10),
                            // GestureDetector(
                            //   onTap: () => _showLocationOnMap(context),
                            //   child: const Icon(Icons.location_on,
                            //       color: Colors.blue),
                            // ),
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

  void _navigateToItemDetail(BuildContext context) {
    if (item.item?.Type?.toLowerCase() == 'sell') {
      // Navigate to shop item detail screen
      final todayItem = TodayItem(
        id: item.item?.id,
        title: item.item?.Title,
        description: item.item?.description,
        itemImg: item.item?.itemImg?.cast<String>(),
        date: item.item?.date,
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
        priceAfterDiscount:
            double.tryParse(item.item?.priceAfterDiscount ?? '0'),
        discountPercentage: item.item?.discountPercentage,
        isFavorite: true, // Since this is from favorites
        // Initialize complex objects with default values to prevent null references
        user: item.user != null
            ? UserModel(
                id: item.user!.id?.toString(),
                name: item.user!.name,
                phoneNumber: item.user!.phoneNumber,
                email: item.user!.email,
              )
            : UserModel.initValues(),
        section: SectionItemModel.initValues(),
        category: CategoryItem.initValues(),
        brand: BrandItem.initValues(),
        subcategory: SubCategory.initValues(),
        // Set default rating values
        rateCount: 0,
        averageRating: 0.0,
        // Add latitude and longitude with actual values from favorite item
        latitude: item.item?.latitude ??
            "0.0", // Use actual latitude from favorite data
        longitude: item.item?.longitude ??
            "0.0", // Use actual longitude from favorite data
      );

      CommentBloc.get.add(GetCommentByItemEvent(itemId: todayItem.id));

      Utils.openNavNewPage(
        context,
        MoreInfoProductScreen(
          todayDealItem: todayItem,
          isDaakeshTodayDeal: true,
        ),
      );
    } else if (item.item?.Type?.toLowerCase() == 'swap') {
      // Navigate to swap item detail screen
      final trendDealsItem = TrendDealsItem(
        id: item.item?.id,
        description: item.item?.description,
        itemImg: item.item?.itemImg?.cast<String>(),
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
        isFavorite: true, // Since this is from favorites
        // Initialize complex objects with default values to prevent null references
        user: item.user != null
            ? UserModel(
                id: item.user!.id?.toString(),
                name: item.user!.name,
                phoneNumber: item.user!.phoneNumber,
                email: item.user!.email,
              )
            : UserModel.initValues(),
        section: SectionItemModel.initValues(),
        category: CategoryItem.initValues(),
        brand: BrandItem.initValues(),
        subcategory: SwapSubCategory.initValues(),
      );

      // Set additional properties that are not in constructor
      trendDealsItem.countrySwap = item.item?.countrySwap;
      trendDealsItem.citySwap = item.item?.citySwap;
      trendDealsItem.offerCount =
          int.tryParse(item.item?.offersCount ?? '0') ?? 0;
      // Set latitude and longitude with actual values from favorite item
      trendDealsItem.latitude = item.item?.latitude ?? "0.0";
      trendDealsItem.longitude = item.item?.longitude ?? "0.0";

      Utils.openNavNewPage(
        context,
        SwapMoreInfoScreen(
          trendDealsItem: trendDealsItem,
        ),
      );
    }
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
    String imageUrl = '';
    if (item.item?.itemImg?.isNotEmpty == true) {
      imageUrl = item.item!.itemImg![0] ?? '';
    }

    return Container(
      color: Colors.blue,
      height: 100,
      width: 100,
      child: CachedImage(imageUrl: imageUrl),
    );
  }
}
