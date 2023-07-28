class ModelCabelList {
  bool? success;
  List<Data>? data;
  String? message;
  String? service;

  ModelCabelList({this.success, this.data, this.message, this.service});

  ModelCabelList.fromJson(Map<String, dynamic> json) {
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
 dynamic provider;

  Data({this.name, this.provider});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['provider'] = this.provider;
    return data;
  }
}
