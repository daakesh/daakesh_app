import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: HomeBloc.scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          HomeAppBarWidget(searchController: searchController,),
        ];
      },
        body:BlocBuilder<HomeBloc,HomeState>(
            builder: (ctx,state){
           switch(state.homeScreenState){
             case HomeScreenState.SEARCH: return const SearchScreen();
             case HomeScreenState.SUBCATEGORYRESULT: return const ResultsScreen();
             case HomeScreenState.CART: return const CartScreen();
             case HomeScreenState.PRODUCTDETAILS: return const MoreInfoProductScreen();
             case HomeScreenState.SECTIONS: return SectionScreen(homeState: state,);
             case HomeScreenState.SHOPBYBRANDS: return const ShopByBrandsScreen();
             case HomeScreenState.HOMEMADE: return const HomemadeScreen();
             default:return HomeDataWidget(state: state);
           }
        }),
      ),
    );
  }
}





