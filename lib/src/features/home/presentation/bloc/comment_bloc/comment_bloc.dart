import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(const CommentState()) {
    on<AddCommentEvent>(_addComment);
    on<GetCommentByItemEvent>(_getCommentsByItem);
    on<RemoveCommentsEvent>(_removeComments);
    on<EditCommentEvent>(_editComments);
  }
  static CommentBloc get get =>
      BlocProvider.of(Utils.navigatorKey.currentState!.context);

  FutureOr<void> _addComment(
      AddCommentEvent event, Emitter<CommentState> emit) async {
    String userId = event.userId;
    int itemId = event.itemId;
    String commentDesc = event.commentDesc;
    emit(state.copyWith(commentStateStatus: CommentStateStatus.LOADING));
    ProgressCircleDialog.show();

    final result =
        await getIt.get<HomeUseCases>().addComment(userId, itemId, commentDesc);
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
      CommentRateModelItem commentRateModel =
          CommentRateModelItem.fromJson(r.data['data']);
      state.commentList.insert(0, commentRateModel);
      emit(state.copyWith(
          commentStateStatus: CommentStateStatus.SUCCESS,
          commentList: state.commentList));
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

  FutureOr<void> _editComments(
      EditCommentEvent event, Emitter<CommentState> emit) async {
    int id = event.id;
    String commentDesc = event.commentDesc;
    emit(state.copyWith(commentStateStatus: CommentStateStatus.LOADING));
    final result =
        await getIt.get<HomeUseCases>().editComments(id, commentDesc);
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
}
