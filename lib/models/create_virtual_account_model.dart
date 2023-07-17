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
  dynamic status;
  bool? isActive;
 dynamic accountNumber;
  KYCInformation? kYCInformation;
  AccountInformation? accountInformation;
  dynamic accountOpeningFee;
  dynamic pendingAdditionalInfoCount;
  bool? isPermanent;
  bool? isCheckoutVa;
  bool? isBankTransferVa;
  bool? isSuspended;

  List<MeansOfId>? meansOfId;
  List<BankStatement>? bankStatement;
  List<UtilityBill>? utilityBill;
 dynamic virtualAccountType;
 dynamic sId;
 dynamic business;
 dynamic currency;
 dynamic accountType;
 dynamic entityType;
 dynamic currencyType;
 dynamic createdAt;
 dynamic updatedAt;

  Data(
      {this.status,
        this.isActive,
        this.accountNumber,
        this.kYCInformation,
        this.accountInformation,
        this.accountOpeningFee,
        this.pendingAdditionalInfoCount,
        this.isPermanent,
        this.isCheckoutVa,
        this.isBankTransferVa,
        this.isSuspended,

        this.meansOfId,
        this.bankStatement,
        this.utilityBill,
        this.virtualAccountType,
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
    kYCInformation = json['KYCInformation'] != null
        ? new KYCInformation.fromJson(json['KYCInformation'])
        : null;
    accountInformation = json['accountInformation'] != null
        ? new AccountInformation.fromJson(json['accountInformation'])
        : null;
    accountOpeningFee = json['accountOpeningFee'];
    pendingAdditionalInfoCount = json['pendingAdditionalInfoCount'];
    isPermanent = json['isPermanent'];
    isCheckoutVa = json['isCheckoutVa'];
    isBankTransferVa = json['isBankTransferVa'];
    isSuspended = json['isSuspended'];

    if (json['meansOfId'] != null) {
      meansOfId = <MeansOfId>[];
      json['meansOfId'].forEach((v) {
        meansOfId!.add(new MeansOfId.fromJson(v));
      });
    }
    if (json['bankStatement'] != null) {
      bankStatement = <BankStatement>[];
      json['bankStatement'].forEach((v) {
        bankStatement!.add(new BankStatement.fromJson(v));
      });
    }
    if (json['utilityBill'] != null) {
      utilityBill = <UtilityBill>[];
      json['utilityBill'].forEach((v) {
        utilityBill!.add(new UtilityBill.fromJson(v));
      });
    }
    virtualAccountType = json['virtualAccountType'];
    sId = json['_id'];
    business = json['business'];
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
    if (this.kYCInformation != null) {
      data['KYCInformation'] = this.kYCInformation!.toJson();
    }
    if (this.accountInformation != null) {
      data['accountInformation'] = this.accountInformation!.toJson();
    }
    data['accountOpeningFee'] = this.accountOpeningFee;
    data['pendingAdditionalInfoCount'] = this.pendingAdditionalInfoCount;
    data['isPermanent'] = this.isPermanent;
    data['isCheckoutVa'] = this.isCheckoutVa;
    data['isBankTransferVa'] = this.isBankTransferVa;
    data['isSuspended'] = this.isSuspended;

    if (this.meansOfId != null) {
      data['meansOfId'] = this.meansOfId!.map((v) => v.toJson()).toList();
    }
    if (this.bankStatement != null) {
      data['bankStatement'] =
          this.bankStatement!.map((v) => v.toJson()).toList();
    }
    if (this.utilityBill != null) {
      data['utilityBill'] = this.utilityBill!.map((v) => v.toJson()).toList();
    }
    data['virtualAccountType'] = this.virtualAccountType;
    data['_id'] = this.sId;
    data['business'] = this.business;
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
  dynamic nationality;
  dynamic address;
  dynamic document;
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
        this.address,
        this.document,
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
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    document = json['document'] != null
        ? new Document.fromJson(json['document'])
        : null;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nationality'] = this.nationality;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.document != null) {
      data['document'] = this.document!.toJson();
    }
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['birthDate'] = this.birthDate;
    data['incomeBand'] = this.incomeBand;
    data['phone'] = this.phone;
    data['occupation'] = this.occupation;
    data['sourceOfIncome'] = this.sourceOfIncome;
    data['accountDesignation'] = this.accountDesignation;
    data['employmentStatus'] = this.employmentStatus;
    return data;
  }
}

class Address {
  dynamic countryOfResidence;
  dynamic number;
  dynamic zip;
  dynamic street;
  dynamic state;
  dynamic city;

  Address(
      {this.countryOfResidence,
        this.number,
        this.zip,
        this.street,
        this.state,
        this.city});

  Address.fromJson(Map<String, dynamic> json) {
    countryOfResidence = json['countryOfResidence'];
    number = json['number'];
    zip = json['zip'];
    street = json['street'];
    state = json['state'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryOfResidence'] = this.countryOfResidence;
    data['number'] = this.number;
    data['zip'] = this.zip;
    data['street'] = this.street;
    data['state'] = this.state;
    data['city'] = this.city;
    return data;
  }
}

class Document {
 dynamic type;
 dynamic number;
 dynamic issuedCountryCode;
 dynamic issuedBy;
 dynamic issuedDate;
 dynamic expirationDate;

  Document(
      {this.type,
        this.number,
        this.issuedCountryCode,
        this.issuedBy,
        this.issuedDate,
        this.expirationDate});

  Document.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    number = json['number'];
    issuedCountryCode = json['issuedCountryCode'];
    issuedBy = json['issuedBy'];
    issuedDate = json['issuedDate'];
    expirationDate = json['expirationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['number'] = this.number;
    data['issuedCountryCode'] = this.issuedCountryCode;
    data['issuedBy'] = this.issuedBy;
    data['issuedDate'] = this.issuedDate;
    data['expirationDate'] = this.expirationDate;
    return data;
  }
}

class AccountInformation {
 dynamic accountNumber;
 dynamic isInstant;
 dynamic bankName;
 dynamic bankCode;
 dynamic countryCode;
 dynamic reference;
  OtherInfo? otherInfo;

  AccountInformation(
      {this.accountNumber,
        this.isInstant,
        this.bankName,
        this.bankCode,
        this.countryCode,
        this.reference,
        this.otherInfo});

  AccountInformation.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    isInstant = json['isInstant'];
    bankName = json['bankName'];
    bankCode = json['bankCode'];
    countryCode = json['countryCode'];
    reference = json['reference'];
    otherInfo = json['otherInfo'] != null
        ? new OtherInfo.fromJson(json['otherInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountNumber'] = this.accountNumber;
    data['isInstant'] = this.isInstant;
    data['bankName'] = this.bankName;
    data['bankCode'] = this.bankCode;
    data['countryCode'] = this.countryCode;
    data['reference'] = this.reference;
    if (this.otherInfo != null) {
      data['otherInfo'] = this.otherInfo!.toJson();
    }
    return data;
  }
}

class OtherInfo {
  dynamic iban;
  dynamic accountNumber;
  dynamic address;
  dynamic checkNumber;
  dynamic sortCode;
  dynamic bankSwiftCode;

  OtherInfo(
      {this.iban,
        this.accountNumber,
        this.address,
        this.checkNumber,
        this.sortCode,
        this.bankSwiftCode});

  OtherInfo.fromJson(Map<String, dynamic> json) {
    iban = json['iban'];
    accountNumber = json['accountNumber'];
    address = json['address'];
    checkNumber = json['checkNumber'];
    sortCode = json['sortCode'];
    bankSwiftCode = json['bankSwiftCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iban'] = this.iban;
    data['accountNumber'] = this.accountNumber;
    data['address'] = this.address;
    data['checkNumber'] = this.checkNumber;
    data['sortCode'] = this.sortCode;
    data['bankSwiftCode'] = this.bankSwiftCode;
    return data;
  }
}

class MeansOfId {
  String? name;
  String? url;

  MeansOfId({this.name, this.url});

  MeansOfId.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
class UtilityBill {
  String? name;
  String? url;

  UtilityBill({this.name, this.url});

  UtilityBill.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
class BankStatement {
  String? name;
  String? url;

  BankStatement({this.name, this.url});

  BankStatement.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
