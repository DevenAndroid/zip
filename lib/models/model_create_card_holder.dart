class ModelCreateCardHolder {
  dynamic status;
  String? message;
  Data? data;

  ModelCreateCardHolder({this.status, this.message, this.data});

  ModelCreateCardHolder.fromJson(Map<String, dynamic> json) {
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
  String? cardholderId;

  Data({this.cardholderId});

  Data.fromJson(Map<String, dynamic> json) {
    cardholderId = json['cardholder_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardholder_id'] = this.cardholderId;
    return data;
  }
}
