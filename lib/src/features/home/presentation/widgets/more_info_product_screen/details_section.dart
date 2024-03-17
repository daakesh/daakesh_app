import 'package:flutter/material.dart';
import '../../../../../src.export.dart';

class DetailsSection extends StatelessWidget {
  final PassDataState state;
  const DetailsSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text('Details:',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 22.0),),
      const SizedBox(height: 21.0,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Brand:',style: easyTheme.textTheme.bodyLarge!.copyWith(color: ColorName.gray,fontSize: 18.0),),
          Text('${state.todayItem.first.brand!.brandName}',style: easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18.0),),
        ],
      ),
      const SizedBox(height: 13.0,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Model Name:',style: easyTheme.textTheme.bodyLarge!.copyWith(color: ColorName.gray,fontSize: 18.0),),
          Text('Mac Cosmetics',style: easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18.0),),
        ],
      ),
      const SizedBox(height: 13.0,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Category:',style: easyTheme.textTheme.bodyLarge!.copyWith(color: ColorName.gray,fontSize: 18.0),),
          Text('${state.todayItem.first.category!.name}',style: easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18.0),),
        ],
      ),
      const SizedBox(height: 13.0,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Year:',style: easyTheme.textTheme.bodyLarge!.copyWith(color: ColorName.gray,fontSize: 18.0),),
          Text('${state.todayItem.first.year}',style: easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18.0),),
        ],
      ),
      const SizedBox(height: 13.0,),
      Text('description:',style: easyTheme.textTheme.bodyLarge!.copyWith(color: ColorName.gray,fontSize: 18.0),),
      const SizedBox(height: 13.0,),
      Text('${state.todayItem.first.description}',style: easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18.0),),
      const SizedBox(height: 29.0,),

    ],);
  }
}
