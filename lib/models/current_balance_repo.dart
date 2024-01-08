class CurrentBalanceModel {
  bool? status;
  String? message;
  Data? data;

  CurrentBalanceModel({this.status, this.message, this.data});

  CurrentBalanceModel.fromJson(Map<String, dynamic> json) {
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
  int? currentBalance;
  Fee? fee;

  Data({this.currentBalance, this.fee});

  Data.fromJson(Map<String, dynamic> json) {
    currentBalance = json['current_balance'];
    fee = json['fee'] != null ? new Fee.fromJson(json['fee']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_balance'] = this.currentBalance;
    if (this.fee != null) {
      data['fee'] = this.fee!.toJson();
    }
    return data;
  }
}

class Fee {
  int? payoutFee;
  int? cashoutFee;
  int? cashinFee;
  int? serviceFee;
  int? bridgeCardFee;

  Fee(
      {this.payoutFee,
        this.cashoutFee,
        this.cashinFee,
        this.serviceFee,
        this.bridgeCardFee});

  Fee.fromJson(Map<String, dynamic> json) {
    payoutFee = json['payout_fee'];
    cashoutFee = json['cashout_fee'];
    cashinFee = json['cashin_fee'];
    serviceFee = json['service_fee'];
    bridgeCardFee = json['bridgeCard_fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payout_fee'] = this.payoutFee;
    data['cashout_fee'] = this.cashoutFee;
    data['cashin_fee'] = this.cashinFee;
    data['service_fee'] = this.serviceFee;
    data['bridgeCard_fee'] = this.bridgeCardFee;
    return data;
  }
}
