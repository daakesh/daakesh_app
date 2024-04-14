import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetSectionDataEvent>(_getSectionData);
  }
  static HomeBloc get get => BlocProvider.of(Utils.currentContext);

  ///Event to swap between home screen states with widget like:
  /// [HomeDataWidget],[SearchScreen],[ResultsScreen],[CartScreen],[MoreInfoProductScreen]

  ///Event to get Categories data at [HomeDataWidget]
  FutureOr<void> _getSectionData(
      GetSectionDataEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(homeStateStatus: HomeStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getSectionData();
    result.fold((l) {
      emit(state.copyWith(homeStateStatus: HomeStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      SectionModel sectionModel = SectionModel.fromJson(r.data);
      List<SectionItemModel> sectionListData =
          sectionModel.data!.data!.toList();
      emit(state.copyWith(
          homeStateStatus: HomeStateStatus.SUCCESS,
          sectionListData: sectionListData));
    });
  }
}
