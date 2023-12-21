class AirtimeOperatorModel {
  bool? status;
  String? message;
  Data? data;

  AirtimeOperatorModel({this.status, this.message, this.data});

  AirtimeOperatorModel.fromJson(Map<String, dynamic> json) {
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
  String? operatorId;
  String? name;
  String? operatorImage;

  Content({this.operatorId, this.name, this.operatorImage});

  Content.fromJson(Map<String, dynamic> json) {
    operatorId = json['operator_id'];
    name = json['name'];
    operatorImage = json['operator_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['operator_id'] = this.operatorId;
    data['name'] = this.name;
    data['operator_image'] = this.operatorImage;
    return data;
  }
}
