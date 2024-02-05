class ServiceVariationModel {
  bool? status;
  String? message;
  Data? data;

  ServiceVariationModel({this.status, this.message, this.data});

  ServiceVariationModel.fromJson(Map<String, dynamic> json) {
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
  Content? content;

  Data({this.responseDescription, this.content});

  Data.fromJson(Map<String, dynamic> json) {
    responseDescription = json['response_description'];
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_description'] = this.responseDescription;
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    return data;
  }
}

class Content {
  String? serviceName;
  String? serviceID;
  String? convinienceFee;
  List<Varations>? varations;

  Content(
      {this.serviceName, this.serviceID, this.convinienceFee, this.varations});

  Content.fromJson(Map<String, dynamic> json) {
    serviceName = json['ServiceName'];
    serviceID = json['serviceID'];
    convinienceFee = json['convinience_fee'];
    if (json['varations'] != null) {
      varations = <Varations>[];
      json['varations'].forEach((v) {
        varations!.add(new Varations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ServiceName'] = this.serviceName;
    data['serviceID'] = this.serviceID;
    data['convinience_fee'] = this.convinienceFee;
    if (this.varations != null) {
      data['varations'] = this.varations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Varations {
  String? variationCode;
  String? name;
  String? variationAmount;
  String? fixedPrice;

  Varations(
      {this.variationCode, this.name, this.variationAmount, this.fixedPrice});

  Varations.fromJson(Map<String, dynamic> json) {
    variationCode = json['variation_code'];
    name = json['name'];
    variationAmount = json['variation_amount'];
    fixedPrice = json['fixedPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variation_code'] = this.variationCode;
    data['name'] = this.name;
    data['variation_amount'] = this.variationAmount;
    data['fixedPrice'] = this.fixedPrice;
    return data;
  }
}
