class ModelLiveDetails {
  dynamic responseCode;
  dynamic description;
  dynamic verificationType;
  dynamic verificationStatus;
  dynamic transactionStatus;
  dynamic transactionReference;
  dynamic transactionDate;
  dynamic searchParameter;
  Null? callBackUrl;
  dynamic livenessScore;
  Null? paymentRef;
  Response? response;
  Null? faceMatch;
  Null? licenseSessionId;
  Null? remainingLicenseSessionRound;

  ModelLiveDetails(
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
      this.faceMatch,
      this.licenseSessionId,
      this.remainingLicenseSessionRound});

  ModelLiveDetails.fromJson(Map<String, dynamic> json) {
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
    licenseSessionId = json['licenseSessionId'];
    remainingLicenseSessionRound = json['remainingLicenseSessionRound'];
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
    data['licenseSessionId'] = this.licenseSessionId;
    data['remainingLicenseSessionRound'] = this.remainingLicenseSessionRound;
    return data;
  }
}

class Response {
  dynamic firstName;
  dynamic middleName;
  dynamic lastName;
  dynamic dob;
  dynamic registrationDate;
  dynamic email;
  dynamic gender;
  dynamic phone;
  dynamic alternatePhone;
  dynamic country;
  dynamic stateOfOrigin;
  dynamic addressLine3;
  dynamic maritalStatus;
  dynamic nin;
  dynamic avatar;
  dynamic watchListed;

  Response(
      {this.firstName,
      this.middleName,
      this.lastName,
      this.dob,
      this.registrationDate,
      this.email,
      this.gender,
      this.phone,
      this.alternatePhone,
      this.country,
      this.stateOfOrigin,
      this.addressLine3,
      this.maritalStatus,
      this.nin,
      this.avatar,
      this.watchListed});

  Response.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    dob = json['dob'];
    registrationDate = json['registrationDate'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    alternatePhone = json['alternatePhone'];
    country = json['country'];
    stateOfOrigin = json['stateOfOrigin'];
    addressLine3 = json['addressLine3'];
    maritalStatus = json['maritalStatus'];
    nin = json['nin'];
    avatar = json['avatar'];
    watchListed = json['watchListed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['dob'] = this.dob;
    data['registrationDate'] = this.registrationDate;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['alternatePhone'] = this.alternatePhone;
    data['country'] = this.country;
    data['stateOfOrigin'] = this.stateOfOrigin;
    data['addressLine3'] = this.addressLine3;
    data['maritalStatus'] = this.maritalStatus;
    data['nin'] = this.nin;
    data['avatar'] = this.avatar;
    data['watchListed'] = this.watchListed;
    return data;
  }
}
