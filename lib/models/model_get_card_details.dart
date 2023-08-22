class ModelGetCardDetails {
  String? status;
  String? message;
  Data? data;

  ModelGetCardDetails({this.status, this.message, this.data});

  ModelGetCardDetails.fromJson(Map<String, dynamic> json) {
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
  dynamic cardNumber;
  dynamic expiryMonth;
  dynamic expiryYear;
  dynamic cvv;
  dynamic last4;
  dynamic cardCurrency;
  dynamic brand;
  BillingAddress? billingAddress;
  dynamic cardName;
  dynamic cardholderId;
  dynamic createdAt;
  dynamic issuingAppId;
  dynamic cardType;
  bool? isActive;
  bool? livemode;
  MetaData? metaData;
  bool? pin3dsActivated;
  Null? insufficientFundsDeclineCount;
  String? balance;

  Data(
      {this.cardId,
        this.cardNumber,
        this.expiryMonth,
        this.expiryYear,
        this.cvv,
        this.last4,
        this.cardCurrency,
        this.brand,
        this.billingAddress,
        this.cardName,
        this.cardholderId,
        this.createdAt,
        this.issuingAppId,
        this.cardType,
        this.isActive,
        this.livemode,
        this.metaData,
        this.pin3dsActivated,
        this.insufficientFundsDeclineCount,
        this.balance});

  Data.fromJson(Map<String, dynamic> json) {
    cardId = json['card_id'];
    cardNumber = json['card_number'];
    expiryMonth = json['expiry_month'];
    expiryYear = json['expiry_year'];
    cvv = json['cvv'];
    last4 = json['last_4'];
    cardCurrency = json['card_currency'];
    brand = json['brand'];
    billingAddress = json['billing_address'] != null
        ? new BillingAddress.fromJson(json['billing_address'])
        : null;
    cardName = json['card_name'];
    cardholderId = json['cardholder_id'];
    createdAt = json['created_at'];
    issuingAppId = json['issuing_app_id'];
    cardType = json['card_type'];
    isActive = json['is_active'];
    livemode = json['livemode'];
    metaData = json['meta_data'] != null
        ? new MetaData.fromJson(json['meta_data'])
        : null;
    pin3dsActivated = json['pin_3ds_activated'];
    insufficientFundsDeclineCount = json['insufficient_funds_decline_count'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['card_id'] = this.cardId;
    data['card_number'] = this.cardNumber;
    data['expiry_month'] = this.expiryMonth;
    data['expiry_year'] = this.expiryYear;
    data['cvv'] = this.cvv;
    data['last_4'] = this.last4;
    data['card_currency'] = this.cardCurrency;
    data['brand'] = this.brand;
    if (this.billingAddress != null) {
      data['billing_address'] = this.billingAddress!.toJson();
    }
    data['card_name'] = this.cardName;
    data['cardholder_id'] = this.cardholderId;
    data['created_at'] = this.createdAt;
    data['issuing_app_id'] = this.issuingAppId;
    data['card_type'] = this.cardType;
    data['is_active'] = this.isActive;
    data['livemode'] = this.livemode;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData!.toJson();
    }
    data['pin_3ds_activated'] = this.pin3dsActivated;
    data['insufficient_funds_decline_count'] =
        this.insufficientFundsDeclineCount;
    data['balance'] = this.balance;
    return data;
  }
}

class BillingAddress {
  dynamic billingAddress1;
  dynamic billingCity;
  dynamic billingCountry;
  dynamic billingZipCode;
  dynamic countryCode;
  dynamic state;
  dynamic stateCode;

  BillingAddress(
      {this.billingAddress1,
        this.billingCity,
        this.billingCountry,
        this.billingZipCode,
        this.countryCode,
        this.state,
        this.stateCode});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    billingAddress1 = json['billing_address1'];
    billingCity = json['billing_city'];
    billingCountry = json['billing_country'];
    billingZipCode = json['billing_zip_code'];
    countryCode = json['country_code'];
    state = json['state'];
    stateCode = json['state_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billing_address1'] = this.billingAddress1;
    data['billing_city'] = this.billingCity;
    data['billing_country'] = this.billingCountry;
    data['billing_zip_code'] = this.billingZipCode;
    data['country_code'] = this.countryCode;
    data['state'] = this.state;
    data['state_code'] = this.stateCode;
    return data;
  }
}

class MetaData {
  String? userId;

  MetaData({this.userId});

  MetaData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    return data;
  }
}
