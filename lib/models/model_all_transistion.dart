class ModelAllTransistion {
  bool? status;
  String? message;
  List<Data>? data;

  ModelAllTransistion({this.status, this.message, this.data});

  ModelAllTransistion.fromJson(Map<String, dynamic> json) {
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
  dynamic userId;
  dynamic beneficiaryId;
  dynamic transactionType;
  dynamic comonId;
  dynamic tId;
  dynamic amount;
  dynamic currency;
  dynamic transactionAbout;
  dynamic userType;
  dynamic createdAt;

  Data(
      {this.userId,
        this.beneficiaryId,
        this.transactionType,
        this.comonId,
        this.tId,
        this.amount,
        this.currency,
        this.transactionAbout,
        this.userType,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    beneficiaryId = json['beneficiary_id'];
    transactionType = json['transaction_type'];
    comonId = json['comon_id'];
    tId = json['t_id'];
    amount = json['amount'];
    currency = json['currency'];
    transactionAbout = json['transaction_about'];
    userType = json['user_type'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['beneficiary_id'] = this.beneficiaryId;
    data['transaction_type'] = this.transactionType;
    data['comon_id'] = this.comonId;
    data['t_id'] = this.tId;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['transaction_about'] = this.transactionAbout;
    data['user_type'] = this.userType;
    data['created_at'] = this.createdAt;
    return data;
  }
}
