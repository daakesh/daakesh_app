import 'package:flutter/material.dart';

class {{feature_name.pascalCase()}}Screen extends StatelessWidget {
  const {{feature_name.pascalCase()}}Screen ({super.key});

  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      body: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text("{{feature_name.pascalCase()}} Screen"),
      ],
     ),
    );
  }
}

