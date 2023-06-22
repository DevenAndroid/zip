class ModelCommonResponse {
  String? status;
  String? message;
  List<Data>? data;

  ModelCommonResponse({this.status, this.message, this.data});

  ModelCommonResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic medium;
  dynamic reference;
  dynamic otp;
  dynamic expiry;

  Data({this.medium, this.reference, this.otp, this.expiry});

  Data.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    reference = json['reference'];
    otp = json['otp'];
    expiry = json['expiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = this.medium;
    data['reference'] = this.reference;
    data['otp'] = this.otp;
    data['expiry'] = this.expiry;
    return data;
  }
}
