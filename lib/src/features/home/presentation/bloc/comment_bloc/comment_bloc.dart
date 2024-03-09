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
  static CommentBloc get get => BlocProvider.of(navigatorKey.currentState!.context);

  FutureOr<void> _addComment(AddCommentEvent event, Emitter<CommentState> emit)async {
    int userId = event.userId;
    int itemId = event.itemId;
    String commentDesc = event.commentDesc;
    emit(state.copyWith(commentStateStatus:CommentStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().addComment(userId, itemId, commentDesc);
    result.fold((l) {
      emit(state.copyWith(commentStateStatus: CommentStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(commentStateStatus: CommentStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _getCommentsByItem(GetCommentByItemEvent event, Emitter<CommentState> emit)async {
    int itemID = event.itemId;
    emit(state.copyWith(commentStateStatus:CommentStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getCommentsByItem(itemID);
    result.fold((l) {
      emit(state.copyWith(commentStateStatus: CommentStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(commentStateStatus: CommentStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _removeComments(RemoveCommentsEvent event, Emitter<CommentState> emit)async {
    int id = event.id;
    emit(state.copyWith(commentStateStatus:CommentStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().removeComments(id);
    result.fold((l) {
      emit(state.copyWith(commentStateStatus: CommentStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(commentStateStatus: CommentStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _editComments(EditCommentEvent event, Emitter<CommentState> emit)async {
    int id = event.id;
    String commentDesc = event.commentDesc;
    emit(state.copyWith(commentStateStatus:CommentStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().editComments(id, commentDesc);
    result.fold((l) {
      emit(state.copyWith(commentStateStatus: CommentStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(commentStateStatus: CommentStateStatus.SUCCESS));
    });
  }

}