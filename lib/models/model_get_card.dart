class ModelGetCard {
  bool? status;
  String? message;
  Data? data;

  ModelGetCard({this.status, this.message, this.data});

  ModelGetCard.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? cardId;
  int? cardNumber;
  Null? resposnse;
  int? expiryYear;
  int? expiryMonth;
  int? cvv;
  int? last4;
  String? cardCurrency;
  String? brand;
  String? cardName;

  Data(
      {this.id,
        this.cardId,
        this.cardNumber,
        this.resposnse,
        this.expiryYear,
        this.expiryMonth,
        this.cvv,
        this.last4,
        this.cardCurrency,
        this.brand,
        this.cardName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cardId = json['card_id'];
    cardNumber = json['card_number'];
    resposnse = json['resposnse'];
    expiryYear = json['expiry_year'];
    expiryMonth = json['expiry_month'];
    cvv = json['cvv'];
    last4 = json['last_4'];
    cardCurrency = json['card_currency'];
    brand = json['brand'];
    cardName = json['card_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['card_id'] = this.cardId;
    data['card_number'] = this.cardNumber;
    data['resposnse'] = this.resposnse;
    data['expiry_year'] = this.expiryYear;
    data['expiry_month'] = this.expiryMonth;
    data['cvv'] = this.cvv;
    data['last_4'] = this.last4;
    data['card_currency'] = this.cardCurrency;
    data['brand'] = this.brand;
    data['card_name'] = this.cardName;
    return data;
  }
}
