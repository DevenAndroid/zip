class ModelNotificationUpdate {
  bool? status;
  String? message;
  Data? data;

  ModelNotificationUpdate({this.status, this.message, this.data});

  ModelNotificationUpdate.fromJson(Map<String, dynamic> json) {
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
  bool? pushNotification;
  bool? emailNotification;

  Data({this.pushNotification, this.emailNotification});

  Data.fromJson(Map<String, dynamic> json) {
    pushNotification = json['push_notification'];
    emailNotification = json['email_notification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['push_notification'] = this.pushNotification;
    data['email_notification'] = this.emailNotification;
    return data;
  }
}
