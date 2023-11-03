class RegisterModel {
  bool? status;
  String? message;
  Data? data;

  RegisterModel({this.status, this.message, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
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
  int? otp;
  User? user;

  Data({this.otp, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? bvn;
  String? createdOrigin;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;
  int? otp;

  User(
      {this.bvn,
        this.createdOrigin,
        this.email,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.otp});

  User.fromJson(Map<String, dynamic> json) {
    bvn = json['bvn'];
    createdOrigin = json['created_origin'];
    email = json['email'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bvn'] = this.bvn;
    data['created_origin'] = this.createdOrigin;
    data['email'] = this.email;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['otp'] = this.otp;
    return data;
  }
}
