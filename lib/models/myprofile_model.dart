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
  dynamic bvn;
  dynamic primaryPurpose;
  dynamic gender;
  dynamic nationality;
  dynamic birthPlace;
  dynamic pin;
  dynamic businessId;
  dynamic countryCode;
  dynamic profileImage;
  dynamic isProfileComplete;
  dynamic status;
  dynamic enableSecurityLock;
  Address? address;

  User(
      {this.id,
        this.fname,
        this.lname,
        this.email,
        this.phone,
        this.zipTag,
        this.dob,
        this.bvn,
        this.primaryPurpose,
        this.gender,
        this.nationality,
        this.birthPlace,
        this.pin,
        this.businessId,
        this.countryCode,
        this.profileImage,
        this.isProfileComplete,
        this.status,
        this.enableSecurityLock,
        this.address});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    phone = json['phone'];
    zipTag = json['zip_tag'];
    dob = json['dob'];
    bvn = json['bvn'];
    primaryPurpose = json['primary_purpose'];
    gender = json['gender'];
    nationality = json['nationality'];
    birthPlace = json['birth_place'];
    pin = json['pin'];
    businessId = json['business_id'];
    countryCode = json['country_code'];
    profileImage = json['profile_image'];
    isProfileComplete = json['is_profile_complete'];
    status = json['status'];
    enableSecurityLock = json['enable_security_lock'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
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
    data['bvn'] = this.bvn;
    data['primary_purpose'] = this.primaryPurpose;
    data['gender'] = this.gender;
    data['nationality'] = this.nationality;
    data['birth_place'] = this.birthPlace;
    data['pin'] = this.pin;
    data['business_id'] = this.businessId;
    data['country_code'] = this.countryCode;
    data['profile_image'] = this.profileImage;
    data['is_profile_complete'] = this.isProfileComplete;
    data['status'] = this.status;
    data['enable_security_lock'] = this.enableSecurityLock;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Address {
  dynamic id;
  dynamic userId;
  dynamic streetName;
  dynamic houseNumber;
  dynamic additional;
  dynamic postalCode;
  dynamic state;
  dynamic city;
  dynamic country;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  Address(
      {this.id,
        this.userId,
        this.streetName,
        this.houseNumber,
        this.additional,
        this.postalCode,
        this.state,
        this.city,
        this.country,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    streetName = json['street_name'];
    houseNumber = json['house_number'];
    additional = json['additional'];
    postalCode = json['postal_code'];
    state = json['state'];
    city = json['city'];
    country = json['country'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['street_name'] = this.streetName;
    data['house_number'] = this.houseNumber;
    data['additional'] = this.additional;
    data['postal_code'] = this.postalCode;
    data['state'] = this.state;
    data['city'] = this.city;
    data['country'] = this.country;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
