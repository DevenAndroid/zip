class ProfileModel {
  bool? status;
  String? message;
  Data? data;

  ProfileModel({this.status, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
 dynamic id;
 dynamic fname;
 dynamic lname;
 dynamic email;
 dynamic phone;
 dynamic zipTag;
 dynamic dob;
 dynamic countryCode;
 dynamic profileImage;
  bool? isProfileComplete;
  bool? status;
  bool? enableSecurityLock;

  User(
      {this.id,
        this.fname,
        this.lname,
        this.email,
        this.phone,
        this.zipTag,
        this.dob,
        this.countryCode,
        this.profileImage,
        this.isProfileComplete,
        this.status,
        this.enableSecurityLock});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    phone = json['phone'];
    zipTag = json['zip_tag'];
    dob = json['dob'];
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
    data['country_code'] = this.countryCode;
    data['profile_image'] = this.profileImage;
    data['is_profile_complete'] = this.isProfileComplete;
    data['status'] = this.status;
    data['enable_security_lock'] = this.enableSecurityLock;
    return data;
  }
}
