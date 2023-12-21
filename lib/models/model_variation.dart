import 'package:zip/models/service_variation_model.dart';

class AirtimeVariationModel {
  bool? status;
  String? message;
  Data? data;

  AirtimeVariationModel({this.status, this.message, this.data});

  AirtimeVariationModel.fromJson(Map<String, dynamic> json) {
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
  String? currency;
  List<Variations>? variations;
  List<Varations>? varations;

  Content(
      {this.serviceName,
        this.serviceID,
        this.convinienceFee,
        this.currency,
        this.variations,
        this.varations});

  Content.fromJson(Map<String, dynamic> json) {
    serviceName = json['ServiceName'];
    serviceID = json['serviceID'];
    convinienceFee = json['convinience_fee'];
    currency = json['currency'];
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
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
    data['currency'] = this.currency;
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    if (this.varations != null) {
      data['varations'] = this.varations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variations {
  String? variationCode;
  String? name;
  String? fixedPrice;
  String? variationAmount;
  int? variationAmountMin;
  int? variationAmountMax;
  double? variationRate;
  String? chargedAmount;
  String? chargedCurrency;

  Variations(
      {this.variationCode,
        this.name,
        this.fixedPrice,
        this.variationAmount,
        this.variationAmountMin,
        this.variationAmountMax,
        this.variationRate,
        this.chargedAmount,
        this.chargedCurrency});

  Variations.fromJson(Map<String, dynamic> json) {
    variationCode = json['variation_code'];
    name = json['name'];
    fixedPrice = json['fixedPrice'];
    variationAmount = json['variation_amount'];
    variationAmountMin = json['variation_amount_min'];
    variationAmountMax = json['variation_amount_max'];
    variationRate = json['variation_rate'];
    chargedAmount = json['charged_amount'];
    chargedCurrency = json['charged_currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variation_code'] = this.variationCode;
    data['name'] = this.name;
    data['fixedPrice'] = this.fixedPrice;
    data['variation_amount'] = this.variationAmount;
    data['variation_amount_min'] = this.variationAmountMin;
    data['variation_amount_max'] = this.variationAmountMax;
    data['variation_rate'] = this.variationRate;
    data['charged_amount'] = this.chargedAmount;
    data['charged_currency'] = this.chargedCurrency;
    return data;
  }
}
