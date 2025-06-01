import 'package:daakesh/src/features/favourite/data/datasourse/favourite_datasource.dart';
import 'package:daakesh/src/features/favourite/domin/repositories/favourite_repository.dart';

import 'package:daakesh/src/src.export.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

@LazySingleton(as: FavouriteRepository)
class FavouriteRepositoryImpl implements FavouriteRepository {
  @override
  Future<Either<Failure, ValidResponse>> addFavouriteItem(
      String userId, int itemId) async {
    return await getIt
        .get<FavouriteDataSource>()
        .addFavouriteItem(userId, itemId);
  }

  @override
  Future<Either<Failure, ValidResponse>> getFavouriteByID() async {
    return await getIt.get<FavouriteDataSource>().getFavouriteByID();
  }

  @override
  Future<Either<Failure, ValidResponse>> removeFavouriteItem(int itemId) async {
    return await getIt.get<FavouriteDataSource>().removeFavouriteItem(itemId);
  }
}
