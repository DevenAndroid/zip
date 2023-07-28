class ModelDataPlan {
  bool? success;
  List<Data>? data;
  String? message;
  String? service;

  ModelDataPlan({this.success, this.data, this.message, this.service});

  ModelDataPlan.fromJson(Map<String, dynamic> json) {
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
 dynamic allowance;
 dynamic price;
 dynamic validity;
  dynamic datacode;

  Data({this.name, this.allowance, this.price, this.validity, this.datacode});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    allowance = json['allowance'];
    price = json['price'];
    validity = json['validity'];
    datacode = json['datacode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['allowance'] = this.allowance;
    data['price'] = this.price;
    data['validity'] = this.validity;
    data['datacode'] = this.datacode;
    return data;
  }
}
