import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: MyOrderRepository)
class MyOrderRepositoryImpl implements MyOrderRepository {
  @override
  Future<Either<Failure, ValidResponse>> updateUserData() async {
    return await getIt.get<MyOrderDatasource>().updateUserData();
  }




}