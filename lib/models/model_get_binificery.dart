class GetBenificiryModel {
  bool? success;
  String? message;
  Data? data;

  GetBenificiryModel({this.success, this.message, this.data});

  GetBenificiryModel.fromJson(Map<String, dynamic> json) {
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
  List<Results>? results;
  int? total;

  Data({this.results, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class Results {
  dynamic lastName;
  dynamic email;
  dynamic phoneNumber;
  dynamic accountHolderName;
  dynamic bank;
  dynamic address;
  dynamic paymentScheme;
  dynamic uniqueIdentifier;
  dynamic isResolved;
  dynamic sId;
  dynamic business;
  dynamic firstName;
  dynamic type;
  dynamic currency;
  dynamic paymentDestination;
  dynamic destinationAddress;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;

  Results(
      {this.lastName,
        this.email,
        this.phoneNumber,
        this.accountHolderName,
        this.bank,
        this.address,
        this.paymentScheme,
        this.uniqueIdentifier,
        this.isResolved,
        this.sId,
        this.business,
        this.firstName,
        this.type,
        this.currency,
        this.paymentDestination,
        this.destinationAddress,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Results.fromJson(Map<String, dynamic> json) {
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    accountHolderName = json['accountHolderName'];
    bank = json['bank'];
    address = json['address'];
    paymentScheme = json['paymentScheme'];
    uniqueIdentifier = json['uniqueIdentifier'];
    isResolved = json['isResolved'];
    sId = json['_id'];
    business = json['business'];
    firstName = json['firstName'];
    type = json['type'];
    currency = json['currency'];
    paymentDestination = json['paymentDestination'];
    destinationAddress = json['destinationAddress'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['accountHolderName'] = this.accountHolderName;
    data['bank'] = this.bank;
    data['address'] = this.address;
    data['paymentScheme'] = this.paymentScheme;
    data['uniqueIdentifier'] = this.uniqueIdentifier;
    data['isResolved'] = this.isResolved;
    data['_id'] = this.sId;
    data['business'] = this.business;
    data['firstName'] = this.firstName;
    data['type'] = this.type;
    data['currency'] = this.currency;
    data['paymentDestination'] = this.paymentDestination;
    data['destinationAddress'] = this.destinationAddress;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
