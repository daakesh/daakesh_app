import 'package:equatable/equatable.dart';
import '../../../../../src.export.dart';

enum SellerInfoStateStatus { INITIAL, LOADING, SUCCESS, ERROR,NULL }

extension SellerInfoStateStatusX on SellerInfoStateStatus {
  bool get isInitial => this == SellerInfoStateStatus.INITIAL;
  bool get isSuccess => this == SellerInfoStateStatus.SUCCESS;
  bool get isError => this == SellerInfoStateStatus.ERROR;
  bool get isLoading => this == SellerInfoStateStatus.LOADING;
  bool get isNull => this == SellerInfoStateStatus.NULL;
}

class SellerInfoState extends Equatable {
  final SellerInfoStateStatus sellerInfoStateStatus;
  final List<SellerInfoData> sellerInfoModel;

  const SellerInfoState({
    this.sellerInfoStateStatus = SellerInfoStateStatus.INITIAL,
    this.sellerInfoModel = const[],
  });

  SellerInfoState copyWith({
    SellerInfoStateStatus? sellerInfoStateStatus,
    List<SellerInfoData>? sellerInfoModel,
  }) {
    return SellerInfoState(
      sellerInfoStateStatus: sellerInfoStateStatus ?? this.sellerInfoStateStatus,
      sellerInfoModel: sellerInfoModel ?? this.sellerInfoModel,
    );
  }

  @override
  List<Object?> get props => [
    sellerInfoStateStatus,
    sellerInfoModel,
  ];
}
