class SwapFilterDataModel {
  String? type;
  String? fromPrice;
  String? toPrice;
  String? country;
  String? city;
  String? rate;

  SwapFilterDataModel({
    this.type,
    this.fromPrice,
    this.toPrice,
    this.country,
    this.city,
    this.rate,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Type'] = 'Swap';
    data['FromPrice'] = '';
    data['ToPrice'] = '';
    data['Country'] = country ?? '';
    data['City'] = city ?? '';
    data['Rate'] = rate ?? '';
    data['StoreType'] = type ?? 'All';
    return data;
  }
}
