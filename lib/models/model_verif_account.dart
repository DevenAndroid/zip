class ModelVerifyVritualAccount {
  bool? status;
  String? message;
  Data? data;

  ModelVerifyVritualAccount({this.status, this.message, this.data});

  ModelVerifyVritualAccount.fromJson(Map<String, dynamic> json) {
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
 dynamic userId;
 dynamic flwRef;
 dynamic orderRef;
 dynamic accountNumber;
 dynamic frequency;
 dynamic bankName;
 dynamic updatedAt;
 dynamic createdAt;
 dynamic id;

  Data(
      {this.userId,
        this.flwRef,
        this.orderRef,
        this.accountNumber,
        this.frequency,
        this.bankName,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    flwRef = json['flw_ref'];
    orderRef = json['order_ref'];
    accountNumber = json['account_number'];
    frequency = json['frequency'];
    bankName = json['bank_name'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['flw_ref'] = this.flwRef;
    data['order_ref'] = this.orderRef;
    data['account_number'] = this.accountNumber;
    data['frequency'] = this.frequency;
    data['bank_name'] = this.bankName;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
