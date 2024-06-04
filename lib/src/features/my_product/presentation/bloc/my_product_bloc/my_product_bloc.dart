import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class MyProBloc extends Bloc<MyProEvent, MyProState> {
  MyProBloc() : super(const MyProState()) {
    on<GetMyProductEvent>(_getMyProduct);
    on<AddProCommentEvent>(_addProComment);
    on<GetProCommentCountEvent>(_getProCommentCount);
    on<GetProCommentByItemEvent>(_getProCommentByItem);
    on<GetProOverAllRateItemsEvent>(_getProOverAllRateItems);
    on<EmptyProDataEvent>(_emptyProDataEvent);
    on<ClearDataEvent>(_clearData);
    on<RemoveItemEvent>(_removeItem);
  }
  static MyProBloc get get => BlocProvider.of(Utils.currentContext);
  FutureOr<void> _getMyProduct(
      GetMyProductEvent event, Emitter<MyProState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        myProStateStatus: MyProStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
        myProStateStatus: MyProStateStatus.LOADING,
        myProductListData: [],
        currentPage: 1,
      ));
    }

    final result = await getIt
        .get<MyProductUseCases>()
        .getMyProduct(state.currentPage, UserType.SELL.name);

    result.fold((l) {
      emit(state.copyWith(myProStateStatus: MyProStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      MyProductModel myProductModel = MyProductModel.fromJson(r.data);
      int lastPage = myProductModel.data!.lastPage!;
      List<MyProductItem> newResultList =
          myProductModel.data!.myProductListData!.toList();
      List<MyProductItem> myProductListData = state.myProductListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          myProStateStatus: MyProStateStatus.NULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }
      myProductListData.addAll(newResultList);
      emit(state.copyWith(
        myProStateStatus: MyProStateStatus.SUCCESS,
        myProductListData: myProductListData,
        isMoreData: lastPage == state.currentPage,
      ));
    });
  }

  FutureOr<void> _addProComment(
      AddProCommentEvent event, Emitter<MyProState> emit) async {
    String userId = event.userId;
    int itemId = event.itemId;
    String commentDesc = event.commentDesc;
    int catID = event.catID;
    int subID = event.subID;
    double rateValue = event.rateValue;
    emit(state.copyWith(myProStateStatus: MyProStateStatus.LOADING));
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
      emit(state.copyWith(myProStateStatus: MyProStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      ProgressCircleDialog.dismiss();
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      MyProBloc.get.add(GetProOverAllRateItemsEvent(itemID: itemId));
      MyProBloc.get.add(GetProCommentByItemEvent());
      //CommentRateModelItem commentRateModel =CommentRateModelItem.fromJson(r.data['data']);
      //state.commentList.insert(0, commentRateModel);
      emit(state.copyWith(
          myProStateStatus: MyProStateStatus.SUCCESS,
          commentList: state.commentList,
          commentCount: state.commentCount + 1));
    });
  }

  FutureOr<void> _getProCommentCount(
      GetProCommentCountEvent event, Emitter<MyProState> emit) async {
    int itemId = event.itemId;
    emit(state.copyWith(myProStateStatus: MyProStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getCommentCountItem(itemId);
    result.fold((l) {
      emit(state.copyWith(myProStateStatus: MyProStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      int commentCount = r.data['data']['comment_count'];
      emit(state.copyWith(
          myProStateStatus: MyProStateStatus.SUCCESS,
          commentCount: commentCount));
    });
  }

  FutureOr<void> _getProCommentByItem(
      GetProCommentByItemEvent event, Emitter<MyProState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        commentCurrentPage: state.commentCurrentPage + 1,
        myProStateStatus: MyProStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
        myProStateStatus: MyProStateStatus.LOADING,
        itemId: event.itemId,
        commentList: [],
        isCommentsMoreData: true,
        commentCurrentPage: 1,
      ));
    }

    final result = await getIt
        .get<HomeUseCases>()
        .getCommentsByItem(state.itemId, state.commentCurrentPage);

    result.fold((l) {
      emit(state.copyWith(myProStateStatus: MyProStateStatus.ERROR));
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
          myProStateStatus: MyProStateStatus.NULL,
          isCommentsMoreData: lastPage == state.commentCurrentPage,
        ));
        return;
      }
      myProductListData.addAll(newResultList);
      emit(state.copyWith(
        myProStateStatus: MyProStateStatus.SUCCESS,
        commentList: myProductListData,
        isCommentsMoreData: lastPage == state.commentCurrentPage,
      ));
    });
  }

  FutureOr<void> _getProOverAllRateItems(
      GetProOverAllRateItemsEvent event, Emitter<MyProState> emit) async {
    int itemID = event.itemID;
    emit(state.copyWith(myProStateStatus: MyProStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getOverAllRateItem(itemID);
    result.fold((l) {
      emit(state.copyWith(myProStateStatus: MyProStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      OverAllRateModel overAllRateModel = OverAllRateModel.fromJson(r.data);
      emit(state.copyWith(
          myProStateStatus: MyProStateStatus.SUCCESS,
          rateAverage: overAllRateModel.data!.average));
    });
  }

  FutureOr<void> _emptyProDataEvent(
      EmptyProDataEvent event, Emitter<MyProState> emit) {
    emit(state.copyWith(rateAverage: 0.0, commentCount: 0));
  }

  FutureOr<void> _clearData(ClearDataEvent event, Emitter<MyProState> emit) {
    emit(state.copyWith(myProductListData: [], isMoreData: true));
  }

  FutureOr<void> _removeItem(
      RemoveItemEvent event, Emitter<MyProState> emit) async {
    ProgressCircleDialog.show();
    final result = await getIt.get<MyProductUseCases>().removeProduct(event.id);
    result.fold((l) {
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      ProgressCircleDialog.dismiss();
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      ShowToastSnackBar.showSnackBars(message: r.data['data'].toString());
      List<MyProductItem> cartItemsList = state.myProductListData.toList();
      cartItemsList.removeWhere((item) => event.id == item.id);
      emit(state.copyWith(myProductListData: []));
      emit(state.copyWith(myProductListData: cartItemsList));
    });
  }
}
