class ModelUpdateProfile {
  bool? status;
  String? message;
  Data? data;

  ModelUpdateProfile({this.status, this.message, this.data});

  ModelUpdateProfile.fromJson(Map<String, dynamic> json) {
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

  Data(
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
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
