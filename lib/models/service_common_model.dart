class ServiceCommonModel {
  bool? status;
  String? message;
  Data? data;

  ServiceCommonModel({this.status, this.message, this.data});

  ServiceCommonModel.fromJson(Map<String, dynamic> json) {
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
  String? responseDescription;
  List<Content>? content;

  Data({this.responseDescription, this.content});

  Data.fromJson(Map<String, dynamic> json) {
    responseDescription = json['response_description'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_description'] = this.responseDescription;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  dynamic serviceID;
  dynamic name;
  dynamic minimiumAmount;
  dynamic maximumAmount;
  dynamic convinienceFee;
  dynamic productType;
  dynamic image;

  Content(
      {this.serviceID,
        this.name,
        this.minimiumAmount,
        this.maximumAmount,
        this.convinienceFee,
        this.productType,
        this.image});

  Content.fromJson(Map<String, dynamic> json) {
    serviceID = json['serviceID'];
    name = json['name'];
    minimiumAmount = json['minimium_amount'];
    maximumAmount = json['maximum_amount'];
    convinienceFee = json['convinience_fee'];
    productType = json['product_type'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceID'] = this.serviceID;
    data['name'] = this.name;
    data['minimium_amount'] = this.minimiumAmount;
    data['maximum_amount'] = this.maximumAmount;
    data['convinience_fee'] = this.convinienceFee;
    data['product_type'] = this.productType;
    data['image'] = this.image;
    return data;
  }
}
