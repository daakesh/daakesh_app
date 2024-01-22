import 'package:daakesh/src/core/injection/inj.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies({required Environment env}) => getIt.init(environment: env.name);