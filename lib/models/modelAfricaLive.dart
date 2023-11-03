class ModelAfricaLive {
  dynamic responseCode;
  dynamic description;
  dynamic verificationType;
  dynamic verificationStatus;
  dynamic transactionStatus;
  dynamic transactionReference;
  dynamic transactionDate;
  Null? searchParameter;
  Null? callBackUrl;
 dynamic livenessScore;
  Null? paymentRef;
  Response? response;
  Null? faceMatch;

  ModelAfricaLive(
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

  ModelAfricaLive.fromJson(Map<String, dynamic> json) {
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
  double? popScore;
  double? liveScore;

  Response({this.popScore, this.liveScore});

  Response.fromJson(Map<String, dynamic> json) {
    popScore = json['pop_score'];
    liveScore = json['live_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pop_score'] = this.popScore;
    data['live_score'] = this.liveScore;
    return data;
  }
}
