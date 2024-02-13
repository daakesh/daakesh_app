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
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          AppBarWidget(searchController: searchController,),
        ];
      },
        body:BlocBuilder<HomeBloc,HomeState>(builder: (_,state){
         if(state.isSearchOn){
           return const SearchScreen();
         }else if(state.isShowSearchResult){
           return const ResultsScreen();
         }
         else if (state.isShowCart){
           return const CartScreen();
         }
         else if(state.isProductDetailsOn){
           return  MoreInfoProductScreen();
         }
         else{
           return  HomeDataWidget(scrollController: scrollController);
         }



        }),
      ),
    );
  }



}






