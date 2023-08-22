class ModelSearchZip {
  bool? status;
  String? message;
  Data? data;

  ModelSearchZip({this.status, this.message, this.data});

  ModelSearchZip.fromJson(Map<String, dynamic> json) {
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
  dynamic id;
  dynamic name;
  dynamic fname;
  dynamic lname;
  dynamic phone;
  dynamic countryCode;
  dynamic email;
  dynamic dob;
  dynamic nationality;
  dynamic pin;
  dynamic birthPlace;
  dynamic gender;
  dynamic otp;
  dynamic otpCreatedAt;
  dynamic otpVerified;
  dynamic profileImage;
  dynamic cardholderId;
  dynamic emailVerifiedAt;
  dynamic walletBalance;
  dynamic status;
  dynamic isProfileComplete;
  dynamic bvn;
  dynamic primaryPurpose;
  dynamic zipTag;
  dynamic verificationImage;
  dynamic isAfricaVerifed;
  dynamic pinResetOtp;
  dynamic uniqueId;
  dynamic tranferLimit;
  dynamic defaultAddress;
  dynamic twoFactorCode;
  dynamic twoFactorExpiresAt;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  Data(
      {this.id,
        this.name,
        this.fname,
        this.lname,
        this.phone,
        this.countryCode,
        this.email,
        this.dob,
        this.nationality,
        this.pin,
        this.birthPlace,
        this.gender,
        this.otp,
        this.otpCreatedAt,
        this.otpVerified,
        this.profileImage,
        this.cardholderId,
        this.emailVerifiedAt,
        this.walletBalance,
        this.status,
        this.isProfileComplete,
        this.bvn,
        this.primaryPurpose,
        this.zipTag,
        this.verificationImage,
        this.isAfricaVerifed,
        this.pinResetOtp,
        this.uniqueId,
        this.tranferLimit,
        this.defaultAddress,
        this.twoFactorCode,
        this.twoFactorExpiresAt,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fname = json['fname'];
    lname = json['lname'];
    phone = json['phone'];
    countryCode = json['country_code'];
    email = json['email'];
    dob = json['dob'];
    nationality = json['nationality'];
    pin = json['pin'];
    birthPlace = json['birth_place'];
    gender = json['gender'];
    otp = json['otp'];
    otpCreatedAt = json['otp_created_at'];
    otpVerified = json['otp_verified'];
    profileImage = json['profile_image'];
    cardholderId = json['cardholder_id'];
    emailVerifiedAt = json['email_verified_at'];
    walletBalance = json['wallet_balance'];
    status = json['status'];
    isProfileComplete = json['is_profile_complete'];
    bvn = json['bvn'];
    primaryPurpose = json['primary_purpose'];
    zipTag = json['zip_tag'];
    verificationImage = json['verification_image'];
    isAfricaVerifed = json['is_africa_verifed'];
    pinResetOtp = json['pin_reset_otp'];
    uniqueId = json['unique_id'];
    tranferLimit = json['tranfer_limit'];
    defaultAddress = json['default_address'];
    twoFactorCode = json['two_factor_code'];
    twoFactorExpiresAt = json['two_factor_expires_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['phone'] = this.phone;
    data['country_code'] = this.countryCode;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['nationality'] = this.nationality;
    data['pin'] = this.pin;
    data['birth_place'] = this.birthPlace;
    data['gender'] = this.gender;
    data['otp'] = this.otp;
    data['otp_created_at'] = this.otpCreatedAt;
    data['otp_verified'] = this.otpVerified;
    data['profile_image'] = this.profileImage;
    data['cardholder_id'] = this.cardholderId;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['wallet_balance'] = this.walletBalance;
    data['status'] = this.status;
    data['is_profile_complete'] = this.isProfileComplete;
    data['bvn'] = this.bvn;
    data['primary_purpose'] = this.primaryPurpose;
    data['zip_tag'] = this.zipTag;
    data['verification_image'] = this.verificationImage;
    data['is_africa_verifed'] = this.isAfricaVerifed;
    data['pin_reset_otp'] = this.pinResetOtp;
    data['unique_id'] = this.uniqueId;
    data['tranfer_limit'] = this.tranferLimit;
    data['default_address'] = this.defaultAddress;
    data['two_factor_code'] = this.twoFactorCode;
    data['two_factor_expires_at'] = this.twoFactorExpiresAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
