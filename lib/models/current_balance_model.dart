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
  dynamic currentBalance;
  Fee? fee;
  dynamic charges;
  Setting? setting;

  Data({this.currentBalance, this.fee, this.charges, this.setting});

  Data.fromJson(Map<String, dynamic> json) {
    currentBalance = json['current_balance'];
    fee = json['fee'] != null ? new Fee.fromJson(json['fee']) : null;
    charges = json['charges'];
    setting =
    json['setting'] != null ? new Setting.fromJson(json['setting']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_balance'] = this.currentBalance;
    if (this.fee != null) {
      data['fee'] = this.fee!.toJson();
    }
    data['charges'] = this.charges;
    if (this.setting != null) {
      data['setting'] = this.setting!.toJson();
    }
    return data;
  }
}

class Fee {
 dynamic payoutFee;
 dynamic cashoutFee;
 dynamic cashinFee;
 dynamic serviceFee;
 dynamic bridgeCardFee;
 dynamic fxRateFee;

  Fee(
      {this.payoutFee,
        this.cashoutFee,
        this.cashinFee,
        this.serviceFee,
        this.bridgeCardFee,
        this.fxRateFee});

  Fee.fromJson(Map<String, dynamic> json) {
    payoutFee = json['payout_fee'];
    cashoutFee = json['cashout_fee'];
    cashinFee = json['cashin_fee'];
    serviceFee = json['service_fee'];
    bridgeCardFee = json['bridgeCard_fee'];
    fxRateFee = json['fx-rate_fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payout_fee'] = this.payoutFee;
    data['cashout_fee'] = this.cashoutFee;
    data['cashin_fee'] = this.cashinFee;
    data['service_fee'] = this.serviceFee;
    data['bridgeCard_fee'] = this.bridgeCardFee;
    data['fx-rate_fee'] = this.fxRateFee;
    return data;
  }
}

class Setting {
  bool? hideBalance;
  bool? enableSecurityLock;
  bool? transactionPin;
  bool? enableFingerprints;
  bool? pushNotification;
  bool? emailNotification;

  Setting(
      {this.hideBalance,
        this.enableSecurityLock,
        this.transactionPin,
        this.enableFingerprints,
        this.pushNotification,
        this.emailNotification});

  Setting.fromJson(Map<String, dynamic> json) {
    hideBalance = json['hide_balance'];
    enableSecurityLock = json['enable_security_lock'];
    transactionPin = json['transaction_pin'];
    enableFingerprints = json['enable_fingerprints'];
    pushNotification = json['push_notification'];
    emailNotification = json['email_notification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hide_balance'] = this.hideBalance;
    data['enable_security_lock'] = this.enableSecurityLock;
    data['transaction_pin'] = this.transactionPin;
    data['enable_fingerprints'] = this.enableFingerprints;
    data['push_notification'] = this.pushNotification;
    data['email_notification'] = this.emailNotification;
    return data;
  }
}
