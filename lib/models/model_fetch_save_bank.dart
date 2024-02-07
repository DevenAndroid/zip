class ModelFetchSaveBankDetails {
  bool? status;
  String? message;
  List<Data>? data;

  ModelFetchSaveBankDetails({this.status, this.message, this.data});

  ModelFetchSaveBankDetails.fromJson(Map<String, dynamic> json) {
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
  dynamic bankCode;
  dynamic bankName;
  dynamic destinationAddress;
  dynamic firstName;

  Data({this.bankCode, this.bankName, this.destinationAddress, this.firstName});

  Data.fromJson(Map<String, dynamic> json) {
    bankCode = json['bank_code'];
    bankName = json['bank_name'];
    destinationAddress = json['destinationAddress'];
    firstName = json['firstName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bank_code'] = this.bankCode;
    data['bank_name'] = this.bankName;
    data['destinationAddress'] = this.destinationAddress;
    data['firstName'] = this.firstName;
    return data;
  }
}
