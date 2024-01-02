class ListBenificaryModel {
  bool? status;
  String? message;
  List<BenificaryData>? data;

  ListBenificaryModel({this.status, this.message, this.data});

  ListBenificaryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BenificaryData>[];
      json['data'].forEach((v) {
        data!.add(new BenificaryData.fromJson(v));
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

class BenificaryData {
  dynamic id;
  dynamic bankName;
  dynamic destinationAddress;
  dynamic firstName;
  dynamic accountHolderName;
  dynamic businessId;
  dynamic createdAt;
  dynamic bankCode;

  BenificaryData(
      {this.id,
        this.bankName,
        this.destinationAddress,
        this.firstName,
        this.accountHolderName,
        this.bankCode,
        this.businessId,
        this.createdAt});

  BenificaryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bank_name'];
    destinationAddress = json['destination_address'];
    bankCode = json['bank_code'];
    firstName = json['first_name'];
    accountHolderName = json['account_holder_name'];
    businessId = json['business_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bank_name'] = this.bankName;
    data['bank_code'] = this.bankCode;
    data['destination_address'] = this.destinationAddress;
    data['first_name'] = this.firstName;
    data['account_holder_name'] = this.accountHolderName;
    data['business_id'] = this.businessId;
    data['created_at'] = this.createdAt;
    return data;
  }
}
