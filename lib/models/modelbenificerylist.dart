class ModelBenificeryList {
  String? status;
  String? message;
  Metapages? metapages;
  List<Data>? data;

  ModelBenificeryList({this.status, this.message, this.metapages, this.data});

  ModelBenificeryList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    metapages = json['metapages'] != null
        ? new Metapages.fromJson(json['metapages'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.metapages != null) {
      data['metapages'] = this.metapages!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metapages {
  PageInfo? pageInfo;

  Metapages({this.pageInfo});

  Metapages.fromJson(Map<String, dynamic> json) {
    pageInfo = json['page_info'] != null
        ? new PageInfo.fromJson(json['page_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pageInfo != null) {
      data['page_info'] = this.pageInfo!.toJson();
    }
    return data;
  }
}

class PageInfo {
  int? total;
  int? currentPage;
  int? totalPages;

  PageInfo({this.total, this.currentPage, this.totalPages});

  PageInfo.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    return data;
  }
}

class Data {
  int? id;
  String? accountNumber;
  String? bankCode;
  String? fullName;
  Meta? meta;
  String? createdAt;
  String? bankName;

  Data(
      {this.id,
        this.accountNumber,
        this.bankCode,
        this.fullName,
        this.meta,
        this.createdAt,
        this.bankName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountNumber = json['account_number'];
    bankCode = json['bank_code'];
    fullName = json['full_name'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    createdAt = json['created_at'];
    bankName = json['bank_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['account_number'] = this.accountNumber;
    data['bank_code'] = this.bankCode;
    data['full_name'] = this.fullName;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['bank_name'] = this.bankName;
    return data;
  }
}

class Meta {
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  dynamic mobileNumber;
  dynamic recipientAddress;
  dynamic accountId;
  dynamic merchantId;
  dynamic sender;
  dynamic merchantName;
  dynamic accountNumber;
  dynamic swiftCode;
  dynamic bankName;
  dynamic beneficiaryName;
  dynamic beneficiaryCountry;

  Meta(
      {this.firstName,
        this.lastName,
        this.email,
        this.mobileNumber,
        this.recipientAddress,
        this.accountId,
        this.merchantId,
        this.sender,
        this.merchantName,
        this.accountNumber,
        this.swiftCode,
        this.bankName,
        this.beneficiaryName,
        this.beneficiaryCountry});

  Meta.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    recipientAddress = json['recipient_address'];
    accountId = json['AccountId'];
    merchantId = json['merchant_id'];
    sender = json['sender'];
    merchantName = json['merchant_name'];
    accountNumber = json['AccountNumber'];
    swiftCode = json['SwiftCode'];
    bankName = json['BankName'];
    beneficiaryName = json['BeneficiaryName'];
    beneficiaryCountry = json['BeneficiaryCountry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['recipient_address'] = this.recipientAddress;
    data['AccountId'] = this.accountId;
    data['merchant_id'] = this.merchantId;
    data['sender'] = this.sender;
    data['merchant_name'] = this.merchantName;
    data['AccountNumber'] = this.accountNumber;
    data['SwiftCode'] = this.swiftCode;
    data['BankName'] = this.bankName;
    data['BeneficiaryName'] = this.beneficiaryName;
    data['BeneficiaryCountry'] = this.beneficiaryCountry;
    return data;
  }
}
