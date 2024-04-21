class FilterDataModel {
  String? type;
  String? fromPrice;
  String? toPrice;
  String? country;
  String? city;
  String? rate;

  FilterDataModel({
    this.type,
    this.fromPrice,
    this.toPrice,
    this.country,
    this.city,
    this.rate,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Type'] = 'Sell';
    data['FromPrice'] = fromPrice ?? '';
    data['ToPrice'] = toPrice ?? '';
    data['Country'] = country ?? '';
    data['City'] = city ?? '';
    data['Rate'] = rate ?? '';
    data['StoreType'] = type ?? 'All';
    return data;
  }
}
