import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SellerInfoBloc extends Bloc<SellerInfoEvent, SellerInfoState> {
  SellerInfoBloc() : super(const SellerInfoState()) {
    on<GetSellerInfoEvent>(_getSellerInfo);
    on<EditSellerInfoEvent>(_editSellerInfo);
  }
  static SellerInfoBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _getSellerInfo(
      GetSellerInfoEvent event, Emitter<SellerInfoState> emit) async {
    emit(state.copyWith(sellerInfoStateStatus: SellerInfoStateStatus.LOADING));
    final result = await getIt.get<MyProductUseCases>().getSellerInfo();
    result.fold(
      (l) {
        emit(
            state.copyWith(sellerInfoStateStatus: SellerInfoStateStatus.ERROR));
        ShowToastSnackBar.showCustomDialog(message: l.message.toString());
      },
      (r) {
        if (!r.status!) {
          ShowToastSnackBar.showCustomDialog(message: r.message.toString());
          return;
        }
        List<SellerInfoData> sellerInfoList = <SellerInfoData>[];
        SellerInfoModel sellerInfoModel =
            SellerInfoModel.fromJson(r.data as Map<String, dynamic>);
        SellerInfoData sellerInfoData = sellerInfoModel.data!;
        sellerInfoList.add(sellerInfoData);
        emit(state.copyWith(
            sellerInfoStateStatus: SellerInfoStateStatus.SUCCESS,
            sellerInfoModel: sellerInfoList));
      },
    );
  }

  FutureOr<void> _editSellerInfo(
      EditSellerInfoEvent event, Emitter<SellerInfoState> emit) async {
    ProgressCircleDialog.show();
    String phoneNumber = event.phoneNumber;
    String userName = event.userName;
    String whatsappNumber = event.whatsappNumber;

    emit(state.copyWith(sellerInfoStateStatus: SellerInfoStateStatus.LOADING));
    final result = await getIt
        .get<MyProductUseCases>()
        .updateSellerInfo(phoneNumber, userName, whatsappNumber);
    result.fold(
      (l) {
        ProgressCircleDialog.dismiss();
        emit(
            state.copyWith(sellerInfoStateStatus: SellerInfoStateStatus.ERROR));
        ShowToastSnackBar.showCustomDialog(message: l.message.toString());
      },
      (r) {
        if (!r.status!) {
          ProgressCircleDialog.dismiss();
          ShowToastSnackBar.showCustomDialog(message: r.message.toString());
          return;
        }
        ProgressCircleDialog.dismiss();
        List<SellerInfoData> sellerInfoList = <SellerInfoData>[];
        SellerInfoModel sellerInfoModel =
            SellerInfoModel.fromJson(r.data as Map<String, dynamic>);
        SellerInfoData sellerInfoData = sellerInfoModel.data!;
        sellerInfoList.add(sellerInfoData);
        emit(state.copyWith(
            sellerInfoStateStatus: SellerInfoStateStatus.SUCCESS,
            sellerInfoModel: sellerInfoList));
      },
    );
  }
}
