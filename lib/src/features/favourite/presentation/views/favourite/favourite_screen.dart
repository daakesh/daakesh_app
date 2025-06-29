import 'package:daakesh/src/features/favourite/presentation/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:daakesh/src/features/favourite/presentation/bloc/favourite_bloc/favourite_event.dart';
import 'package:daakesh/src/features/favourite/presentation/bloc/favourite_bloc/favourite_state.dart';
import 'package:daakesh/src/features/favourite/presentation/widgets/favourite_item_widgrt.dart';
import 'package:daakesh/src/src.export.dart';
import 'package:daakesh/src/widgets/custom_message_dialog.dart';
import 'package:daakesh/src/widgets/is_empty_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.whiteSmoke,
      body: BlocProvider(
        create: (_) => FavouriteBloc(),
        child: _FavouriteScreenContent(),
      ),
    );
  }
}

class _FavouriteScreenContent extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  _FavouriteScreenContent();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FavouriteBloc>();

    return Column(
      children: [
        const HeaderWidget(),
        const SizedBox(height: 17),
        getTabbar(bloc, context),
        const SizedBox(height: 12),
        buildSearchField(bloc),
        const SizedBox(height: 12),
        Expanded(
          child: BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              if (state is FavouriteLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              if (bloc.favouriteItems.isEmpty) {
                return const IsEmptyDataWidget(name: 'Shop Favourite');
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: bloc.favouriteItems.length,
                itemBuilder: (context, index) {
                  final item = bloc.favouriteItems[index];
                  return FavouriteItemWidget(
                    item: item,
                    onPressedDelete: () async {
                      final result = await showMessageDialog(
                          context: context,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Are you sure to delete this item ? '),
                              const SizedBox(height: 50),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: TextButtonWidget(
                                          text: 'YES',
                                          onPressed: () {
                                            Navigator.pop(context, true);
                                          })),
                                  const SizedBox(width: 30),
                                  Expanded(
                                      child: TextButtonWidget(
                                          text: 'NO',
                                          onPressed: () {
                                            Navigator.pop(context, false);
                                          })),
                                ],
                              ),
                            ],
                          ));

                      if (result == true) {
                        bloc.add(RemoveFavouriteEvent(
                          itemId: item.id!,
                          actualItemId: item.item?.id,
                        ));
                      }
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildSearchField(FavouriteBloc bloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search favourites...',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          bloc.add(SearchFavouriteItemsEvent(value));
        },
      ),
    );
  }

  Widget getTabbar(FavouriteBloc bloc, BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder: (context, state) {
        final isShopTab = bloc.currentTab == FavouriteTapBarENUM.SELL;

        return Container(
          width: double.infinity,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 13),
          decoration: const BoxDecoration(
            color: ColorName.paleGray,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            children: [
              // SELL
              Expanded(
                child: InkWell(
                  onTap: () {
                    bloc.add(SwapTabBarFavouriteTypeEvent(
                        favouriteTapBarENUM: FavouriteTapBarENUM.SELL));
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isShopTab ? ColorName.amber : ColorName.paleGray,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Center(
                      child: Text(
                        context.locale.shop_tab_bar,
                        style: context.easyTheme.textTheme.headlineMedium!
                            .copyWith(
                          fontSize: 18,
                          color:
                              isShopTab ? ColorName.white : ColorName.blueGray,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // SWAP
              Expanded(
                child: InkWell(
                  onTap: () {
                    bloc.add(SwapTabBarFavouriteTypeEvent(
                        favouriteTapBarENUM: FavouriteTapBarENUM.SWAP));
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: !isShopTab ? ColorName.amber : ColorName.paleGray,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Center(
                      child: Text(
                        context.locale.swap_tab_bar,
                        style: context.easyTheme.textTheme.headlineMedium!
                            .copyWith(
                          fontSize: 18,
                          color:
                              !isShopTab ? ColorName.white : ColorName.blueGray,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
