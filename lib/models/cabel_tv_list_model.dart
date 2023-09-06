class BuyCavelTvList {
  bool? status;
  String? message;
  List<Data>? data;

  BuyCavelTvList({this.status, this.message, this.data});

  BuyCavelTvList.fromJson(Map<String, dynamic> json) {
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
  dynamic comonId;
  dynamic tId;
  dynamic amount;
  dynamic phone;
  dynamic dataplan;
  dynamic telcos;
  dynamic dataCode;
  dynamic description;
  dynamic transactionAbout;
  dynamic userType;
  dynamic createdAt;

  Data(
      {this.userId,
        this.comonId,
        this.tId,
        this.amount,
        this.phone,
        this.dataplan,
        this.telcos,
        this.dataCode,
        this.description,
        this.transactionAbout,
        this.userType,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    comonId = json['comon_id'];
    tId = json['t_id'];
    amount = json['amount'];
    phone = json['phone'];
    dataplan = json['dataplan '];
    telcos = json['telcos'];
    dataCode = json['data_code'];
    description = json['description'];
    transactionAbout = json['transaction_about'];
    userType = json['user_type'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['comon_id'] = this.comonId;
    data['t_id'] = this.tId;
    data['amount'] = this.amount;
    data['phone'] = this.phone;
    data['dataplan '] = this.dataplan;
    data['telcos'] = this.telcos;
    data['data_code'] = this.dataCode;
    data['description'] = this.description;
    data['transaction_about'] = this.transactionAbout;
    data['user_type'] = this.userType;
    data['created_at'] = this.createdAt;
    return data;
  }
}
