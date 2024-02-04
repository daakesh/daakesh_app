import 'package:daakesh/src/features/authentication/data/data.export.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/injection/inj.dart';
import '../../../../services/services.export.dart';
import '../../../../src.export.dart';
import '../../domain/domain.export.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, ValidResponse>> onLogin() async {
    return await getIt.get<AuthDatasource>().onLogin();
  }
}