import 'dart:convert';

class ModelVerifyVritualAccount {
  bool? status;
  String? message;
  Data? data;

  ModelVerifyVritualAccount({this.status, this.message, this.data});

  ModelVerifyVritualAccount.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = jsonDecode(status.toString());
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic userId;
  dynamic accountType;
  dynamic currency;
  dynamic business;
  dynamic businessId;
  dynamic accountNumber;
  KYCInformation? kYCInformation;
  AccountInformation? accountInformation;
 dynamic updatedAt;
 dynamic createdAt;
 dynamic id;

  Data(
      {this.userId,
        this.accountType,
        this.currency,
        this.business,
        this.businessId,
        this.accountNumber,
        this.kYCInformation,
        this.accountInformation,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    accountType = json['accountType'];
    currency = json['currency'];
    business = json['business'];
    businessId = json['business_id'];
    accountNumber = json['accountNumber'];
    kYCInformation = json['KYCInformation'] != null
        ? KYCInformation.fromJson(jsonDecode(json['KYCInformation']))
        : null;
    accountInformation = json['accountInformation'] != null
        ? AccountInformation.fromJson(jsonDecode(json['accountInformation']))
        : null;
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['accountType'] = accountType;
    data['currency'] = currency;
    data['business'] = business;
    data['business_id'] = businessId;
    data['accountNumber'] = accountNumber;
    if (kYCInformation != null) {
      data['KYCInformation'] = kYCInformation!.toJson();
    }
    if (accountInformation != null) {
      data['accountInformation'] = accountInformation!.toJson();
    }
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class KYCInformation {
  dynamic nationality;
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  dynamic birthDate;
  dynamic incomeBand;
  dynamic phone;
  dynamic occupation;
  dynamic sourceOfIncome;
  dynamic accountDesignation;
  dynamic employmentStatus;

  KYCInformation(
      {this.nationality,
        this.firstName,
        this.lastName,
        this.email,
        this.birthDate,
        this.incomeBand,
        this.phone,
        this.occupation,
        this.sourceOfIncome,
        this.accountDesignation,
        this.employmentStatus});

  KYCInformation.fromJson(Map<String, dynamic> json) {
    nationality = json['nationality'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    birthDate = json['birthDate'];
    incomeBand = json['incomeBand'];
    phone = json['phone'];
    occupation = json['occupation'];
    sourceOfIncome = json['sourceOfIncome'];
    accountDesignation = json['accountDesignation'];
    employmentStatus = json['employmentStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nationality'] = nationality;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['birthDate'] = birthDate;
    data['incomeBand'] = incomeBand;
    data['phone'] = phone;
    data['occupation'] = occupation;
    data['sourceOfIncome'] = sourceOfIncome;
    data['accountDesignation'] = accountDesignation;
    data['employmentStatus'] = employmentStatus;
    return data;
  }
}

class AccountInformation {
  String? accountNumber;
  dynamic isInstant;
  String? bankName;
  dynamic bankCode;
  dynamic countryCode;
  String? reference;

  AccountInformation(
      {this.accountNumber,
        this.isInstant,
        this.bankName,
        this.bankCode,
        this.countryCode,
        this.reference});

  AccountInformation.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    isInstant = json['isInstant'];
    bankName = json['bankName'];
    bankCode = json['bankCode'];
    countryCode = json['countryCode'];
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountNumber'] = accountNumber;
    data['isInstant'] = isInstant;
    data['bankName'] = bankName;
    data['bankCode'] = bankCode;
    data['countryCode'] = countryCode;
    data['reference'] = reference;
    return data;
  }
}
