class ModelVerifyMeterNumber {
  bool? success;
  Data? data;
  String? message;
  String? service;

  ModelVerifyMeterNumber({this.success, this.data, this.message, this.service});

  ModelVerifyMeterNumber.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    service = json['service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['service'] = this.service;
    return data;
  }
}

class Data {
  dynamic name;
  dynamic address;
  dynamic outstandingBalance;
  dynamic dueDate;
  dynamic district;
  dynamic accountNumber;
  dynamic minimumAmount;
  dynamic rawOutput;
  dynamic errorMessage;

  Data(
      {this.name,
        this.address,
        this.outstandingBalance,
        this.dueDate,
        this.district,
        this.accountNumber,
        this.minimumAmount,
        this.rawOutput,
        this.errorMessage});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    outstandingBalance = json['outstandingBalance'];
    dueDate = json['dueDate'];
    district = json['district'];
    accountNumber = json['accountNumber'];
    minimumAmount = json['minimumAmount'];
    rawOutput = json['rawOutput'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['outstandingBalance'] = this.outstandingBalance;
    data['dueDate'] = this.dueDate;
    data['district'] = this.district;
    data['accountNumber'] = this.accountNumber;
    data['minimumAmount'] = this.minimumAmount;
    data['rawOutput'] = this.rawOutput;
    data['errorMessage'] = this.errorMessage;
    return data;
  }
}
