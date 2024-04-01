import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapCommentBloc extends Bloc<SwapCommentEvent, SwapCommentState> {
  SwapCommentBloc() : super(const SwapCommentState()) {
    on<SwapAddCommentEvent>(_addComment);
    on<SwapGetCommentByItemEvent>(_getCommentsByItem);
    on<SwapRemoveCommentsEvent>(_removeComments);
    on<SwapEditCommentEvent>(_editComments);
  }
  static SwapCommentBloc get get =>
      BlocProvider.of(Utils.navigatorKey.currentState!.context);

  FutureOr<void> _addComment(
      SwapAddCommentEvent event, Emitter<SwapCommentState> emit) async {
    int userId = event.userId;
    int itemId = event.itemId;
    String commentDesc = event.commentDesc;
    emit(
        state.copyWith(swapCommentStateStatus: SwapCommentStateStatus.LOADING));
    final result =
        await getIt.get<SwapUseCases>().addComment(userId, itemId, commentDesc);
    result.fold((l) {
      emit(
          state.copyWith(swapCommentStateStatus: SwapCommentStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(
          swapCommentStateStatus: SwapCommentStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _getCommentsByItem(
      SwapGetCommentByItemEvent event, Emitter<SwapCommentState> emit) async {
    int itemID = event.itemId;
    emit(
        state.copyWith(swapCommentStateStatus: SwapCommentStateStatus.LOADING));
    final result = await getIt.get<SwapUseCases>().getCommentsByItem(itemID);
    result.fold((l) {
      emit(
          state.copyWith(swapCommentStateStatus: SwapCommentStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(
          swapCommentStateStatus: SwapCommentStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _removeComments(
      SwapRemoveCommentsEvent event, Emitter<SwapCommentState> emit) async {
    int id = event.id;
    emit(
        state.copyWith(swapCommentStateStatus: SwapCommentStateStatus.LOADING));
    final result = await getIt.get<SwapUseCases>().removeComments(id);
    result.fold((l) {
      emit(
          state.copyWith(swapCommentStateStatus: SwapCommentStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(
          swapCommentStateStatus: SwapCommentStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _editComments(
      SwapEditCommentEvent event, Emitter<SwapCommentState> emit) async {
    int id = event.id;
    String commentDesc = event.commentDesc;
    emit(
        state.copyWith(swapCommentStateStatus: SwapCommentStateStatus.LOADING));
    final result =
        await getIt.get<SwapUseCases>().editComments(id, commentDesc);
    result.fold((l) {
      emit(
          state.copyWith(swapCommentStateStatus: SwapCommentStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(
          swapCommentStateStatus: SwapCommentStateStatus.SUCCESS));
    });
  }
}
