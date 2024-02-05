class ModelCreateVritualAccount {
  String? status;
  String? message;
  Data? data;

  ModelCreateVritualAccount({this.status, this.message, this.data});

  ModelCreateVritualAccount.fromJson(Map<String, dynamic> json) {
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
 dynamic responseCode;
 dynamic responseMessage;
 dynamic flwRef;
 dynamic orderRef;
 dynamic accountNumber;
 dynamic accountStatus;
 dynamic frequency;
 dynamic bankName;
 dynamic createdAt;
 dynamic expiryDate;
 dynamic note;
 dynamic amount;

  Data(
      {this.responseCode,
        this.responseMessage,
        this.flwRef,
        this.orderRef,
        this.accountNumber,
        this.accountStatus,
        this.frequency,
        this.bankName,
        this.createdAt,
        this.expiryDate,
        this.note,
        this.amount});

  Data.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    responseMessage = json['response_message'];
    flwRef = json['flw_ref'];
    orderRef = json['order_ref'];
    accountNumber = json['account_number'];
    accountStatus = json['account_status'];
    frequency = json['frequency'];
    bankName = json['bank_name'];
    createdAt = json['created_at'];
    expiryDate = json['expiry_date'];
    note = json['note'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    data['response_message'] = this.responseMessage;
    data['flw_ref'] = this.flwRef;
    data['order_ref'] = this.orderRef;
    data['account_number'] = this.accountNumber;
    data['account_status'] = this.accountStatus;
    data['frequency'] = this.frequency;
    data['bank_name'] = this.bankName;
    data['created_at'] = this.createdAt;
    data['expiry_date'] = this.expiryDate;
    data['note'] = this.note;
    data['amount'] = this.amount;
    return data;
  }
}
