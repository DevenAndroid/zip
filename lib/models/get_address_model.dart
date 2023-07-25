class GetAddressModel {
  bool? status;
  String? message;
  Data? data;

  GetAddressModel({this.status, this.message, this.data});

  GetAddressModel.fromJson(Map<String, dynamic> json) {
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
dynamic id;
dynamic streetName;
dynamic houseNumber;
dynamic additional;
dynamic postalCode;
dynamic state;
dynamic city;
dynamic country;

  Data(
      {this.id,
        this.streetName,
        this.houseNumber,
        this.additional,
        this.postalCode,
        this.state,
        this.city,
        this.country});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    streetName = json['street_name'];
    houseNumber = json['house_number'];
    additional = json['additional'];
    postalCode = json['postal_code'];
    state = json['state'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['street_name'] = this.streetName;
    data['house_number'] = this.houseNumber;
    data['additional'] = this.additional;
    data['postal_code'] = this.postalCode;
    data['state'] = this.state;
    data['city'] = this.city;
    data['country'] = this.country;
    return data;
  }
}
