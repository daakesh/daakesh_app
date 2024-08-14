import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class SwapScreen extends StatefulWidget {
  const SwapScreen({super.key});

  @override
  State<SwapScreen> createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  @override
  void initState() {
    super.initState();
    getSwapScreenData();
  }

  void getSwapScreenData() {
    SwapAdvBloc.get.add(SwapGetAdvertisementDataEvent());
    SwapBloc.get.add(SwapGetSectionDataEvent());
    TrendDealsBloc.get.add(GetTrendDealsDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [const SwapAppBarWidget()];
        },
        body: BlocBuilder<SwapBloc, SwapState>(builder: (ctx, state) {
          return RefreshIndicatorWidget(
            onRefresh: () => getSwapScreenData(),
            child: SwapDataWidget(state: state),
          );
        }),
      ),
    );
  }
}
