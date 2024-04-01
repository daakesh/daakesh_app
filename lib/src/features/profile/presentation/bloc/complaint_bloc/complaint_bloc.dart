import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class ComplaintBloc extends Bloc<ComplaintEvent, ComplaintState> {
  ComplaintBloc() : super(const ComplaintState()) {
    on<GetAllComplaintEvent>(_getAllComplaint);
    on<AddComplaintEvent>(_addComplaint);
  }
  static ComplaintBloc get get =>
      BlocProvider.of(Utils.navigatorKey.currentState!.context);

  FutureOr<void> _getAllComplaint(
      GetAllComplaintEvent event, Emitter<ComplaintState> emit) async {
    emit(state.copyWith(complaintStateStatus: ComplaintStateStatus.LOADING));
    final result = await getIt.get<ProfileUseCases>().getAllComplaints();
    result.fold((l) {
      emit(state.copyWith(complaintStateStatus: ComplaintStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(complaintStateStatus: ComplaintStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _addComplaint(
      AddComplaintEvent event, Emitter<ComplaintState> emit) async {
    emit(state.copyWith(complaintStateStatus: ComplaintStateStatus.LOADING));
    String complaintType = event.complaintType;
    String sellerName = event.sellerName;
    String subject = event.subject;
    String remark = event.remark;
    final result = await getIt
        .get<ProfileUseCases>()
        .addComplaints(complaintType, sellerName, subject, remark);
    result.fold((l) {
      emit(state.copyWith(complaintStateStatus: ComplaintStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(complaintStateStatus: ComplaintStateStatus.SUCCESS));
    });
  }
}
