class ChooseBankList {
  bool? success;
  List<Data>? data;

  ChooseBankList({this.success, this.data});

  ChooseBankList.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
 dynamic id;
 dynamic code;
 dynamic name;
  dynamic isMobileVerified;
  dynamic branches;
  bool? isCashPickUp;

  Data(
      {this.id,
        this.code,
        this.name,
        this.isMobileVerified,
        this.branches,
        this.isCashPickUp});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    isMobileVerified = json['isMobileVerified'];
    branches = json['branches'];
    isCashPickUp = json['isCashPickUp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['isMobileVerified'] = this.isMobileVerified;
    data['branches'] = this.branches;
    data['isCashPickUp'] = this.isCashPickUp;
    return data;
  }
}
