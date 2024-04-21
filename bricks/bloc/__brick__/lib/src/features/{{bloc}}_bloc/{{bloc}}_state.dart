import 'package:equatable/equatable.dart';

enum {{bloc.pascalCase()}}StateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension {{bloc.pascalCase()}}StateStatusX on {{bloc.pascalCase()}}StateStatus{
  bool get isInitial => this == {{bloc.pascalCase()}}StateStatus.INITIAL;
  bool get isSuccess => this == {{bloc.pascalCase()}}StateStatus.SUCCESS;
  bool get isError => this == {{bloc.pascalCase()}}StateStatus.ERROR;
  bool get isLoading => this == {{bloc.pascalCase()}}StateStatus.LOADING;
}

class {{bloc.pascalCase()}}State extends Equatable {
  final {{bloc.pascalCase()}}StateStatus {{bloc}}StateStatus;


  const {{bloc.pascalCase()}}State({
    this.{{bloc}}StateStatus = {{bloc.pascalCase()}}StateStatus.INITIAL,
  });

  {{bloc.pascalCase()}}State copyWith({
     {{bloc.pascalCase()}}StateStatus? {{bloc}}StateStatus,

  }) {
    return {{bloc.pascalCase()}}State(
      {{bloc}}StateStatus: {{bloc}}StateStatus ?? this.{{bloc}}StateStatus,

    );
  }

  @override
  List<Object?> get props => [
    {{bloc}}StateStatus,
  ];
}
