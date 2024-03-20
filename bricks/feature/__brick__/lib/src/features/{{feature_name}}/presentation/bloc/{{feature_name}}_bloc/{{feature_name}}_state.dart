import 'package:equatable/equatable.dart';

enum {{feature_name.pascalCase()}}StateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension {{feature_name.pascalCase()}}StateStatusX on {{feature_name.pascalCase()}}StateStatus{
  bool get isInitial => this == {{feature_name.pascalCase()}}StateStatus.INITIAL;
  bool get isSuccess => this == {{feature_name.pascalCase()}}StateStatus.SUCCESS;
  bool get isError => this == {{feature_name.pascalCase()}}StateStatus.ERROR;
  bool get isLoading => this == {{feature_name.pascalCase()}}StateStatus.LOADING;
}

class {{feature_name.pascalCase()}}State extends Equatable {
  final {{feature_name.pascalCase()}}StateStatus {{feature_name}}StateStatus;


  const {{feature_name.pascalCase()}}State({
    this.{{feature_name}}StateStatus = {{feature_name.pascalCase()}}StateStatus.INITIAL,
  });

  {{feature_name.pascalCase()}}State copyWith({
     {{feature_name.pascalCase()}}StateStatus? {{feature_name}}StateStatus,

  }) {
    return {{feature_name.pascalCase()}}State(
      {{feature_name}}StateStatus: {{feature_name}}StateStatus ?? this.{{feature_name}}StateStatus,

    );
  }

  @override
  List<Object?> get props => [
    {{feature_name}}StateStatus,
  ];
}
