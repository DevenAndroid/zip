class UserVerifyOtpModel {
  bool? status;
  String? message;
  String? authToken;
  Data? data;

  UserVerifyOtpModel({this.status, this.message, this.authToken, this.data});

  UserVerifyOtpModel.fromJson(Map<String, dynamic> json) {
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
 dynamic latitude;
 dynamic longitude;
 dynamic location;
 dynamic name;
 dynamic fname;
 dynamic lname;
 dynamic email;
 dynamic phone;
 dynamic countryCode;
 dynamic profileImage;
  bool? isProfileComplete;
  bool? status;

  Data(
      {this.id,
        this.latitude,
        this.longitude,
        this.location,
        this.name,
        this.fname,
        this.lname,
        this.email,
        this.phone,
        this.countryCode,
        this.profileImage,
        this.isProfileComplete,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    location = json['location'];
    name = json['name'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    phone = json['phone'];
    countryCode = json['country_code'];
    profileImage = json['profile_image'];
    isProfileComplete = json['is_profile_complete'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['location'] = this.location;
    data['name'] = this.name;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country_code'] = this.countryCode;
    data['profile_image'] = this.profileImage;
    data['is_profile_complete'] = this.isProfileComplete;
    data['status'] = this.status;
    return data;
  }
}
