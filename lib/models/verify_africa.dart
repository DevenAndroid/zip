  class ModelVerifyAfrica {
  dynamic responseCode;
  dynamic description;
  dynamic verificationType;
  dynamic verificationStatus;
  dynamic transactionStatus;
  dynamic transactionReference;
  dynamic transactionDate;
  dynamic searchParameter;
  dynamic callBackUrl;
  dynamic livenessScore;
  dynamic paymentRef;
  Response? response;
  FaceMatch? faceMatch;

  ModelVerifyAfrica(
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

  ModelVerifyAfrica.fromJson(Map<String, dynamic> json) {
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
    faceMatch = json['faceMatch'] != null
        ? new FaceMatch.fromJson(json['faceMatch'])
        : null;
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
    if (this.faceMatch != null) {
      data['faceMatch'] = this.faceMatch!.toJson();
    }
    return data;
  }
}

class Response {
  dynamic validity;
  dynamic bvn;
  dynamic status;
  dynamic basicDetailBase64;
  dynamic description;
  dynamic imageBase64;

  Response(
      {this.validity,
        this.bvn,
        this.status,
        this.basicDetailBase64,
        this.description,
        this.imageBase64});

  Response.fromJson(Map<String, dynamic> json) {
    validity = json['validity'];
    bvn = json['bvn'];
    status = json['status'];
    basicDetailBase64 = json['basicDetailBase64'];
    description = json['description'];
    imageBase64 = json['imageBase64'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['validity'] = this.validity;
    data['bvn'] = this.bvn;
    data['status'] = this.status;
    data['basicDetailBase64'] = this.basicDetailBase64;
    data['description'] = this.description;
    data['imageBase64'] = this.imageBase64;
    return data;
  }
}

class FaceMatch {
  dynamic score;
  dynamic verdict;
  dynamic message;
  dynamic selfie;

  FaceMatch({this.score, this.verdict, this.message, this.selfie});

  FaceMatch.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    verdict = json['verdict'];
    message = json['message'];
    selfie = json['selfie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['verdict'] = this.verdict;
    data['message'] = this.message;
    data['selfie'] = this.selfie;
    return data;
  }
}
