import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class SwapScreen extends StatefulWidget {
  const SwapScreen({super.key});

  @override
  State<SwapScreen> createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  final searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: SwapBloc.scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SwapAppBarWidget(searchController: searchController,),
        ];
      },
        body:BlocBuilder<SwapBloc,SwapState>(
            builder: (ctx,state){
           switch(state.swapScreenState){
             case SwapScreenState.SEARCH: return const SwapSearchScreen();
             case SwapScreenState.SUBCATEGORYRESULT: return const SwapResultsScreen();
             case SwapScreenState.CART: return const SwapCartScreen();
             case SwapScreenState.SECTIONS: return SwapSectionScreen(swapState: state,);
             case SwapScreenState.PRODUCTDETAILS: return const SwapMoreInfoProductScreen();
             default:return SwapDataWidget(state: state);
           }
        }),
      ),
    );
  }
}





