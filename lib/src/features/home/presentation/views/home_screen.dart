import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getHomeScreenData();
  }

  void getHomeScreenData() => HomeBloc.get.add(GetHomeScreenData());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const HomeAppBarWidget(),
          ];
        },
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (ctx, state) {
            return RefreshIndicatorWidget(
              onRefresh: () => getHomeScreenData(),
              child: HomeDataWidget(state: state),
            );
          },
        ),
      ),
    );
  }
}
