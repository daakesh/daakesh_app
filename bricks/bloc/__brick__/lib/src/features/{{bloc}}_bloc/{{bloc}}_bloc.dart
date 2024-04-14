import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class {{bloc.pascalCase()}}Bloc extends Bloc<{{bloc.pascalCase()}}Event, {{bloc.pascalCase()}}State> {
  {{bloc.pascalCase()}}Bloc() : super(const {{bloc.pascalCase()}}State()) {
    on<{{bloc.pascalCase()}}Event>(_{{bloc}});
  }
  static {{bloc.pascalCase()}}Bloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _{{bloc}}({{bloc.pascalCase()}}Event event, Emitter<{{bloc.pascalCase()}}State> emit) async{
    emit(state.copyWith({{bloc}}StateStatus:  {{bloc.pascalCase()}}StateStatus.LOADING));
    final result = await getIt.get<{{bloc.pascalCase()}}UseCases>().method();
    result.fold((l) {
      emit(state.copyWith({{bloc}}StateStatus: {{bloc.pascalCase()}}StateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith({{bloc}}StateStatus: {{bloc.pascalCase()}}StateStatus.SUCCESS));
    });
  }
}
