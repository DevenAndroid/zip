class CreateVirtualAccountModel {
  bool? success;
  String? message;
  Data? data;

  CreateVirtualAccountModel({this.success, this.message, this.data});

  CreateVirtualAccountModel.fromJson(Map<String, dynamic> json) {
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
  String? status;
  bool? isActive;
  String? accountNumber;
  Null? merchantReference;
  KYCInformation? kYCInformation;
  AccountInformation? accountInformation;
  Null? verifiedKYCData;
  Null? note;
  int? accountOpeningFee;
  int? pendingAdditionalInfoCount;
  bool? isPermanent;
  Null? expiresAt;
  bool? isCheckoutVa;
  bool? isBankTransferVa;
  bool? isSuspended;
  Null? reason;
  Null? monthlyVolume;
  Null? entityName;
  Null? paymentFlowDescription;
  String? virtualAccountType;
  Null? riskRating;
  Null? checklist;
  Null? riskScreening;
  Null? channelKycUpdateStatus;
  Null? channelKycUpdateResponse;
  String? sId;
  String? business;
  String? currency;
  String? accountType;
  String? entityType;
  String? currencyType;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.status,
        this.isActive,
        this.accountNumber,
        this.merchantReference,
        this.kYCInformation,
        this.accountInformation,
        this.verifiedKYCData,
        this.note,
        this.accountOpeningFee,
        this.pendingAdditionalInfoCount,
        this.isPermanent,
        this.expiresAt,
        this.isCheckoutVa,
        this.isBankTransferVa,
        this.isSuspended,
        this.reason,
        this.monthlyVolume,
        this.entityName,
        this.paymentFlowDescription,
        this.virtualAccountType,
        this.riskRating,
        this.checklist,
        this.riskScreening,
        this.channelKycUpdateStatus,
        this.channelKycUpdateResponse,
        this.sId,
        this.business,
        this.currency,
        this.accountType,
        this.entityType,
        this.currencyType,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isActive = json['isActive'];
    accountNumber = json['accountNumber'];
    merchantReference = json['merchantReference'];
    kYCInformation = json['KYCInformation'] != null
        ? new KYCInformation.fromJson(json['KYCInformation'])
        : null;
    accountInformation = json['accountInformation'] != null
        ? new AccountInformation.fromJson(json['accountInformation'])
        : null;
    verifiedKYCData = json['verifiedKYCData'];
    note = json['note'];
    accountOpeningFee = json['accountOpeningFee'];
    pendingAdditionalInfoCount = json['pendingAdditionalInfoCount'];
    isPermanent = json['isPermanent'];
    expiresAt = json['expiresAt'];
    isCheckoutVa = json['isCheckoutVa'];
    isBankTransferVa = json['isBankTransferVa'];
    isSuspended = json['isSuspended'];
    reason = json['reason'];
    monthlyVolume = json['monthlyVolume'];
    entityName = json['entityName'];
    paymentFlowDescription = json['paymentFlowDescription'];
    virtualAccountType = json['virtualAccountType'];
    riskRating = json['riskRating'];
    checklist = json['checklist'];
    riskScreening = json['riskScreening'];
    channelKycUpdateStatus = json['channelKycUpdateStatus'];
    channelKycUpdateResponse = json['channelKycUpdateResponse'];
    business = json['business'];
    sId = json['_id'];

    currency = json['currency'];
    accountType = json['accountType'];
    entityType = json['entityType'];
    currencyType = json['currencyType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['isActive'] = this.isActive;
    data['accountNumber'] = this.accountNumber;
    data['merchantReference'] = this.merchantReference;
    if (this.kYCInformation != null) {
      data['KYCInformation'] = this.kYCInformation!.toJson();
    }
    if (this.accountInformation != null) {
      data['accountInformation'] = this.accountInformation!.toJson();
    }
    data['verifiedKYCData'] = this.verifiedKYCData;
    data['note'] = this.note;
    data['accountOpeningFee'] = this.accountOpeningFee;
    data['pendingAdditionalInfoCount'] = this.pendingAdditionalInfoCount;
    data['isPermanent'] = this.isPermanent;
    data['expiresAt'] = this.expiresAt;
    data['isCheckoutVa'] = this.isCheckoutVa;
    data['isBankTransferVa'] = this.isBankTransferVa;
    data['isSuspended'] = this.isSuspended;
    data['reason'] = this.reason;
    data['monthlyVolume'] = this.monthlyVolume;
    data['entityName'] = this.entityName;
    data['paymentFlowDescription'] = this.paymentFlowDescription;
    data['virtualAccountType'] = this.virtualAccountType;
    data['riskRating'] = this.riskRating;
    data['checklist'] = this.checklist;
    data['riskScreening'] = this.riskScreening;
    data['channelKycUpdateStatus'] = this.channelKycUpdateStatus;
    data['channelKycUpdateResponse'] = this.channelKycUpdateResponse;
    data['business'] = this.business;
    data['_id'] = this.sId;
    // if (this.business != null) {
    //   data['business'] = this.business!.toJson();
    // }
    data['currency'] = this.currency;
    data['accountType'] = this.accountType;
    data['entityType'] = this.entityType;
    data['currencyType'] = this.currencyType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class KYCInformation {
  String? firstName;
  String? email;
  String? lastName;

  KYCInformation({this.firstName, this.email, this.lastName});

  KYCInformation.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    email = json['email'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['email'] = this.email;
    data['lastName'] = this.lastName;
    return data;
  }
}

class AccountInformation {
  String? accountNumber;
  String? accountName;
  String? bankName;
  String? reference;

  AccountInformation(
      {this.accountNumber, this.accountName, this.bankName, this.reference});

  AccountInformation.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    accountName = json['accountName'];
    bankName = json['bankName'];
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountNumber'] = this.accountNumber;
    data['accountName'] = this.accountName;
    data['bankName'] = this.bankName;
    data['reference'] = this.reference;
    return data;
  }
}

class Business {
  String? name;
  String? email;

  Business({this.name, this.email});

  Business.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
