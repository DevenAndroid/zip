class ModelConversion {
  bool? success;
  String? message;
  Data? data;

  ModelConversion({this.success, this.message, this.data});

  ModelConversion.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sourceCurrency;
  String? destinationCurrency;
  int? sourceAmount;
  double? destinationAmount;
  String? action;
  String? transactionType;
  double? fee;
  int? initialAmount;
  double? quotedAmount;
  double? rate;
  int? amountToCharge;
  double? amountToReceive;
  String? reference;
  String? expireAt;
  String? settlementDate;

  Data(
      {this.sourceCurrency,
        this.destinationCurrency,
        this.sourceAmount,
        this.destinationAmount,
        this.action,
        this.transactionType,
        this.fee,
        this.initialAmount,
        this.quotedAmount,
        this.rate,
        this.amountToCharge,
        this.amountToReceive,
        this.reference,
        this.expireAt,
        this.settlementDate});

  Data.fromJson(Map<String, dynamic> json) {
    sourceCurrency = json['sourceCurrency'];
    destinationCurrency = json['destinationCurrency'];
    sourceAmount = json['sourceAmount'];
    destinationAmount = json['destinationAmount'];
    action = json['action'];
    transactionType = json['transactionType'];
    fee = json['fee'];
    initialAmount = json['initialAmount'];
    quotedAmount = json['quotedAmount'];
    rate = json['rate'];
    amountToCharge = json['amountToCharge'];
    amountToReceive = json['amountToReceive'];
    reference = json['reference'];
    expireAt = json['expireAt'];
    settlementDate = json['settlementDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sourceCurrency'] = this.sourceCurrency;
    data['destinationCurrency'] = this.destinationCurrency;
    data['sourceAmount'] = this.sourceAmount;
    data['destinationAmount'] = this.destinationAmount;
    data['action'] = this.action;
    data['transactionType'] = this.transactionType;
    data['fee'] = this.fee;
    data['initialAmount'] = this.initialAmount;
    data['quotedAmount'] = this.quotedAmount;
    data['rate'] = this.rate;
    data['amountToCharge'] = this.amountToCharge;
    data['amountToReceive'] = this.amountToReceive;
    data['reference'] = this.reference;
    data['expireAt'] = this.expireAt;
    data['settlementDate'] = this.settlementDate;
    return data;
  }
}
