class ModelAfricaFaceMatch {
  String? responseCode;
  String? description;
  String? verificationType;
  String? verificationStatus;
  String? transactionStatus;
  String? transactionReference;
  String? transactionDate;
  dynamic searchParameter;
  dynamic callBackUrl;
  dynamic livenessScore;
  dynamic paymentRef;
  Response? response;
  dynamic faceMatch;

  ModelAfricaFaceMatch(
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

  ModelAfricaFaceMatch.fromJson(Map<String, dynamic> json) {
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
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
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
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    data['faceMatch'] = this.faceMatch;
    return data;
  }
}

class Response {
  bool? faceMatch;
 dynamic prediction;
 dynamic message;

  Response({this.faceMatch, this.prediction, this.message});

  Response.fromJson(Map<String, dynamic> json) {
    faceMatch = json['faceMatch'];
    prediction = json['prediction'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['faceMatch'] = this.faceMatch;
    data['prediction'] = this.prediction;
    data['message'] = this.message;
    return data;
  }
}
