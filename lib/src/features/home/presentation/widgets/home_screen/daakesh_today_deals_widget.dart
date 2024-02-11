// import 'package:flutter/material.dart';
// import '../../../../../src.export.dart';
//
// class DaakeshTodayDealsWidget extends StatelessWidget {
//   const DaakeshTodayDealsWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomScrollView(
//             physics: const BouncingScrollPhysics(),
//             shrinkWrap: true,
//             slivers: [
//               SliverToBoxAdapter(
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 20.0),
//                   child: Text(
//                     'Daakesh Today\'s Deals',
//                     style: easyTheme.textTheme.headlineMedium!.copyWith(
//                       fontSize: 18.0,
//                     ),
//                   ),
//                 ),
//               ),
//               SliverGrid(
//                 delegate: SliverChildBuilderDelegate((_, index) {
//                   return const TodayDealProduct();
//                   },
//                   childCount: 11,
//                 ),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 0.66,
//                     mainAxisSpacing: 9.0,
//                     crossAxisSpacing: 8.0
//                   )),
//
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
