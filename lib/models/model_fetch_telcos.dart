class ModelFetchTelcos {
  bool? success;
  List<Data>? data;
  String? message;
  String? service;

  ModelFetchTelcos({this.success, this.data, this.message, this.service});

  ModelFetchTelcos.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    service = json['service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['service'] = this.service;
    return data;
  }
}

class Data {
  dynamic name;
  dynamic shortname;
  Plan? plan;

  Data({this.name, this.shortname, this.plan});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shortname = json['shortname'];
    plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['shortname'] = this.shortname;
    if (this.plan != null) {
      data['plan'] = this.plan!.toJson();
    }
    return data;
  }
}

class Plan {
  String? serviceType;
  String? shortname;
  int? billerId;
  int? productId;
  String? name;
  List<String>? plan;

  Plan(
      {this.serviceType,
        this.shortname,
        this.billerId,
        this.productId,
        this.name,
        this.plan});

  Plan.fromJson(Map<String, dynamic> json) {
    serviceType = json['service_type'];
    shortname = json['shortname'];
    billerId = json['biller_id'];
    productId = json['product_id'];
    name = json['name'];
    plan = json['plan'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_type'] = this.serviceType;
    data['shortname'] = this.shortname;
    data['biller_id'] = this.billerId;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['plan'] = this.plan;
    return data;
  }
}
