class ModelAccountResolve {
  bool? success;
  String? message;
  Data? data;

  ModelAccountResolve({this.success, this.message, this.data});

  ModelAccountResolve.fromJson(Map<String, dynamic> json) {
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
  String? accountNumber;
  String? accountName;

  Data({this.accountNumber, this.accountName});

  Data.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    accountName = json['accountName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountNumber'] = this.accountNumber;
    data['accountName'] = this.accountName;
    return data;
  }
}
