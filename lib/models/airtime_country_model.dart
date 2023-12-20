class AirtimeCountryModel {
  bool? status;
  String? message;
  Data? data;

  AirtimeCountryModel({this.status, this.message, this.data});

  AirtimeCountryModel.fromJson(Map<String, dynamic> json) {
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
  List<Countries>? countries;

  Content({this.countries});

  Content.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(new Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countries {
  String? code;
  String? flag;
  String? name;
  String? currency;
  String? prefix;

  Countries({this.code, this.flag, this.name, this.currency, this.prefix});

  Countries.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    flag = json['flag'];
    name = json['name'];
    currency = json['currency'];
    prefix = json['prefix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['flag'] = this.flag;
    data['name'] = this.name;
    data['currency'] = this.currency;
    data['prefix'] = this.prefix;
    return data;
  }
}
