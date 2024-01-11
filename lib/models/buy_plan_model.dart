class ModelBuy {
  bool? success;
  Data? data;
  String? message;

  ModelBuy({this.success, this.data, this.message});

  ModelBuy.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  dynamic message;
  dynamic amount;
  dynamic netAmount;
  dynamic commission;
  dynamic chargeBack;
  dynamic status;
  dynamic customerReference;
  dynamic reference;
  dynamic businessId;
  dynamic createdAt;

  Data(
      {this.message,
      this.amount,
      this.netAmount,
      this.commission,
      this.chargeBack,
      this.status,
      this.customerReference,
      this.reference,
      this.businessId,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    amount = json['amount'];
    netAmount = json['net_amount'];
    commission = json['commission'];
    chargeBack = json['charge_back'];
    status = json['status'];
    customerReference = json['customer_reference'];
    reference = json['reference'];
    businessId = json['business_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['amount'] = this.amount;
    data['net_amount'] = this.netAmount;
    data['commission'] = this.commission;
    data['charge_back'] = this.chargeBack;
    data['status'] = this.status;
    data['customer_reference'] = this.customerReference;
    data['reference'] = this.reference;
    data['business_id'] = this.businessId;
    data['created_at'] = this.createdAt;
    return data;
  }
}
