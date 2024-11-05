import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(const CommentState()) {
    on<AddCommentEvent>(_addComment);
    on<GetCommentByItemEvent>(_getCommentsByItem);
    on<RemoveCommentsEvent>(_removeComments);
    on<GetCommentCountEvent>(_getCommentCount);
    on<EmptyCommentDataEvent>(_emptyCommentData);
  }
  static CommentBloc get get =>
      BlocProvider.of(Utils.navigatorKey.currentState!.context);

  FutureOr<void> _addComment(
      AddCommentEvent event, Emitter<CommentState> emit) async {
    String userId = event.userId;
    int itemId = event.itemId;
    String commentDesc = event.commentDesc;
    int catID = event.catID;
    int subID = event.subID;
    double rateValue = event.rateValue;
    emit(state.copyWith(commentStateStatus: CommentStateStatus.LOADING));
    ProgressCircleDialog.show();

    final result = await getIt.get<HomeUseCases>().addComment(
          userId,
          itemId,
          commentDesc,
          catID,
          subID,
          rateValue,
        );
    result.fold((l) {
      ProgressCircleDialog.dismiss();
      emit(state.copyWith(commentStateStatus: CommentStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      ProgressCircleDialog.dismiss();
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      RateBloc.get.add(GetOverAllRateItemsEvent(itemID: itemId));
      CommentBloc.get.add(GetCommentByItemEvent());
      int commentCount = state.commentCount + 1;
      TodayDealsBloc.get.add(UpdateTodayDealsItem(
          id: itemId, avgRating: rateValue, rateCount: commentCount));
      OfferDealsBloc.get.add(UpdateTodayDealsItemEvent(
          id: itemId, avgRating: rateValue, rateCount: commentCount));

      emit(state.copyWith(
          commentStateStatus: CommentStateStatus.SUCCESS,
          commentList: state.commentList,
          commentCount: commentCount));
    });
  }

  FutureOr<void> _getCommentsByItem(
      GetCommentByItemEvent event, Emitter<CommentState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        commentStateStatus: CommentStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
        commentStateStatus: CommentStateStatus.LOADING,
        itemId: event.itemId,
        commentList: [],
        isMoreData: true,
        currentPage: 1,
      ));
    }

    final result = await getIt
        .get<HomeUseCases>()
        .getCommentsByItem(state.itemId, state.currentPage);

    result.fold((l) {
      emit(state.copyWith(commentStateStatus: CommentStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      CommentRateModel commentRateModel = CommentRateModel.fromJson(r.data);
      int lastPage = commentRateModel.data!.lastPage!;
      List<CommentRateModelItem> newResultList =
          commentRateModel.data!.commentRateModelItem!.toList();
      List<CommentRateModelItem> myProductListData = state.commentList.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          commentStateStatus: CommentStateStatus.NULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }
      myProductListData.addAll(newResultList);
      emit(state.copyWith(
        commentStateStatus: CommentStateStatus.SUCCESS,
        commentList: myProductListData,
        isMoreData: lastPage == state.currentPage,
      ));
    });
  }

  FutureOr<void> _removeComments(
      RemoveCommentsEvent event, Emitter<CommentState> emit) async {
    int id = event.id;
    emit(state.copyWith(commentStateStatus: CommentStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().removeComments(id);
    result.fold((l) {
      emit(state.copyWith(commentStateStatus: CommentStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(commentStateStatus: CommentStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _getCommentCount(
      GetCommentCountEvent event, Emitter<CommentState> emit) async {
    int itemId = event.itemId;
    emit(state.copyWith(commentStateStatus: CommentStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getCommentCountItem(itemId);
    result.fold((l) {
      emit(state.copyWith(commentStateStatus: CommentStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      int commentCount = r.data['data']['comment_count'];
      emit(state.copyWith(
          commentStateStatus: CommentStateStatus.SUCCESS,
          commentCount: commentCount));
    });
  }

  FutureOr<void> _emptyCommentData(
      EmptyCommentDataEvent event, Emitter<CommentState> emit) {
    emit(state.copyWith(commentCount: 0));
  }
}
