class ModelBankDetails {
  bool? status;
  String? message;
  Data? data;

  ModelBankDetails({this.status, this.message, this.data});

  ModelBankDetails.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? accountType;
  String? currency;
  String? business;
  String? businessId;
  String? accountNumber;
  KYCInformation? kYCInformation;
  AccountInformation? accountInformation;
  String? cardType;
  String? creationOrigin;

  Data(
      {this.id,
        this.userId,
        this.accountType,
        this.currency,
        this.business,
        this.businessId,
        this.accountNumber,
        this.kYCInformation,
        this.accountInformation,
        this.cardType,
        this.creationOrigin});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    accountType = json['accountType'];
    currency = json['currency'];
    business = json['business'];
    businessId = json['business_id'];
    accountNumber = json['accountNumber'];
    kYCInformation = json['KYCInformation'] != null
        ? new KYCInformation.fromJson(json['KYCInformation'])
        : null;
    accountInformation = json['accountInformation'] != null
        ? new AccountInformation.fromJson(json['accountInformation'])
        : null;
    cardType = json['card_type'];
    creationOrigin = json['creation_origin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['accountType'] = this.accountType;
    data['currency'] = this.currency;
    data['business'] = this.business;
    data['business_id'] = this.businessId;
    data['accountNumber'] = this.accountNumber;
    if (this.kYCInformation != null) {
      data['KYCInformation'] = this.kYCInformation!.toJson();
    }
    if (this.accountInformation != null) {
      data['accountInformation'] = this.accountInformation!.toJson();
    }
    data['card_type'] = this.cardType;
    data['creation_origin'] = this.creationOrigin;
    return data;
  }
}

class KYCInformation {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;

  KYCInformation({this.firstName, this.lastName, this.email, this.phoneNumber});

  KYCInformation.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}

class AccountInformation {
  String? accountNumber;
  String? accountName;
  String? bankName;
  String? bankCode;

  AccountInformation(
      {this.accountNumber, this.accountName, this.bankName, this.bankCode});

  AccountInformation.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    accountName = json['accountName'];
    bankName = json['bankName'];
    bankCode = json['bankCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountNumber'] = this.accountNumber;
    data['accountName'] = this.accountName;
    data['bankName'] = this.bankName;
    data['bankCode'] = this.bankCode;
    return data;
  }
}
