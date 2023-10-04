class ModelKey {
  bool? status;
  String? message;
  Data? data;

  ModelKey({this.status, this.message, this.data});

  ModelKey.fromJson(Map<String, dynamic> json) {
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
 dynamic token;
 dynamic apiKey;
 dynamic secretKey;
 dynamic publicKey;
 dynamic businessId;

  Data(
      {this.token,
        this.apiKey,
        this.secretKey,
        this.publicKey,
        this.businessId});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    apiKey = json['api_Key'];
    secretKey = json['secret_key'];
    publicKey = json['public_key'];
    businessId = json['business_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['api_Key'] = this.apiKey;
    data['secret_key'] = this.secretKey;
    data['public_key'] = this.publicKey;
    data['business_id'] = this.businessId;
    return data;
  }
}
