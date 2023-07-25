class LoginModel {
  bool? status;
  String? message;
  String? authToken;
  Data? data;

  LoginModel({this.status, this.message, this.authToken, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    authToken = json['auth_token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['auth_token'] = this.authToken;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic id;
  dynamic fname;
  dynamic lname;
  dynamic email;
  dynamic phone;
  dynamic zipTag;
  dynamic dob;
  dynamic businessId;
  dynamic countryCode;
  dynamic profileImage;
  bool? isProfileComplete;
  bool? status;
  bool? enableSecurityLock;

  Data(
      {this.id,
        this.fname,
        this.lname,
        this.email,
        this.phone,
        this.zipTag,
        this.dob,
        this.businessId,
        this.countryCode,
        this.profileImage,
        this.isProfileComplete,
        this.status,
        this.enableSecurityLock});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    phone = json['phone'];
    zipTag = json['zip_tag'];
    dob = json['dob'];
    businessId = json['business_id'];
    countryCode = json['country_code'];
    profileImage = json['profile_image'];
    isProfileComplete = json['is_profile_complete'];
    status = json['status'];
    enableSecurityLock = json['enable_security_lock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['zip_tag'] = this.zipTag;
    data['dob'] = this.dob;
    data['business_id'] = this.businessId;
    data['country_code'] = this.countryCode;
    data['profile_image'] = this.profileImage;
    data['is_profile_complete'] = this.isProfileComplete;
    data['status'] = this.status;
    data['enable_security_lock'] = this.enableSecurityLock;
    return data;
  }
}
