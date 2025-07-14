import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class {{feature_name.pascalCase()}}Bloc extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Bloc() : super(const {{feature_name.pascalCase()}}State()) {
    on<{{feature_name.pascalCase()}}Event>(_{{feature_name}});
  }
  static {{feature_name.pascalCase()}}Bloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _{{feature_name}}({{feature_name.pascalCase()}}Event event, Emitter<{{feature_name.pascalCase()}}State> emit) async{
    emit(state.copyWith({{feature_name}}StateStatus:  {{feature_name.pascalCase()}}StateStatus.LOADING));
    final result = await getIt.get<{{feature_name.pascalCase()}}UseCases>().method();
    result.fold((l) {
      emit(state.copyWith({{feature_name}}StateStatus: {{feature_name.pascalCase()}}StateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      emit(state.copyWith({{feature_name}}StateStatus: {{feature_name.pascalCase()}}StateStatus.SUCCESS));
    });
  }
}
