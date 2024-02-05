class ModelPayout {
  bool? success;
  String? message;
  Data? data;

  ModelPayout({this.success, this.message, this.data});

  ModelPayout.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  dynamic reference;
  dynamic customerReference;
  String? status;

  Data({this.id, this.reference, this.customerReference, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reference = json['reference'];
    customerReference = json['customerReference'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reference'] = this.reference;
    data['customerReference'] = this.customerReference;
    data['status'] = this.status;
    return data;
  }
}