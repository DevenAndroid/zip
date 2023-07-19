class ModelCheckout {
  bool? status;
  String? message;
  Data? data;

  ModelCheckout({this.status, this.message, this.data});

  ModelCheckout.fromJson(Map<String, dynamic> json) {
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
  dynamic link;
  dynamic payCode;

  Data({this.link, this.payCode});

  Data.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    payCode = json['payCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['payCode'] = this.payCode;
    return data;
  }
}
