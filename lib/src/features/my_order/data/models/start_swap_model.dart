class StartSwapModel {
  int? sourceItem;
  int? offerItem;
  int? approved;
  String? sourceUser;
  String? offerUser;

  StartSwapModel({
    this.sourceItem,
    this.offerItem,
    this.approved,
    this.sourceUser,
    this.offerUser,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source_item'] = sourceItem.toString();
    data['offer_item'] = offerItem.toString();
    data['note'] = 'Your Comment';
    data['approved'] = approved.toString();
    data['source_user'] = sourceUser;
    data['offer_user'] = offerUser;
    return data;
  }
}
