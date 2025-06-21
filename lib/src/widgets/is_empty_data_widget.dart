import 'package:flutter/material.dart';

class IsEmptyDataWidget extends StatelessWidget {
  final String name;
  const IsEmptyDataWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //const Icon(Icons.data_array),
        const SizedBox(height: 30),
        Text('No $name Items')
      ],
    );
  }
}
