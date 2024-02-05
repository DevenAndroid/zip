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
        this.faceMatch});

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
  dynamic email;
  dynamic gender;
  dynamic dob;
  dynamic phone;
  dynamic country;
  dynamic nin;
  dynamic bvn;
  dynamic nationality;
  bool? watchlisted;
  dynamic avatar;
  dynamic fullName;
  dynamic firstName;
  dynamic middleName;
  dynamic lastName;
  dynamic alternatePhone;
  dynamic stateOfOrigin;
  dynamic stateOfResidence;
  dynamic lgaOfOrigin;
  dynamic lgaOfResidence;
  dynamic addressLine2;
  dynamic addressLine3;
  dynamic maritalStatus;
  dynamic enrollmentBank;
  dynamic enrollmentBranch;
  dynamic accountLevel;

  Response(
      {this.email,
        this.gender,
        this.dob,
        this.phone,
        this.country,
        this.nin,
        this.bvn,
        this.nationality,
        this.watchlisted,
        this.avatar,
        this.fullName,
        this.firstName,
        this.middleName,
        this.lastName,
        this.alternatePhone,
        this.stateOfOrigin,
        this.stateOfResidence,
        this.lgaOfOrigin,
        this.lgaOfResidence,
        this.addressLine2,
        this.addressLine3,
        this.maritalStatus,
        this.enrollmentBank,
        this.enrollmentBranch,
        this.accountLevel});

  Response.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    phone = json['phone'];
    country = json['country'];
    nin = json['nin'];
    bvn = json['bvn'];
    nationality = json['nationality'];
    watchlisted = json['watchlisted'];
    avatar = json['avatar'];
    fullName = json['full_name'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    alternatePhone = json['alternate_phone'];
    stateOfOrigin = json['state_of_origin'];
    stateOfResidence = json['state_of_residence'];
    lgaOfOrigin = json['lga_of_origin'];
    lgaOfResidence = json['lga_of_residence'];
    addressLine2 = json['address_line_2'];
    addressLine3 = json['address_line_3'];
    maritalStatus = json['marital_status'];
    enrollmentBank = json['enrollment_bank'];
    enrollmentBranch = json['enrollment_branch'];
    accountLevel = json['account_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    data['country'] = this.country;
    data['nin'] = this.nin;
    data['bvn'] = this.bvn;
    data['nationality'] = this.nationality;
    data['watchlisted'] = this.watchlisted;
    data['avatar'] = this.avatar;
    data['full_name'] = this.fullName;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['alternate_phone'] = this.alternatePhone;
    data['state_of_origin'] = this.stateOfOrigin;
    data['state_of_residence'] = this.stateOfResidence;
    data['lga_of_origin'] = this.lgaOfOrigin;
    data['lga_of_residence'] = this.lgaOfResidence;
    data['address_line_2'] = this.addressLine2;
    data['address_line_3'] = this.addressLine3;
    data['marital_status'] = this.maritalStatus;
    data['enrollment_bank'] = this.enrollmentBank;
    data['enrollment_branch'] = this.enrollmentBranch;
    data['account_level'] = this.accountLevel;
    return data;
  }
}
