class ModelCabelProvider {
  bool? success;
  List<Data>? data;
  String? message;
  String? service;

  ModelCabelProvider({this.success, this.data, this.message, this.service});

  ModelCabelProvider.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    service = json['service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['service'] = this.service;
    return data;
  }
}

class Data {
  List<AvailablePricingOptions>? availablePricingOptions;
 dynamic code;
 dynamic name;
 dynamic description;

  Data({this.availablePricingOptions, this.code, this.name, this.description});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['availablePricingOptions'] != null) {
      availablePricingOptions = <AvailablePricingOptions>[];
      json['availablePricingOptions'].forEach((v) {
        availablePricingOptions!.add(new AvailablePricingOptions.fromJson(v));
      });
    }
    code = json['code'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.availablePricingOptions != null) {
      data['availablePricingOptions'] =
          this.availablePricingOptions!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class AvailablePricingOptions {
 dynamic monthsPaidFor;
 dynamic price;
 dynamic invoicePeriod;

  AvailablePricingOptions({this.monthsPaidFor, this.price, this.invoicePeriod});

  AvailablePricingOptions.fromJson(Map<String, dynamic> json) {
    monthsPaidFor = json['monthsPaidFor'];
    price = json['price'];
    invoicePeriod = json['invoicePeriod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['monthsPaidFor'] = this.monthsPaidFor;
    data['price'] = this.price;
    data['invoicePeriod'] = this.invoicePeriod;
    return data;
  }
}
