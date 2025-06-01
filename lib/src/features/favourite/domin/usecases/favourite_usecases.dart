import 'package:daakesh/src/features/favourite/domin/repositories/favourite_repository.dart';
import 'package:daakesh/src/src.export.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class FavouriteUseCases {
  Future<Either<Failure, ValidResponse>> getFavouriteByID();

  Future<Either<Failure, ValidResponse>> removeFavouriteItem(int itemId);
  Future<Either<Failure, ValidResponse>> addFavouriteItem(
      String userId, int itemId);
}

@dev
@LazySingleton(as: FavouriteUseCases)
class FavouriteUseCasesImpl implements FavouriteUseCases {
  @override
  Future<Either<Failure, ValidResponse>> getFavouriteByID() async {
    return await getIt.get<FavouriteRepository>().getFavouriteByID();
  }

  @override
  Future<Either<Failure, ValidResponse>> addFavouriteItem(
      String userId, int itemId) async {
    return await getIt
        .get<FavouriteRepository>()
        .addFavouriteItem(userId, itemId);
  }

  @override
  Future<Either<Failure, ValidResponse>> removeFavouriteItem(int itemId) async {
    return await getIt.get<FavouriteRepository>().removeFavouriteItem(itemId);
  }
}
