class ModelVerifyMeterNumber {
  bool? status;
  String? message;
  Data? data;

  ModelVerifyMeterNumber({this.status, this.message, this.data});

  ModelVerifyMeterNumber.fromJson(Map<String, dynamic> json) {
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
  String? code;
  Content? content;

  Data({this.code, this.content});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    return data;
  }
}

class Content {
  String? customerName;
  String? status;
  String? dueDate;
  int? customerNumber;
  String? customerType;
  String? currentBouquet;
  String? currentBouquetCode;
  int? renewalAmount;

  Content(
      {this.customerName,
        this.status,
        this.dueDate,
        this.customerNumber,
        this.customerType,
        this.currentBouquet,
        this.currentBouquetCode,
        this.renewalAmount});

  Content.fromJson(Map<String, dynamic> json) {
    customerName = json['Customer_Name'];
    status = json['Status'];
    dueDate = json['Due_Date'];
    customerNumber = json['Customer_Number'];
    customerType = json['Customer_Type'];
    currentBouquet = json['Current_Bouquet'];
    currentBouquetCode = json['Current_Bouquet_Code'];
    renewalAmount = json['Renewal_Amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Customer_Name'] = this.customerName;
    data['Status'] = this.status;
    data['Due_Date'] = this.dueDate;
    data['Customer_Number'] = this.customerNumber;
    data['Customer_Type'] = this.customerType;
    data['Current_Bouquet'] = this.currentBouquet;
    data['Current_Bouquet_Code'] = this.currentBouquetCode;
    data['Renewal_Amount'] = this.renewalAmount;
    return data;
  }
}
