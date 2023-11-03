class ModelSaveDetailsAfrica {
  bool? status;
  String? message;
  Data? data;

  ModelSaveDetailsAfrica({this.status, this.message, this.data});

  ModelSaveDetailsAfrica.fromJson(Map<String, dynamic> json) {
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
 dynamic userId;
 dynamic email;
 dynamic gender;
 dynamic dob;
 dynamic phone;
 dynamic country;
 dynamic nin;
 dynamic bvn;
 dynamic nationality;
 dynamic fullName;
 dynamic firstName;
 dynamic lastName;
 dynamic middleName;
 dynamic alternatePhone;
 dynamic stateOfOrigin;
 dynamic stateOfResidence;
 dynamic lgaOfOrigin;
 dynamic lgaOfResidence;
 dynamic addressLine2;
 dynamic addressLine3;
 dynamic maritalStatus;
 dynamic watchlisted;
 dynamic avatar;
 dynamic updatedAt;
 dynamic createdAt;
 dynamic id;

  Data(
      {this.userId,
        this.email,
        this.gender,
        this.dob,
        this.phone,
        this.country,
        this.nin,
        this.bvn,
        this.nationality,
        this.fullName,
        this.firstName,
        this.lastName,
        this.middleName,
        this.alternatePhone,
        this.stateOfOrigin,
        this.stateOfResidence,
        this.lgaOfOrigin,
        this.lgaOfResidence,
        this.addressLine2,
        this.addressLine3,
        this.maritalStatus,
        this.watchlisted,
        this.avatar,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    phone = json['phone'];
    country = json['country'];
    nin = json['nin'];
    bvn = json['bvn'];
    nationality = json['nationality'];
    fullName = json['full_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    alternatePhone = json['alternate_phone'];
    stateOfOrigin = json['state_of_origin'];
    stateOfResidence = json['state_of_residence'];
    lgaOfOrigin = json['lga_of_origin'];
    lgaOfResidence = json['lga_of_residence'];
    addressLine2 = json['address_line_2'];
    addressLine3 = json['address_line_3'];
    maritalStatus = json['marital_status'];
    watchlisted = json['watchlisted'];
    avatar = json['avatar'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    data['country'] = this.country;
    data['nin'] = this.nin;
    data['bvn'] = this.bvn;
    data['nationality'] = this.nationality;
    data['full_name'] = this.fullName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['middle_name'] = this.middleName;
    data['alternate_phone'] = this.alternatePhone;
    data['state_of_origin'] = this.stateOfOrigin;
    data['state_of_residence'] = this.stateOfResidence;
    data['lga_of_origin'] = this.lgaOfOrigin;
    data['lga_of_residence'] = this.lgaOfResidence;
    data['address_line_2'] = this.addressLine2;
    data['address_line_3'] = this.addressLine3;
    data['marital_status'] = this.maritalStatus;
    data['watchlisted'] = this.watchlisted;
    data['avatar'] = this.avatar;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
