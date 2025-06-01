import 'package:daakesh/src/features/favourite/data/datasourse/favourite_datasource.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../src.export.dart';

@LazySingleton(as: FavouriteDataSource)
class RemoteFavouriteDataSource extends FavouriteDataSource {
  @override
  Future<Either<Failure, ValidResponse>> addFavouriteItem(
      String userId, int itemId) async {
    final result = await getIt
        .get<NetworkService>()
        .post(path: 'DaakeshServices/api/favorite/addFavorite', body: {
      "userID": userId.toString(),
      "itemID": itemId.toString(),
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getFavouriteByID() async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/favorite/getFavoriteForUser',
        params: {"userID": ValueConstants.userId});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> removeFavouriteItem(int itemId) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/favorite/removeFavorite',
        params: {"id": "$itemId"});
    return result;
  }
}
