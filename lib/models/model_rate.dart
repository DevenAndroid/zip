class ModelRate {
  String? status;
  String? message;
  Data? data;

  ModelRate({this.status, this.message, this.data});

  ModelRate.fromJson(Map<String, dynamic> json) {
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
  int? nGNUSD;

  Data({this.nGNUSD});

  Data.fromJson(Map<String, dynamic> json) {
    nGNUSD = json['NGN-USD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NGN-USD'] = this.nGNUSD;
    return data;
  }
}
