class ModelSetting {
  bool? status;
  String? message;
  Data? data;

  ModelSetting({this.status, this.message, this.data});

  ModelSetting.fromJson(Map<String, dynamic> json) {
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
  String? authKey;
  String? userID;

  Data({this.authKey, this.userID});

  Data.fromJson(Map<String, dynamic> json) {
    authKey = json['authKey'];
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authKey'] = this.authKey;
    data['userID'] = this.userID;
    return data;
  }
}
