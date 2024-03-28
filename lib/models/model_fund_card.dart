class ModelFundCard {
  dynamic status;
  String? message;
  Data? data;

  ModelFundCard({this.status, this.message, this.data});

  ModelFundCard.fromJson(Map<String, dynamic> json) {
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
  String? transactionReference;

  Data({this.cardId, this.transactionReference});

  Data.fromJson(Map<String, dynamic> json) {
    cardId = json['card_id'];
    transactionReference = json['transaction_reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['card_id'] = this.cardId;
    data['transaction_reference'] = this.transactionReference;
    return data;
  }
}
