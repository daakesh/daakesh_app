import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

MultiBlocProvider listOfBlocProviders({Widget? child}) {
  return MultiBlocProvider(
    providers: const [
      //BlocProvider<AuthBloc>(create: (context) => di.sl<AuthBloc>()),

    ],
    child: child!,
  );
}
