class SettingModal {
  bool? status;
  String? message;
  Data? data;

  SettingModal({this.status, this.message, this.data});

  SettingModal.fromJson(Map<String, dynamic> json) {
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
  bool? hideBalance;
  bool? enableSecurityLock;
  bool? transactionPin;
  bool? enableFingerprints;

  Data(
      {this.pushNotification,
        this.emailNotification,
        this.hideBalance,
        this.enableSecurityLock,
        this.transactionPin,
        this.enableFingerprints});

  Data.fromJson(Map<String, dynamic> json) {
    pushNotification = json['push_notification'];
    emailNotification = json['email_notification'];
    hideBalance = json['hide_balance'];
    enableSecurityLock = json['enable_security_lock'];
    transactionPin = json['transaction_pin'];
    enableFingerprints = json['enable_fingerprints'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['push_notification'] = this.pushNotification;
    data['email_notification'] = this.emailNotification;
    data['hide_balance'] = this.hideBalance;
    data['enable_security_lock'] = this.enableSecurityLock;
    data['transaction_pin'] = this.transactionPin;
    data['enable_fingerprints'] = this.enableFingerprints;
    return data;
  }
}
