import 'package:flutter/material.dart';

@immutable
sealed class FavouriteState {}

class FavouriteInitialState extends FavouriteState {}

class FavouriteLoadingState extends FavouriteState {}

class FavouriteLoadedState extends FavouriteState {}

class FavouriteErrorState extends FavouriteState {
  final String message;
  FavouriteErrorState({required this.message});
}

class FavouriteLoadingMoreState extends FavouriteState {}

class FavouriteNullState extends FavouriteState {}

class FavouriteItemChangeState extends FavouriteState {}

class FavouriteTabBarChangedState extends FavouriteState {}

class FavouriteListTypeChangedState extends FavouriteState {}
