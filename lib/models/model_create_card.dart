class ModelCreateCard {
  String? status;
  String? message;
  Data? data;

  ModelCreateCard({this.status, this.message, this.data});

  ModelCreateCard.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic cardId;
  dynamic currency;

  Data({this.cardId, this.currency});

  Data.fromJson(Map<String, dynamic> json) {
    cardId = json['card_id'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['card_id'] = this.cardId;
    data['currency'] = this.currency;
    return data;
  }
}
