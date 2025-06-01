import 'package:daakesh/src/src.export.dart';
import 'package:dartz/dartz.dart';

abstract class FavouriteDataSource {
  Future<Either<Failure, ValidResponse>> getFavouriteByID();

  Future<Either<Failure, ValidResponse>> removeFavouriteItem(int itemId);
  Future<Either<Failure, ValidResponse>> addFavouriteItem(
      String userId, int itemId);
}
