class ModelUnfreezCard {
  dynamic status;
  dynamic message;
  Data? data;

  ModelUnfreezCard({this.status, this.message, this.data});

  ModelUnfreezCard.fromJson(Map<String, dynamic> json) {
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
  String? cardId;

  Data({this.cardId});

  Data.fromJson(Map<String, dynamic> json) {
    cardId = json['card_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['card_id'] = this.cardId;
    return data;
  }
}
