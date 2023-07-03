class ModelVerifyAfrica {
  bool? status;
  String? message;
  Data? data;

  ModelVerifyAfrica({this.status, this.message, this.data});

  ModelVerifyAfrica.fromJson(Map<String, dynamic> json) {
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
  VerifitionData? verifitionData;

  Data({this.verifitionData});

  Data.fromJson(Map<String, dynamic> json) {
    verifitionData = json['verifitionData'] != null
        ? new VerifitionData.fromJson(json['verifitionData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.verifitionData != null) {
      data['verifitionData'] = this.verifitionData!.toJson();
    }
    return data;
  }
}

class VerifitionData {
  String? responseCode;
  String? description;
  String? verificationType;
  String? verificationStatus;
  String? transactionStatus;
  String? transactionReference;
  String? transactionDate;
  String? searchParameter;
  Null? callBackUrl;
  int? livenessScore;
  Null? paymentRef;
  Null? response;
  Null? faceMatch;

  VerifitionData(
      {this.responseCode,
        this.description,
        this.verificationType,
        this.verificationStatus,
        this.transactionStatus,
        this.transactionReference,
        this.transactionDate,
        this.searchParameter,
        this.callBackUrl,
        this.livenessScore,
        this.paymentRef,
        this.response,
        this.faceMatch});

  VerifitionData.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    description = json['description'];
    verificationType = json['verificationType'];
    verificationStatus = json['verificationStatus'];
    transactionStatus = json['transactionStatus'];
    transactionReference = json['transactionReference'];
    transactionDate = json['transactionDate'];
    searchParameter = json['searchParameter'];
    callBackUrl = json['callBackUrl'];
    livenessScore = json['livenessScore'];
    paymentRef = json['paymentRef'];
    response = json['response'];
    faceMatch = json['faceMatch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['description'] = this.description;
    data['verificationType'] = this.verificationType;
    data['verificationStatus'] = this.verificationStatus;
    data['transactionStatus'] = this.transactionStatus;
    data['transactionReference'] = this.transactionReference;
    data['transactionDate'] = this.transactionDate;
    data['searchParameter'] = this.searchParameter;
    data['callBackUrl'] = this.callBackUrl;
    data['livenessScore'] = this.livenessScore;
    data['paymentRef'] = this.paymentRef;
    data['response'] = this.response;
    data['faceMatch'] = this.faceMatch;
    return data;
  }
}
